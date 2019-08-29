package co.kr.khaki.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.CarDTO;

@Controller
public class MapController {
	
	@Autowired
	CarDAO cdao;

	@RequestMapping("map.do")
  	public String map(Model model, HttpSession session){
		String selectZoneNum = "0,1,2,";
		session.setAttribute("selectZoneNum", selectZoneNum);
  		return "map/map";
  	}
	
	@RequestMapping("mapReset.do")
	public String mapReset(Model model, String selectZoneNum,HttpSession session) {
		System.out.println("컨트롤러에서의 값 : " + selectZoneNum);
		// 받아온 String 값을 세션에 넣어야 함
		session.setAttribute("selectZoneNum", selectZoneNum);
		return "map/map";
	}
	
	@RequestMapping("selectCar.do")
  	public String SelectCar(Model model,String buy_carModel) {
		List<CarDTO> list = cdao.selectCar(buy_carModel);
		model.addAttribute("carList", list);
  		return "map/selectCar";
  	}
	
	@RequestMapping("test.do")
	public String test() {
		return "map/test";
	}
	@RequestMapping("carListInfo.do")
	public String carListInfo(Model model, Integer zoneNum) {
		System.out.println("1 컨트롤러 : " + zoneNum);
		List<CarDTO> list = cdao.carListInfo(zoneNum);
		model.addAttribute("carList", list);
		System.out.println("4 컨트롤러 : " + list.get(0).getCar_num());
		return "map/carListInfo";
	}
	@RequestMapping("burumReservation.do")
	public String burumReservation(String add, Model model) { // 부름예약시 주소입력 후 비용계산하기 위한 크롤링페이지
		//https://map.kakao.com/?sName=출발주소(존)&eName=도착주소(고객)
		model.addAttribute("add", add);
		return "map/burumReservation";
	}
	

}