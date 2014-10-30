package com.sevendosoft.access.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sevendo.framework.action.auth.AuthInterceptor;
import com.sevendo.framework.action.exception.ActionFailException;
import com.sevendo.framework.action.result.DWZResponse;
import com.sevendosoft.access.constant.permission.anno.Permission;
import com.sevendosoft.access.model.SysPrivilege;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>旅游网站信息化系统
 * @company:7dosoft
 * @author 唐选东
 * @Date: 2014年6月9日
 * @version 1.0
 */
public class PermissionAuth implements HandlerInterceptor {

    private Log logger = LogFactory.getLog( AuthInterceptor.class );
    
    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object obj, Exception e )
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
            Object arg2, ModelAndView arg3) throws Exception {
        
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {

        HandlerMethod method =(HandlerMethod) handler;
        
        Permission auth = method.getMethodAnnotation( Permission.class );
        if( auth == null ) {
            this.logger.debug( "无需认证：" + request.getRequestURI() );
            return true;
        }
        //认证
        if( -1 != UserInfo.getUserId( request) ) 
        {
        	boolean flag = false ;
        	//获取当前用户所有权限
			List<SysPrivilege> privilege = UserInfo.getUserPrivilege(request.getSession());
			for (SysPrivilege sysPrivilege : privilege)
			{
				if( (sysPrivilege.getPermValue()&auth.permission()) == auth.permission() )
				{
					flag = true ;					
					break ;
				}
			}
			
			return  flag ;
			
        } else {
			throw new ActionFailException( new DWZResponse( DWZResponse.DWZ_STATUS_CODE_TIME_OUT, "没有操作权限或登录过期请重新登录" ).toString() , "utf-8" ); 
        }
        
    }
}
