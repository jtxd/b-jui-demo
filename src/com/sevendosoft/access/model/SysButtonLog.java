package com.sevendosoft.access.model;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：操作日志表
	*@author childlikeman@gmail.com,http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysButtonLog{
	private long logId;//操作日志ID
	private long userId;//用户ID
	private long urlId;//URLID
	private String permission;//操作权限类
	private int permValue;//权限值
	private long operaTime;//操作时间
	private String logIp;//操作Ip
	private String logDesc ;//描述
	
	public SysButtonLog() {
		super();
	}
	public SysButtonLog( long userId, long urlId,String permission, int permValue, long operaTime, String logIp ,String logDesc ) {
		super();
		this.userId = userId;
		this.urlId = urlId;
		this.permission = permission;
		this.permValue = permValue;
		this.operaTime = operaTime;
		this.logIp = logIp;
		this.logDesc = logDesc;
	}
	public long getLogId(){
		return this.logId;
	}
	public void setLogId(long logId){
		this.logId=logId;
	}
	public long getUserId(){
		return this.userId;
	}
	public void setUserId(long userId){
		this.userId=userId;
	}
	
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public int getPermValue() {
		return permValue;
	}
	public void setPermValue(int permValue) {
		this.permValue = permValue;
	}
	public long getOperaTime(){
		return this.operaTime;
	}
	public void setOperaTime(long operaTime){
		this.operaTime=operaTime;
	}
	public String getLogIp(){
		return this.logIp;
	}
	public void setLogIp(String logIp){
		this.logIp=logIp;
	}
	public long getUrlId()
	{
		return urlId;
	}
	public void setUrlId(long urlId)
	{
		this.urlId = urlId;
	}
	public String getLogDesc()
	{
		return logDesc;
	}
	public void setLogDesc(String logDesc)
	{
		this.logDesc = logDesc;
	}

}