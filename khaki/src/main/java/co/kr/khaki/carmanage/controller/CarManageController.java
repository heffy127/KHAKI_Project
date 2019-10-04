package co.kr.khaki.carmanage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.carmanage.DTO.CarConsumableDTO;
import co.kr.khaki.carmanage.DTO.CarManageDTO;
import co.kr.khaki.carmanage.service.CarList;
import co.kr.khaki.carmanage.service.CarManageSeviceInterface;
import co.kr.khaki.common.pagination;
import co.kr.khaki.zone.KhakiZone_CarmanageDTO;

@Controller
public class CarManageController {

	@Autowired
	CarManageSeviceInterface CarManageServiceImpl;
	
	@RequestMapping("car_numCheck.do")
	public String car_numCheck(String car_num, Model model) {
		
		String select_car_num = CarManageServiceImpl.car_numCheck(car_num);
		model.addAttribute("car_num",select_car_num);
		return "carmanage/car_numCheck";
	}
	
	@RequestMapping("carmanageDelete.do")
	public String carmanageDelete(String car_num, Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int pageSize){
		// 페이지수 조절하는 것 연결하려면 curPage, pageSize를 가지고 다닐 수 있도록
		
		System.out.println("carmanage Controller Delete!");
		ArrayList arr = CarManageServiceImpl.carmanageDelete(car_num, curPage, pageSize);
		
		List<CarManageDTO> cmlist = (List<CarManageDTO>)arr.get(0);
		int listCnt = (int)arr.get(1);
		pagination pg = (pagination)arr.get(2);
		
		// model로 객체 전송
		model.addAttribute("cmlist", cmlist);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		
		return "carmanage/carmanage";
	}
	
	@RequestMapping("car_consumable2.do")
	public String car_consumable2(CarConsumableDTO carConsumableDTO, String change_data, String change_index) {
		
		CarManageServiceImpl.car_consumable2(carConsumableDTO, change_data, change_index);
		
		return "carmanage/car_consumable2";	//ajax용
	}
	
	@RequestMapping("car_consumable1.do")
	public String car_consumable1(String distance, String carnum1, Model model){
		// distance와 carnum(차량번호)을 넘겨 받음
		
		// comsumable select 필요
		// consumable DB에서 넘겨받아옴(소모품 교체 횟수와 등록일시를)
		// model로 보낼 것은 select해온 값들
		
		CarConsumableDTO carConsumableDTO = CarManageServiceImpl.car_consumable1(carnum1);
		
		model.addAttribute("distance",distance);
		model.addAttribute("ccdto", carConsumableDTO);
		model.addAttribute("carnum1",carnum1);
		
		return "carmanage/car_consumable1";
	}
	
	
	@RequestMapping("carmanageSelect.do")
	public String carmanageSelect(Model model, CarManageDTO carManageDTO){
		
		carManageDTO = CarManageServiceImpl.carmanageSelect(carManageDTO);
		//select 완료
		// model객체로 전송
		model.addAttribute("cmdto",carManageDTO);
		return "carmanage/carmanageselect";
	}
	
	@RequestMapping("carmanage.do")
	public String carmanage(Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int pageSize,
			@RequestParam(defaultValue="검색어없음") String search_list, @RequestParam(defaultValue="검색어없음") String search_obj){
		
		ArrayList arr = CarManageServiceImpl.carmanage(curPage, pageSize, search_list, search_obj);
		
		//selectAll
		List<CarManageDTO> cmlist = (List<CarManageDTO>) arr.get(0);
		
		int listCnt = (int) arr.get(1);
		//pagination 객체 생성
		pagination pg = (pagination) arr.get(2);
		
		// model로 객체 전송
		model.addAttribute("cmlist", cmlist);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		
		return "carmanage/carmanage";
	}
	
	@RequestMapping("carmanageInsert.do")
	public String carmanageInsert(Model model){
		
		ArrayList arr = CarManageServiceImpl.carmanageInsert();
		
		CarList carList = (CarList) arr.get(0);
		List<KhakiZone_CarmanageDTO> zonelist = (List<KhakiZone_CarmanageDTO>) arr.get(1);
		
		// model로 객체 전송
		model.addAttribute("cars", carList.getCars());
		model.addAttribute("carlist", carList.getCarsList());
		model.addAttribute("brands",carList.getBrands());
		model.addAttribute("zonelist", zonelist);
		
		return "carmanage/carmanageInsert";
	}
	
	@RequestMapping("carmanageInsertDB.do")
	public String carmanageInsertDB(CarManageDTO carManageDTO, CarConsumableDTO carConsumableDTO, 
			@RequestParam(defaultValue="1") int curPage, Model model, @RequestParam(defaultValue="10") int pageSize){
		
		ArrayList arr = CarManageServiceImpl.carmanageInsertDB(carManageDTO, carConsumableDTO, curPage, pageSize);
		
		List<CarManageDTO> cmlist = (List<CarManageDTO>) arr.get(0);
		
		int listCnt = (int) arr.get(1);
		pagination pg = (pagination) arr.get(2);
		
		//CarList 객체 생성
		CarList carList = (CarList) arr.get(3);
		
		model.addAttribute("cmlist", cmlist);		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		model.addAttribute("carList", carList.getCars());
		
		return "carmanage/carmanage";
	}
	
}