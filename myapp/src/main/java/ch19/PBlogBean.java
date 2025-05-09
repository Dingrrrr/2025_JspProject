package ch19;

public class PBlogBean {
	
	private int num;
	private String message;
	private String id;
	private String pdate;
	private String photo;
	private int hcnt;
	
	public PBlogBean() {}
	
	public PBlogBean(int num, String message, String id, String pdate, String photo, int hcnt) {
		super();
		this.num = num;
		this.message = message;
		this.id = id;
		this.pdate = pdate;
		this.photo = photo;
		this.hcnt = hcnt;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getHcnt() {
		return hcnt;
	}
	public void setHcnt(int hcnt) {
		this.hcnt = hcnt;
	}
	
}
