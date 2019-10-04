package co.kr.khaki.carmanage.DAO;

import java.util.List;

import co.kr.khaki.carmanage.DTO.CarManageDTO;

public interface CarManageDAOInter {

	String check_car_num(String car_num);

	List<CarManageDTO> search(String search_list, String search_obj);

	List<CarManageDTO> selectAll();

	void insert(CarManageDTO carManageDTO);

	CarManageDTO select(CarManageDTO carManageDTO);

	List<CarManageDTO> selectjunggo();

	List<CarManageDTO> selectold();

	void delete(String car_num);

}