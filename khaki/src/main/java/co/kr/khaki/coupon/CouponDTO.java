package co.kr.khaki.coupon;

public class CouponDTO {
	
	private int num; 
	private String cId; // 쿠폰 ID
	private String cTitle1; // 쿠폰 이름
	private String cTitle2; // 쿠폰 이름
	private String cOption; // 할인 옵션(금액인지 할인율인지)
	private int discount; // 할인액 & 할인율
	private String endDate; // 쿠폰 마감시점
	private String cpCondition; // 쿠폰조건번호
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcTitle1() {
		return cTitle1;
	}
	public void setcTitle1(String cTitle1) {
		this.cTitle1 = cTitle1;
	}
	public String getcTitle2() {
		return cTitle2;
	}
	public void setcTitle2(String cTitle2) {
		this.cTitle2 = cTitle2;
	}
	public String getcOption() {
		return cOption;
	}
	public void setcOption(String cOption) {
		this.cOption = cOption;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCpCondition() {
		return cpCondition;
	}
	public void setCpCondition(String cpCondition) {
		this.cpCondition = cpCondition;
	}
	
	
	
	
	
}
