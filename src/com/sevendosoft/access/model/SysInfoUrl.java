package com.sevendosoft.access.model;

import java.util.List;

	/**
	*此类由MySQLToBean工具自动生成
	*菜单表
	*@author childlikeman@gmail.com,http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysInfoUrl{
	private int urlId;//菜单ID
	private String name;//名称
	private int type;//类型
	private String href;//url地址
	private String icon;//图标
	private String description;//描述
	private String target;//目标对象
	private String rel ;
	private int parentId;//父级
	private long createTime;//创建时间
	private int isUsed;//是否有效
	private int sortNo;//排序号
	private String permission;//权限类
	private int permValue ; //权限值
	
	private String parentName;//父级菜单
	private List<SysButton> sysButton ;
	
	public int getUrlId(){
		return this.urlId;
	}
	public void setUrlId(int urlId){
		this.urlId=urlId;
	}
	public String getName(){
		return this.name;
	}
	public void setName(String name){
		this.name=name;
	}
	public int getType(){
		return this.type;
	}
	public void setType(int type){
		this.type=type;
	}
	public String getHref(){
		return this.href;
	}
	public void setHref(String href){
		this.href=href;
	}
	public String getIcon(){
		return this.icon;
	}
	public void setIcon(String icon){
		this.icon=icon;
	}
	public String getDescription(){
		return this.description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String getTarget(){
		return this.target;
	}
	public void setTarget(String target){
		this.target=target;
	}
	public int getParentId(){
		return this.parentId;
	}
	public void setParentId(int parentId){
		this.parentId=parentId;
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
	public int getSortNo(){
		return this.sortNo;
	}
	public void setSortNo(int sortNo){
		this.sortNo=sortNo;
	}
	public String getPermission(){
		return this.permission;
	}
	public void setPermission(String permission){
		this.permission=permission;
	}
	public List<SysButton> getSysButton()
	{
		return sysButton;
	}
	public void setSysButton(List<SysButton> sysButton)
	{
		this.sysButton = sysButton;
	}
	public int getPermValue()
	{
		return permValue;
	}
	public void setPermValue(int permValue)
	{
		this.permValue = permValue;
	}
	public String getParentName()
	{
		return parentName;
	}
	public void setParentName(String parentName)
	{
		this.parentName = parentName;
	}
	public String getRel()
	{
		return rel;
	}
	public void setRel(String rel)
	{
		this.rel = rel;
	}

}