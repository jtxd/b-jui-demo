package com.sevendosoft.init;

import javax.servlet.http.HttpServletRequest;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>360问医生后台管理
 * @company:7dosoft
 * @author: txd
 * @Date: 2014-10-24下午4:06:14
 * @version 1.0
 */
public class SessionUtil {

	public static String getBasePath( HttpServletRequest request ) {
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		return basePath;
	}

}
