package co.kr.khaki.carmanage;

public class CarManageDTO {

	private int khaki_num;		// 카키 차량 고유 번호 부여
	private String carnum;		// 차량 번호
	private int distance;		// 총 운행 km
	private String fuel;		// 가솔린, 디젤, 하이브리드
	private String brand;		// 현대, 기아, 삼성 등
	private String car_size;	// 차량 크기 : 중형, 준중형, 소형, 경차 등
	private String carname;		// 차량 종류 : 아반떼, 소나타 등
	private String reg_date;	// 등록일시
	private String img;			// 차량사진
	
	public int getKhaki_num() {
		return khaki_num;
	}
	public String getCar_size() {
		return car_size;
	}
	public void setCar_size(String car_size) {
		this.car_size = car_size;
	}
	public void setKhaki_num(int khaki_num) {
		this.khaki_num = khaki_num;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "CarManageDTO [khaki_num=" + khaki_num + ", carnum=" + carnum + ", distance=" + distance + ", fuel="
				+ fuel + ", brand=" + brand + ", car_size=" + car_size + ", carname=" + carname + ", reg_date="
				+ reg_date + ", img=" + img + "]";
	}
	
	
}
