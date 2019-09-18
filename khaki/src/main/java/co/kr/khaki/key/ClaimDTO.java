package co.kr.khaki.key;

public class ClaimDTO {
	private int claim_num; // 신고번호
	private String claim_id; // 신고자 id
	private int claim_resNum; // 신고자 예약번호
	private String claim_category; // 신고유형
	private String claim_content; // 신고내용
	private String claim_suspect; // 용의자 (이전 사용자)
	private String claim_result; // 처리결과
	private String claim_subTime; // 처리결과
	private String claim_ansTime; // 처리결과
	
	public int getClaim_num() {
		return claim_num;
	}
	public void setClaim_num(int claim_num) {
		this.claim_num = claim_num;
	}
	public String getClaim_id() {
		return claim_id;
	}
	public void setClaim_id(String claim_id) {
		this.claim_id = claim_id;
	}
	public int getClaim_resNum() {
		return claim_resNum;
	}
	public void setClaim_resNum(int claim_resNum) {
		this.claim_resNum = claim_resNum;
	}
	public String getClaim_category() {
		return claim_category;
	}
	public void setClaim_category(String claim_category) {
		this.claim_category = claim_category;
	}
	public String getClaim_content() {
		return claim_content;
	}
	public void setClaim_content(String claim_content) {
		this.claim_content = claim_content;
	}
	public String getClaim_result() {
		return claim_result;
	}
	public void setClaim_result(String claim_result) {
		this.claim_result = claim_result;
	}
	public String getClaim_suspect() {
		return claim_suspect;
	}
	public void setClaim_suspect(String claim_suspect) {
		this.claim_suspect = claim_suspect;
	}
	public String getClaim_subTime() {
		return claim_subTime;
	}
	public void setClaim_subTime(String claim_subTime) {
		this.claim_subTime = claim_subTime;
	}
	public String getClaim_ansTime() {
		return claim_ansTime;
	}
	public void setClaim_ansTime(String claim_ansTime) {
		this.claim_ansTime = claim_ansTime;
	}
	
}
