package com.sevendosoft.access.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.app.handler.list.tree.TreeNode;
import com.sevendo.app.servlet.RequestHandler;
import com.sevendo.framework.action.auth.Auth;
import com.sevendo.framework.util.page.PageList;
import com.sevendosoft.access.constant.permethod.role.RolePermission;
import com.sevendosoft.access.constant.permethod.role.UserPermission;
import com.sevendosoft.access.constant.permission.anno.Permission;
import com.sevendosoft.access.model.SysInfoRole;
import com.sevendosoft.access.model.SysInfoUrl;
import com.sevendosoft.access.model.SysInfoUser;
import com.sevendosoft.access.model.SysPrivilege;
import com.sevendosoft.access.service.LogService;
import com.sevendosoft.access.service.UserService;
import com.sevendosoft.access.util.UserInfo;
import com.sevendosoft.init.Config;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-29上午11:44:06
 * @version 1.0
 */
@RequestMapping(value="/user") 
@Controller( "userAction" )
@Scope( "singleton" )
public class UserAction
{
	private Logger logger = LoggerFactory.getLogger( UserAction.class );
	private UserService userService; 
	private LogService logService;
	//添加前缀
    @InitBinder("infoRole")
    public void initBinder1(WebDataBinder binder) {    
        binder.setFieldDefaultPrefix("infoRole.");
    }
    //添加前缀
    @InitBinder("infoUser")
    public void initBinder2(WebDataBinder binder) {    
        binder.setFieldDefaultPrefix("infoUser.");
    }
    //添加前缀
    @InitBinder("roleUser")
    public void initBinder3(WebDataBinder binder) {    
        binder.setFieldDefaultPrefix("roleUser.");
    }
	
	/**
	 * 角色信息列表
	 * @param pageNum
	 * @param keyWord
	 * @param numPerPage
	 * @param session
	 * @return
	 */
	@RequestMapping( value="/role/listview" )
	@Permission( node=RolePermission.class  )
	public ModelAndView roleListview( HttpServletRequest request ) 
    {
        ModelAndView view = new ModelAndView( "/system/user/role_list" );
        List<TreeNode<SysInfoRole>> list = this.userService.getSysInfoRoleList() ;
        view.addObject( "list", list );
        this.logService.addLog(request, RolePermission.class, 0 , "点击，角色信息列表" ) ;
        return view;
    }
	
    /**
     * 添加页面
     * @return
     */
    @RequestMapping( value="/role/addview" )
    @Permission( node=RolePermission.class , permission = RolePermission.ADD )
    public ModelAndView roleAddview(HttpSession session,HttpServletRequest request)
    {
    	//添加操作日志
    	this.logService.addLog(request, RolePermission.class, RolePermission.ADD , "添加，角色信息页面" ) ;
    	
        ModelAndView view = new ModelAndView( "/system/user/role_edit" );
        view.addObject( "parentId" , "-1" ) ;
        view.addObject( "infoRole" , new SysInfoRole() ) ;
        return view ;
    }
    
    /**
     * 保存页面
     * @return
     */
    @RequestMapping( value="/role/add", method=RequestMethod.POST )
    @ResponseBody
    @Permission( node=RolePermission.class , permission = RolePermission.ADD )
    public String addPageInfo( 
            @ModelAttribute("infoRole") SysInfoRole infoRole ,
            HttpServletRequest request  ) 
    {
        JSONObject obj = new JSONObject();
        int row = 0 ;
        String message = null ;
        try {
            infoRole.setCreateTime( System.currentTimeMillis() );
            //添加角色信息
            row = this.userService.addRoleInfo( infoRole );
            this.logService.addLog( request, RolePermission.class, RolePermission.ADD , "保存，添加根角色信息" ) ;
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "新增角色成功！" );
            obj.put( "navTabId", "user_role_listview" );
            obj.put( "callbackType", "closeCurrent" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "新增失败" + message + "！" );
        }
        return obj.toString();
    }
    
    /**
     * 添加子角色页面
     * @return
     */
    @RequestMapping( value="/role/addchiview" )
    @Permission( node=RolePermission.class , permission = RolePermission.ADDCHI )
    public ModelAndView addchiview(int roleId,HttpSession session,HttpServletRequest request)
    {
    	this.logService.addLog( request, RolePermission.class, RolePermission.ADDCHI , "添加，子角色信息" ) ;
       
    	ModelAndView view = new ModelAndView( "/system/user/child_edit" );
        SysInfoRole role = this.userService.getRoleInfoById(roleId);
        view.addObject( "parentId" , roleId) ;
        view.addObject( "parentName" , role.getRoleName()) ;
        return view ;
    }
    
    /**
     * 保存子角色页面
     * @param codeArea
     * @return
     */
    @RequestMapping( value="/role/addChild", method=RequestMethod.POST )
    @ResponseBody
    @Permission( node=RolePermission.class , permission = RolePermission.ADDCHI )
    public String addChild( @ModelAttribute("infoRole") SysInfoRole infoRole , HttpServletRequest request  ) 
    {
        JSONObject obj = new JSONObject();
        int row = 0 ;
        String message = null ;
        try {
            infoRole.setCreateTime( System.currentTimeMillis() );
            //添加角色信息
            row = this.userService.addChild( infoRole );
            this.logService.addLog( request, RolePermission.class, RolePermission.ADDCHI , "保存，添加子角色" ) ;
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "新增角色成功！" );
            obj.put( "navTabId", "user_role_listview" );
            obj.put( "callbackType", "closeCurrent" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "新增失败" + message + "！" );
        }
        return obj.toString();
    }
    
    
    /**
     * 修改页面
     * @return
     */
    @RequestMapping( value="/role/editview" )
    @Auth
    public ModelAndView roleEditView( @RequestParam(value = "roleId" ,defaultValue = "-1" ,required=true) int roleId ,
    		HttpServletRequest request,HttpSession session)
    {
        ModelAndView view = new ModelAndView( "/system/user/role_edit" );
        SysInfoRole infoRole= this.userService.getRoleInfoById(roleId) ;        
        view.addObject( "infoRole" , infoRole ) ;
        SysInfoRole role = this.userService.getRoleInfoById(infoRole.getParentId());
        view.addObject( "parentId" , infoRole.getParentId()) ;
        if(role!=null){
        	view.addObject( "parentName" , role.getRoleName()) ;
        }
		this.logService.addLog( request, RolePermission.class, 0 , "修改，角色信息ID:"+roleId ) ;

		return view ;
    }
    
    /**
     * 修改保存页面
     * @param codeArea
     * @return
     */
    @RequestMapping( value="/role/edit", method=RequestMethod.POST )
    @ResponseBody
    @Auth
    public String roleEdit( 
    		@ModelAttribute("infoRole") SysInfoRole infoRole , HttpServletRequest request  ) 
    {
        JSONObject obj = new JSONObject();        
        int row = 0 ;
        String message = null ;
        try {
            row = this.userService.updateSysInfoRole(infoRole) ;
            this.logService.addLog( request, RolePermission.class, 0 , "保存，修改角色信息" ) ;
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "修改角色成功！" );
            obj.put( "navTabId", "user_role_listview" );
            obj.put( "callbackType", "closeCurrent" );
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "修改角色失败" + message + "！" );
        }
        return obj.toString();
    }
    

    /**
     * 修改状态
     * @param linkId
     * @return
     */
    @RequestMapping( value="/role/editstatus", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=RolePermission.class , permission = RolePermission.STATUS)
    public String updateSysInfoRoleStasus( 
    		int roleId ,HttpSession session,HttpServletRequest request) 
    {
        JSONObject result = new JSONObject();
        try {
        	 //添加操作日志
        	this.logService.addLog( request, RolePermission.class, RolePermission.STATUS , "修改，角色状态信息，ID:"+roleId ) ;
        	SysInfoRole infoRole= this.userService.getRoleInfoById( roleId ) ;
        	
            int isUsed = infoRole.getIsUsed() == 1 ? 0 : 1 ;
            infoRole.setIsUsed(isUsed);
            
            this.userService.updateSysInfoRoleStasus( infoRole );
            
            result.put( "statusCode", 200 );
            result.put( "message", "修改状态成功" );
            result.put( "navTabId", "user_role_listview" );
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
    }
    
    /**
     * 删除
     * @param linkId
     * @return
     */
    @RequestMapping( value="/role/delview", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=RolePermission.class , permission = RolePermission.DELETE)
    public String deleteSysInfoRoleTx( long roleId ,HttpSession session,HttpServletRequest request) 
    {
        JSONObject result = new JSONObject();
        int count = 0;
        try {
			count = this.userService.checkUserByRoleId(roleId);
		} catch (BusinessException e ) {
			this.logger.info( e.getMessage(), e );
    		result.put( "statusCode", 300 );
    		result.put( "message", e.getMessage() );
    		return result.toString();
		}
        if(count==0){
        	try {
        		this.userService.deleteSysInfoRoleTx(  roleId );
        		result.put( "statusCode", 200 );
        		result.put( "message", "删除成功" );
        		result.put( "navTabId", "user_role_listview" );
        		//添加操作日志
            	this.logService.addLog(request, RolePermission.class, RolePermission.DELETE , "删除，角色信息，角色ID："+roleId ) ;
        		return result.toString();
        	} catch ( BusinessException e ) {
        		this.logger.info( e.getMessage(), e );
        		result.put( "statusCode", 300 );
        		result.put( "message", e.getMessage() );
        		return result.toString();
        	}
        }else{
    		result.put( "statusCode", 300 );
    		result.put( "message", "该角色存在用户，不能删除" );
    		//添加操作日志
        	this.logService.addLog(request, RolePermission.class, RolePermission.DELETE , "删除，角色信息失败，角色ID："+roleId ) ;
    		return result.toString();
        }
    }
    
    /**
     * 获取角色授权信息
     * @param roleId
     * @param session
     * @param request
     * @return
     */
    @RequestMapping( value="/role/permissionview"  )
    @Permission( node=RolePermission.class , permission=RolePermission.PER )
    public ModelAndView rolePermissionview(long roleId,HttpSession session,HttpServletRequest request)
    {
        ModelAndView view = new ModelAndView( "/system/user/role_permission_list" );
        try
		{
			logService.addLog(request,RolePermission.class , RolePermission.PER , "角色授权，信息页面！" ) ;
        	//获取角色授权信息        	       	
        	List<SysInfoUrl> infoUrl = this.userService.getSysInfoUrlByRoleId(roleId) ;  
        	
        	view.addObject( "infoUrl", infoUrl );
            view.addObject( "roleId", roleId ) ;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
        return view ;
    }
    
    /**
     * 给角色授权
     * @param roleId
     * @param rolePermission
     * @return
     */
    @RequestMapping( value="/role/permissionsave" )
    @ResponseBody
    public String rolePermissionsave( long roleId , String rolePermission , HttpServletRequest request )
    {
    	JSONObject result = new JSONObject() ;
    	try
		{
    		////删除该角色所有权限
			int row = this.userService.deleteSysPrivilegeByroleId(roleId) ;
			if( 0 <= row )
			{
				List<SysPrivilege> listPrivileges = new ArrayList<SysPrivilege>() ;
		    	SysPrivilege privilege = null ;
		    	if(rolePermission != null)
		    	{
		    		String[] permiStrs = rolePermission.split(",") ;
		    		for (int i = 0; i < permiStrs.length; i++)
					{
		    			privilege = new SysPrivilege() ;
						String[] pers  = permiStrs[i].split("_") ;
						privilege.setUrlId( Integer.parseInt(pers[0]) ) ;
						privilege.setPermValue( Integer.parseInt(pers[1]) ) ;
						if( pers.length > 2 )
							privilege.setPermission(pers[2] ) ;
						
						listPrivileges.add(privilege) ;				
					}
		    		//添加权限信息
		    		this.userService.addSysPrivilegeByroleId(roleId, listPrivileges) ;
		    	}
			}			
			
		} catch (BusinessException e)
		{
			result.put( "statusCode", 300 );
	        result.put( "message", e.getMessage() );
			logger.info( e.getMessage());
			return result.toString() ;
		}
    	
    	result.put( "statusCode", 200 );
        result.put( "message", "权限设置成功" );
        result.put( "navTabId", "user_role_listview" );
        result.put( "callbackType", "closeCurrent" );
        logService.addLog(request,RolePermission.class , RolePermission.PER , "修改，角色授权！ID:"+roleId  ) ;
    	return result.toString() ;
    }
    
	/**
	 * 用户信息列表
	 * @param pageNum
	 * @param keyWord
	 * @param numPerPage
	 * @param session
	 * @return
	 */
	@RequestMapping( value="/info/listview" )
	@Permission( node=UserPermission.class )
	public ModelAndView userListview( Integer pageNum, String keyWord, Integer numPerPage, HttpServletRequest request ) 
    {
        ModelAndView view = new ModelAndView( "/system/user/user_list" );
        pageNum = pageNum == null ? 1 : pageNum;
        numPerPage = ( numPerPage == null || numPerPage == 0 ) ? 20 : numPerPage;
        long userId = UserInfo.getUserId( request );
        PageList<Map> list = this.userService.getUserInfo( userId,keyWord, pageNum, numPerPage );
        List<SysInfoRole> roles = this.userService.getRoles();
        view.addObject( "list", list );
        view.addObject( "roles", roles );
        view.addObject( "keyWord", keyWord );
        logService.addLog( request, UserPermission.class , 0 ,"点击，用户信息列表" ) ;
        return view;
    }


    /**
     * 添加页面
     * @return
     */
    @RequestMapping( value="/info/addview" )
    @Permission(node=UserPermission.class , permission = UserPermission.ADD)
    public ModelAndView userAddview(HttpSession session,HttpServletRequest request)
    {
    	//添加操作日志
    	logService.addLog( request, UserPermission.class , UserPermission.ADD ,"添加，用户信息" ) ;
    	
    	int logRoleId = (int)session.getAttribute("loginRoleId");
        ModelAndView view = new ModelAndView( "/system/user/user_edit" );
        List<SysInfoRole> roles = this.userService.getSysRoles(logRoleId);
    	SysInfoUser infoUser = new SysInfoUser() ;
    	infoUser.setIsUsed(1) ;
    	infoUser.setSex(1) ;
    	infoUser.setSortNo(1) ;
    	view.addObject( "infoUser" ,  infoUser ) ;
    	view.addObject( "roles" ,  roles ) ;
    	view.addObject("size", roles.size());
    	return view ;
    }
    
    /**
     * 保存页面
     * @param codeArea
     * @return
     */
    @RequestMapping( value="/info/add", method=RequestMethod.POST )
    @ResponseBody    
    @Permission(node=UserPermission.class , permission = UserPermission.ADD)
    public String addPageInfo( 
    		@ModelAttribute("infoUser") SysInfoUser infoUser , 
    		HttpServletRequest request , HttpSession session  
    	) 
    {
        JSONObject obj = new JSONObject();
        String message = null ;
        String dp = request.getParameter("isDefPassWord");
        //判断是否选用默认密码
        int isDefPas = dp==null?1:0;
        infoUser.setIsDefPassWord(isDefPas);
        if(isDefPas==0){
        	infoUser.setPassWord(Config.getConfig("default_pwd"));
        }
        //检查用户名是否存在
        String userName = infoUser.getUserName();
        boolean checkUserName = this.userService.checkUserName(userName);
        if(checkUserName==true){
        	 obj.put( "statusCode", 300 );
             obj.put( "message", "新增失败，用户名存在！" );
             return obj.toString();
        }
        int row = 0 ;
        if(infoUser.getRoleId()!=0){
        	 try {
                 infoUser.setCreateTime( System.currentTimeMillis() );
                 infoUser.setCreateUserId( UserInfo.getUserId(session) ) ;
                 infoUser.setCreateIp(RequestHandler.getIpAddr(request)) ;
                 row = this.userService.addUserInfo( infoUser );
             } catch( BusinessException e ) {
                 this.logger.info( e.getMessage() );
                 message = e.getMessage() ;
             }
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "新增用户成功！" );
            obj.put( "navTabId", "user_info_listview" );
            obj.put( "callbackType", "closeCurrent" );
            logService.addLog( request, UserPermission.class , UserPermission.ADD ,"保存，添加用户信息" ) ;
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "新增失败" + message + "！" );
        }
        return obj.toString();
    }
    
    /**
     * 修改页面
     * @return
     */
    @RequestMapping( value="/info/editview" )
    @Permission(node=UserPermission.class , permission = UserPermission.UPDATE)
    public ModelAndView UserEditView( @RequestParam(value = "userId" ,defaultValue = "-1" ,required=true) long userId,
    		HttpSession session ,HttpServletRequest request)
    {
    	//添加操作日志
    	logService.addLog( request, UserPermission.class , UserPermission.UPDATE , "修改,用户信息") ;
    	
    	int logRoleId = UserInfo.getRoleId(session) ;
        ModelAndView view = new ModelAndView( "/system/user/user_edit" );
        List<SysInfoRole> roles = this.userService.getSysRoles(logRoleId);
        SysInfoUser infoUser= this.userService.getUserInfoById(userId) ;        
        view.addObject( "infoUser" , infoUser ) ;
        view.addObject( "roles" ,  roles ) ;
        view.addObject("size", roles.size());
        return view ;
    }
    
    /**
     * 修改保存页面
     * @param codeArea
     * @return
     */
    @RequestMapping( value="/info/edit", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=UserPermission.class , permission = UserPermission.UPDATE)
    public String UserEdit( 
            @ModelAttribute("infoUser") SysInfoUser infoUser , HttpServletRequest request  ) 
    {
        JSONObject obj = new JSONObject();        
        int row = 0 ;
        String message = null ;
        try {
        	infoUser.setOperateUserId( UserInfo.getUserId(request) ) ;
			infoUser.setOpetateTime( System.currentTimeMillis() ) ;
            row = this.userService.updateSysInfoUser(infoUser) ;
        } catch( BusinessException e ) {
            this.logger.info( e.getMessage() );
            message = e.getMessage() ;
        }
        if( 0 < row ) {
            obj.put( "statusCode", 200 );
            obj.put( "message", "修改用户成功！" );
            obj.put( "navTabId", "user_info_listview" );
            obj.put( "callbackType", "closeCurrent" );
            //添加操作日志
        	logService.addLog( request, UserPermission.class , UserPermission.UPDATE , "保存，修改用户信息") ;
        } else {
            obj.put( "statusCode", 300 );
            obj.put( "message", "修改角色失败" + message + "！" );
        }
        return obj.toString();
    }
    

    /**
     * 修改状态
     * @param linkId
     * @return
     */
    @RequestMapping( value="/info/editstatus", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=UserPermission.class , permission = UserPermission.STATUS)
    public String updateSysInfoUserStasus( long userId ,HttpSession session,HttpServletRequest request) 
    {
        JSONObject result = new JSONObject();
        try {
	    	//添加操作日志
	    	logService.addLog( request, UserPermission.class , UserPermission.STATUS , "修改，用户状态，用户ID:"+userId ) ;
        	SysInfoUser infoUser= this.userService.getUserInfoById( userId ) ;
            int isUsed = infoUser.getIsUsed() == 1 ? 0 : 1 ;
            infoUser.setIsUsed(isUsed);
            this.userService.updateSysInfoUserStasus( infoUser );
            result.put( "statusCode", 200 );
            result.put( "message", "修改状态成功" );
            result.put( "navTabId", "user_info_listview" );
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
    }
    
    /**
     * 删除
     * @param linkId
     * @return
     */
    @RequestMapping( value="/info/delview", method=RequestMethod.POST )
    @ResponseBody
    @Permission(node=UserPermission.class , permission = UserPermission.DELETE)
    public String deleteSysInfoUserTx( long userId ,HttpSession session ,HttpServletRequest request) 
    {
        JSONObject result = new JSONObject();
        try {
	    	//添加操作日志
	    	logService.addLog( request, UserPermission.class , UserPermission.DELETE , "删除，用户信息，用户ID:"+userId ) ;
	    	
            this.userService.deleteSysInfoUserTx(  userId );
            result.put( "statusCode", 200 );
            result.put( "message", "删除信息成功" );
            result.put( "navTabId", "user_info_listview" );
            return result.toString();
        } catch ( BusinessException e ) {
            this.logger.info( e.getMessage(), e );
            result.put( "statusCode", 300 );
            result.put( "message", e.getMessage() );
            return result.toString();
        }
    }
    
    
    /**
     * 选择用户
     * @param userId
     * @return
     */
    @RequestMapping( value="/info/choose/user"  )
    @Auth
    public ModelAndView infoChooseRole( Integer pageNum, String keyWord, Integer numPerPage, HttpSession session )
    {
        ModelAndView view = new ModelAndView( "/system/user/role_user_choose" );
        pageNum = pageNum == null ? 1 : pageNum;
        numPerPage = ( numPerPage == null || numPerPage == 0 ) ? 20 : numPerPage;
        PageList<Map> list = this.userService.getUserInfo(1, keyWord, pageNum, numPerPage );
        List<Map> listMap =  list.getDatalist() ;
        for (Map<String, Object> map : listMap)
		{
			JSONObject obj = new JSONObject() ;
			obj.put( "ids", map.get ("userId" )) ;
			obj.put( "userName" , map.get( "userName" ) ) ;
			obj.put( "userId" , map.get( "userId" ) ) ;
			map.put("checkbox", obj.toString().replace("\"", "\'")) ;
		}
        list.setDatalist( listMap ) ;
        view.addObject( "list", list );
        view.addObject( "keyWord", keyWord );
        return view ;
    }
	public UserService getUserService()
	{
		return userService;
	}
	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
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
