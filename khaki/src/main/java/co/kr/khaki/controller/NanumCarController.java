package co.kr.khaki.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NanumCarController {


	@RequestMapping("nanumCar.do")
	public String nanumCar() {
		return "nanum/nanumCar";
	}


}