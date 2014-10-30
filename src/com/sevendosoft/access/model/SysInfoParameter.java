package com.sevendosoft.access.model;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：系统参数表
	*@author childlikeman@gmail.com,http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysInfoParameter{
	private int parameterId;//系统参数ID
	private String paraName;//参数名称
	private String paraDesc;//参数描述
	private String paraValue;//参数值
	private long createTime;//创建时间
	private int isUsed;//是否有效0无效，1有效
	public int getParameterId(){
		return this.parameterId;
	}
	public void setParameterId(int parameterId){
		this.parameterId=parameterId;
	}
	public String getParaName(){
		return this.paraName;
	}
	public void setParaName(String paraName){
		this.paraName=paraName;
	}
	public String getParaDesc(){
		return this.paraDesc;
	}
	public void setParaDesc(String paraDesc){
		this.paraDesc=paraDesc;
	}
	public String getParaValue(){
		return this.paraValue;
	}
	public void setParaValue(String paraValue){
		this.paraValue=paraValue;
	}
	public long getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(long createTime){
		this.createTime=createTime;
	}
	public int getIsUsed(){
		return this.isUsed;
	}
	public void setIsUsed(int isUsed){
		this.isUsed=isUsed;
	}

}