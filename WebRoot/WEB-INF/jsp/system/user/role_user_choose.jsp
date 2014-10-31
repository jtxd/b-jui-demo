<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<form id="pagerForm" method="get" action="<%=basePath%>/user/info/choose/user">
	<input type="hidden" name="pageNum" value="${list.curPage}" />
	<input type="hidden" name="numPerPage" value="${list.pageSize}" />
</form>


<div class="pageHeader">
	<form action="<%=basePath%>/user/info/choose/user" method="get" onsubmit="return dwzSearch(this, 'dialog');">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>关键字:</label>
				<input class="textInput" name="keyWord" value="" type="text">
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" multLookup="roleUser" warn="确认选择">选择</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="113" nowrapTD="false" >
		<thead>
			<tr>
				<th width="10%"><input type="checkbox" class="checkboxCtrl" group="roleUser" /></th>
				<th width="40%" orderfield="orgName" >用户ID</th>
				<th width="50%" orderfield="orgNum" >用户名称</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.datalist}" var="feedback">
			<tr target="userId" rel="${feedback.userId}">
				<td><input type="checkbox" name="roleUser" value="${feedback.checkbox}"/></td>
				<td>${feedback.userId}</td>
				<td>${feedback.userName}</td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20" ${list.pageSize==20?"selected='true'":""} >20</option>
				<option value="50" ${list.pageSize==50?"selected='true'":""} >50</option>
				<option value="100" ${list.pageSize==100?"selected='true'":""} >100</option>
				<option value="200" ${list.pageSize==200?"selected='true'":""} >200</option>
			</select>
			<span>条，共${list.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${list.totalCount}" numPerPage="${list.pageSize}" pageNumShown="6" currentPage="${list.curPage}"></div>

	</div>
</div>
