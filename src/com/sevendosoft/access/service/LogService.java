package com.sevendosoft.access.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.app.servlet.RequestHandler;
import com.sevendo.framework.dao.defaultimpl.DefaultDaoSuperImpl;
import com.sevendo.framework.util.page.PageList;
import com.sevendosoft.access.model.SysButtonLog;
import com.sevendosoft.access.model.SysLogLog;
import com.sevendosoft.access.util.UserInfo;


@Component( "logService" )
@Scope( "singleton" )
public class LogService {
	
	private Logger logger = LoggerFactory.getLogger( UserService.class );
	private DefaultDaoSuperImpl defaultDao;

	/**
	 * 日志列表
	 * @param keyWord
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageList<Map> getLogInfoList(String keyWord , int page , int pageSize ) {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put( "keyWord", keyWord );
        return defaultDao.pageQuery( "SysButtonLog.getPageLogList", "SysButtonLog.getPageInfoLogCount", param, page, pageSize, Map.class );
    }
	
	/**
     * 清空日志
     * 把日志添加到日志历史信息中
     * 再做定期清空处理
     * @return
     */
	public void deleteLogTx() throws BusinessException {
		int row = defaultDao.createObj( "SysButtonLog.insertButtonLogHis" ,  null ) ;
		row = defaultDao.deleteByPara( "SysButtonLog.deleteButtonLog" , null ) ;
		if( row == 0 ) {
            this.logger.error("清空日志失败!");
            throw new BusinessException( "清空日志失败!" );
        }
	}
			
	/**
	 * 日志登录列表
	 * @param keyWord
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageList<Map> getLoginInfoList(String keyWord , int page , int pageSize ) {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put( "keyWord", keyWord );
        return defaultDao.pageQuery( "SysLogLog.getPageLoginList", "SysLogLog.getPageInfoLoginCount", param, page, pageSize, Map.class );
    }
	
	/**
     * 清空登录日志
     * 把登录日志添加到登录日志历史信息中
     * 再做定期清空处理
     * @return
     */
	public void deleteLoginTx() throws BusinessException {
		int row = defaultDao.createObj( "SysLogLog.insertLoginLogHis" ,  null ) ;
		row = defaultDao.deleteByPara( "SysLogLog.deleteLoginLog" , null ) ;
		if( row == 0 ) {
            this.logger.error("清空登录日志失败!");
            throw new BusinessException( "清空登录日志失败!" );
        }
	}
	
	/**
	 * 添加登录日志信息
	 * @param infoRole
	 * @return
	 * @throws BusinessException
	 */
	public long addRoleInfo( SysLogLog log) throws BusinessException
	{
		int row = defaultDao.createObj( "SysLogLog.addSysLoglog" ,  log ) ;
		if( row == 0 ) {
            this.logger.error("添加信息失败!");
            throw new BusinessException( "添加信息失败!" );
        }
		return log.getLogId() ;
	}
	/**
     * 修改用户登录日志信息-->退出时间和状态
     * @param SysInfoUser
     * @return
     * @throws BusinessException
     */
    public int updateLoginOutTimeByLogId(SysLogLog log) throws BusinessException
    {
        int row = this.defaultDao.updateByObject( "SysLogLog.updateLoginOutTimeByLogId", log );
        if( row == -1 ) {
            this.logger.error("修改信息失败!");
            throw new BusinessException( "修改信息失败" );
        }
        return row ;
    }
    /**
     * 根据userId获取该用户的登录日志
     * @param roleId
     */
    public List<SysLogLog> getlogByUserId( long userId )
    {
    	List<SysLogLog> logs = this.defaultDao.findAll( "SysLogLog.getlogByUserId" , userId , SysLogLog.class ) ; 
    	return logs ;
    }
    
	public int addButtonLog(SysButtonLog bLog) throws BusinessException{
		int row = defaultDao.createObj( "SysButtonLog.addButtonLog" ,  bLog ) ;
		if( row == 0 ) {
            this.logger.error("添加信息失败!");
            throw new BusinessException( "添加信息失败!" );
        }
		return row;
	}
	
	/**
	 * 添加操作日志
	 * @param request
	 * @param clazz 权限类
	 * @param permValue 权限值
	 * @param logDesc 描述
	 * @return
	 * @throws BusinessException
	 */
	public int addLog(HttpServletRequest request,Class<?> clazz,int permValue,String logDesc)
	{
		int row = 0 ;
		try
		{
			 SysButtonLog bLog = new SysButtonLog(
					 	UserInfo.getUserId( request ),
		        		0,
		        		clazz.getName(),
		        		permValue,
		        		System.currentTimeMillis(),
		        		RequestHandler.getIpAddr( request ),
		        		logDesc);
			row = this.addButtonLog(bLog) ;
		} catch (BusinessException e)
		{
			e.printStackTrace();
			this.logger.debug( e.getMessage() ) ;
		}
		return row ;
	}
	
	/**
	 * 定时清空历史日志信息
	 * @throws BusinessException
	 */
	public void deleteLogHis() throws BusinessException {
		
		int row = this.defaultDao.deleteByPara( "SysButtonLog.deleteButtonLogHis" , null ) ;
		row = this.defaultDao.deleteByPara( "SysButtonLog.deleteLoginLogHis" , null ) ;
		if( row == -1 ) {
            this.logger.error("清空历史日志信息失败!");
            throw new BusinessException( "清空历史日志信息失败!" );
        }
	}
	public DefaultDaoSuperImpl getDefaultDao() {
		return defaultDao;
	}

	public void setDefaultDao(DefaultDaoSuperImpl defaultDao) {
		this.defaultDao = defaultDao;
	}
	
	
}
