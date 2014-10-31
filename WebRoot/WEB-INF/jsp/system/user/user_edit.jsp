<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->
<script src="dwz/js/jquery.md5.js" type="text/javascript"></script>
<script type="text/javascript">
	function changemd5Pws(value)
	{
		$("#user_passWord1").val($.md5( $.md5( value ) )) ; 
	}
	function openWindowWithPost() { 
		var newWindow = window.open(); 
		if (!newWindow) {
			return false;
		} 
		$.post( "<%=basePath%>/infoUser/perview", $("#infoUser_edit").serialize(), function ( html ) {
			//debugger;		
			newWindow.document.write( html ); 
		}, "html" );
	} 
	function ckDefPas(t){
		if(t.checked==true){
		//选用默认密码
			$("#ti").attr("title","123456");
			$("#pass").hide();
		}else{
		//不要选用默认密码
			$("#ti").attr("title","");
			$("#pass").show();
		}
	}
</script>

<style type="text/css"> 
.unit_tr{
	margin-top:20px;
	height:35px;
	width:100%;
}
</style> 

<div class="pageContent">
	<form id="infoUser_edit" method="post" action="<%=basePath %>/user/info/${infoUser.userId==0?'add':'edit'}" class="pageForm required-validate" onsubmit="return iframeCallback( this, dialogAjaxDone )">
		<input type="hidden" name="infoUser.userId" id="userId" value="${infoUser.userId}" />
		<div class="pageFormContent" layoutH="56">
			<table style="padding:20px 0 0 30px;width:100%;">				
				<tr class="unit unit_tr">
					<td width="10%;">用户名称：</td>
					<td width="40%;"><input type="text" name="infoUser.userName" style="width:200px;" maxlength="20" class="required string" value="${infoUser.userName}" /></td>
					<td width="10%;">性别：</td>
					<td width="40%;">
						<input type="radio" name="infoUser.sex" value="1" ${infoUser.sex!=0?"checked='checked'":""} />男
						<input type="radio" name="infoUser.sex" value="0" ${infoUser.sex==0?"checked='checked'":""} />女
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>用户密码：</td>
					<td>
						<div id="pass">
							<input type="password" id="user_passWord" style="width:100px;" maxlength="16" class="string" onblur="changemd5Pws(this.value)"  />
							<input type="hidden" name="infoUser.passWord" id="user_passWord1" />
						</div>
						<div>
							<input type="checkbox" value="0" onclick="ckDefPas(this)" name="isDefPassWord" ${infoUser.isDefPassWord==0?"checked='checked'":""} />
							<a id="ti">使用默认密码</a>
						</div>
					</td>
					<td>选择角色：</td>
					<td>
						<c:choose>
							<c:when test="${size>0}">
								<select name="infoUser.roleId">
									<c:forEach items="${roles}" var="role">
										<option value="${role.roleId}">${role.roleName}</option>
									</c:forEach>
								</select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="infoUser.roleId" value="0">
								<font color="red">请添加子角色</font>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td>身份证：</td>
					<td><input type="text" name="infoUser.idCard" style="width:200px;" maxlength="20" class="string" value="${infoUser.idCard}" /></td>
					<td>手机：</td>
					<td><input type="text" name="infoUser.mobile" style="width:200px;" maxlength="13" class="string" value="${infoUser.mobile}" /></td>
				</tr>
				<tr class="unit unit_tr">
					<td>生日：</td>
					<td>
						<input type="text" name="infoUser.birthday" style="width:183px;" class="date" value="${infoUser.birthday}" dateFmt="yyyy-MM-dd" minDate="{%y-120}" maxDate="{%y+1}" readonly="true"/>
						<a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td>电子邮件：</td>
					<td><input type="text" name="infoUser.email" style="width:200px;" maxlength="50" class="string" value="${infoUser.email}" /></td>
				</tr>
				<tr class="unit unit_tr">
					<td>地址：</td>
					<td colspan="3"><input type="text" name="infoUser.addr" style="width:87%;" maxlength="200" class="string" value="${infoUser.addr}" /></td>
				</tr>
				<tr class="unit unit_tr">
					<td>排序号：</td>
					<td><input type="text" name="infoUser.sortNo" style="width:200px;" maxlength="20" class="required string" value="${infoUser.sortNo}" /></td>
					<td>是否有效：</td>
					<td>
						<input type="radio" name="infoUser.isUsed" id="isUsed1" value="1" ${infoUser.isUsed!=0?"checked='checked'":""} >是
						<input type="radio" name="infoUser.isUsed" id="isUsed2" value="0" ${infoUser.isUsed==0?"checked='checked'":""} >否
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