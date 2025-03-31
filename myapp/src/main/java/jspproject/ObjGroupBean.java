package jspproject;

public class ObjGroupBean {
	private int objgroup_id;
	private String objgroup_name;
	private int obj_id;
	private String user_id;
	
	public ObjGroupBean() {}
	
	public ObjGroupBean(int objgroup_id, String objgroup_name, int obj_id, String user_id) {
		this.objgroup_id = objgroup_id;
		this.objgroup_name = objgroup_name;
		this.obj_id = obj_id;
		this.user_id = user_id;
	}

	public int getObjgroup_id() {
		return objgroup_id;
	}
	public void setObjgroup_id(int objgroup_id) {
		this.objgroup_id = objgroup_id;
	}
	public String getObjgroup_name() {
		return objgroup_name;
	}
	public void setObjgroup_name(String objgroup_name) {
		this.objgroup_name = objgroup_name;
	}
	public int getObj_id() {
		return obj_id;
	}
	public void setObj_id(int obj_id) {
		this.obj_id = obj_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
