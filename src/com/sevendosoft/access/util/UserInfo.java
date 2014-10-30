package com.sevendosoft.access.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sevendosoft.access.model.SysInfoUser;
import com.sevendosoft.access.model.SysPrivilege;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>360问医生后台管理
 * @company:7dosoft
 * @author: txd
 * @Date: 2014-10-24下午4:06:14
 * @version 1.0
 */
public class UserInfo {

	public static void setUserSession( HttpSession session, SysInfoUser userInfo , List<SysPrivilege> userPrivilege ) 
	{
		session.setAttribute( "userInfo", userInfo );
		session.setAttribute( "userPrivilege", userPrivilege );
	}
	
	public static SysInfoUser getUserInfo( HttpSession session ) {
		return (SysInfoUser) session.getAttribute( "userInfo" );
	}
	
	/**
	 * 获取当前用户ID
	 * @param request
	 * @return
	 */
	public static long getUserId( HttpServletRequest request ) {
		return getUserId( request.getSession() );
	}
	
	/**
	 * 获取当前用户ID
	 * @param session
	 * @return
	 */
	public static long getUserId( HttpSession session ) {
		SysInfoUser userInfo = getUserInfo(session) ;
		return userInfo == null ? -1 : userInfo.getUserId() ;
	}
	
	/**
	 * 获取当前用户名称
	 * @param request
	 * @return
	 */
	public static String getUserName( HttpServletRequest request ) {
		return getUserName( request.getSession() );
	}
	
	/**
	 * 获取当前用户名称
	 * @param session
	 * @return
	 */
	public static String getUserName( HttpSession session ) {
		SysInfoUser userInfo = getUserInfo(session) ;
		return userInfo == null ?  null : userInfo.getUserName();
	}
	
	/**
	 * 获取用户角色ID
	 * @param request
	 * @return
	 */
	public static int getRoleId( HttpServletRequest request ) {
		return getRoleId( request.getSession() );
	}
	
	/**
	 * 获取用户角色ID
	 * @param session
	 * @return
	 */
	public static int getRoleId( HttpSession session ) {
		SysInfoUser userInfo = getUserInfo(session) ;
		return userInfo == null ? -1 : userInfo.getRoleId() ;
	}
	
	/**
	 * 角色名称
	 * @param session
	 * @return
	 */
	public static String getRoleName( HttpSession session ) {
		SysInfoUser userInfo = getUserInfo(session) ;
		return userInfo == null ?  null : userInfo.getRoleName();
	}
	
	/**
	 * 角色名称
	 * @param session
	 * @return
	 */
	public static String getRoleCode( HttpSession session ) {
		SysInfoUser userInfo = getUserInfo(session) ;
		return userInfo == null ?  null : userInfo.getRoleCode();
	}
	
	/**
	 * 获取当前用户所有权限
	 * @param session
	 * @return
	 */
	public static List<SysPrivilege> getUserPrivilege( HttpSession session ) {
		@SuppressWarnings("unchecked")
		List<SysPrivilege> userPrivilege = (List<SysPrivilege>) session.getAttribute( "userPrivilege" );
		return userPrivilege ;
	}
	
	public static void destory( HttpSession session ) {
		session.removeAttribute( "userInfo" );
		session.removeAttribute( "userPrivilege" );
	}

}
