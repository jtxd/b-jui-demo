<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
function checkSumPermValue( checkId , checkName ,checkValue ) 
{
	var urlValue = document.getElementById(checkName).value ;
	var strs= new Array(); //定义一数组
	strs = urlValue.split("_");
	//是否被选中
	var result ;
	if(document.getElementById(checkId).checked)
	{
		document.getElementById(checkName).checked = true ;
		result = parseInt(strs[1])+parseInt(checkValue) ;
	}else{
		result = parseInt(strs[1])-parseInt(checkValue) ;
	}
	var newStri = strs[0] + "_" +  result + "_" + strs[2] ;
	document.getElementById(checkName).value  = newStri ;	
}

function checkSelectValue(id ,value)
{
	if(!document.getElementById(id).checked && value.split("_")[1] > 0 )
	{
		document.getElementById(id).checked = true ;
	}
}
</script>
<div class="pageContent">
	<form id="role_permission" method="post" action="<%=basePath %>/user/role/permissionsave" class="pageForm required-validate" onsubmit="return iframeCallback( this, dialogAjaxDone )">
	<input type="hidden" name="roleId" id="roleId" value="${roleId}" />
	<div class="pageFormContent" layoutH="56">
		<table class="table" width="100%" layoutH="113" nowrapTD="false">
			<c:forEach items="${infoUrl}" var="info">
				<!-- 一级菜单 -->
				<c:if test="${info.parentId==-1 }">
					<tr target="name" rel="${info.name}" style="height:30px;width:100%;border:solid 1px #e2e5e8;background-color:#009933;margin-left:10%;">
						<td width="30%">${info.name}</td>
						<td >
							<c:if test="${info.sysButton != null }">
								<table width="100%">
									<tr width="100%">
										<td><input type="checkbox" name="rolePermission" id="${info.urlId}_${info.permission}" value="${info.urlId}_${info.permValue==-1?'0':info.permValue}_${info.permission}" ${info.permValue>=0?'checked':''} >查看</td>
										<c:forEach items="${info.sysButton}" var="button">
											<td>
												<input type="checkbox" name="${info.urlId}_${info.permission}" id="${info.urlId}_${info.permission}_${button.permValue}" ${button.hasPermission?'checked':''} onclick="checkSumPermValue(this.id ,this.name,this.value)"  value="${button.permValue}">
												${button.btnName}
											</td> 
										</c:forEach>
									</tr>
								</table>										
							</c:if>
							<c:if test="${infochildren.sysButton == null }">
								<input type="checkbox" name="rolePermission" value="${info.urlId}_0_${info.permission}" ${info.permValue>=0?'checked':''} >查看
							</c:if>
						</td>
					</tr>
					
					<!-- 二级菜单 -->
					<c:forEach items="${infoUrl}" var="infochildren">
						<c:if test="${infochildren.parentId == info.urlId }">
							<tr style="height:30px;width:100%;border:solid 1px #e2e5e8;margin-left:20%;">
								<td style="padding-left:40px;"><span>${infochildren.name}</span></td>
								<td>
									<c:if test="${infochildren.sysButton != null }">
										<table width="100%">
											<tr width="100%">
												<td><input type="checkbox" name="rolePermission" id="${infochildren.urlId}_${infochildren.permission}" value="${infochildren.urlId}_${infochildren.permValue==-1?'0':infochildren.permValue}_${infochildren.permission}" onclick="checkSelectValue(this.id ,this.value)"  ${infochildren.permValue>=0?'checked':''}>查看</td>
												<c:forEach items="${infochildren.sysButton}" var="button">
													<td>
														<input type="checkbox" name="${infochildren.urlId}_${infochildren.permission}" id="${infochildren.urlId}_${infochildren.permission}_${button.permValue}" ${button.hasPermission?'checked':''}  onclick="checkSumPermValue(this.id,this.name,this.value)"  value="${button.permValue}">
														${button.btnName}
													</td> 
												</c:forEach>
											</tr>
										</table>										
									</c:if>
									<c:if test="${infochildren.sysButton == null }">
										<input type="checkbox" name="rolePermission" value="${infochildren.urlId}_0_${infochildren.permission}" ${infochildren.permValue>=0?'checked':''} >查看
									</c:if>								
								</td>
							</tr>
							
							<!-- 三级菜单 -->
							<c:forEach items="${infoUrl}" var="infochildchild">
								<c:if test="${infochildchild.parentId == infochildren.urlId }">
									<tr style="height:30px;width:100%;border:solid 1px #e2e5e8;margin-left:10%;">
										<td style="padding-left:80px;"><span>${infochildchild.name}</span></td>
										<td>
											<c:if test="${infochildchild.sysButton != null }">
												<table width="100%">
													<tr width="100%">
														<td><input type="checkbox" name="rolePermission" id="${infochildchild.urlId}_${infochildchild.permission}" value="${infochildchild.urlId}_${infochildchild.permValue==-1?'0':infochildchild.permValue}_${infochildchild.permission}" ${infochildchild.permValue>=0?'checked':''}>查看</td>
														<c:forEach items="${infochildchild.sysButton}" var="button">
															<td>
																<input type="checkbox" name="${infochildchild.urlId}_${infochildchild.permission}" id="${infochildchild.urlId}_${infochildchild.permission}_${button.permValue}" ${button.hasPermission?'checked':''} onclick="checkSumPermValue(this.id,this.name,this.value)"  value="${button.permValue}">
																${button.btnName}
															</td> 
														</c:forEach>
													</tr>
												</table>										
											</c:if>
											<c:if test="${infochildchild.sysButton == null }">
												<input type="checkbox" name="rolePermission" value="${infochildchild.urlId}_0_${infochildchild.permission}" ${infochildchild.permValue>=0?'checked':''}>查看
											</c:if>								
										</td>
									</tr>			
															
								</c:if>						
							</c:forEach>				
						</c:if>						
					</c:forEach>
					
					
				</c:if>
			</c:forEach>		
		</table>
	</div>
	<div class="formBar">
		<ul style="float:right;" >
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit"> 提 交 </button></div></div></li>
		</ul>
	</div>
	</form>
</div>
