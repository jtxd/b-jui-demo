package com.sevendosoft.access.model;

	/**
	*此类由MySQLToBean工具自动生成
	*备注(数据表的comment字段)：角色表
	*@author http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/

	public class SysInfoRole
	{
		private int roleId;//角色ID
		private String roleCode ;//角色编号
		private String roleName;//角色名称
		private int isUsed;//是否有效
		private long createTime;//创建时间
		private int parentId ;//父级角色
		
		public int getRoleId(){
			return this.roleId;
		}
		public void setRoleId(int roleId){
			this.roleId=roleId;
		}
		public String getRoleName(){
			return this.roleName;
		}
		public void setRoleName(String roleName){
			this.roleName=roleName;
		}
		public int getIsUsed(){
			return this.isUsed;
		}
		public void setIsUsed(int isUsed){
			this.isUsed=isUsed;
		}
		public long getCreateTime(){
			return this.createTime;
		}
		public void setCreateTime(long createTime){
			this.createTime=createTime;
		}
		public String getRoleCode()
		{
			return roleCode;
		}
		public void setRoleCode(String roleCode)
		{
			this.roleCode = roleCode;
		}
		public int getParentId(){
			return parentId;
		}
		public void setParentId(int parentId)
		{
			this.parentId = parentId;
		}

}