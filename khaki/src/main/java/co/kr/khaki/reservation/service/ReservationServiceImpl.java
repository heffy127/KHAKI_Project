package co.kr.khaki.reservation.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;
import co.kr.khaki.common.CalculateMemberLevel;
import co.kr.khaki.confirm.service.ConfirmServiceInterface;
import co.kr.khaki.coupon.CouponUseDAO;
import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.handler.DAO.HandlerDAO;
import co.kr.khaki.handler.DTO.HandlerDTO;
import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DAO.MemberLevelDAOInter;
import co.kr.khaki.member.DTO.MemberLevelDTO;
import co.kr.khaki.reservation.DAO.PayDAOInterface;
import co.kr.khaki.reservation.DTO.PayDTO;

@Service
public class ReservationServiceImpl implements ReservationServiceInterface {

	@Autowired
	PayDAOInterface pdao;

	@Autowired
	MemberDAOInter memberDAO;

	@Autowired
	HandlerDAO hdao;

	@Autowired
	CouponUseDAO cpuDAO;

	@Autowired
	MemberLevelDAOInter memberLevelDAO;

	@Autowired
	CarDAO cdao;
	
	@Autowired
	ConfirmServiceInterface confirmServiceImpl;

	String cnt;

	@Override
	public String search2(String buy_endTime, String buy_startTime, String buy_carNum) {
		System.out.println("컨트롤러 : " + buy_carNum + "," + buy_startTime + "," + buy_endTime);
		cnt = pdao.search2(buy_endTime, buy_carNum, buy_startTime);
		return cnt;
	}

	// 차량명에 해당하는 자료들의 갯수 불러옴
	@Override
	public String selectCar(String buy_carModel) {
		cnt = pdao.selectCar(buy_carModel);
		return cnt;
	}

	@Override
	public String searchEndTIme(String buy_endTime, String buy_carModel) {
		cnt = pdao.selectEndTime(buy_endTime, buy_carModel);
		return cnt;
	}

	@Override
	public String searchStartTime(String buy_startTime, String buy_carModel) {
		cnt = pdao.selectStartTime(buy_startTime, buy_carModel);
		return cnt;
	}

	@Override
	public String payResult(PayDTO payDTO, CalculateMemberLevel cal) {
		System.out.println("PayDAO Insert~");
		System.out.println(payDTO.getBuy_startTime() + "aaaaaaaaaaa");
		System.out.println(payDTO.getBuy_endTime() + "aaaaaaaaaaa");
		pdao.insert(payDTO);
		memberDAO.updatePointCount(payDTO);
		MemberLevelDTO memberlevelDTO = memberLevelDAO.selectId(payDTO.getBuy_id());
		MemberLevelDTO memberlevelDTO2 = cal.setLevel(memberlevelDTO, 500); // 결제가 완료 될 때마다 500씩 증가
		memberLevelDAO.update(memberlevelDTO2); // 등급 DB 업데이트
		return "pay/payResult";
	}

	@Override
	public String pointUseInput(String id, String point) {
		System.out.println(point + "넘어온 point!!");
		// 결제화면에서 포인트 사용을 했을 경우 입력한 포인트만큼 memberDB에서 포인트 차감
		// ex) 100포인트 사용시 100 * (-1) = -100
		// 현재 포인트가 500포인트라면 500 + (-100) = 400
		PayDTO payDTO = new PayDTO();
		point = Integer.toString(Integer.parseInt(point) * (-1));
		System.out.println(point + "넘겨야 할 point!!");
		payDTO.setBuy_id(id);
		payDTO.setBuy_point(point);
		memberDAO.minusPointCount(payDTO);
		return "pay/payResult";
	}

	@Override
	public String burumService(PayDTO payDTO) {
		System.out.println("부름서비스 확인 " + payDTO.getBuy_carNum());
		HandlerDTO hDTO = new HandlerDTO();

		hDTO.setCarNum(payDTO.getBuy_carNum());
		hDTO.setCarModel(payDTO.getBuy_carModel());
		hDTO.setStartLocation(payDTO.getBuy_startLocation());
		hDTO.setReturnLocation(payDTO.getBuy_returnLocation());
		hDTO.setHandler(payDTO.getBuy_id());
		hDTO.setPoint(Integer.parseInt(payDTO.getBuy_amount()) / 2);
		String[] c = payDTO.getBuy_startTime().split("");
		String comp = c[0] + c[1] + "." + c[2] + c[3] + "." + c[4] + c[5] + " " + c[6] + c[7] + ":" + c[8] + c[9];
		hDTO.setComplete(comp);
		System.out.println("hdto set완료!!!");
		hdao.insert(hDTO);
		System.out.println("hdao insert완료오오오");

		return "pay/payResult";
	}

	@Override
	public String couponUsing(CouponUseDTO cpuDTO) {
		System.out.println("쿠폰 사용처리");
		cpuDAO.update(cpuDTO);
		return "pay/payResult";
	}

	@Override
	public ArrayList checkReservation(String id) {

		List<PayDTO> pay_list = pdao.selectAll();
		List<PayDTO> list = new ArrayList<PayDTO>();
		List<String> carImageList = new ArrayList<String>();
		for (int i = 0; i < pay_list.size(); i++) {
			PayDTO dto = pay_list.get(i);
			if (dto.getBuy_id().equals(id)) {
				System.out.println(dto.getBuy_id() + " 예약 아이디 확인");
				System.out.println(dto.getBuy_impUid() + " 예약 주문번호 확인");

				list.add(dto);
			}

			CarDTO cdto = cdao.carNumSearch((String) dto.getBuy_carNum());
			carImageList.add(cdto.getCar_image());
		}
		
		ArrayList returnList = new ArrayList();
		returnList.add(list);
		returnList.add(carImageList);
		
		return returnList;
	}
	
	public String reservation_endTime_check(String id) {
		List<PayDTO> pdto = pdao.selectId(id);
		String returnText = "";
		if(pdto.size() == 0) {
			System.out.println("dto NULL 확인");
			returnText = "Y";
		} else {
			for (PayDTO payDTO : pdto) {
				System.out.println("realEndTime : " + payDTO.getBuy_real_endTime());
				if(String.valueOf(payDTO.getBuy_real_endTime()).equals("null")) {
					return returnText = "N";
				} else {
					returnText = "Y";
				}
			}
		}
		
		return returnText;
	}
	
	public String reservation_endTime_insert(String id) {
		List<PayDTO> pdto = pdao.selectId(id);
		String returnText = "";
		PayDTO insertDto = new PayDTO();
		if(pdto.size() == 0) {
			System.out.println("dto NULL 확인");
		} else {
			for (PayDTO payDTO : pdto) {
				System.out.println("realEndTime : " + payDTO.getBuy_real_endTime());
				if(String.valueOf(payDTO.getBuy_real_endTime()).equals("null")) {
					// select 해온 예약 내용 중 아직 반납이 안되어있는 예약건의 DTO를 저장
					insertDto = payDTO;
					
					// 반납시간을 dto에 저장(원래는 현재 시각으로 해야 하지만 테스트일때는 실제 반납시간보다 테스트 시간이 더 빠르기 때문에)
					insertDto.setBuy_real_endTime(payDTO.getBuy_endTime());
					
					// confirm 서비스에 있는 시간차이 계산하는 메소드로 시간차이 구하기
					// 주행거리는 시간당 40km로 임시 설정. 실제로는 GPS로 차량 주행거리를 구해서 나온 값을 입력
					long gap = confirmServiceImpl.timeGap(payDTO.getBuy_startTime(), payDTO.getBuy_endTime());
					System.out.println("timeGap : " + gap);
					gap = gap / 60;
					insertDto.setBuy_driveDistance(Integer.toString(((int)gap * 40)));
					
					insertDto.setBuy_real_returnLocation(payDTO.getBuy_returnLocation());
					CarDTO cdto = cdao.carNumSearch(insertDto.getBuy_carNum());
					insertDto.setBuy_addAmount(Integer.toString((int)gap * cdto.getFee_hour()));
					pdao.update(insertDto);
					
				} else {
				}
			}
		}
		
		return returnText;
	}
	

}