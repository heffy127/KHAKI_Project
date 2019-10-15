package co.kr.khaki.carmanage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CarList {

	// String 배열 한개로 한큐에 끝내자! substring으로 각 요소들 찾아서 활용할 수 있도록 구현
	// Map이용 ( key : value 형태로 ) 예) 제조사(키) - 차종(value = key2) - 연료,사이즈(value2)
	private String[] cars = {"avante", "grandeur", "k3", "k5", "k7", "malibu", "olando", "pride", "ray", "santafe",
			"sm3", "sm5", "sm7", "sonata", "soranto", "spark", "stinger", "tivoli", "tivoli_air", "tucson"};

	private String[] fuels = {"가솔린", "디젤", "하이브리드"};
	
	private String[] sizes = {"소형", "준중형", "중형", "준중형_SUV", "SUV"};
	// 경형 = 준중형, 소형 = 소형, 준중형 = semi-중형, 중형 = 중형, 소형SUV = 준중형_SUV, SUV = SUV
	
	private String[] brands = {"현대", "르노삼성", "기아", "쉐보레", "쌍용"};
	
	// 제조사/차량명/사이즈/연료 순으로 정리
	private String[] carsList = {
			"현대/avante/준중형/가솔린", "현대/grandeur/중형/가솔린",
			"현대/grandeur/중형/하이브리드",
			"현대/sonata/중형/가솔린", "현대/santafe/SUV/디젤",
			"현대/santafe/SUV/가솔린", "현대/tucson/SUV/가솔린",
			"현대/tucson/SUV/디젤", "르노삼성/sm3/준중형/가솔린",
			"르노삼성/sm5/중형/가솔린", "르노삼성/sm7/중형/가솔린",
			"기아/k3/준중형/가솔린", "기아/k5/중형/가솔린", "기아/k7/중형/가솔린",
			"기아/pride/소형/가솔린", "기아/ray/소형/가솔린", "기아/soranto/SUV/디젤",
			"기아/stinger/중형/가솔린", "쉐보레/malibu/중형/가솔린",
			"쉐보레/olando/SUV/디젤", "쉐보레/spark/소형/가솔린",
			"쌍용/tivoli/SUV/디젤", "쌍용/tivoli/SUV/가솔린",
			"쌍용/tivoli_air/SUV/디젤", "쌍용/tivoli_air/SUV/가솔린" 
	};
	
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