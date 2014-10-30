<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="textml; charset=UTF-8"
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

	$.post( "<%=basePath%>/infoUrl/perview", $("#order_edit").serialize(), function ( html ) {
		//debugger;		
		newWindow.document.write( html ); 
	}, "html" );
} 
</script>
<div class="pageContent">
	　　${message}
</div>