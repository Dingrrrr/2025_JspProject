package jspproject;

public class BgmBean {
	private int bgm_id;
	private String user_id;
	private String bgm_name;
	private String bgm_cnt;
	private String bgm_music;
	private int bgm_onoff;
	private String bgm_image;
	private int mplist_id;
	
	public BgmBean() {}
	
	public BgmBean(int bgm_id, String user_id, String bgm_name, String bgm_cnt, String bgm_music, int bgm_onoff,
			String bgm_image, int mplist_id) {
		this.bgm_id = bgm_id;
		this.user_id = user_id;
		this.bgm_name = bgm_name;
		this.bgm_cnt = bgm_cnt;
		this.bgm_music = bgm_music;
		this.bgm_onoff = bgm_onoff;
		this.bgm_image = bgm_image;
		this.mplist_id = mplist_id;
	}

	public int getBgm_id() {
		return bgm_id;
	}
	public void setBgm_id(int bgm_id) {
		this.bgm_id = bgm_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBgm_name() {
		return bgm_name;
	}
	public void setBgm_name(String bgm_name) {
		this.bgm_name = bgm_name;
	}
	public String getBgm_cnt() {
		return bgm_cnt;
	}
	public void setBgm_cnt(String bgm_cnt) {
		this.bgm_cnt = bgm_cnt;
	}
	public String getBgm_music() {
		return bgm_music;
	}
	public void setBgm_music(String bgm_music) {
		this.bgm_music = bgm_music;
	}
	public int getBgm_onoff() {
		return bgm_onoff;
	}
	public void setBgm_onoff(int bgm_onoff) {
		this.bgm_onoff = bgm_onoff;
	}
	public String getBgm_image() {
		return bgm_image;
	}
	public void setBgm_image(String bgm_image) {
		this.bgm_image = bgm_image;
	}
	public int getMplist_id() {
		return mplist_id;
	}
	public void setMplist_id(int mplist_id) {
		this.mplist_id = mplist_id;
	}
}
