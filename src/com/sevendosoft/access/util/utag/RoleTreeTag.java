package com.sevendosoft.access.util.utag;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.sevendo.app.handler.list.tree.TreeNode;
import com.sevendosoft.access.model.SysInfoRole;
import com.sevendosoft.init.SessionUtil;

/**
 * <b>Description:</b></br> 
 * <b>Title:</b>信息化系统
 * @company:7dosoft
 * @author: tangXD
 * @Date: 2014-7-30下午4:31:42
 * @version 1.0
 */
public class RoleTreeTag extends TagSupport
{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<TreeNode<SysInfoRole>> list ;
	
	public int doStartTag()
	{
		try
		{
			StringBuilder str = new StringBuilder() ;
			
			JspWriter out = pageContext.getOut();
			HttpServletRequest httpservletrequest = (HttpServletRequest)pageContext.getRequest();
			String basePath = SessionUtil.getBasePath(httpservletrequest) ;
			
			String st = treeMenu(list , str , basePath ) ;
			out.write(st);
		} catch (IOException e)
		{
			
		}
		
		return TagSupport.SKIP_BODY  ;
		
	}
	
	
	public String treeMenu(List<TreeNode<SysInfoRole>> list , StringBuilder str , String basePath )
	{
		for (TreeNode<SysInfoRole> node : list)
		{
			SysInfoRole infoRole = node.get() ;			
			str.append( "<li><a order_detail="+infoRole.getRoleId()+" href=\""+basePath+"/user/role/editview?roleId="+infoRole.getRoleId()+"\" onclick=\"javascript:setroleListValue('"+infoRole.getRoleId()+"')\"  target=\"ajax\" rel=\"role_detail\" fresh=\"true\" >"+infoRole.getRoleName()+"</a>" ) ;
			
			if( node.getChildren().size() > 0 )
			{
				str.append("<ul>") ;
				treeMenu( node.getChildren() , str , basePath );
				str.append("</ul>") ;
			}
			str.append( "</li>" ) ;
		}		
		
		return str.toString() ;
	}

	public List<TreeNode<SysInfoRole>> getList()
	{
		return list;
	}

	public void setList(List<TreeNode<SysInfoRole>> list)
	{
		this.list = list;
	}
    
}
