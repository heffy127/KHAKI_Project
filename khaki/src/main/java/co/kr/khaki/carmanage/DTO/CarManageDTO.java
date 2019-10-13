package co.kr.khaki.carmanage.DTO;

/**
 * @author 민병호
 *
 */
public class CarManageDTO {

	private String car_name; // 차종 > 소나타,아반떼..
	private String car_num; // 차번호 > 30가1234 , 프라이머리키
	private int driven; // 주행거리
	private String fuel_type; // 연료타입 디젤,가솔린,하이브리드,전기
	private int fuel_gage; // 연료충전량		-- 90 고정으로 넣는 것(일단)
	private int zone_num; // 해당 차량이 소속된 존의 번호(위도,경도)	-- 
	private int fee_hour; // 1시간당 대여료 (처음 예약시 결제)		-- 기준 7000
	private int fee_km; // km당 요금 (반납 후 결제)		-- 기준 150
	private String car_image; //이미지 경로		-- 
	private String brand;	//제조사 
	private String car_size;
	private String reg_date;
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public int getDriven() {
		return driven;
	}
	public void setDriven(int driven) {
		this.driven = driven;
	}
	public String getFuel_type() {
		return fuel_type;
	}
	public void setFuel_type(String fuel_type) {
		this.fuel_type = fuel_type;
	}
	public int getFuel_gage() {
		return fuel_gage;
	}
	public void setFuel_gage(int fuel_gage) {
		this.fuel_gage = fuel_gage;
	}
	public int getZone_num() {
		return zone_num;
	}
	public void setZone_num(int zone_num) {
		this.zone_num = zone_num;
	}
	public int getFee_hour() {
		return fee_hour;
	}
	public void setFee_hour(int fee_hour) {
		this.fee_hour = fee_hour;
	}
	public int getFee_km() {
		return fee_km;
	}
	public void setFee_km(int fee_km) {
		this.fee_km = fee_km;
	}
	public String getCar_image() {
		return car_image;
	}
	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCar_size() {
		return car_size;
	}
	public void setCar_size(String car_size) {
		this.car_size = car_size;
	}
	
	@Override
	public String toString() {
		return "CarManageDTO [car_name=" + car_name + ", car_num=" + car_num + ", driven=" + driven + ", fuel_type="
				+ fuel_type + ", fuel_gage=" + fuel_gage + ", zone_num=" + zone_num + ", fee_hour=" + fee_hour
				+ ", fee_km=" + fee_km + ", car_image=" + car_image + ", brand=" + brand + ", car_size=" + car_size
				+ ", reg_date=" + reg_date + "]";
	}
	
}