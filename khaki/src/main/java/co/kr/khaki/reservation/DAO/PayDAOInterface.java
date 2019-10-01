package co.kr.khaki.reservation.DAO;

import java.util.List;

import co.kr.khaki.reservation.DTO.PayDTO;

public interface PayDAOInterface {

	void insert(PayDTO PayDTO);

	void update(PayDTO PayDTO);

	void delete(PayDTO PayDTO);

	PayDTO select(PayDTO PayDTO);

	List<PayDTO> select2(PayDTO PayDTO);

	List<PayDTO> selectImpUid(String buy_impUid);

	List<PayDTO> selectId(String buy_id);

	List<PayDTO> selectName(String buy_name);

	List<PayDTO> selectCarNum(String buy_carNum);

	List<PayDTO> selectAll();

	String selectCar(String buy_carModel);

	String selectEndTime(String buy_endTime, String buy_carModel);

	String selectStartTime(String buy_startTime, String buy_carModel);

	int countReservation(String buy_id);

	String search2(String buy_endTime, String buy_carNum, String buy_startTime);

}