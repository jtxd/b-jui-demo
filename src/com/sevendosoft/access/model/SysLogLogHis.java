package com.sevendosoft.access.model;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：登录日志历史表
	*@author childlikeman@gmail.com,http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysLogLogHis{
	private long logId;//日志ID
	private long userId;//用户ID
	private long loginTime;//登录时间
	private long logoutTime;//退出时间
	private String logIp;//登录Ip
	private long lastlogTime;//上次登录时间
	private int status;//状态;1在线0下线
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
	public long getLoginTime(){
		return this.loginTime;
	}
	public void setLoginTime(long loginTime){
		this.loginTime=loginTime;
	}
	public long getLogoutTime(){
		return this.logoutTime;
	}
	public void setLogoutTime(long logoutTime){
		this.logoutTime=logoutTime;
	}
	public String getLogIp(){
		return this.logIp;
	}
	public void setLogIp(String logIp){
		this.logIp=logIp;
	}
	public long getLastlogTime(){
		return this.lastlogTime;
	}
	public void setLastlogTime(long lastlogTime){
		this.lastlogTime=lastlogTime;
	}
	public int getStatus(){
		return this.status;
	}
	public void setStatus(int status){
		this.status=status;
	}

}