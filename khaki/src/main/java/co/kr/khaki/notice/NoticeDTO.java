package co.kr.khaki.notice;

public class NoticeDTO {

	private int notice_num;
	private String title;
	private String writer;
	private String content;
	private String image;
	private int hit;
	private String notice_type;
	private String write_date;
	
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	@Override
	public String toString() {
		return "NoticeDTO [notice_num=" + notice_num + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", image=" + image + ", write_date=" + write_date + ", hit=" + hit + ", notice_type="
				+ notice_type + "]";
	}
	
	
	
}
