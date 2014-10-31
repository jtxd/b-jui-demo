<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.UserPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="/WEB-INF/s-tld/s.tld" prefix="s" %>
<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->

<form id="pagerForm" method="get" action="<%=basePath%>/user/info/listview">
	<input type="hidden" name="pageNum" value="${list.curPage}" />
	<input type="hidden" name="numPerPage" value="${list.pageSize}" />
</form>

 <div class="pageHeader">
    <form onsubmit="return navTabSearch(this);" action="<%=basePath%>/user/info/listview" method="get" >
        <div class="searchBar">
            <ul class="searchContent">
                <li><label>关键字：</label><input type="text" value="${keyWord}" name="keyWord" class="form-control" size="10" /></li>
                <li><button type="submit" class="btn btn-default btn-sm">查询</button></li>
                <li><a class="btn btn-orange btn-sm" href="javascript:navTab.reload('', {clearQuery:true});">清空查询</a></li>
                <li><s:a clazz="btn btn-green btn-sm"  href="/user/info/addview" node="<%=UserPermission.class.getName() %>" permission="<%=UserPermission.ADD %>" target="dialog" max="false" rel="user_info_addview" name="添加" width="750" height="450"  /></li>
            </ul>
        </div>
    </form>
</div>

<div class="pageContent">
    <table class="j-table" width="100%" layoutH="95">
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
				<th width="28"><input type="checkbox" class="checkboxCtrl j-icheck" group="ids"></th>
                <th width="80">操作</th>
			</tr>
		</thead>
        <tbody>
        	<c:forEach items="${list.datalist}" var="data">
            <tr>
                <td>${data.userId}</td>
				<td>
					${data.userName}
				</td>
				<td>
					<c:forEach items="${roles}" var="role">
						<c:if test="${data.roleId==role.roleId}">
							${role.roleName}
						</c:if>
					</c:forEach>
				</td>
				<td>${data.sex=='1'?'男':'女'}</td>
				<td>${data.birthday}</td>
				<td>${data.idCard}</td>
				<td>${data.mobile}</td>
				<td>${data.addr}</td>
				<td>${data.isUsed=='1'?'是':'否'}</td>
				<td>${fn:substring(data.createDate,0,19)}</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                	<s:a clazz="btn btn-green btn-sm" href="/user/info/editview?userId=${data.userId}" id="user_info_editview" node="<%=UserPermission.class.getName() %>" permission="<%=UserPermission.UPDATE %>"  
                	 target="dialog" max="false" rel="user_info_editview"  name="修改" width="750" height="450"/>
                	<s:a clazz="btn btn-green btn-sm" href="/user/info/editstatus?userId=${data.userId}" permission="<%=UserPermission.STATUS %>" node="<%=UserPermission.class.getName() %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态"/>
					<s:a clazz="btn btn-red btn-sm" href="/user/info/delview?userId=${data.userId}" permission="<%=UserPermission.DELETE %>" node="<%=UserPermission.class.getName() %>" target="ajaxTodo" title="确定要删除吗?" name="删除"/>	
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<span class="sel">
				<select class="selectpicker show-tick dropup" data-style="btn-default btn-sel xs" data-width="auto" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
					<option value="20" ${list.pageSize==20?"selected='true'":""} >20</option>
					<option value="50" ${list.pageSize==50?"selected='true'":""} >50</option>
					<option value="100" ${list.pageSize==100?"selected='true'":""} >100</option>
					<option value="200" ${list.pageSize==200?"selected='true'":""} >200</option>
				</select>
			</span>
			<span>&nbsp;条，共${list.totalCount}条</span>
		</div>
		<div class="pagination-box" targettype="navTab" totalcount="${list.totalCount}" numperpage="${list.pageSize}" pagenumshown="6" currentpage="${list.curPage}"></div>
	</div>
	
</div>
 <!-- </body></html> -->