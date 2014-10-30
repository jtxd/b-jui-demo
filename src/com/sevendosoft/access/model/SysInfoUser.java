package com.sevendosoft.access.model;

import java.sql.Timestamp;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：用户表
	*@author http://t.qq.com/lostpig
	*@since 2014-07-29 10:14:55
	*/

public class SysInfoUser
{
	public static final int STATUS_NOMAL = 1;
	    
	public static final int STATUS_FREEZE = 0;
	    
	private long userId;//用户ID
	private int roleId ;//角色ID
	private String roleCode ;//角色编号
	private String roleName ;//角色名称
	private String userName;//用户名称
	private String passWord;//用户密码
	private long createTime;//创建时间
	private Timestamp createDate;//创建日期
	private int sex;//性别;0女1男
	private String birthday;//生日
	private String idCard;//身份证
	private String mobile;//手机
	private String phone;//电话
	private String email;//电子邮件
	private String addr;//地址
	private long createUserId;//创建者ID
	private String createIp;//创建IP
	//操作人
	private long operateUserId ;
	//操作时间
	private long opetateTime ;
	private int isDefPassWord;//是否默认0是1否
	private int isUsed;//是否有效
	private int sortNo;//排序号
	
	public long getUserId(){
		return this.userId;
	}
	public void setUserId(long userId){
		this.userId=userId;
	}
	public String getUserName(){
		return this.userName;
	}
	public void setUserName(String userName){
		this.userName=userName;
	}
	public String getPassWord(){
		return this.passWord;
	}
	public void setPassWord(String passWord){
		this.passWord=passWord;
	}
	public long getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(long createTime){
		this.createTime=createTime;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public int getSex(){
		return this.sex;
	}
	public void setSex(int sex){
		this.sex=sex;
	}
	public String getBirthday(){
		return this.birthday;
	}
	public void setBirthday(String birthday){
		this.birthday=birthday;
	}
	public String getIdCard(){
		return this.idCard;
	}
	public void setIdCard(String idCard){
		this.idCard=idCard;
	}
	public String getMobile(){
		return this.mobile;
	}
	public void setMobile(String mobile){
		this.mobile=mobile;
	}
	public String getPhone(){
		return this.phone;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getEmail(){
		return this.email;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public String getAddr(){
		return this.addr;
	}
	public void setAddr(String addr){
		this.addr=addr;
	}
	public long getCreateUserId(){
		return this.createUserId;
	}
	public void setCreateUserId(long createUserId){
		this.createUserId=createUserId;
	}
	public String getCreateIp(){
		return this.createIp;
	}
	public void setCreateIp(String createIp){
		this.createIp=createIp;
	}
	public int getIsDefPassWord(){
		return this.isDefPassWord;
	}
	public void setIsDefPassWord(int isDefPassWord){
		this.isDefPassWord=isDefPassWord;
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
	public long getOperateUserId()
	{
		return operateUserId;
	}
	public void setOperateUserId(long operateUserId)
	{
		this.operateUserId = operateUserId;
	}
	public long getOpetateTime()
	{
		return opetateTime;
	}
	public void setOpetateTime(long opetateTime)
	{
		this.opetateTime = opetateTime;
	}
	public int getRoleId()
	{
		return roleId;
	}
	public void setRoleId(int roleId)
	{
		this.roleId = roleId;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}