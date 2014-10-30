package com.sevendosoft.access.constant.permethod.role;

import com.sevendosoft.access.constant.permission.BasicPermission;
import com.sevendosoft.access.constant.permission.anno.PermissionName;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-8-4下午5:44:28
 * @version 1.0
 */
public class UserPermission extends BasicPermission
{
	@PermissionName( "修改状态" )
	public static final int STATUS = 0B1000;
}
