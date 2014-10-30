<%@page import="com.sevendosoft.access.constant.permethod.role.MenuPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</script>

<script type="text/javascript">

function setbuttonValue(urlId)
{
	$("#order_list_addchinode").attr("href","<%=basePath%>/order/root/addview?urlId="+urlId);
	$("#order_list_editinfo").attr("href","<%=basePath%>/order/root/editstatus?urlId="+urlId);
	$("#order_list_deletechinode").attr("href","<%=basePath%>/order/root/delview?urlId="+urlId);
}
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			
			<svdo:pmsnBtn clazz="add" order_detail="1" href="/order/root/addview"  node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.ADDROOT %>"  target="ajax" rel="order_detail" fresh="true"  title="添加根节点" name="添加根节点" />
			<svdo:pmsnBtn clazz="edit" order_detail="0" href="/order/root/addview?urlId=-2" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.ADDCHI %>"  target="ajax"  rel="order_detail" fresh="true" title="添加子节点" name="添加子节点" id="order_list_addchinode" />
			<li class="line">line</li>
			<svdo:pmsnBtn clazz="edit" href="/order/root/editstatus?urlId={urlId}" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态"  id="order_list_editinfo" />
			<svdo:pmsnBtn clazz="delete" href="/order/root/delview?urlId={urlId}" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除"  id="order_list_deletechinode" />
		</ul>
	</div>
	
	<div style="float: left;width: 210px;" >		
		<div class="accordion" fillSpace="sidebar">
			<div class="accordionHeader">
				<h2><span>Folder</span>菜单管理</h2>
			</div>
			<div layoutH="27" class="accordionContent">		
				<div style="width: 200px;" id="order_list">
					<ul class="tree treeFolder">
						<!-- 一级菜单 -->
						<c:forEach items="${infoUrl}" var="info">
							<c:if test="${info.parentId==-1 }">
								<li><a order_detail="${info.urlId}" href="<%=basePath%>/order/info/last/${info.urlId}" onclick="javascript:setbuttonValue('${info.urlId}')"  target="ajax" rel="order_detail" fresh="true" >${info.name}</a>
					            	<!-- 二级菜单 -->
									<c:forEach items="${infoUrl}" var="infochildren">
										<c:if test="${infochildren.parentId == info.urlId }">
											<ul>
												<li><a order_detail="${infochildren.urlId}" href="<%=basePath%>/order/info/last/${infochildren.urlId}" onclick="javascript:setbuttonValue('${infochildren.urlId}')"  target="ajax" rel="order_detail" fresh="true" >${infochildren.name}</a>
						                        	<!-- 三级菜单 -->
													<c:forEach items="${infoUrl}" var="infochildchild">
														<c:if test="${infochildchild.parentId == infochildren.urlId }">
															<ul><li><a order_detail="${infochildchild.urlId}" href="<%=basePath%>/order/info/last/${infochildchild.urlId}" onclick="javascript:setbuttonValue('${infochildchild.urlId}')" target="ajax" rel="order_detail" fresh="true" >${infochildchild.name} </a></li></ul>
														</c:if>				
													</c:forEach>
						                        </li>
					                        </ul>
				                        </c:if>						
									</c:forEach>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
	</div>
	
	<div id="order_detail" class="unitBox" style="margin-left: 200px; " ></div>
	
</div>