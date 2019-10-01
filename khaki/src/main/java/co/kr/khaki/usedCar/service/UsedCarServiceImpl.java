package co.kr.khaki.usedCar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.khaki.reservation.DTO.PayDTO;
import co.kr.khaki.usedCar.DAO.UsedCarDAOInterface;
import co.kr.khaki.usedCar.DTO.UsedCarDTO;

@Service
public class UsedCarServiceImpl implements UsedCarServiceInterface {
	
	@Autowired
	UsedCarDAOInterface usedCarDAO;

	@Override
	public void usedCarSales(UsedCarDTO usedCarDTO) {
		usedCarDAO.insert(usedCarDTO);
	}

	@Override
	public List<UsedCarDTO> admin_usedCar() {
		List<UsedCarDTO> usedCarDTO = usedCarDAO.selectAll();
		return usedCarDTO;
	}
	
	@Override
	public List<UsedCarDTO> usedCarYN() {
		List<UsedCarDTO> usedCarDTO = usedCarDAO.select();
		return usedCarDTO;
	}
	
	
	@Override
	public List<UsedCarDTO> refund_search(String select, String text) {
		System.out.println(select + "넘어온 데이터 확인");
		System.out.println(text + "넘어온 데이터 확인");

		if (select.equals("name")) {
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectName(text);
			return usedCarDTO;
		} else if (select.equals("carNum")){
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectCarNum(text);
			return usedCarDTO;
		} else if (select.equals("phone")){
			List<UsedCarDTO> usedCarDTO = usedCarDAO.selectPhone(text);
			return usedCarDTO;
		}
		return null;
		
		
	}

}