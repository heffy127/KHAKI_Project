package co.kr.khaki.usedCar.DAO;

import java.util.List;

import co.kr.khaki.usedCar.DTO.UsedCarDTO;

public interface UsedCarDAOInterface {

	void insert(UsedCarDTO UsedCarDTO);

	void update(UsedCarDTO UsedCarDTO);

	List<UsedCarDTO> select();

	List<UsedCarDTO> selectAll();

	List<UsedCarDTO> selectName(String name);

	List<UsedCarDTO> selectCarNum(String carNum);

	List<UsedCarDTO> selectPhone(String phone);

}