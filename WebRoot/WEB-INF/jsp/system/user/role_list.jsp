<%@page import="com.sevendosoft.access.constant.permethod.role.RolePermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.MenuPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/svdo-tld/svdo.tld" prefix="svdo" %>
<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<script type="text/javascript">
var newWindow;
function openview() {
	newWindow = window.open(); 
}
function preview( html ) {
	
	if (!newWindow) {
		return false;
	}
	newWindow.document.write( html );
}
</script>

<script type="text/javascript">

function setroleListValue(roleId)
{
	
	$("#user_role_addchiview").attr("href","<%=basePath%>/user/role/addchiview?roleId="+roleId);
	$("#user_role_permissionview").attr("href","<%=basePath%>/user/role/permissionview?roleId="+roleId);
	$("#user_role_editstatus").attr("href","<%=basePath%>/user/role/editstatus?roleId="+roleId);
	$("#user_role_delview").attr("href","<%=basePath%>/user/role/delview?roleId="+roleId);
}

</script>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<svdo:pmsnBtn clazz="add"  href="/user/role/addview" node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADD %>" target="dialog" max="false" rel="user_role_addview" name="添加超级管理员" width="750" height="450" />
			<svdo:pmsnBtn clazz="edit" href="/user/role/addchiview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADDCHI %>"  target="dialog" max="false" rel="user_role_addchiview" name="添加子角色" width="750" height="450"/>
			<svdo:pmsnBtn clazz="edit" href="/user/role/permissionview?roleId={roleId}"   node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.PER %>" target="dialog" max="true" name="授权" width="750" height="450" title="授权" id="user_role_permissionview"/>
			<li class="line">line</li>
			<svdo:pmsnBtn clazz="edit" href="/user/role/editstatus?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态" id="user_role_editstatus" />
			<svdo:pmsnBtn clazz="delete" href="/user/role/delview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除" id="user_role_delview" />	

		</ul>
	</div>
	
	<div style="float: left;width: 210px;" >		
		<div class="accordion" fillSpace="sidebar">
			<div class="accordionHeader">
				<h2><span>Folder</span>角色管理</h2>
			</div>
			<div layoutH="27" class="accordionContent">		
			
					<div style="width: 200px;" id="order_list">
						<ul class="tree treeFolder">
							<svdo:tree list="${list }"/>
							
							<!-- 一级菜单 
							<c:forEach items="${infoUrl}" var="info">
								<c:if test="${info.parentId==-1 }">
									<li><a order_detail="${info.roleId}" href="<%=basePath%>/order/info/last/${info.roleId}" onclick="javascript:setbuttonValue('${info.roleId}')"  target="ajax" rel="order_detail" fresh="true" >${info.name}</a>
									
								           
												<c:forEach items="${infoUrl}" var="infochildren">
													<c:if test="${infochildren.parentId == info.roleId }">
														<ul>
															<li><a order_detail="${infochildren.roleId}" href="<%=basePath%>/order/info/last/${infochildren.roleId}" onclick="javascript:setbuttonValue('${infochildren.roleId}')"  target="ajax" rel="order_detail" fresh="true" >${infochildren.name}</a>
									                        
																<c:forEach items="${infoUrl}" var="infochildchild">
																	<c:if test="${infochildchild.parentId == infochildren.roleId }">
																		<ul><li><a order_detail="${infochildchild.roleId}" href="<%=basePath%>/order/info/last/${infochildchild.roleId}" onclick="javascript:setbuttonValue('${infochildchild.roleId}')" target="ajax" rel="order_detail" fresh="true" >${infochildchild.name} </a></li></ul>
																	</c:if>				
																</c:forEach>
									                        </li>
								                        </ul>
							                        </c:if>						
												</c:forEach>
											
											
									</li>
								</c:if>
							</c:forEach>
							
							-->
							
							
						</ul>
					</div>
			</div>
			
		</div>	
	</div>
	
	<div id="role_detail" class="unitBox" style="margin-left: 200px; " ></div>
	
</div>
<!-- 	</body>
	</html>  -->