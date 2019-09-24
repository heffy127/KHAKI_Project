package co.kr.khaki.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;
import co.kr.khaki.member.DTO.LicenseDTO;
import co.kr.khaki.zone.KhakiZoneDAO;
import co.kr.khaki.zone.KhakiZoneDTO;

@Controller
public class MapController {

	@Autowired
	CarDAO cdao;
	
	@Autowired
	KhakiZoneDAO kdao;

	@RequestMapping("map.do")
	public String map(Model model, HttpSession session) {
		String selectZoneNum = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,";
		System.out.println("컨트롤러 1번");
		List<KhakiZoneDTO> list = kdao.selectAll();
		model.addAttribute("selectZoneNum", selectZoneNum);
		model.addAttribute("selectCarNum", null);
		model.addAttribute("list", list);
	return "map/map";
	}

	@RequestMapping("mapReset.do")
	public String mapReset(Model model, String selectZoneNum, String startTime, String endTime, String carNums) {
		System.out.println("MAP컨트롤러에서의 zones 값 : " + selectZoneNum);
		// 받아온 String 값을 세션에 넣어야 함
		List<KhakiZoneDTO> list = kdao.selectAll();
		model.addAttribute("selectZoneNum", selectZoneNum);
		model.addAttribute("selectCarNum", carNums);
		model.addAttribute("buy_startTime", startTime);
		model.addAttribute("buy_endTime", endTime);
		model.addAttribute("carNums", carNums);
		model.addAttribute("list", list);
		return "map/map";
	}

	@RequestMapping("selectCar.do")
	public String SelectCar(Model model, String buy_carModel) {
		List<CarDTO> list = cdao.selectCar(buy_carModel);
		model.addAttribute("carList", list);
		return "map/selectCar";
	}

	@RequestMapping("test.do")
	public String test() {
		return "map/test";
	}

	@RequestMapping("carListInfo.do") // 마커를 클릭했을 때 오른쪽 창에 차량목록표시
	public String carListInfo(Model model, Integer zoneNum) {
		System.out.println("1 컨트롤러 : " + zoneNum);
		List<CarDTO> list = cdao.carListInfo(zoneNum);
		model.addAttribute("carList", list);
		System.out.println("4 컨트롤러 : " + list.size());
		return "map/carListInfo";
	}

	@RequestMapping("burumReservation.do") // 부름예약시 주소입력 후 비용계산하기 위한 크롤링
	public String burumReservation(String add, Model model) {
		// https://map.kakao.com/?sName=출발주소(존)&eName=도착주소(고객)
		model.addAttribute("add", add);
		return "map/burumReservation";
	}

	@RequestMapping("carNumSearch.do") // 차량번호로 차량정보 찾아옴
	public String carNumSearch(Model model, String car_num) {
		CarDTO cdto = cdao.carNumSearch(car_num);
		model.addAttribute("cDTO", cdto);
		return "map/carNumSearch";
	}

	@RequestMapping("search1.do") // 차종으로 차량정보 찾아옴
	public String search1(Model model, String buy_carModel) {
		List<CarDTO> list = cdao.search1(buy_carModel);
		model.addAttribute("carList", list);
		return "map/search1";
	}
	
	@RequestMapping("mapLisence.do") // 차종으로 차량정보 찾아옴
	public String mapLisence(Model model, String sessionId) {
		LicenseDTO dto = cdao.mapLisence(sessionId);
		model.addAttribute("dto", dto);
		return "map/lisence";
	}

}