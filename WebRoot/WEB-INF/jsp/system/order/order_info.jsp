<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->
<script type="text/javascript">

function openWindowWithPost() { 

	var newWindow = window.open(); 
	if (!newWindow) {
		return false;
	} 

	$.post( "<%=basePath%>/infoUrl/perview", $("#order_info").serialize(), function ( html ) {
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
.tips{color:#ADADAD;}
</style> 
<div class="pageContent">
	<form id="order_info" method="post" action="<%=basePath %>/order/info/${infoUrl.urlId==0?'add':'edit'}" class="pageForm required-validate" onsubmit="return iframeCallback( this, dialogAjaxDone )">
		<div class="pageFormContent" layoutH="86">
			<table style="padding:0 0 0 30px;width:100%;">				
				<tr class="unit unit_tr">
					<th width="100%;" colspan="2" style="background-color:#009933;">修改菜单信息</th>				
				</tr>
				<tr class="unit unit_tr">
					<td width="10%;">父级菜单：</td>
					<td width="80%;">
						<input type="text" class="readonly" readonly="true" name="infoUrl.parentName" style="width:300px;" maxlength="20" class="required string" value="${infoUrl.parentName}" />
					</td>					
				</tr>
				<tr class="unit unit_tr">
					<td>菜单名称：</td>
					<td>
						<input type="text" name="infoUrl.name" style="width:300px;" maxlength="20" class="required string" value="${infoUrl.name}" />
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>菜单ID：</td>
					<td>
						<input type="text" class="readonly" readonly="true" name="infoUrl.urlId" style="width:300px;" maxlength="20" class="required string" value="${infoUrl.urlId}" />
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>url地址：</td>
					<td>
						<input type="text" name="infoUrl.href" style="width:300px;" maxlength="120" class="string" value="${infoUrl.href}" />
						<span class="tips">(eg：/order/info/listview)</span>
					</td>
				</tr>				
				<tr class="unit unit_tr">
					<td>描述title：</td>
					<td>
						<textarea class="textInput" rows="2" cols="80" name="infoUrl.description" style="width: 504px; height: 68px;">${infoUrl.description}</textarea>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>图标样式class：</td>
					<td>
						<input type="text" name="infoUrl.icon" style="width:300px;" maxlength="20" class="string" value="${infoUrl.icon}" />
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>目标对象target：</td>
					<td>
						<input type="text" name="infoUrl.target" style="width:300px;" maxlength="20" class="string" value="${infoUrl.target}" />
						<span style="color:red;">(navTab、dialog、ajaxTodo )</span>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>rel：</td>
					<td>
						<input type="text" name="infoUrl.rel" style="width:400px;" maxlength="120" class="string" value="${infoUrl.rel}" />
						<span class="tips">(eg：order_info_listview)</span>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>是否有效：</td>
					<td>
						<input type="radio" name="infoUrl.isUsed" id="isUsed1" value="1" ${infoUrl.isUsed!=0?"checked='checked'":""} >是
						<input type="radio" name="infoUrl.isUsed" id="isUsed2" value="0" ${infoUrl.isUsed==0?"checked='checked'":""} >否
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>排序号：</td>
					<td>
						<input type="text" class="digits" name="infoUrl.sortNo" style="width:200px;" maxlength="20" value="${infoUrl.sortNo}" />
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>权限类：</td>
					<td>
						<input type="text" name="infoUrl.permission" style="width:70%;" maxlength="255" class="string" value="${infoUrl.permission}" />
						<span style="color:red;">(注意：此菜单不存在功能点即不需填写)</span>
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
<!-- </body></html> -->