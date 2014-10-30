<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<div class="pageContent" >
	<img alt="" src="<%=basePath %>/imgs/no_permession.jpg" />
</div>
