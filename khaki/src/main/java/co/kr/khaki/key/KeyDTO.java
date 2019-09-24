package co.kr.khaki.key;

public class KeyDTO {
	private String keyId; // sessionID�� id �� ����
	private String door; // �� ���� - ���
	private String carNum; // ���� ��ȣ /reservation DB join
	private String startCar; // �õ�����
	private String returnCar; // ���� �ݳ��ð� / timestamp ���
	
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
	
	// key ������ default ���� �������ִ� ������
	
	public KeyDTO() {
		
		this.door = "N";
		
		this.startCar = "N";
	}
	
	
}

