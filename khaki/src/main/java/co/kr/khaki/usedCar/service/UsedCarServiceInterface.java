package co.kr.khaki.usedCar.service;

import java.util.List;

import co.kr.khaki.usedCar.DTO.UsedCarDTO;

public interface UsedCarServiceInterface {

	void usedCarSales(UsedCarDTO usedCarDTO);

	List<UsedCarDTO> admin_usedCar();

	List<UsedCarDTO> usedCarYN();

	List<UsedCarDTO> refund_search(String select, String text);

}