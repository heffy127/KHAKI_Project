package co.kr.khaki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.carmanage.CarConsumableDAO;
import co.kr.khaki.carmanage.CarConsumableDTO;
import co.kr.khaki.carmanage.CarList;
import co.kr.khaki.carmanage.CarManageDAO;
import co.kr.khaki.carmanage.CarManageDTO;
import co.kr.khaki.notice.pagination;

@Controller
public class CarManageController {

	@Autowired
	CarManageDAO cmdao;
	
	@Autowired
	CarConsumableDAO ccdao;
	
	@RequestMapping("car_consumable1.do")
	public String car_consumable(String distance, int carnum1, Model model){
		// distance와 carnum(차량번호)을 넘겨 받음
		model.addAttribute("distance",distance);
		
		ccdao.select(carnum1);
		// comsumable select 필요
		// consumable DB에서 넘겨받아옴(소모품 교체 횟수와 등록일시를)

		// model로 보낼 것은 select해온 값들
		
		
		return "carmanage/car_consumable1";
	}
	
	
	@RequestMapping("carmanageSelect.do")
	public String carmanageSelect(Model model, CarManageDTO carManageDTO){
		
		//차량번호 넘어오는지 확인(OK)
		System.out.println(carManageDTO.getCarnum().trim());
		// 차량번호를 넘겨받아서 select해오는 sql문 작성
		
		// 넘어올 때 이상한 띄어쓰기가 들어간 것을 제거하고 다시 넣어줌
		carManageDTO.setCarnum(carManageDTO.getCarnum().trim());
		carManageDTO = cmdao.select(carManageDTO);
		//select 완료
		
		// model객체로 전송
		model.addAttribute("cmdto",carManageDTO);
		
		
		return "carmanage/carmanageselect";
	}
	
	@RequestMapping("carmanage.do")
	public String carmanage(Model model, @RequestParam(defaultValue="1") int curPage){
		
		//selectAll
		System.out.println("carmanage selectAll");
		List<CarManageDTO> cmlist = cmdao.selectAll();
		
		int listCnt = cmlist.size();
		//pagination 객체 생성
		pagination pg = new pagination(listCnt, curPage);
		
		
		// model로 객체 전송
		model.addAttribute("cmlist", cmlist);		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		
		
		return "carmanage/carmanage";
	}
	
	@RequestMapping("carmanageInsert.do")
	public String carmanageInsert(Model model){
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		// model로 객체 전송
		model.addAttribute("cars", carList.getCars());
		model.addAttribute("carlist", carList.getCarsList());
		model.addAttribute("brands",carList.getBrands());
		
		return "carmanage/carmanageInsert";
	}
	
	@RequestMapping("carmanageInsertDB.do")
	public String carmanageInsertDB(CarManageDTO carManageDTO, CarConsumableDTO carConsumableDTO, 
			@RequestParam(defaultValue="1") int curPage, Model model){
		
		System.out.println("CMcontroller Insert!");
		cmdao.insert(carManageDTO);
		System.out.println("test1");
		//
		System.out.println(carConsumableDTO);
		System.out.println("CarConsumable Insert!");
		ccdao.insert(carConsumableDTO);
		//
		System.out.println("test2");
		System.out.println(carConsumableDTO);
		System.out.println("test3");
		
		List<CarManageDTO> cmlist = cmdao.selectAll();
		int listCnt = cmlist.size();
		pagination pg = new pagination(listCnt, curPage);
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		model.addAttribute("cmlist", cmlist);		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		model.addAttribute("carList", carList.getCars());
		
		return "carmanage/carmanage";
	}
	
}
