<%@page import="com.sevendosoft.access.constant.permethod.role.RolePermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.MenuPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/s-tld/s.tld" prefix="s" %>
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
			<s:a clazz="add"  href="/user/role/addview" node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADD %>" target="dialog" max="false" rel="user_role_addview" name="添加超级管理员" width="750" height="450" />
			<s:a clazz="edit" href="/user/role/addchiview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADDCHI %>"  target="dialog" max="false" rel="user_role_addchiview" name="添加子角色" width="750" height="450"/>
			<s:a clazz="edit" href="/user/role/permissionview?roleId={roleId}"   node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.PER %>" target="dialog" max="true" name="授权" width="750" height="450" title="授权" id="user_role_permissionview"/>
			<li class="line">line</li>
			<s:a clazz="edit" href="/user/role/editstatus?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态" id="user_role_editstatus" />
			<s:a clazz="delete" href="/user/role/delview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除" id="user_role_delview" />	

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
							
							
							
						</ul>
					</div>
			</div>
			
		</div>	
	</div>
	
	<div id="role_detail" class="unitBox" style="margin-left: 200px; " ></div>
	
</div>
<!-- 	</body>
	</html>  -->