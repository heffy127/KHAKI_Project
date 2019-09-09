package co.kr.khaki.carmanage;

import java.util.ArrayList;

public class CarList {

	// String 배열 한개로 한큐에 끝내자! substring으로 각 요소들 찾아서 활용할 수 있도록 구현
	// Map이용 ( key : value 형태로 ) 예) 제조사(키) - 차종(value = key2) - 연료,사이즈(value2)
	private String[] cars = {"avante", "grandeur", "k3", "k5", "k7", "malibu", "olando", "pride", "ray", "santafe",
			"sm3", "sm5", "sm7", "sonata", "soranto", "spark", "stinger", "tivoli", "tivoli_air", "tucson"};

	private String[] fuels = {"가솔린", "디젤", "하이브리드"};
	
	private String[] sizes = {"small", "compact", "midsize", "compact_SUV", "SUV"};
	// 경형 = compact, 소형 = small, 준중형 = semi-midsize, 중형 = midsize, 소형SUV = compact_SUV, SUV = SUV
	
	private String[] brands = {"Hyundai", "RenaultSamsung", "Kia", "Chevrolet", "Ssangyong"};

	// 제조사/차량명/사이즈/연료 순으로 정리
	private String[] carsList = {
			"Hyundai/avante/compact/가솔린", "Hyundai/grandeur/midesize/가솔린",
			"Hyundai/grandeur/midesize/하이브리드",
			"Hyundai/sonata/midesize/가솔린", "Hyundai/santafe/SUV/디젤",
			"Hyundai/santafe/SUV/가솔린", "Hyundai/tucson/SUV/가솔린",
			"Hyundai/tucson/SUV/디젤", "RenaultSamsung/sm3/compact/가솔린",
			"RenaultSamsung/sm5/midsize/가솔린", "RenaultSamsung/sm7/midsize/가솔린",
			"Kia/k3/compact/가솔린", "Kia/k5/midsize/가솔린", "Kia/k7/midsize/가솔린",
			"Kia/pride/small/가솔린", "Kia/ray/small/가솔린", "Kia/soranto/SUV/디젤",
			"Kia/stinger/midsize/가솔린", "Chevrolet/malibu/midsize/가솔린",
			"Chevrolet/olando/SUV/디젤", "Chevrolet/spark/small/가솔린",
			"Ssangyong/tivoli/SUV/디젤", "Ssangyong/tivoli/SUV/가솔린",
			"Ssangyong/tivoli_air/SUV/디젤", "Ssangyong/tivoli_air/SUV/가솔린" 
	};
	
	/*
	private String[] Hyundai = {"avante", "grandeur", "sonata", "santafe", "tucson"};	
	private String[] RenaultSamsung = {"sm3", "sm5", "sm7"};	
	private String[] Kia = {"k3", "k5", "k7", "pride", "ray", "soranto", "stinger"};	
	private String[] Chevrolet = {"malibu", "olando", "spark"};	
	private String[] Ssangyong = {"tivoli", "tivoli_air"};
	*/
	
	public static void main(String[] args) {
		CarList name = new CarList();
		System.out.println(name.getCarsList()[0]);
		
	}
	
	public String[] getBrands() {
		return brands;
	}

	public void setBrands(String[] brands) {
		this.brands = brands;
	}
	
	public String[] getCarsList() {
		return carsList;
	}

	public void setCarsList(String[] carsList) {
		this.carsList = carsList;
	}

	public String[] getCars() {
		return cars;
	}

	public void setCars(String[] cars) {
		this.cars = cars;
	}
	
}