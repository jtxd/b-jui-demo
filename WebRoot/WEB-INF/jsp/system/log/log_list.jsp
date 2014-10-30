<%@page import="com.sevendosoft.access.constant.permethod.role.LogPermission"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

function targetValue(value)
{
	$("#user_info_editview").attr("href").replace("my","our");;
	
}

</script>

<form id="pagerForm" method="get" action="<%=basePath%>/log/node/listview">
	<input type="hidden" name="pageNum" value="${list.curPage}" />
	<input type="hidden" name="numPerPage" value="${list.pageSize}" />
</form>


<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=basePath%>/log/node/listview" method="get">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					关键字：
				</td>
				<td>
					<input value="" name="keyWord" id="keyWord" value="${keyWord}">
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<svdo:pmsnBtn clazz="delete" href="/log/node/delview"  node="<%=LogPermission.class.getName() %>" permission="<%=LogPermission.DELALL %>" target="ajaxTodo" title="确定要清空日志吗?" name="清空日志" id="log_node_delview" />	
		</ul>
	</div>
	<table class="table" width="100%" layoutH="113" nowrapTD="false" >
		<thead>
			<tr>
				<th width="7%">日志ID</th>
				<th width="10%">用户名称</th>
				<th width="10%">菜单名称</th>
				<th width="10%">操作</th>
				<th width="30%">操作权限类</th>				
				<th width="10%">操作时间</th>
				<th width="8%">IP</th>
				<th width="15%">描述</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${listMap}" var="data">
			<tr target="logId" rel="${data.logId}">
				<td>${data.logId}</td>
				<td>${data.userName}</td>
				<td>${data.name}</td>
				<td>${data.permValue}</td>
				<td>${data.permission}</td>
				<td>${data.operaTime}</td>
				<td>${data.logIp}</td>
				<td>${data.logDesc}</td>
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
