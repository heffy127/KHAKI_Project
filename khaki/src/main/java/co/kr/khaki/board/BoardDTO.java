package co.kr.khaki.board;


public class BoardDTO {
	private int bNum;
	private String title;
	private String writer;
	private String content;
	private String image;
	private int views;
	private int hit;
	private String category;
	private String write_date;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "BoardDTO [bNum=" + bNum + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", image=" + image + ", views=" + views + ", hit=" + hit + ", category=" + category + ", write_date="
				+ write_date + "]";
	}
	
	
	
	
}
