<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.UserPermission"%>
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

<form id="pagerForm" method="get" action="<%=basePath%>/user/info/listview">
	<input type="hidden" name="pageNum" value="${list.curPage}" />
	<input type="hidden" name="numPerPage" value="${list.pageSize}" />
</form>


<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=basePath%>/user/info/listview" method="get">
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
			<svdo:pmsnBtn clazz="add"  href="/user/info/addview" node="<%=UserPermission.class.getName() %>" permission="<%=UserPermission.ADD %>" target="dialog" max="false" rel="user_info_addview" name="添加" width="750" height="450"  />
			<svdo:pmsnBtn clazz="edit" href="/user/info/editview?userId={userId}" id="user_info_editview" node="<%=UserPermission.class.getName() %>" permission="<%=UserPermission.UPDATE %>"   target="dialog" max="false" rel="user_info_editview" name="修改" width="750" height="450"/>
			<li class="line">line</li>
			<svdo:pmsnBtn clazz="edit" href="/user/info/editstatus?userId={userId}" permission="<%=UserPermission.STATUS %>" node="<%=UserPermission.class.getName() %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态"/>
			<svdo:pmsnBtn clazz="delete" href="/user/info/delview?userId={userId}" permission="<%=UserPermission.DELETE %>" node="<%=UserPermission.class.getName() %>" target="ajaxTodo" title="确定要删除吗?" name="删除"/>	
		</ul>
	</div>
	<table class="table" width="100%" layoutH="113" nowrapTD="false" >
		<thead>
			<tr>
				<th width="7%">用户ID</th>
				<th width="10%">用户名称</th>
				<th width="10%">角色名称</th>
				<th width="5%">性别</th>
				<th width="10%">生日</th>
				<th width="10%">身份证</th>
				<th width="5%"> 手机</th>
				<th width="10%">地址</th>
				<th width="5%">是否有效</th>
				<th width="10%">创建时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.datalist}" var="feedback">
			<tr target="userId" rel="${feedback.userId}">
				<td>${feedback.userId}</td>
				<td>
					${feedback.userName}
				</td>
				<td>
					<c:forEach items="${roles}" var="role">
						<c:if test="${feedback.roleId==role.roleId}">
							${role.roleName}
						</c:if>
					</c:forEach>
				</td>
				<td>${feedback.sex=='1'?'男':'女'}</td>
				<td>${feedback.birthday}</td>
				<td>${feedback.idCard}</td>
				<td>${feedback.mobile}</td>
				<td>${feedback.addr}</td>
				<td>${feedback.isUsed=='1'?'是':'否'}</td>
				<td>${fn:substring(feedback.createDate,0,19)}</td>
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
