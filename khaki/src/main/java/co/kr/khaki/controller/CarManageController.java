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
import co.kr.khaki.handler.DTO.HandlerDTO;
import co.kr.khaki.notice.pagination;
import co.kr.khaki.usedCar.UsedCarDAO;
import co.kr.khaki.usedCar.UsedCarDTO;
import co.kr.khaki.zone.KhakiZoneDAO;
import co.kr.khaki.zone.KhakiZone_CarmanageDTO;

@Controller
public class CarManageController {

	@Autowired
	CarManageDAO cmdao;
	
	@Autowired
	CarConsumableDAO ccdao;
	
	@Autowired
	UsedCarDAO usedCarDAO;
	
	@Autowired
	KhakiZoneDAO zoneDAO;
	
	@RequestMapping("carmanageDelete.do")
	public String carmanageDelete(String car_num, Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int pageSize){
		// 페이지수 조절하는 것 연결하려면 curPage, pageSize를 가지고 다닐 수 있도록
		
		System.out.println("carmanage Controller Delete!");
		cmdao.delete(car_num);
		
		//selectJunggo
		System.out.println("carmanage select_junggo");
		List<CarManageDTO> junggolist = cmdao.selectjunggo();
		
		//selectOld
		System.out.println("carmanage select_old");
		List<CarManageDTO> oldlist = cmdao.selectold();

		//selectAll
		System.out.println("carmanage selectAll");
		List<CarManageDTO> cmlist = cmdao.selectAll();	
		
		int listCnt = cmlist.size();
		//pagination 객체 생성
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		
		// model로 객체 전송
		model.addAttribute("cmlist", cmlist);
		model.addAttribute("junggolist", junggolist);
		model.addAttribute("oldlist", oldlist);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		
		return "carmanage/carmanage";
	}
	
	@RequestMapping("car_consumable2.do")
	public String car_consumable2(CarConsumableDTO carConsumableDTO, String change_data, String change_index) {
		
		// update
		System.out.println("CarConsumable update");
		ccdao.updata(carConsumableDTO);
		
		return "carmanage/car_consumable2";	//ajax용
	}
	
	@RequestMapping("car_consumable1.do")
	public String car_consumable1(String distance, String carnum1, Model model){
		// distance와 carnum(차량번호)을 넘겨 받음
		model.addAttribute("distance",distance);
		
		// comsumable select 필요
		// consumable DB에서 넘겨받아옴(소모품 교체 횟수와 등록일시를)
		// model로 보낼 것은 select해온 값들
		System.out.println(carnum1);
		System.out.println("test1");
		System.out.println(ccdao.select(carnum1));
		
		System.out.println("test2");
		model.addAttribute("ccdto", ccdao.select(carnum1));
		model.addAttribute("carnum1",carnum1);
		
		return "carmanage/car_consumable1";
	}
	
	
	@RequestMapping("carmanageSelect.do")
	public String carmanageSelect(Model model, CarManageDTO carManageDTO){
		
		//차량번호 넘어오는지 확인(OK)
		System.out.println(carManageDTO.getCar_num().trim());
		// 차량번호를 넘겨받아서 select해오는 sql문 작성
		
		// 넘어올 때 이상한 띄어쓰기가 들어간 것을 제거하고 다시 넣어줌
		carManageDTO.setCar_num(carManageDTO.getCar_num().trim());
		carManageDTO = cmdao.select(carManageDTO);
		//select 완료
		
		// model객체로 전송
		model.addAttribute("cmdto",carManageDTO);
		
		
		return "carmanage/carmanageselect";
	}
	
	@RequestMapping("carmanage.do")
	public String carmanage(Model model, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int pageSize,
			@RequestParam(defaultValue="검색어없음") String search_list, @RequestParam(defaultValue="검색어없음") String search_obj){
		
		//selectJunggo
		System.out.println("carmanage select_junggo");
		List<CarManageDTO> junggolist = cmdao.selectjunggo();
		
		//selectOld
		System.out.println("carmanage select_old");
		List<CarManageDTO> oldlist = cmdao.selectold();

		//selectAll
		System.out.println("carmanage select, Search 분기");
		System.out.println("search_list : "+search_list+" / search_obj : "+search_obj);
		List<CarManageDTO> cmlist = cmdao.search(search_list, search_obj);
		
		System.out.println("junggosize : "+junggolist.size() +" / " + "oldsize : "+oldlist.size());
		
		int listCnt = cmlist.size();
		//pagination 객체 생성
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		
		// model로 객체 전송
		model.addAttribute("cmlist", cmlist);
		model.addAttribute("junggolist", junggolist);
		model.addAttribute("oldlist", oldlist);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		
		
		return "carmanage/carmanage";
	}
	
	@RequestMapping("carmanageInsert.do")
	public String carmanageInsert(Model model){
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		List<KhakiZone_CarmanageDTO> zonelist = zoneDAO.select_zone_num();
		
		//System.out.println(zonelist.get(0).getZone_name());
		
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
		String carNum = carManageDTO.getCar_num();
		List<UsedCarDTO> usedCarDTO = usedCarDAO.selectAll();
		for (UsedCarDTO used : usedCarDTO) {
			if(carNum.equals(used.getCarNum())) {
				usedCarDAO.update(used);
			}
		}
		
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
		//selectJunggo
		List<CarManageDTO> junggolist = cmdao.selectjunggo();
		//selectOld
		List<CarManageDTO> oldlist = cmdao.selectold();
		
		int listCnt = cmlist.size();
		pagination pg = new pagination(listCnt, curPage, pageSize);
		
		//CarList 객체 생성
		CarList carList = new CarList();
		
		model.addAttribute("cmlist", cmlist);		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pg);
		model.addAttribute("carList", carList.getCars());
		model.addAttribute("junggolist", junggolist);
		model.addAttribute("oldlist", oldlist);
		
		return "carmanage/carmanage";
	}
	
}