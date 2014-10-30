package com.sevendosoft.access.util.utag;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.sevendosoft.access.model.SysPrivilege;
import com.sevendosoft.access.util.UserInfo;
import com.sevendosoft.init.SessionUtil;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-30下午4:31:42
 * @version 1.0
 */
public class PermissionBtnTag extends TagSupport
{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name ;
	private String id ;
	private String href ;
	private int permission ;
	private String node ;
	private String clazz ;
	private String target ;
	private boolean max = false ;
	private String rel ;
	private String title ;
	private String width ;
	private String height ;
	private String fresh ;
	private String order_detail ;
	
	public int doStartTag()
	{
		try
		{
			StringBuilder li = new StringBuilder("<li") ;
			
			StringBuilder a = new StringBuilder("<a") ;
			
			JspWriter out = pageContext.getOut();
			HttpServletRequest httpservletrequest = (HttpServletRequest)pageContext.getRequest();
			HttpSession session = httpservletrequest.getSession() ;
			if( null != id && !"".equals(id) ) a.append( " id="+id ) ;
			if( null != clazz && !"".equals(clazz) ) a.append( " class="+clazz ) ;
			a.append( " href="+ SessionUtil.getBasePath(httpservletrequest) + href ) ;
			if( null != target && !"".equals(target) ) a.append( " target="+target ) ;
			a.append( " max="+max ) ;
			if( null != rel && !"".equals(rel) ) a.append( " rel="+rel ) ;
			String tit = title==null?name:title ;
			if( null != title && !"".equals(title) ) a.append( " title="+tit ) ;
			if( null != width && !"".equals(width) ) a.append( " width="+width ) ;
			if( null != height && !"".equals(height) ) a.append( " height="+height ) ;
			if( null != fresh && !"".equals(fresh) ) a.append( " fresh="+fresh ) ;
			if( null != order_detail && !"".equals(order_detail) ) a.append( " order_detail="+order_detail ) ;
			
			//获取当前用户所有权限
			List<SysPrivilege> privilege = UserInfo.getUserPrivilege(session);
			boolean flag = true ;
			
			if( null != privilege && privilege.size() > 0 )
			{
				for (SysPrivilege sysPrivilege : privilege)
				{
					if( node.equals(sysPrivilege.getPermission())  && (sysPrivilege.getPermValue()&permission) == permission )
					{
						flag = false ;
						
						break ;
					}
				}
			}
			
			if(flag)
				li.append( " style="+"display:none" ) ;
			
			a.append( " ><span>"+name +"</span>" ) ;
			a.append( " </a>" ) ;
			
			
			//添加a标签到li标签
			li.append( ">"+a.toString()+"</li>" ) ;	

			out.write(li.toString());
		} catch (IOException e)
		{
			
		}
		
		return TagSupport.SKIP_BODY  ;
		
		
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public void setPermission(int permission)
	{
		this.permission = permission;
	}

	public void setNode(String node)
	{
		this.node = node;
	}

	public void setClazz(String clazz)
	{
		this.clazz = clazz;
	}

	public void setTarget(String target)
	{
		this.target = target;
	}

	public void setMax(boolean max)
	{
		this.max = max;
	}

	public void setRel(String rel)
	{
		this.rel = rel;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public void setWidth(String width)
	{
		this.width = width;
	}

	public void setHeight(String height)
	{
		this.height = height;
	}

	public void setFresh(String fresh)
	{
		this.fresh = fresh;
	}

	public void setOrder_detail(String order_detail)
	{
		this.order_detail = order_detail;
	}
	


    
}
