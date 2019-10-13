package co.kr.khaki.carmanage.service;

import java.util.ArrayList;
import java.util.List;

import co.kr.khaki.carmanage.DTO.CarConsumableDTO;
import co.kr.khaki.carmanage.DTO.CarManageDTO;

public interface CarManageSeviceInterface {

	String car_numCheck(String car_num);

	ArrayList carmanageDelete(String car_num, int curPage, int pageSize);

	void car_consumable2(CarConsumableDTO carConsumableDTO, String change_data, String change_index);

	CarConsumableDTO car_consumable1(String carnum1);

	CarManageDTO carmanageSelect(CarManageDTO carManageDTO);

	ArrayList carmanage(int curPage, int pageSize, String search_list, String search_obj);
	
	ArrayList carmanageInsert();

	ArrayList carmanageInsertDB(CarManageDTO carManageDTO, CarConsumableDTO carConsumableDTO, int curPage,
			int pageSize);
	
	List<CarManageDTO> carmanageSelectZonenum(int zone_num);

	ArrayList carmanageUpdateDB(CarManageDTO carManageDTO,int curPage, int pageSize);
	
}