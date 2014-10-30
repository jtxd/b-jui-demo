package com.sevendosoft.access.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sevendo.framework.action.auth.AuthHandler;
import com.sevendo.framework.action.result.DWZResponse;

public class AuthCheck implements AuthHandler {

	@Override
	public boolean auth(HttpServletRequest request,
			HttpServletResponse response, int node, int permession ) {
		
		return -1 != UserInfo.getUserId( request );
	}

	@Override
	public String getAuthFailRedirectURL() {
		return "/404";
	}

	@Override
	public String getAuthFailJSON() {
		return new DWZResponse( DWZResponse.DWZ_STATUS_CODE_TIME_OUT, "没有操作权限或登录过期请重新登录" ).toString();
	}

	@Override
	public void unAuth(HttpServletRequest request, HttpServletResponse response) {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Exception e) {
		
	}

	
	
}
