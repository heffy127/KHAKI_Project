package co.kr.khaki.refund.DTO;

public class RefundDTO {
	
	String impUid; // 환불신청한 주문번호
	String id; // 환불신청한 고객 아이디
	String name; // 환불신청한 고객 이름
	String refundRequest; // 환불신청한 날짜
	String burum; // 부름서비스 선택 여부(부름서비스 선택했을 경우 handler DB에서도 해당건 환불 됐을 때 삭제 처리해주어야 함.
	String amount; // 총 결제 금액(환불해줘야 할 금액. 할인 적용된 금액임. 환불 해줄 때는 amount + usePoint + pointOrCoupon)
	String usePoint; // 사용한 포인트(환불 완료 될 경우 사용한 포인트를 다시 되돌려주어야 함)
	String pointOrCoupon; // 사용한 쿠폰 금액(환불 완료 될때 고객에게 환불해줘야 함)
	String couponNum; // 쿠폰 번호(환불 완료 될 경우 해당 쿠폰 사용여부를 N으로 바꿔서 사용 할 수 있게 처리해야 함)
	String exp; // 추가 된 경험치(환불 완료 될 경우 해당 경험치를 차감해야 함)
	String refundYN; // 환불처리 여부 Y/N
	
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRefundRequest() {
		return refundRequest;
	}
	public void setRefundRequest(String refundRequest) {
		this.refundRequest = refundRequest;
	}
	public String getBurum() {
		return burum;
	}
	public void setBurum(String burum) {
		this.burum = burum;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
	}
	public String getPointOrCoupon() {
		return pointOrCoupon;
	}
	public void setPointOrCoupon(String pointOrCoupon) {
		this.pointOrCoupon = pointOrCoupon;
	}
	public String getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(String couponNum) {
		this.couponNum = couponNum;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getRefundYN() {
		return refundYN;
	}
	public void setRefundYN(String refundYN) {
		this.refundYN = refundYN;
	}
	
	
	

	
	
}
