package com.sevendosoft.access.model;

import java.io.Serializable;

	/**
	*权限管理表
	*@author http://t.qq.com/lostpig
	*@since 2014-07-29 09:45:44
	*/
	public class SysPrivilege implements Serializable
	{
		
		private static final long serialVersionUID = 1L;

		private long privilegeId;//权限管理表ID
		private int roleId;//角色ID
		private int urlId;//菜单ID
		private int permValue;//权限值
		private String permission ;//权限类
		public long getPrivilegeId()
		{
			return privilegeId;
		}
		public void setPrivilegeId(long privilegeId)
		{
			this.privilegeId = privilegeId;
		}
		public int getRoleId()
		{
			return roleId;
		}
		public void setRoleId(int roleId)
		{
			this.roleId = roleId;
		}
		public int getUrlId()
		{
			return urlId;
		}
		public void setUrlId(int urlId)
		{
			this.urlId = urlId;
		}
		public int getPermValue()
		{
			return permValue;
		}
		public void setPermValue(int permValue)
		{
			this.permValue = permValue;
		}
		public String getPermission()
		{
			return permission;
		}
		public void setPermission(String permission)
		{
			this.permission = permission;
		}
		
}