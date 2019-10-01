package co.kr.khaki.refund.DAO;

import java.util.List;

import co.kr.khaki.refund.DTO.RefundDTO;

public interface RefundDAOInterface {

	void insert(RefundDTO RefundDTO);

	void update(RefundDTO RefundDTO);

	RefundDTO select(String impUid);

	List<RefundDTO> selectAll();

}