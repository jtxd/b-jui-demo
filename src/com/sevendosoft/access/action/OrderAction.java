package com.sevendosoft.access.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.framework.action.auth.Auth;
import com.sevendosoft.access.constant.permethod.role.MenuPermission;
import com.sevendosoft.access.constant.permethod.role.RolePermission;
import com.sevendosoft.access.constant.permission.anno.Permission;
import com.sevendosoft.access.model.SysInfoUrl;
import com.sevendosoft.access.service.LogService;
import com.sevendosoft.access.service.OrderService;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>旅游网站信息化系统
 * @company:7dosoft
 * @author 唐选东
 * @Date: 2014年8月3日
 * @version 1.0
 */
@RequestMapping( value = "/order")
@Controller( "OrderAction" )
@Scope( "singleton" )
public class OrderAction
{
    private Logger logger = LoggerFactory.getLogger( OrderAction.class );
    private OrderService orderService ;
    private LogService logService;
    
    //添加前缀
    @InitBinder("infoUrl")
    public void initBinder1(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("infoUrl.");
    }
    
    /**
     * 菜单信息列表
     * @param request
     * @return
     */
    @RequestMapping( value="/info/listview" )
    @Permission( node=MenuPermission.class )
    public ModelAndView OrderListview( HttpServletRequest request ) 
    {
        ModelAndView view = new ModelAndView( "/system/order/order_list" );
        
        List<SysInfoUrl> infoUrl = this.orderService.getSysInfoUrl();
        this.logService.addLog(request, RolePermission.class, 0 , "点击，菜单信息列表" ) ;
        view.addObject( "infoUrl", infoUrl );
        return view;
    }
    
    /**
     * 添加页面
     * @return
     */
    @RequestMapping( value="/root/addview" )
    @Permission(node=MenuPermission.class , permission = MenuPermission.ADDROOT)
    public ModelAndView userAddview(
    	@RequestParam(defaultValue="-1" , required=true , value="urlId") int urlId,HttpSession session,HttpServletRequest request
    		)
    {
        ModelAndView view = new ModelAndView( "/system/order/order_edit" );
        if( -2 == urlId)
    	{
        	view = new ModelAndView( "/system/order/error_edit" );
        	view.addObject( "statusCode", 300 );
        	view.addObject( "message", "请选择菜单信息！" );
    		return view ;
    	}
        int permValue = MenuPermission.ADDROOT;
        
        SysInfoUrl infoUrl = new SysInfoUrl() ;
        if(-1 != urlId)
        {
        	permValue = MenuPermission.ADDCHI;
        	//通过id 获取菜单名称信息
        	infoUrl.setParentName(this.orderService.getInfoUrlNameById(urlId)) ;
        }
        
    	//添加操作日志
        logService.addLog(request , MenuPermission.class , permValue ,"添加，根菜单" );

        infoUrl.setParentId(urlId) ;
        infoUrl.setIsUsed(1) ;
        infoUrl.setSortNo(1) ;
        view.addObject( "infoUrl" ,  infoUrl ) ;
        return view ;
    }
    
    /**
     * 保存页面
     * @param codeArea
     * @return
     */
    @RequestMapping( value="/root/add", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=MenuPermission.class , permission = MenuPermission.ADDROOT)
    public String addPageInfo( 
    		@ModelAttribute("infoUrl") SysInfoUrl infoUrl ,
            HttpServletRequest request ,
            HttpSession session  ) 
    {
        JSONObject obj = new JSONObject();
        
        int row = 0 ;
        String message = null ;
        try {
            infoUrl.setCreateTime( System.currentTimeMillis() );
            infoUrl.setHref("/"+infoUrl.getHref());
            this.orderService.addSysInfoUrl(infoUrl) ;           
            //添加操作日志
            row = logService.addLog(request , MenuPermission.class , MenuPermission.ADDROOT ,"保存，根节点信息" );
            
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "新增信息成功！" );
            obj.put( "navTabId", "order_info_listview" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "新增失败" + message + "！" );
        }
        return obj.toString();
    }

    /**
     * 菜单详细信息编辑
     * @param session
     * @return
     */
    @RequestMapping( value="/info/last/{urlId}" )    
    @Auth
    public ModelAndView infoLastUrlId( HttpServletRequest request ,  @PathVariable("urlId") int urlId ) 
    {
        ModelAndView view = new ModelAndView( "/system/order/order_info" );
        SysInfoUrl infoUrl = this.orderService.getSysInfoUrlById( urlId );
        view.addObject( "infoUrl", infoUrl );
        logService.addLog(request , MenuPermission.class , 0 ,"修改，菜单详细信息" );
        
        return view;
    }
    
    /**
     * 菜单详细信息编辑保存
     * @param session
     * @return
     */
    @RequestMapping( value="/info/edit" )
    @ResponseBody
    @Auth
    public String infoEdit( HttpSession session ,
    		HttpServletRequest request, @ModelAttribute("infoUrl") SysInfoUrl infoUrl) 
    {
        JSONObject obj = new JSONObject();        
        int row = 0 ;
        String message = null ;
        try {
            row = this.orderService.updateSysInfoUrl( infoUrl );            
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "修改信息成功！" );
            obj.put( "navTabId", "order_info_listview" );
            logService.addLog( request , MenuPermission.class , 0 ,"保存，菜单详细信息" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "修改信息失败" + message + "！" );
            logService.addLog( request , MenuPermission.class , 0 ,"保存，菜单详细信息失败" + message + "！" );
        }
        return obj.toString();
    }
    
    /**
     * 修改状态
     * @param session
     * @param urlId
     * @return
     */
    @RequestMapping( value="/root/editstatus" )
    @ResponseBody
    @Permission(node=MenuPermission.class , permission = MenuPermission.STATUS)
    public String updateSysInfoUrlisUsed( HttpSession session ,HttpServletRequest request,
    		@RequestParam(defaultValue="-1" , required=true , value="urlId") int urlId 
    	) 
    {
        JSONObject obj = new JSONObject();        
        int row = 0 ;
        String message = null ;
        try {
        	if( -1 == urlId)
        	{
        		obj.put( "statusCode", 300 );
                obj.put( "message", "urlId不能为空！" );
                return obj.toString();
        	}
        	SysInfoUrl infoUrl = this.orderService.getsSysInfoUrlBy(urlId);    	
        	infoUrl.setIsUsed(infoUrl.getIsUsed()==0?1:0) ;
            row = this.orderService.updateSysInfoUrlisUsed( infoUrl );
            
            //添加操作日志
            this.logService.addLog(request, MenuPermission.class, MenuPermission.STATUS ,"修改，菜单状态" ) ;
            
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "修改信息成功！" );
            obj.put( "navTabId", "order_info_listview" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "修改信息失败" + message + "！" );
        }
        return obj.toString();
    }
    
    /**
     * 删除信息
     * @param urlId
     * @return
     */
    @RequestMapping( value="/root/delview", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=MenuPermission.class , permission = MenuPermission.DELETE)
    public String delSysInfoUrl( 
    		@RequestParam(defaultValue="-1" , required=true , value="urlId") int urlId ,HttpServletRequest request 	) 
    {
        JSONObject result = new JSONObject();
        try {
        	if( -1 == urlId)
        	{
        		result.put( "statusCode", 300 );
        		result.put( "message", "urlId不能为空！" );
                return result.toString();
        	}
        	//查询是否存在子菜单
        	int row = this.orderService.getInfoUrlIsChiById(urlId) ;
        	if(row > 0 )
        	{
        		result.put( "statusCode", 300 );
        		result.put( "message", "不能删除，存在子菜单！" );
                return result.toString();
        	}
        	this.orderService.delSysInfoUrl(urlId) ;
        	//添加操作日志
        	this.logService.addLog( request, MenuPermission.class, MenuPermission.DELETE , "删除，菜单信息" ) ;
        	result.put( "statusCode", 200 );
            result.put( "message","删除成功！" );
            result.put( "navTabId", "order_info_listview" );
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
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
