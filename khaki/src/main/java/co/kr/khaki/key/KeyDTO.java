package co.kr.khaki.key;

public class KeyDTO {
	private String keyId; // sessionID로 id 값 지정
	private String door; // 문 열림 - 잠김
	private String carNum; // 차량 번호 /reservation DB join
	private String startCar; // 시동유무
	private String returnCar; // 차량 반납시간 / timestamp 사용
	
	public String getKeyId() {
		return keyId;
	}
	public void setKeyId(String keyId) {
		this.keyId = keyId;
	}
	public String getDoor() {
		return door;
	}
	public void setDoor(String door) {
		this.door = door;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getStartCar() {
		return startCar;
	}
	public void setStartCar(String startCar) {
		this.startCar = startCar;
	}
	public String getReturnCar() {
		return returnCar;
	}
	public void setReturnCar(String returnCar) {
		this.returnCar = returnCar;
	}
	
	// key 생성시 default 값을 지정해주는 생성자
	
	public KeyDTO() {
		
		this.door = "N";
		
		this.startCar = "N";
	}
	
	
}

