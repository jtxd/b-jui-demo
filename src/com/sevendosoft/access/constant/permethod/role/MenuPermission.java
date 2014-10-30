package com.sevendosoft.access.constant.permethod.role;

import com.sevendosoft.access.constant.permission.anno.PermissionName;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-8-4下午5:45:31
 * @version 1.0
 */
public class MenuPermission
{
	@PermissionName( "添加根节点" )
	public static final int ADDROOT = 0B0001;
	
	@PermissionName( "添加根子点" )
	public static final int ADDCHI = 0B0010;
	
	@PermissionName( "修改状态" )
	public static final int STATUS = 0B0100;
	
	@PermissionName( "删除" )
	public static final int DELETE = 0B1000;
	
}
