package com.sevendosoft.access.action;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.app.handler.date.DateHandler;
import com.sevendo.framework.util.page.PageList;
import com.sevendosoft.access.constant.permethod.role.LogPermission;
import com.sevendosoft.access.constant.permethod.role.LoginPermission;
import com.sevendosoft.access.constant.permission.anno.Permission;
import com.sevendosoft.access.constant.permission.anno.PermissionName;
import com.sevendosoft.access.service.LogService;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>旅游网站信息化系统
 * @company:7dosoft
 * @author 唐选东
 * @Date: 2014年8月3日
 * @version 1.0
 */
@RequestMapping( value = "/log")
@Controller( "logAction" )
@Scope( "singleton" )
public class LogAction
{
    private Logger logger = LoggerFactory.getLogger( LogAction.class );
    private LogService logService;
    
    /**
	 * 日志信息列表
	 * @param pageNum
	 * @param keyWord
	 * @param numPerPage
	 * @param session
	 * @return
	 */
    @RequestMapping( value="/node/listview" )
	@Permission( node=LogPermission.class )
	public ModelAndView nodeListview( Integer pageNum, 
			String keyWord, Integer numPerPage, HttpServletRequest request ) 
    {
        ModelAndView view = new ModelAndView( "/system/log/log_list" );
        pageNum = pageNum == null ? 1 : pageNum;
        numPerPage = ( numPerPage == null || numPerPage == 0 ) ? 20 : numPerPage;
        PageList<Map> list = this.logService.getLogInfoList( keyWord, pageNum, numPerPage );
        List<Map> listMap = list.getDatalist() ;
        for (Map<String, Object> map : listMap)
		{
			map.put("operaTime", DateHandler.long2String( Long.parseLong( map.get( "operaTime" )+"" ) ) ) ;
			if( Integer.parseInt( map.get( "permValue" )+"" )  != 0 ){
				try
				{
					Class<?> clz = Class.forName(map.get( "permission" )+"") ;
					// 获取当前实体类的所有属性，返回Field数组 
	    			Field[] fields = clz.getDeclaredFields(); 
	    			// 获取父类的所有属性，返回Field数组
	    			Field[] fieldsSup = clz.getSuperclass().getDeclaredFields();
	    			for(int i=0; i< fieldsSup.length; i++){
	    				Field f = fieldsSup[i];	
	    				if (fieldsSup[i].getType().getName().equals(   java.lang.Integer.class.getName())   || fieldsSup[i].getType().getName().equals("int"))
							try{
								if( Integer.parseInt( map.get( "permValue" )+"" ) == fieldsSup[i].getInt(f)){
									map.put("permValue", f.getAnnotation(PermissionName.class).value() ) ;
									break ;
								}
							} catch (IllegalArgumentException
									| IllegalAccessException e){
								logger.debug("非法参数或安全权限异常:" + e.getMessage() ) ;
							}
	    	        }
	    			for(int i=0; i< fields.length; i++){
	    				Field f = fields[i];	
	    				if (fields[i].getType().getName().equals(   java.lang.Integer.class.getName())   || fields[i].getType().getName().equals("int"))
							try{
								if( Integer.parseInt( map.get( "permValue" )+"" ) == fields[i].getInt(f)){
									map.put("permValue", f.getAnnotation(PermissionName.class).value() ) ;
									break ;
								}
							} catch (IllegalArgumentException
									| IllegalAccessException e){
								logger.debug("非法参数或安全权限异常:" + e.getMessage() ) ;
							}
	    	        }
				} catch (ClassNotFoundException e)
				{
					logger.debug("不存在该类:"+e.getMessage()) ;
				}
			}
			else{ map.put("permValue", "列表" ) ; } ;
		}
        view.addObject( "list", list );
        view.addObject( "listMap", listMap );
        view.addObject( "keyWord", keyWord );
        logService.addLog( request, LogPermission.class , 0 ,"点击，日志信息列表" ) ;
        return view;
    }
    
    /**
     * 清空日志
     * 把日志添加到日志历史信息中
     * 在做定期清空处理
     * @return
     */
    @RequestMapping( value="/node/delview", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=LogPermission.class , permission = LogPermission.DELALL)
    public String nodeDelview( HttpSession session ,HttpServletRequest request ) 
    {
        JSONObject result = new JSONObject();
        try {
            this.logService.deleteLogTx();            
            result.put( "statusCode", 200 );
            result.put( "message", "清空操作日志" );
            result.put( "navTabId", "log_node_listview" );
            //添加操作日志
	    	logService.addLog( request, LogPermission.class , LogPermission.DELALL , "清空操作日志" ) ;
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
    }

    /**
	 * 登录日志信息列表
	 * @param pageNum
	 * @param keyWord
	 * @param numPerPage
	 * @param session
	 * @return
	 */
    @RequestMapping( value="/login/listview" )
	@Permission( node=LoginPermission.class )
	public ModelAndView loginListview( Integer pageNum, 
			String keyWord, Integer numPerPage, HttpServletRequest request ) 
    {
        ModelAndView view = new ModelAndView( "/system/log/login_list" );
        pageNum = pageNum == null ? 1 : pageNum;
        numPerPage = ( numPerPage == null || numPerPage == 0 ) ? 20 : numPerPage;
        PageList<Map> list = this.logService.getLoginInfoList( keyWord, pageNum, numPerPage );
        List<Map> listMap = list.getDatalist() ;
        for (Map<String, Object> map : listMap)
		{
			map.put("loginTime", DateHandler.long2String(Long.parseLong( map.get( "loginTime" )+"" )) ) ;
			map.put("logoutTime", DateHandler.long2String(Long.parseLong( map.get( "logoutTime" )+"" )) ) ;
			map.put("lastlogTime", DateHandler.long2String(Long.parseLong( map.get( "lastlogTime" )+"" )) ) ;
		}
        
        view.addObject( "list", list );
        view.addObject( "listMap", listMap );
        view.addObject( "keyWord", keyWord );
        logService.addLog( request, LoginPermission.class , 0 ,"点击，登录日志信息列表" ) ;
        return view;
    }
    
    /**
     * 清空登录日志
     * 把登录日志添加到日志历史信息中
     * 在做定期清空处理
     * @return
     */
    @RequestMapping( value="/login/delview", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=LoginPermission.class , permission = LoginPermission.DELALL)
    public String logindeleteTx( HttpSession session ,HttpServletRequest request ) 
    {
        JSONObject result = new JSONObject();
        try {
            this.logService.deleteLoginTx();
            
            result.put( "statusCode", 200 );
            result.put( "message", "清空登录日志" );
            result.put( "navTabId", "log_login_listview" );
            
            //添加操作日志
	    	logService.addLog( request, LoginPermission.class , LoginPermission.DELALL , "清空登录日志" ) ;
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
    }
    
    /**
     * 定时清空历史日志信息
     */
    public void CleanHisLogInfoRun(){
    	try{
			this.logService.deleteLogHis();
			this.logger.info( "定时清空历史日志信息!" ) ;
		} catch (BusinessException e)
		{
			 e.printStackTrace() ;
		}
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
