package com.sevendosoft.access.model;

public class SysButton {

	private long btnlId;
	private long urlId;
	private String btnName;
	private int permValue;
	private boolean hasPermission;
	public long getBtnlId() {
		return btnlId;
	}
	public void setBtnlId(long btnlId) {
		this.btnlId = btnlId;
	}
	public long getUrlId() {
		return urlId;
	}
	public void setUrlId(long urlId) {
		this.urlId = urlId;
	}
	public String getBtnName() {
		return btnName;
	}
	public void setBtnName(String btnName) {
		this.btnName = btnName;
	}
	public int getPermValue() {
		return permValue;
	}
	public void setPermValue(int permValue) {
		this.permValue = permValue;
	}
	public boolean isHasPermission() {
		return hasPermission;
	}
	public void setHasPermission(boolean hasPermission) {
		this.hasPermission = hasPermission;
	}
	
	
	
}
