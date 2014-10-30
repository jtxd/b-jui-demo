package com.sevendosoft.access.constant.permethod.role;

import com.sevendosoft.access.constant.permission.anno.PermissionName;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-31下午2:25:34
 * @version 1.0
 */
public class RolePermission
{
	@PermissionName( "添加超级管理员" )
	public static final int ADD = 0B001;
	
	@PermissionName( "添加子角色" )
	public static final int ADDCHI = 0B010;
	
	@PermissionName( "删除" )
	public static final int DELETE = 0B100;
	
	@PermissionName( "授权" )
	public static final int PER = 0B1000;
	
	@PermissionName( "修改状态" )
	public static final int STATUS = 0B10000;
	
	
}
