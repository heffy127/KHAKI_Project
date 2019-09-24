package co.kr.khaki.controller;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.key.KeyDAO;
import co.kr.khaki.key.KeyDTO;

@Controller
public class KeyController {
	
	@Autowired
	KeyDAO keyDAO;
	
	// 키 불러오기
	@RequestMapping("key.do")
	public String key() {
		return "key/key";
	}
	
	// 키생성
	@RequestMapping("Crekey.do")
	public String CreKey() {
		return "key/key";
	}
	
	// 문열림
	@RequestMapping("unlock.do")
	public String unlock(KeyDTO KeyDTO) {
		if(KeyDTO.getDoor().equals("N")) {
			KeyDTO.setDoor("Y");
			keyDAO.updateDoor(KeyDTO);
		}
		return "key/key";
	}
	
	// 문잠김
	@RequestMapping("lock.do")
	public String lock(KeyDTO KeyDTO) {
		if(KeyDTO.getDoor().equals("Y")) {
			KeyDTO.setDoor("N");
			keyDAO.updateDoor(KeyDTO);
		}
		return "key/key";
	}
	
	// 시동걸기
	@RequestMapping("startCar.do")
	public String startCar(KeyDTO KeyDTO) {
		if(KeyDTO.getStartCar().equals("N")) {
			KeyDTO.setDoor("Y");
			keyDAO.updateStartCar(KeyDTO);
		}
		return "key/key";
	}
	
	// 차 반납하기
	@RequestMapping("returnCar.do")
	public String returnCar(KeyDTO KeyDTO, String returnTime) {
		if(KeyDTO.getReturnCar().isEmpty()) {
			// DB에 차량 반납시간 넣기
			DateFormat df = DateFormat.getDateInstance(DateFormat.LONG, Locale.KOREA);
			Calendar cal = Calendar.getInstance(Locale.KOREA);
			returnTime = df.format(cal.getTime());
			
			KeyDTO.setReturnCar(returnTime);
			keyDAO.updateReturnCar(KeyDTO);
		}
		return "key/key";
	}
}
