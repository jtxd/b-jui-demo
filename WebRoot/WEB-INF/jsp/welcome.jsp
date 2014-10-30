<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->
<style type="text/css">
/*内容信息*/
#welcome_content_top{
	display:block;
	padding-top:0px; height:100%;background-color:#FFFFFF; background-repeat:no-repeat;background-position: center;background-attachment: fixed;}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var welcome_content = $(".navTab-panel") ;
	var height = welcome_content.outerHeight(true) - 30  ;
	$("#welcome_content_topImg").css( "height", height) ;
	$("#welcome_content_topImg").css( "width", height*0.83 ) ;
});  
</script>
<div id="welcome_content" style="display:block; width:100%; height:100%;TEXT-ALIGN: center;">
	<div style="text-align: left;">
		<img  src="<%=basePath %>/imgs/login_logo.png" />
	</div>
	<div style="width:100%; display:block; height:100%; text-align:center;vertical-align:middle; MARGIN-RIGHT: auto;MARGIN-LEFT: auto;" >
		<div id="welcome_content_top">
				<div style="text-align:left;float: left;">	
					<img id="welcome_content_topImg" src="<%=basePath %>/imgs/welcome_bg.png" />
				</div>
				<div  style="padding-top:10%;float: left;">
					<font style="font-size:20px; font-weight:300;color:#1E4E62">欢迎<span style="color: green;font-size:20px;">${sessionScope.userName}</span>进入，启笃 - 权限管理系统</font> 	
				</div>
			</div>
	</div>
	
</div>
<!-- </body></html> -->