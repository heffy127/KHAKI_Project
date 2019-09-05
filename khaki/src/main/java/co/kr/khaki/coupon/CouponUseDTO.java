package co.kr.khaki.coupon;

public class CouponUseDTO {
	
	// 쿠폰북처럼 모든 쿠폰이 들어가는 DB가 아닌
	// 사용자가 사용하고 싶은 쿠폰을 다운로드 했을 경우 해당 DB에 insert됨
	// 사용자는 해당 DB에 등록 된 db만 사용 할 수 있음.
	private String cp_id; // 쿠폰 다운받은 사용자 sessionId
	private String cp_title; // 쿠폰 이름
	private String cp_type; // 쿠폰종류(퍼센트 할인, 금액할인 구분. P일경우 퍼센트 M일 경우 금액할인)
	private int cp_num; // 할인정도
	private String cp_end; // 쿠폰 유효기간 마감날짜(해당 DTO 호출할 때 유효기간 마감날짜가 이미 지났을 경우 해당 쿠폰 삭제)
	private String cp_using;
	
	
	public String getCp_using() {
		return cp_using;
	}
	public void setCp_using(String cp_using) {
		this.cp_using = cp_using;
	}
	public String getCp_id() {
		return cp_id;
	}
	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}
	public String getCp_title() {
		return cp_title;
	}
	public void setCp_title(String cp_title) {
		this.cp_title = cp_title;
	}
	public String getCp_type() {
		return cp_type;
	}
	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}
	public int getCp_num() {
		return cp_num;
	}
	public void setCp_num(int cp_num) {
		this.cp_num = cp_num;
	}
	public String getCp_end() {
		return cp_end;
	}
	public void setCp_end(String cp_end) {
		this.cp_end = cp_end;
	}
	
	
	
	
}
