package com.sevendosoft.access.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.app.servlet.RequestHandler;
import com.sevendo.framework.action.auth.Auth;
import com.sevendosoft.access.model.SysInfoUrl;
import com.sevendosoft.access.model.SysLogLog;
import com.sevendosoft.access.model.SysPrivilege;
import com.sevendosoft.access.service.LogService;
import com.sevendosoft.access.service.LoginService;
import com.sevendosoft.access.service.OrderService;
import com.sevendosoft.access.util.UserInfo;
import com.sevendosoft.init.SessionUtil;

/**
 * Description: 后台登录
 * Title:旅游网站信息化系统
 * @company:7dosoft
 * @author 唐选东
 * @Date: 2014年7月28日
 * @version 1.0
 */
@Controller( "loginAction" )
@Scope( "singleton" )
public class LoginAction {

	private LoginService loginService ;
	private OrderService orderService ;
	private LogService logService;
	/**
	 * 进入登录界面
	 * @return
	 */
	@RequestMapping( value="/index", method=RequestMethod.GET )
	public ModelAndView index(HttpServletRequest request) 
	{
		return new ModelAndView( 
		        new RedirectView( RequestHandler.getBasePath(request) +  "/login.html" )  
		) ;
	}	
	
	/**
	 * 后台登录
	 * @param loginName
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping( value="/user/login" )
	@ResponseBody
	public String login(
			String loginName, String password, String code, HttpSession session ,HttpServletRequest request) 
	{
		try {
			this.loginService.userLogin( loginName, password,code, session ,request);
			//获取上次登录时间-->第一次登录、上次登录时间为0
			long lastTime = 0;
			List<SysLogLog> logs = logService.getlogByUserId(UserInfo.getUserId(session));
			if(logs!=null && logs.size()>0){
				lastTime = logs.get(0).getLoginTime();
			}
			SysLogLog sysLogLog = new SysLogLog();
			sysLogLog.setUserId(UserInfo.getUserId(session));
			sysLogLog.setLoginTime(System.currentTimeMillis());
			sysLogLog.setLogIp(RequestHandler.getIpAddr(request));
			sysLogLog.setLastlogTime(lastTime);
			sysLogLog.setStatus(1);
			long logId = logService.addRoleInfo(sysLogLog);
			session.setAttribute("logId", logId);
			
			JSONObject result = new JSONObject();
			result.put( "statusCode", 200 );
			return result.toString();
		} catch( BusinessException e ) {
			JSONObject result = new JSONObject();
			result.put( "statusCode", 300 );
			result.put( "message", e.getMessage() );
			return result.toString();
		}
	}
	
	/**
     * 登录成功进入，主界面
     * @return
     */
    @RequestMapping( value="/main", method=RequestMethod.GET )
    @Auth
    public ModelAndView backIndex( HttpServletRequest request , HttpSession session) 
    {
    	ModelAndView view = new ModelAndView("/main") ;
    	String basePath = SessionUtil.getBasePath(request) ;
    	JSONArray array = new JSONArray() ;
    	JSONObject object = null ;
    	List<SysInfoUrl> infoUrl =  this.orderService.getSysInfoUrl() ;
    	List<SysPrivilege>  privilege = UserInfo.getUserPrivilege(session) ;
    	for (SysInfoUrl sysInfoUrl : infoUrl){
    		object = new JSONObject() ;
    		for (SysPrivilege sysPrivilege : privilege){
    			if(sysInfoUrl.getUrlId() == sysPrivilege.getUrlId() ){
    				object.put( "id" , sysInfoUrl.getUrlId() ) ;
    				object.put( "pId" , sysInfoUrl.getParentId() ) ;
    				object.put( "name" , sysInfoUrl.getName() ) ;
    				object.put( "nurl" , basePath + sysInfoUrl.getHref() ) ;
    				object.put( "target" , sysInfoUrl.getTarget() ) ;
    				object.put( "rel" , sysInfoUrl.getRel() ) ;
    				array.add(object) ;
    				break ;
				}
			}
		}
    	view.addObject( "infoUrl" , array ) ;
        return view;
    }
    
    /**
     * 退出界面
     * @param request
     * @param session
     * @return
     */
    @RequestMapping( value="/login" ,method=RequestMethod.GET )
    public ModelAndView logout(HttpServletRequest request,HttpSession session){
    	
    	logOutDtail(session) ;
    	return new ModelAndView( new RedirectView( RequestHandler.getBasePath(request) +  "/login.html" ) );
    }
    
    public void logOutDtail(HttpSession session){
    	Long logId = (Long)session.getAttribute("logId");
    	if( null != logId ){
    		try {
    			SysLogLog log = new SysLogLog();
    			log.setLogId(logId);
    			log.setLogoutTime(System.currentTimeMillis());
    			logService.updateLoginOutTimeByLogId(log );
    		} catch (BusinessException e) {
    			e.printStackTrace();
    		}
    		UserInfo.destory(session);
    	}
    }
    
    /**
     * 404界面
     * @return
     */
    @RequestMapping( value="/404" )
	public ModelAndView error() {		
		return new ModelAndView( "/404" );
	}
    
    /**
     * 欢迎界面
     * @return
     */
    @RequestMapping( value="/welcome" )
	public ModelAndView welcome() {		
		return new ModelAndView( "/welcome" );
	}
    
    /**
     * 修改密码
     * @return
     */
    @RequestMapping( value="/changePwd" )
    @Auth
    public ModelAndView changePwd(){
    	return new ModelAndView( "/system/user/user_pwd" ) ;
    }
    
    /**
     * 保存密码
     * @return
     */
    @RequestMapping( value="/pwd/save" )
    @Auth
    @ResponseBody
    public String pwdSave( String oldPwd , String newPwd , HttpSession session ){
    	JSONObject result = new JSONObject();
    	try
		{
			this.loginService.updatePwd( UserInfo.getUserId(session), oldPwd, newPwd, session ) ;
		} catch (BusinessException e)
		{
			result.put( "statusCode", 300 );
			result.put( "message", e.getMessage() );
			result.put( "navTabId", "main_changePwd" );
			result.put( "callbackType", "closeCurrent" );
			return result.toString();
		}    	
		result.put( "statusCode", 200 );
		result.put( "message", "修改密码成功！" );
		result.put( "navTabId", "main_changePwd" );
		result.put( "callbackType", "closeCurrent" );
		return result.toString();
    }
    
	public LoginService getLoginService()
	{
		return loginService;
	}

	public void setLoginService(LoginService loginService)
	{
		this.loginService = loginService;
	}

	public OrderService getOrderService()
	{
		return orderService;
	}

	public void setOrderService(OrderService orderService)
	{
		this.orderService = orderService;
	}

	public LogService getLogService()
	{
		return logService;
	}

	public void setLogService(LogService logService)
	{
		this.logService = logService;
	}
    
}
