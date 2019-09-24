package co.kr.khaki.coupon;

public class CouponDTO {
	
	private int num; 
	private String cId; // 쿠폰 ID
	private String cTitle; // 쿠폰 이름
	private String option; // 할인 옵션(금액인지 할인율인지)
	private int discount; // 할인액 & 할인율
	private String startDate; // 쿠폰 사용시점(발급일자)
	private String endDate; // 쿠폰 마감시점
	
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
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
