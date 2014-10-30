package com.sevendosoft.access.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.framework.dao.defaultimpl.DefaultDaoSuperImpl;
import com.sevendosoft.access.model.SysInfoUser;
import com.sevendosoft.access.model.SysPrivilege;
import com.sevendosoft.access.util.UserInfo;

@Component( "loginService" )
@Scope( "singleton" )
public class LoginService {

	private DefaultDaoSuperImpl defaultDao;

	/**
	 * 处理用户登录
	 * @param loginName
	 * @param password
	 * @param session
	 * @throws BusinessException  
	 */
	public void userLogin( String userName, String passWord,String code, HttpSession session ,HttpServletRequest request) 
			throws BusinessException 
	{
		Object obj = session.getAttribute("code");
		if(!code.equals(obj)){ throw new BusinessException( "验证码错误！" ); }
		//登录前先清空session
		UserInfo.destory( session );
		
		HashMap<String, String> param = new HashMap<String, String>() ;
		param.put( "userName" , userName ) ;
		param.put( "passWord" , passWord ) ;
		
	    SysInfoUser infoUser = defaultDao.findByObject( "SysInfoUser.getLoginInfo", param , SysInfoUser.class );
		if( infoUser == null ) {
			//没有该用户
			throw new BusinessException( "账号或密码错误！" );
		} else if( infoUser.getIsUsed() != SysInfoUser.STATUS_NOMAL ) {
			//管理员被冻结
			throw new BusinessException( "用户被冻结！" );
		} else {
			//正常登陆 获取用户所有角色，所有权限
			List<SysPrivilege> userPrivilege = defaultDao.findAll( "SysPrivilege.getsysprivilegeByUserId" , infoUser.getUserId(), SysPrivilege.class ) ;
			//设置session
			UserInfo.setUserSession( session, infoUser, userPrivilege );
		}
		
	}
	
	
	/**
	 * 处理用户登录
	 * @param userId
	 * @param oldPwd
	 * @param newPwd
	 * @param session
	 * @throws BusinessException
	 */
	public void updatePwd( long userId , String oldPwd , String newPwd , HttpSession session ) 
			throws BusinessException 
	{
	    SysInfoUser infoUser = defaultDao.findById( "SysInfoUser.getUserInfoById", userId, SysInfoUser.class );
		if( infoUser == null ) {
			//没有该用户
			throw new BusinessException( "登录账号错误！" );
		} else if( !infoUser.getPassWord().equals( oldPwd ) ) {
			//密码不正确
			throw new BusinessException( "旧密码错误！" );
		} else {
			//修改密码
			infoUser.setPassWord( newPwd ) ;
			this.defaultDao.updateByObject( "SysInfoUser.updatePwdById" , infoUser ) ;
		}
		
	}
	public DefaultDaoSuperImpl getDefaultDao() {
		return defaultDao;
	}

	public void setDefaultDao(DefaultDaoSuperImpl defaultDao) {
		this.defaultDao = defaultDao;
	}
	
}
