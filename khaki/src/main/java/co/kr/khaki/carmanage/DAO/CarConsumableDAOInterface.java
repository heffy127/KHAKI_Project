package co.kr.khaki.carmanage.DAO;

import co.kr.khaki.carmanage.DTO.CarConsumableDTO;

public interface CarConsumableDAOInterface {

	void insert(CarConsumableDTO carConsumableDTO); // insert End

	CarConsumableDTO select(String carnum1);

	void updata(CarConsumableDTO carConsumableDTO);

}