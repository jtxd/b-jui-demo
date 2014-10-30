package com.sevendosoft.access.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.app.handler.list.tree.TreeList;
import com.sevendo.app.handler.list.tree.TreeNode;
import com.sevendo.framework.dao.defaultimpl.DefaultDaoSuperImpl;
import com.sevendo.framework.util.page.PageList;
import com.sevendosoft.access.constant.permission.anno.PermissionName;
import com.sevendosoft.access.model.SysButton;
import com.sevendosoft.access.model.SysInfoRole;
import com.sevendosoft.access.model.SysInfoUrl;
import com.sevendosoft.access.model.SysInfoUser;
import com.sevendosoft.access.model.SysPrivilege;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-29下午2:44:32
 * @version 1.0
 */
@Component( "userService" )
@Scope( "singleton" )
public class UserService
{

	private Logger logger = LoggerFactory.getLogger( UserService.class );
	private DefaultDaoSuperImpl defaultDao;

	/**
	 * 获取角色信息
	 * @param userId
	 * @param keyWord
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageList<Map> getRoleInfo(String keyWord , int page , int pageSize ) 
    {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put( "keyWord", keyWord );
        return defaultDao.pageQuery( "SysInfoRole.getPageInfoList", "SysInfoRole.getPageInfoListCount", param, page, pageSize, Map.class );
    } 
	
	public List<SysInfoRole> getRoles(){
		List<SysInfoRole> findAll = defaultDao.findAll("SysInfoRole.getRoles", SysInfoRole.class, SysInfoRole.class);
		return findAll;
	}
	
	
	/**
	 * 添加角色信息
	 * @param infoRole
	 * @return
	 * @throws BusinessException
	 */
	public int addRoleInfo( SysInfoRole infoRole) throws BusinessException
	{
		int row = defaultDao.createObj( "SysInfoRole.addRoleInfo" ,  infoRole ) ;
		if( row == 0 ) {
            this.logger.error("添加信息失败!");
            throw new BusinessException( "添加信息失败!" );
        }
		return row ;
	}
	/**
	 * 添加子角色信息
	 * @param infoRole
	 * @return
	 * @throws BusinessException
	 */
	public int addChild( SysInfoRole infoRole) throws BusinessException
	{
		int row = defaultDao.createObj( "SysInfoRole.addChildRoleInfo" ,  infoRole ) ;
		if( row == 0 ) {
			this.logger.error("添加信息失败!");
			throw new BusinessException( "添加信息失败!" );
		}
		return row ;
	}
	
	/**
	 * 通过id查询角色信息
	 * @param roleId
	 * @return
	 */
	public SysInfoRole getRoleInfoById( int roleId)
	{
		return defaultDao.findById( "SysInfoRole.getRoleInfoById" , roleId, SysInfoRole.class) ;
	}
	
	/**
	 * 修改角色信息
	 * @param infoRole
	 * @return
	 * @throws BusinessException
	 */
	public int updateSysInfoRole( SysInfoRole infoRole ) throws BusinessException
	{
		int row = defaultDao.updateByObject( "SysInfoRole.updateSysInfoRole", infoRole) ;
		if( row == 0 ) {
            this.logger.error("修改角色信息失败!");
            throw new BusinessException( "修改角色信息失败!" );
        }
		return row ;
	}
	
	/**
     * 修改角色信息状态
     * @param SysInfoRole
     * @return
     * @throws BusinessException
     */
    public int updateSysInfoRoleStasus(SysInfoRole infoRole) throws BusinessException
    {
        int row = this.defaultDao.updateByObject( "SysInfoRole.updateSysInfoRoleStasus", infoRole );
        if( row == -1 ) {
            this.logger.error("修改信息失败!");
            throw new BusinessException( "修改信息失败" );
        }
        return row ;
    }
    
    public int checkUserByRoleId(long roleId) throws BusinessException{
		 List<SysInfoUser> users = this.defaultDao.findAll("SysInfoUser.checkUserByRoleId", roleId ,SysInfoUser.class);
         return users==null?0:users.size();
    }
    
    /**
     * 删除 角色
     * @param areaId
     * @throws BusinessException
     */
    public int deleteSysInfoRoleTx(long roleId) throws BusinessException
    {
       int row = this.defaultDao.deleteById( "SysInfoRole.delSysInfoRole", roleId );
       if( row == -1 ) {
           this.logger.error("删除信息失败!");
           throw new BusinessException( "修改信息失败" );
       }
       return row ;
    }
	
	/**
	 * 获取用户信息
	 * @param userId
	 * @param keyWord
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageList<Map> getUserInfo( long userId, String keyWord , int page , int pageSize ) 
    {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put( "keyWord", keyWord );
        return defaultDao.pageQuery( "SysInfoUser.getPageInfoList", "SysInfoUser.getPageInfoListCount", param, page, pageSize, Map.class );
    } 
	
	/**
	 * 判断用户名是否存在
	 * @param userName
	 * @return  true-->存在
	 */
	public boolean checkUserName(String userName){
		boolean flag = true;
		SysInfoUser infoUser = defaultDao.findByObject( "SysInfoUser.getLoginInfo", userName, SysInfoUser.class );
		if(infoUser==null){
			return false;
		}
		return flag;
	}
	
	/**
	 * 检查用户名的个数
	 * @param userName
	 */
	public int checkUserNameCount(String userName){
		Integer integer = this.defaultDao.findByObject( "SysInfoUser.checkUserNameCount", userName, Integer.class );
		return integer;
	}
	
	/**
	 * 添加用户信息
	 * @param infoRole
	 * @return
	 * @throws BusinessException
	 */
	public int addUserInfo( SysInfoUser infoUser) throws BusinessException
	{
		int row = defaultDao.createObj( "SysInfoUser.addUserInfo" ,  infoUser ) ;
		if( row == 0 ) {
            this.logger.error("添加信息失败!");
            throw new BusinessException( "添加信息失败!" );
        }
		return row ;
	}
	
	/**
	 * 通过id查询用户信息
	 * @param userId
	 * @return
	 */
	public SysInfoUser getUserInfoById( long userId)
	{
		return defaultDao.findById( "SysInfoUser.getUserInfoById" , userId, SysInfoUser.class) ;
	}
	
	/**
	 * 修改用户信息
	 * @param infoUser
	 * @return
	 * @throws BusinessException
	 */
	public int updateSysInfoUser( SysInfoUser infoUser ) throws BusinessException
	{
		int row = defaultDao.updateByObject( "SysInfoUser.updateSysInfoUser", infoUser) ;
		if( row == 0 ) {
            this.logger.error("修改角色信息失败!");
            throw new BusinessException( "修改角色信息失败!" );
        }
		return row ;
	}
	
	/**
     * 修改用户信息状态
     * @param SysInfoUser
     * @return
     * @throws BusinessException
     */
    public int updateSysInfoUserStasus(SysInfoUser infoUser) throws BusinessException
    {
        int row = this.defaultDao.updateByObject( "SysInfoUser.updateSysInfoUserStasus", infoUser );
        if( row == -1 ) {
            this.logger.error("修改信息失败!");
            throw new BusinessException( "修改信息失败" );
        }
        return row ;
    }
    
    /**
     * 删除用户
     * @param areaId
     * @throws BusinessException
     */
    public int deleteSysInfoUserTx(long userId) throws BusinessException
    {
       int row = this.defaultDao.deleteById( "SysInfoUser.delSysInfoUser", userId );
       if( row == -1 ) {
           this.logger.error("删除信息失败!");
           throw new BusinessException( "修改信息失败" );
       }
       return row ;
    }
    
    /**
     * 通过角色ID获取用户信息
     * @param roleId
     * @return
     */
    public String getUserInfoByroleId( int roleId )
    {
    	List<String> infoUser = this.defaultDao.findAll( "SysInfoUser.getUserInfoByroleId" , roleId, String.class) ;
    	StringBuffer strBuffer = new StringBuffer() ;
    	for (String string : infoUser)
		{
    		strBuffer.append(string + ", ") ;
		}    	
    	return strBuffer.toString() ;
    }
    
    /**
     * 获取角色授权信息
     * @param roleId
     */
    public List<SysPrivilege> getSysPrivilegeById( long roleId )
    {
    	List<SysPrivilege> privilege = this.defaultDao.findAll( "SysPrivilege.getSysPrivilegeById" , roleId , SysPrivilege.class ) ; 
    	return privilege ;
    }
    /**
     * 获取所有角色
     * @param roleId
     */
    public List<SysInfoRole> getSysRoles(int roleId)
    {
    	List<SysInfoRole> sysInfoRole = this.defaultDao.findAll( "SysInfoRole.getSysRoles" , roleId , SysInfoRole.class ) ; 
    	return sysInfoRole ;
    }
    
    /**
     * 获取授权列表
     * @return
     * @throws Exception
     */
    public List<SysInfoUrl> getSysInfoUrlByRoleId(long roleId)
    {
    	//获取菜单
    	List<SysInfoUrl> infoUrl = this.defaultDao.findAll( "SysInfoUrl.getSysInfoUrlByRoleId" , roleId , SysInfoUrl.class) ;
    	List<SysButton> buttonList = new ArrayList<SysButton>() ;
    	for (SysInfoUrl sysInfoUrl : infoUrl)
		{
    		buttonList = new ArrayList<SysButton>() ;
    		
    		String permissionMethod = sysInfoUrl.getPermission() ;
    		//通过反射，找到所需节点名称，值
    		if(permissionMethod != null && !"".equals( permissionMethod ))
    		{
    			Class<?> clz;
				try
				{
					clz = Class.forName(permissionMethod);
					// 获取当前实体类的所有属性，返回Field数组 
	    			Field[] fields = clz.getDeclaredFields(); 
	    			// 获取父类的所有属性，返回Field数组
	    			Field[] fieldsSup = clz.getSuperclass().getDeclaredFields();
	    			
	    			SysButton button = null ;
	    			for(int i=0; i< fieldsSup.length; i++)
	    	        {
	    				button = new SysButton() ;
	    				Field f = fieldsSup[i];	            
	    	            PermissionName permission = f.getAnnotation(PermissionName.class); 
	    	            button.setBtnName(permission.value()) ;
	    	            int permValue = -1 ;
	    	            if (fieldsSup[i].getType().getName().equals(   java.lang.Integer.class.getName())   || fieldsSup[i].getType().getName().equals("int"))
							try
							{
								permValue = fieldsSup[i].getInt(f);
							} catch (IllegalArgumentException
									| IllegalAccessException e)
							{
								logger.debug("非法参数或安全权限异常:" + e.getMessage() ) ;
							}  
	    	            button.setPermValue(permValue) ;	
	    	            //设置是否存在权限
	    	            if( -1 == sysInfoUrl.getPermValue() )
	    	            	button.setHasPermission(false) ;
	    	            else
	    	            	button.setHasPermission((sysInfoUrl.getPermValue()&permValue)==permValue) ;
	    	            
	    	            buttonList.add(button) ;
	    	        }
	    	            
	    			for(int i=0; i< fields.length; i++)
	    	        {
	    				button = new SysButton() ;
	    				Field f = fields[i];	            
	    	            PermissionName permission = f.getAnnotation(PermissionName.class); 
	    	            button.setBtnName(permission.value()) ;
	    	            int permValue = -1 ;
	    	            if (fields[i].getType().getName().equals(   java.lang.Integer.class.getName())   || fields[i].getType().getName().equals("int"))
							try
							{
								permValue = fields[i].getInt(f);
							} catch (IllegalArgumentException
									| IllegalAccessException e)
							{
								logger.debug("非法参数或安全权限异常:" + e.getMessage() ) ;
							}  
	    	            button.setPermValue(permValue) ;
	    	            //设置是否存在权限
	    	            if( -1 == sysInfoUrl.getPermValue() )
	    	            	button.setHasPermission(false) ;
	    	            else
	    	            	button.setHasPermission((sysInfoUrl.getPermValue()&permValue)==permValue) ;
	    	            
	    	            buttonList.add(button) ;
	    	        }
				} catch (ClassNotFoundException e)
				{
					logger.debug("不存在该类:"+e.getMessage()) ;
				}
				sysInfoUrl.setSysButton(buttonList) ;
    		}
		}
    	return infoUrl ;		
    }
    
    
    /**
     * 删除该角色所有权限
     * @param roleId
     */
    public int deleteSysPrivilegeByroleId( long roleId ) throws BusinessException
    {
    	int row = this.defaultDao.deleteByPara( "SysPrivilege.deleteSysPrivilegeByroleId" , roleId ) ; 
    	if( row == -1 ) {
            this.logger.error("删除信息失败!");
            throw new BusinessException( "修改信息失败" );
        }
        return row ;
    }
    
    /**
     * 添加权限信息
     * @param roleId
     * @param privilege
     * @return
     * @throws BusinessException
     */
    public int addSysPrivilegeByroleId( long roleId ,List<SysPrivilege> privilege) throws BusinessException
    {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put( "roleId", roleId );
		map.put( "privilege", privilege );
    	int row = this.defaultDao.createObj( "SysPrivilege.addSysPrivilege" , map ) ;
    	if( row == -1 ) {
            this.logger.error("添加权限信息失败!");
            throw new BusinessException( "添加权限信息失败" );
        }
        return row ;
    }
    
    /**
     * 获取角色列表信息
     * @return
     */
    public List<TreeNode<SysInfoRole>> getSysInfoRoleList()
    {
    	List<SysInfoRole> infoRole = this.defaultDao.findAll( "SysInfoRole.getSysInfoRoleList" , null , SysInfoRole.class) ;
    	
    	 List<TreeNode<SysInfoRole>> list =  TreeList.sort( infoRole, new TreeList.SortHandler<SysInfoRole>() {
			@Override
			public long getId(SysInfoRole t)
			{
				return t.getRoleId();
			}

			@Override
			public long getParentId(SysInfoRole t)
			{
				return t.getParentId();
			}	
    	} );
    	
    	return list ;
    }
    
    
	public DefaultDaoSuperImpl getDefaultDao()
	{
		return defaultDao;
	}

	public void setDefaultDao(DefaultDaoSuperImpl defaultDao)
	{
		this.defaultDao = defaultDao;
	}
	
}
