package com.sevendosoft.access.model;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：操作日志表
	*@author childlikeman@gmail.com,http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysButtonLogHis{
	private long logId;//操作日志ID
	private long userId;//用户ID
	private long buttonId;//功能ID
	private long operaTime;//操作时间
	private String logIp;//操作Ip
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
	public long getButtonId(){
		return this.buttonId;
	}
	public void setButtonId(long buttonId){
		this.buttonId=buttonId;
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

}