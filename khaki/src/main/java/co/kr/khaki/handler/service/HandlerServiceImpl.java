package co.kr.khaki.handler.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.coupon.CouponUseDTO;
import co.kr.khaki.handler.DAO.HandlerDAO;
import co.kr.khaki.handler.DAO.HandlerUseDAO;
import co.kr.khaki.handler.DTO.HandlerDTO;
import co.kr.khaki.handler.DTO.HandlerStatusDTO;
import co.kr.khaki.handler.DTO.HandlerUseDTO;
import co.kr.khaki.member.InsertPointDTO;
import co.kr.khaki.member.LicenseDAO;
import co.kr.khaki.member.LicenseDTO;
import co.kr.khaki.member.MemberDAO;
import co.kr.khaki.member.MemberDTO;

@Service
public class HandlerServiceImpl implements HandlerServiceInterface {

	@Autowired
	HandlerDAO hdao;

	@Autowired
	HandlerUseDAO hudao;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	LicenseDAO licenseDAO;

	@Override
	public List<HandlerDTO> handlerBoard() {
		List<HandlerDTO> handler = hdao.selectAll();
		List<HandlerDTO> hd = new ArrayList<HandlerDTO>(); // 저장되어 출력 될 List

		Calendar cal = Calendar.getInstance();

		// 현재 년도, 월, 일
		int year2 = cal.get(cal.YEAR);
		String year3 = Integer.toString(year2);
		String[] year4 = year3.split("");
		String year5 = year4[2] + year4[3];
		int year = Integer.parseInt(year5);
		int month = cal.get(cal.MONTH) + 1;
		int date = cal.get(cal.DATE);
		int si = cal.get(cal.HOUR_OF_DAY);
		int bun = cal.get(cal.MINUTE);
		for (HandlerDTO hdr : handler) {

			String result = hdr.getComplete();
			String[] result2 = result.split("");
			String[] complete2 = new String[5];

			complete2[0] = result2[0] + result2[1];
			complete2[1] = result2[3] + result2[4];
			complete2[2] = result2[6] + result2[7];
			complete2[3] = result2[9] + result2[10];
			complete2[4] = result2[12] + result2[13];
			int[] complete = new int[5];
			complete[0] = Integer.parseInt(complete2[0]);
			complete[1] = Integer.parseInt(complete2[1]);
			complete[2] = Integer.parseInt(complete2[2]);
			complete[3] = Integer.parseInt(complete2[3]);
			complete[4] = Integer.parseInt(complete2[4]);
			System.out.println(year + " " + month + " " + date + " " + si + " " + bun + " " + "오늘날짜");
			System.out.println(complete[0] + " " + complete[1] + " " + complete[2] + " " + complete[3] + " "
					+ complete[4] + " " + "예약날짜");
				// 현재 년도와 완료날짜 년도가 같을 경우
				if(year == complete[0]) {
					if(month == complete[1]) { // 현재 월이 완료날짜 월과 같을 경우
						if(date == complete[2]) { // 현재 일이 완료날짜 일과 같을 경우
							if(si == complete[3]) { // 현재 시간이 완료날짜 시간과 같을 경우
								if(bun == complete[4]) { // 현재 분이 완료날짜 분과 같을 경우
									hd.add(hdr);
								} else if(bun > complete[4]) { // 현재 분이 완료날짜 분보다 클 경우(현재 30, 완료 29)
									// 완료날짜 지남(분)
								} else if(bun < complete[4]) { // 현재 분이 완료날짜 분보다 낮을 경우(현재 30, 완료 31)
									hd.add(hdr);
								}
							} else if(si > complete[3]) { // 현재 시간이 완료날짜 시간보다 클 경우(현재 13, 완료 12)
								// 완료날짜 지남(시)
							} else if(si < complete[3]) { // 현재 시간이 완료날짜 시간보다 작을 경우(현재 13, 완료 14)
								hd.add(hdr);
							}
						} else if(date > complete[2]) { // 현재 일이 완료날짜 일보다 클 경우(현재 15, 유효 14)
							// 완료날짜 지남(일)
						} else if(date < complete[2]) { // 현재 일이 완료날짜 일보다 작을 경우(현재 15, 유효 16)
							hd.add(hdr);
						}
					} else if(month > complete[1]) { // 현재 월이 완료날짜 월보다 클 경우(현재 09, 유효 08)
						// 완료날짜 지남(월)
					} else if(month < complete[1]) { // 현재 월이 완료날짜 월보다 작을 경우(현재 09, 유효 10)
						hd.add(hdr);
					}
					
				} else if(year > complete[0]) { // 현재 년도가 완료날짜년도보다 클 경우(현재 2019, 유효 2018)
					// 완료날짜 지남
				} else if(year < complete[0]) {// 현재 년도가 완료날짜년도보다 작을 경우(현재 2019, 유효 2020)
					hd.add(hdr);
				}

		}

		System.out.println("Controller SelectAll");
		return hd;
	}

	@Override
	public List<HandlerDTO> handlerDetailSearch(HandlerDTO hdto) {
		List<HandlerDTO> handler = hdao.select(hdto);
		System.out.println("Controller Select");
		return handler;
	}

	@Override
	public List<HandlerDTO> handlerDetailSearch2(HandlerDTO hdto) {
		List<HandlerDTO> handler = hdao.select2(hdto);
		System.out.println("Controller Select2");
		return handler;
	}

	@Override
	public MemberDTO handlerIdCheck(MemberDTO memberDTO) {
		MemberDTO memberDTO2 = memberDAO.selectId(memberDTO.getId());
		return memberDTO2;
	}

	// handler.jsp에서 아직 핸들러가 아닌 회원이 핸들러 신청하기 버튼을 클릭 했을 경우
	// 사용자의 useCount(카키 이용횟수)를 파악해 5번 이상 이용한 회원 일 경우 핸들러 신청 가능.
	@Override
	@RequestMapping("handlerUseCountCheck.do")
	public String handlerUseCountCheck(MemberDTO memberDTO) {
		memberDTO = memberDAO.selectId(memberDTO.getId()); // ajax에서 sessionId를 data로 보내서 해당 id로 select
		System.out.println(memberDTO.getId() + " : sessionId 확인");
		System.out.println(memberDTO.getUseCount() + " : useCount 확인"); // sessionId와 useCount 확인.
		String handler = ""; // handler여부에 들어갈 데이터 변수 생성
		HandlerStatusDTO hsDTO = new HandlerStatusDTO();
		System.out.println("확이이인");
		hsDTO.setId(memberDTO.getId()); // handler여부 DTO에 set id
		if (Integer.parseInt(memberDTO.getUseCount()) > 4) { // select해 온 useCount가 4보다 클 경우(5이상인 경우)
			LicenseDTO licenseDTO = licenseDAO.selectId(memberDTO.getId());
			int liYear = Integer.parseInt(licenseDTO.getIssueYear());
			int liMonth = Integer.parseInt(licenseDTO.getIssueMonth());
			int liDate = Integer.parseInt(licenseDTO.getIssueDay());
			Calendar cal = Calendar.getInstance();
			int year = cal.get(cal.YEAR);
			int month = cal.get(cal.MONTH) + 1;
			int date = cal.get(cal.DATE);
			if ((year - liYear) >= 2) {
				handler = "Y";
				hsDTO.setHandler(handler);
				System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
				memberDAO.updateHandler(hsDTO);
				return handler;
			} else if ((year - liYear) == 1) {
				if (month > liMonth) {
					handler = "Y";
					hsDTO.setHandler(handler);
					System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
					memberDAO.updateHandler(hsDTO);
					return handler;
				} else if (month == liMonth) {
					if (date > liDate) {
						handler = "Y";
						hsDTO.setHandler(handler);
						System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
						memberDAO.updateHandler(hsDTO);
						return handler;
					}
				}
			}

		} else if (memberDTO.getUseCount() == "null") { // select해 온 useCount가 한번도 이용을 하지 않아 비어 있을 경우(NULL)
			handler = "N";
			hsDTO.setHandler(handler);
			System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
			memberDAO.updateHandler(hsDTO);
			return handler;
		} else { // 4미만일 경우
			handler = "N";
			hsDTO.setHandler(handler);
			System.out.println("입력 될 데이터 : " + hsDTO.getId() + ", " + hsDTO.getHandler());
			memberDAO.updateHandler(hsDTO);
			return handler;
		}
		
		return handler;

		
	}

	// 핸들러 게시판에서 신청하기 버튼 누를 때마다 handleruse db에 insert
	@Override
	public void handlerUse(HandlerUseDTO handlerUseDTO) {
		System.out.println("hudao Insert~");
		hudao.insert(handlerUseDTO);
	}

	@Override
	public List<HandlerUseDTO> handlerUseSelect(String h_id) {
		System.out.println("handlerUse select 시작");
		List<HandlerUseDTO> hu = hudao.select(h_id);
		return hu;
	}

	@Override
	public void handlerUseUpdate(HandlerUseDTO handlerUseDTO) {
		String[] sp = handlerUseDTO.getH_point().split("p");
		System.out.println(sp[0]);
		hudao.update(handlerUseDTO);
		InsertPointDTO insertpointDTO = new InsertPointDTO();
		insertpointDTO.setId(handlerUseDTO.getH_id());
		insertpointDTO.setPoint(Integer.parseInt(sp[0]));
		memberDAO.updatePoint(insertpointDTO);
	}

	@Override
	@RequestMapping("handlerDelete.do")
	public void handlerDelete(HandlerDTO handlerDTO) {
		System.out.println(handlerDTO.getHb_num() + " 번호!!!");
		hdao.delete(handlerDTO);
	}

}
