<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<script type="text/javascript">

function openWindowWithPost() { 

	var newWindow = window.open(); 
	if (!newWindow) {
		return false;
	} 

	$.post( "<%=basePath%>/infoRole/perview", $("#infoRole_edit").serialize(), function ( html ) {
		//debugger;		
		newWindow.document.write( html ); 
	}, "html" );
} 
</script>

<style type="text/css"> 
.unit_tr{
	margin-top:20px;
	height:40px;
	width:100%;
}

</style> 
<div class="pageContent">
	<form id="infoRole_edit" method="post" action="<%=basePath %>/user/role/addChild" class="pageForm required-validate" onsubmit="return iframeCallback( this, dialogAjaxDone )">
		<div class="pageFormContent" layoutH="56">
			<table style="padding:20px 0 0 30px;width:100%;">		
				<tr class="unit unit_tr">
					<td width="10%;">父级角色：</td>
					<td width="80%;">
						<input type="text" style="width:300px;" maxlength="20" value="${parentName}" disabled="disabled"/>
						<input type="hidden" name="infoRole.parentId" id="roleId" value="${parentId}" />
					</td>					
				</tr>
				<tr class="unit unit_tr">
					<td width="10%;">角色编号：</td>
					<td width="80%;">
						<input type="text" name="infoRole.roleCode" style="width:300px;" maxlength="20" class="required string" value="${infoRole.roleCode}" />
					</td>					
				</tr>
				<tr class="unit unit_tr">
					<td>角色名称：</td>
					<td>
						<input type="text" name="infoRole.roleName" style="width:300px;" maxlength="20" class="required string" value="${infoRole.roleName}" />
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>是否有效：</td>
					<td>
						<input type="radio" name="infoRole.isUsed" id="isUsed1" value="1" ${infoRole.isUsed!=0?"checked='checked'":""} >是
						<input type="radio" name="infoRole.isUsed" id="isUsed2" value="0" ${infoRole.isUsed==0?"checked='checked'":""} >否
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul style="float:right;" >
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit"> 提 交 </button></div></div></li>
			</ul>
		</div>
	</form>
</div>