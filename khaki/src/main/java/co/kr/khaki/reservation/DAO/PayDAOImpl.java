package co.kr.khaki.reservation.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.reservation.DTO.PayDTO;

@Repository
public class PayDAOImpl implements PayDAOInterface {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public void insert(PayDTO PayDTO) {
		System.out.println("PayDAO Insert!");
		my.insert("pDAO.insert", PayDTO);
	}

	@Override
	public void update(PayDTO PayDTO) {
		System.out.println("PayDAO Update!");
		my.update("pDAO.update", PayDTO);
	}

	@Override
	public void delete(PayDTO PayDTO) {
		System.out.println("PayDAO delete!");
		my.delete("pDAO.delete", PayDTO);
	}

	@Override
	public PayDTO select(PayDTO PayDTO) {
		System.out.println("PayDAO select!");
		return my.selectOne("pDAO.select", PayDTO);
	}

	@Override
	public List<PayDTO> select2(PayDTO PayDTO) {
		System.out.println("PayDAO select!");
		return my.selectList("pDAO.select2", PayDTO);
	}

	@Override
	public List<PayDTO> selectImpUid(String buy_impUid) {
		System.out.println("PayDAO selectImpUid!");
		return my.selectList("pDAO.selectImpUid", buy_impUid);
	}

	@Override
	public List<PayDTO> selectId(String buy_id) {
		System.out.println("PayDAO selectId!");
		return my.selectList("pDAO.selectId", buy_id);
	}

	@Override
	public List<PayDTO> selectName(String buy_name) {
		System.out.println("PayDAO selectName!");
		return my.selectList("pDAO.selectName", buy_name);
	}

	@Override
	public List<PayDTO> selectCarNum(String buy_carNum) {
		System.out.println("PayDAO selectCarNum!");
		return my.selectList("pDAO.selectCarNum", buy_carNum);
	}

	@Override
	public List<PayDTO> selectAll() {
		System.out.println("PayDAO selectAll!");
		return my.selectList("pDAO.selectAll");
	}

	String cnt;

	@Override
	public String selectCar(String buy_carModel) {
		cnt = my.selectOne("pDAO.selectCar", buy_carModel);
		return cnt;
	}

	@Override
	public String selectEndTime(String buy_endTime, String buy_carModel) {
		PayDTO pDTO = new PayDTO();
		pDTO.setBuy_carModel(buy_carModel);
		pDTO.setBuy_endTime(buy_endTime);
		cnt = my.selectOne("pDAO.selectEndTime", pDTO);
		return cnt;
	}

	@Override
	public String selectStartTime(String buy_startTime, String buy_carModel) {
		PayDTO pDTO = new PayDTO();
		pDTO.setBuy_carModel(buy_carModel);
		pDTO.setBuy_startTime(buy_startTime);
		cnt = my.selectOne("pDAO.selectStartTime", pDTO);
		return cnt;
	}

	@Override
	public int countReservation(String buy_id) {
		System.out.println("pDAO countReservation");
		return my.selectOne("pDAO.countReservation", buy_id);
	}

	@Override
	public String search2(String buy_endTime, String buy_carNum, String buy_startTime) {
		// 입력한 시간,차량으로 예약가능한지 여부 계산
		PayDTO pDTO = new PayDTO();
		pDTO.setBuy_carNum(buy_carNum);
		pDTO.setBuy_startTime(buy_startTime);
		pDTO.setBuy_endTime(buy_endTime);
		System.out.println("☆DAO buy_carNum : " + buy_carNum);
		System.out.println("☆DAO buy_startTime : " + buy_startTime);
		System.out.println("☆DAO buy_endTime : " + buy_endTime);

		String arg1 = my.selectOne("pDAO.search2_1", pDTO); // 출발시간으로 비교
		System.out.println("startTime비교값 : " + arg1);
		String arg2 = my.selectOne("pDAO.search2_2", pDTO); // 도착시간으로 비교
		System.out.println("endTime비교값 : " + arg2);
		// 출발비교값 + 도착비교값 = 예약건수 일때 예약가능
		String arg = null;
		if (Integer.parseInt(arg1) + Integer.parseInt(arg2) == 0) {
			arg = "y";
		} else {
			arg = "n";
		}
		return arg;
	}

}