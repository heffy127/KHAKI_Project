package co.kr.khaki.zone;

public class KhakiZoneDTO {

	private int zone_num;			//카키존 넘버
	private String zone_name;		//카키존 이름
	private float zone_location_x;	//카키존 위도
	private float zone_location_y;	//카키존 경도
	private String zone_comment;	//카키존 세부설명
	
	public float getZone_location_x() {
		return zone_location_x;
	}
	public void setZone_location_x(float zone_location_x) {
		this.zone_location_x = zone_location_x;
	}
	public float getZone_location_y() {
		return zone_location_y;
	}
	public void setZone_location_y(float zone_location_y) {
		this.zone_location_y = zone_location_y;
	}
	public int getZone_num() {
		return zone_num;
	}
	public void setZone_num(int zone_num) {
		this.zone_num = zone_num;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public String getZone_comment() {
		return zone_comment;
	}
	public void setZone_comment(String zone_comment) {
		this.zone_comment = zone_comment;
	}
	
}