package co.kr.khaki.carmanage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.carmanage.DAO.CarConsumableDAOInterface;
import co.kr.khaki.carmanage.DAO.CarManageDAOInter;
import co.kr.khaki.carmanage.DTO.CarConsumableDTO;
import co.kr.khaki.carmanage.DTO.CarManageDTO;
import co.kr.khaki.common.pagination;
import co.kr.khaki.usedCar.DAO.UsedCarDAOInterface;
import co.kr.khaki.usedCar.DTO.UsedCarDTO;
import co.kr.khaki.zone.DAO.KhakiZoneDAO;
import co.kr.khaki.zone.DTO.KhakiZone_CarmanageDTO;

@Service
public class CarManageServiceImpl implements CarManageSeviceInterface {

	@Autowired
	CarManageDAOInter cmdao;
	
	@Autowired
	CarConsumableDAOInterface ccdao;
	
	@Autowired
	UsedCarDAOInterface usedCarDAO;
	
	@Autowired
	KhakiZoneDAO zoneDAO;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#car_numCheck(java.lang.String, org.springframework.ui.Model)
	 */
	@Override
	public String car_numCheck(String car_num) {
		// car_numCheck : 차번호를 받아서 DB에서 있는지 확인하는 메소드
		String select_car_num = cmdao.check_car_num(car_num);
		return select_car_num;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#carmanageDelete(java.lang.String, org.springframework.ui.Model, int, int)
	 */
	@Override
	public ArrayList carmanageDelete(String car_num, int curPage, int pageSize){
		// 페이지수 조절하는 것 연결하려면 curPage, pageSize를 가지고 다닐 수 있도록
		
		System.out.println("carmanage Controller Delete!");
		cmdao.delete(car_num);

		//selectAll
		System.out.println("carmanage selectAll");
		List<CarManageDTO> cmlist = cmdao.selectAll();	
		
		int listCnt = cmlist.size();
		//pagination 객체 생성
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		ArrayList arr = new ArrayList();
		arr.add(cmlist);
		arr.add(listCnt);
		arr.add(pg);
		
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#car_consumable2(co.kr.khaki.carmanage.CarConsumableDTO, java.lang.String, java.lang.String)
	 */
	@Override
	public void car_consumable2(CarConsumableDTO carConsumableDTO, String change_data, String change_index) {
		
		// update
		System.out.println("CarConsumable update");
		ccdao.updata(carConsumableDTO);
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#car_consumable1(java.lang.String, java.lang.String, org.springframework.ui.Model)
	 */
	@Override
	public CarConsumableDTO car_consumable1(String carnum1){
		
		// comsumable select 필요
		// consumable DB에서 넘겨받아옴(소모품 교체 횟수와 등록일시를)
		// model로 보낼 것은 select해온 값들
		// distance와 carnum(차량번호)을 넘겨 받음
		
		return ccdao.select(carnum1);
	}
	
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#carmanageSelect(org.springframework.ui.Model, co.kr.khaki.carmanage.CarManageDTO)
	 */
	@Override
	public CarManageDTO carmanageSelect(CarManageDTO carManageDTO){
		// 넘어올 때 이상한 띄어쓰기가 들어간 것을 제거하고 다시 넣어줌
		carManageDTO.setCar_num(carManageDTO.getCar_num().trim());
		carManageDTO = cmdao.select(carManageDTO);
		//select 완료
		
		return carManageDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#carmanage(org.springframework.ui.Model, int, int, java.lang.String, java.lang.String)
	 */
	@Override
	public ArrayList carmanage(int curPage, int pageSize,
			@RequestParam(defaultValue="검색어없음") String search_list, @RequestParam(defaultValue="검색어없음") String search_obj){

		ArrayList arr = new ArrayList();
		
		//selectAll
		List<CarManageDTO> cmlist = cmdao.search(search_list, search_obj);
		
		int listCnt = cmlist.size();
		//pagination 객체 생성
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		arr.add(cmlist);
		arr.add(listCnt);
		arr.add(pg);
		
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#carmanageInsert(org.springframework.ui.Model)
	 */
	@Override
	public ArrayList carmanageInsert(){
		
		ArrayList arr = new ArrayList();
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		List<KhakiZone_CarmanageDTO> zonelist = zoneDAO.select_zone_num();
		
		arr.add(carList);
		arr.add(zonelist);
		
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.service.CarManageSeviceInterface#carmanageInsertDB(co.kr.khaki.carmanage.CarManageDTO, co.kr.khaki.carmanage.CarConsumableDTO, int, org.springframework.ui.Model, int)
	 */
	@Override
	public ArrayList carmanageInsertDB(CarManageDTO carManageDTO, CarConsumableDTO carConsumableDTO, 
			int curPage, int pageSize){
		
		ArrayList arr = new ArrayList();
		
		String carNum = carManageDTO.getCar_num();
		List<UsedCarDTO> usedCarDTO = usedCarDAO.selectAll();
		for (UsedCarDTO used : usedCarDTO) {
			if(carNum.equals(used.getCarNum())) {
				usedCarDAO.update(used);
			}
		}
		
		cmdao.insert(carManageDTO);
		ccdao.insert(carConsumableDTO);
		
		List<CarManageDTO> cmlist = cmdao.selectAll();
		
		int listCnt = cmlist.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		arr.add(cmlist);
		arr.add(listCnt);
		arr.add(pg);
		arr.add(carList);
		
		return arr;
	}
	
}