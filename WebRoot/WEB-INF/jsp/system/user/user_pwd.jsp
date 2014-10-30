<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->
<script src="<%=basePath %>/dwz/js/jquery.md5.js" type="text/javascript"></script>

<style type="text/css"> 
.unit_tr{
	margin-top:20px;
	height:35px;
	width:100%;
}
.tips{color:#ADADAD;}
.red{color:red;}
.bg{display: none;}
.pageFormContent .textInput {
    float:none;
}
img {
max-width:200px;
myimg:expression(onload=function(){
this.style.width=(this.offsetWidth > 200)?"200px":"auto"});
}
</style>
<script type="text/javascript">
	$( function () {
		var form = $( "form[name='user_pwd_edit']" );
		form.submit( function () {
			var oldPwd = $( "input[name='oldPwd']" );
			var newPwd = $( "input[name='newPwd']" );
			var newPwd2 = $( "input[name='newPwd2']" );
			
			if( oldPwd.val() == '' ) {
				$( "#oldPwdSpan" ).text( "请输入旧密码！" );
				return false;
			}else{
				$( "#oldPwdSpan" ).text( "" );
			}
			if( newPwd.val() == '' ) {
				$( "#newPwdSpan" ).text( "请输入新密码密码！" );
				return false;
			}else{
				$( "#newPwdSpan" ).text( "" );
			}
			if( newPwd.val() != newPwd2.val() ) {
				$( "#newPwd2Span" ).text( "密码输入不一致！" );
				return false;
			}else{
				$( "#newPwd2Span" ).text( "" );
			}
			$.post( form.attr( "action" ), { 
					"oldPwd":$.md5( $.md5( oldPwd.val() ) ),
					"newPwd":$.md5( $.md5( newPwd.val() ) )
				}, function ( data ) {
					if( data.statusCode == 300 ) {
						alert( data.message );
					} else{
						dialogAjaxDone(data);
					}
			}, "json" );
			return false;
		} );
	} );	
</script>
<div class="pageContent">
	<form name="user_pwd_edit" method="post" action="<%=basePath %>/pwd/save">
		<input type="hidden" name="hospitalId" id="hospitalId" value="${hospitalId}" />
		<div class="pageFormContent" layoutH="56">
			<table style="padding:15px 0 0 5px;width:100%;">				
				<tr class="unit unit_tr">
					<td style="min-width: 60px;width: 20%;" align="center">原&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
					<td align="left">
						<input type="password" name="oldPwd" id="oldPwd" style="width:150px;" maxlength="16" class="required string" />
						<span id="oldPwdSpan" class="red"></span>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td align="center">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
					<td align="left">
						<input type="password" name="newPwd" id="newPwd" style="width:150px;" maxlength="16" class="required string" />
						<span id="newPwdSpan" class="red"></span>
					</td>
				</tr>
				<tr class="unit unit_tr">
					<td align="center">再次输入：</td>
					<td align="left">
						<input type="password" name="newPwd2" id="newPwd2" style="width:150px;" maxlength="16" class="required string" />
						<span id="newPwd2Span" class="red"></span>
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