package com.sevendosoft.access.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.sevendo.app.exception.BusinessException;
import com.sevendo.framework.dao.defaultimpl.DefaultDaoSuperImpl;
import com.sevendosoft.access.model.SysInfoUrl;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>旅游网站信息化系统
 * @company:7dosoft
 * @author 唐选东
 * @Date: 2014年8月3日
 * @version 1.0
 */
@Component( "orderService" )
@Scope( "singleton" )
public class OrderService
{

    private Logger logger = LoggerFactory.getLogger( OrderService.class );
    private DefaultDaoSuperImpl defaultDao;
    
    /**
     * 获取菜单信息
     * @param OrderId
     * @param keyWord
     * @param page
     * @param pageSize
     * @return
     */
    public List<SysInfoUrl> getSysInfoUrl() 
    {
        List<SysInfoUrl> infoUrl = this.defaultDao.findAll( "SysInfoUrl.getSysInfoUrl" , null , SysInfoUrl.class) ;
        return infoUrl ;
    }
    
    
    /**
     * 通过id 获取菜单信息
     * @param urlId
     * @return
     */
    public SysInfoUrl getSysInfoUrlById(int urlId)
    {
    	return this.defaultDao.findById( "SysInfoUrl.getSysInfoUrlById" , urlId , SysInfoUrl.class) ;
    }    
    public SysInfoUrl getsSysInfoUrlBy(int urlId)
    {
    	return this.defaultDao.findById( "SysInfoUrl.getsSysInfoUrlBy" , urlId , SysInfoUrl.class) ;
    }
    
    /**
     * 通过id 获取菜单名称信息
     * @param urlId
     * @return
     */
    public String getInfoUrlNameById(int urlId)
    {
    	return this.defaultDao.findByObject( "SysInfoUrl.getInfoUrlNameById", urlId,  String.class ) ;    	
    }
    
    
    /**
     * 修改菜单详细信息
     * @param infoUrl
     * @return
     * @throws BusinessException
     */
    public int updateSysInfoUrl( SysInfoUrl infoUrl) throws BusinessException
    {
		int row = defaultDao.updateByObject( "SysInfoUrl.updateSysInfoUrl", infoUrl) ;
		if( row == 0 ) {
            this.logger.error("修改菜单信息失败!");
            throw new BusinessException( "修改菜单信息失败!" );
        }
		return row ;
	}
    
    /**
     * 修改菜单信息状态
     * @param infoUrl
     * @return
     * @throws BusinessException
     */
    public int updateSysInfoUrlisUsed( SysInfoUrl infoUrl) throws BusinessException
    {
		int row = defaultDao.updateByObject( "SysInfoUrl.updateSysInfoUrlisUsed", infoUrl) ;
		if( row == 0 ) {
            this.logger.error("修改菜单状态失败!");
            throw new BusinessException( "修改菜单状态失败!" );
        }
		return row ;
	}
    /**
     * 添加菜单信息
     * @param infoUrl
     * @return
     * @throws BusinessException
     */
    public long addSysInfoUrl( SysInfoUrl infoUrl) throws BusinessException
    {
		int row = defaultDao.updateByObject( "SysInfoUrl.addSysInfoUrl", infoUrl) ;
		if( row == 0 ) {
            this.logger.error("添加菜单信息失败!");
            throw new BusinessException( "添加菜单信息失败!" );
        }
		return infoUrl.getUrlId() ;
	}
    
    /**
     * 删除菜单
     * @param roleId
     */
    public int delSysInfoUrl( int urlId ) throws BusinessException
    {
    	int row = this.defaultDao.deleteByPara( "SysInfoUrl.delSysInfoUrl" , urlId ) ; 
    	if( row == -1 ) {
            this.logger.error("删除信息失败!");
            throw new BusinessException( "修改信息失败" );
        }
        return row ;
    }
    /**
     * 是否存在子菜单
     * @param urlId
     * @return
     */
    public int getInfoUrlIsChiById( int urlId )
    {
    	return this.defaultDao.findByObject( "SysInfoUrl.getInfoUrlIsChiById" , urlId , Integer.class) ;    	
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
