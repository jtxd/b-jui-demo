package com.sevendosoft.access.constant.permission;

import com.sevendosoft.access.constant.permission.anno.PermissionName;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-28下午4:50:42
 * @version 1.0
 */
public class BasicPermission
{
	
	@PermissionName( "添加" )
	public static final int ADD = 0B001;
	
	@PermissionName( "修改" )
	public static final int UPDATE = 0B010;
	
	@PermissionName( "删除" )
	public static final int DELETE = 0B100;
	
}
