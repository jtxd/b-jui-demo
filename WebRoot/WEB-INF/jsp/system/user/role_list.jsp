<%@page import="com.sevendosoft.access.constant.permethod.role.UserPermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.RolePermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.MenuPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/s-tld/s.tld" prefix="s" %>
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

<script type="text/javascript">

function setroleListValue(roleId)
{
	
	$("#user_role_addchiview").attr("href","<%=basePath%>/user/role/addchiview?roleId="+roleId);
	$("#user_role_permissionview").attr("href","<%=basePath%>/user/role/permissionview?roleId="+roleId);
	$("#user_role_editstatus").attr("href","<%=basePath%>/user/role/editstatus?roleId="+roleId);
	$("#user_role_delview").attr("href","<%=basePath%>/user/role/delview?roleId="+roleId);
}

</script>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body> -->
<%-- 
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<s:a clazz="add"  href="/user/role/addview" node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADD %>" target="dialog" max="false" rel="user_role_addview" name="添加超级管理员" width="750" height="450" />
			<s:a clazz="edit" href="/user/role/addchiview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADDCHI %>"  target="dialog" max="false" rel="user_role_addchiview" name="添加子角色" width="750" height="450"/>
			<s:a clazz="edit" href="/user/role/permissionview?roleId={roleId}"   node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.PER %>" target="dialog" max="true" name="授权" width="750" height="450" title="授权" id="user_role_permissionview"/>
			<li class="line">line</li>
			<s:a clazz="edit" href="/user/role/editstatus?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态" id="user_role_editstatus" />
			<s:a clazz="delete" href="/user/role/delview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除" id="user_role_delview" />	

		</ul>
	</div>
	
	<div style="float: left;width: 210px;" >		
		<div class="accordion" fillSpace="sidebar">
			<div class="accordionHeader">
				<h2><span>Folder</span>角色管理</h2>
			</div>
			<div layoutH="27" class="accordionContent">		
			
					<div style="width: 200px;" id="order_list">
						<ul class="tree treeFolder">
							<svdo:tree list="${list }"/>
							
							
							
						</ul>
					</div>
			</div>
			
		</div>	
	</div>
	
	<div id="role_detail" class="unitBox" style="margin-left: 200px; " ></div>
	
</div> --%>
<script type="text/javascript">
function changeZtree(t) {
    var $panel = navTab.getCurrentPanel();
    var $t    = $('#ztree1');
    var attrs = jQuery.parseJSON($t.attr('attrs'));
    var $span = $('#ztree-'+ t);
    if (t != 8)
        $.fn.zTree.destroy("ztree1");
    switch(t) {
        case 1:
            attrs.editEnable ? delete attrs.editEnable : attrs.editEnable = true;
            attrs.showRenameBtn ? delete attrs.showRenameBtn : attrs.showRenameBtn = true;
            attrs.showRemoveBtn ? delete attrs.showRemoveBtn : attrs.showRemoveBtn = true;
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 2:
            attrs.addHoverDom ? delete attrs.addHoverDom : attrs.addHoverDom = 'edit';
            attrs.removeHoverDom ? delete attrs.removeHoverDom : attrs.removeHoverDom = 'edit';
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 3:
            attrs.checkEnable ? delete attrs.checkEnable : attrs.checkEnable = true;
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 4:
            attrs.onClick ? delete attrs.onClick : attrs.onClick = 'ZtreeClick';
            $span.text(($span.text() == '无') ? 'ZtreeClick' : '无');
            $('#ztree-detail').toggle();
            break;
        case 5:
            attrs.beforeDrag ? delete attrs.editEnable : attrs.editEnable = true;
            attrs.beforeDrag ? delete attrs.beforeDrag : attrs.beforeDrag = 'M_BeforeNodeDrag';
            attrs.beforeDrop ? delete attrs.beforeDrop : attrs.beforeDrop = 'M_BeforeNodeDrop';
            attrs.onDrop ? delete attrs.onDrop : attrs.onDrop = 'M_NodeDrop';
            $span.text(($span.text() == '无') ? 'M_BeforeNodeDrag、M_BeforeNodeDrop、M_NodeDrop' : '无');
            break;
        case 6:
            attrs.addHoverDom ? delete attrs.addHoverDom : attrs.addHoverDom = 'edit';
            attrs.removeHoverDom ? delete attrs.removeHoverDom : attrs.removeHoverDom = 'edit';
            attrs.beforeRemove ? delete attrs.beforeRemove : attrs.beforeRemove = 'M_BeforeRemove';
            attrs.onRemove ? delete attrs.onRemove : attrs.onRemove = 'M_NodeRemove';
            $('#ztree-2').text(($('#ztree-2').text() == '无') ? '显示' : '无');
            $span.text(($span.text() == '无') ? 'M_BeforeRemove、M_NodeRemove' : '无');
            break;
        case 7:
            attrs.addDiyDom ? delete attrs.addDiyDom : attrs.addDiyDom = 'M_AddDiyDom';
            $span.text(($span.text() == '无') ? 'M_AddDiyDom' : '无');
            break;
        case 8:
            attrs = null;
            var tree = $.fn.zTree.getZTreeObj("ztree1");
            var menus = tree.getNodes();
            $('#ztree-log').val(JSON.stringify(menus));
            break;
    }
    if (attrs) {
        var _attrs = JSON.stringify(attrs);
        $t.attr('attrs', _attrs);
        $('#ztree-log').val('attrs:'+ _attrs);
        $panel.initUI();
    }
}
//点击事件
//通过id查询出菜单信息
function ZtreeClick(event, treeId, treeNode) {
	
	$.post(
			"<%=basePath%>/order/info/last/"+treeNode.id , 
			function ( data ) {
				var infoUrl = data.infoUrl;
				$("#j_menu_fname").val(infoUrl.parentName);
				$("#j_menu_name").val(infoUrl.name);
				$("#j_menu_url").val(infoUrl.href);
				$("#j_menu_rel").val(infoUrl.rel);
				$("#j_menu_target").empty() ;
				$("#j_menu_target").append('<option value="navTab" '+infoUrl.target=='navTab'?'checked=checked':'' +' >navTab</option>') ;
				$("#j_menu_target").append('<option value="dialog" '+infoUrl.target=='dialog'?'checked=checked':'' +' >dialog</option>') ;
				$("#j_menu_description").val(infoUrl.description);
				if( 1 == infoUrl.isUsed ){
					alert($("#j_form_isUsed1"));
					$("#j_form_isUsed1").attr("checked",true) ;
				}else{
					$("#j_form_isUsed2").attr("checked",true) ;
				}
				$("#j_menu_permission").val(infoUrl.permission);
				$("#j_menu_sortNo").val(infoUrl.sortNo);
			},
		"json" );
	
}
//保存属性
function M_Ts_Menu() {
	var zTree  = $.fn.zTree.getZTreeObj("ztree1");
	var name   = $('#j_menu_name').val();
	var url    = $('#j_menu_url').val();
	var rel    = $('#j_menu_rel').val();
	var target = $('#j_menu_target').val();
	if ($.trim(name).length == 0) {
		alertMsg.error('菜单名称不能为空！');
		return;
	}
	var upNode = zTree.getSelectedNodes()[0];
	if (!upNode) {
		alertMsg.error('未选中任何菜单！');
        return;
	}
	upNode.name   = name;
	upNode.nurl   = url;
	upNode.rel    = rel;
	upNode.target = target;
	zTree.updateNode(upNode);
}
//
function M_BeforeNodeDrag(treeId, treeNodes) {
    var $log = $('#ztree-log');
    $log.val('开始拖拽：'+ treeNodes[0].name +'！\n'+ $log.val());
    return true;
}
//监听拖拽事件
function M_BeforeNodeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
    /*禁止插入层级为2的节点*/
    if (moveType == 'inner' && targetNode.level == 2) {
        return false;
    }
    /*禁止插入剩余层级不足的子节点*/
    if (moveType == 'inner' && treeNodes[0].isParent) {
        var molevel = 2 - targetNode.level; //剩余层级
        var maxlevel = 1;
        var zTree = $.fn.zTree.getZTreeObj("ztree1");
        var nodes = zTree.transformToArray(treeNodes);
        var level = nodes[0].level;
        for (var i = 1; i < nodes.length; i++) {
            if (nodes[i].level == (level + 1)) {
                maxlevel++;
                level++;
            }
        }
        if (maxlevel > molevel) {
            return false;
        }
    }
    return true;
}
//拖拽结束事件
function M_NodeDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
    var $log = $('#ztree-log');
    $log.val('拖拽结束！\n'+ $log.val());
}
//删除前事件
function M_BeforeRemove(treeId, treeNode) {
    var $log = $('#ztree-log');
    $log.val('准备删除：'+ treeNode.name +'！\n'+ $log.val());
    return true;
}
//删除结束事件
function M_NodeRemove(event, treeId, treeNode) {
    var $log = $('#ztree-log');
    $log.val('删除成功！\n'+ $log.val());
}
//自定义DOM
function M_AddDiyDom(treeId, treeNode) {
	alert(1);
    var aObj = $('#' + treeNode.tId + '_a');
	if ($('#diyBtn_'+ treeNode.id).length > 0) return;
	var editStr = '<button type="button" class="diyBtn1" id="diyBtn_' + treeNode.id +'" title="'+ treeNode.name +'" onfocus="this.blur();"><i class="fa fa-plane"></i></button>';
	aObj.append(editStr);
	var btn = $('#diyBtn_'+treeNode.id);
	if (btn) btn.bind('click', function(){alertMsg.info(treeNode.name +' 的飞机！');});
}
</script>
<div class="pageContent">
    <div class="pageFormContent" layouth="29">
        <div style="float: left; width: 99%;">
        	
        	<div class="pageHeader">
			    <form onsubmit="return navTabSearch(this);" action="<%=basePath%>/user/info/listview" method="get" >
			        <div class="searchBar">
			            <ul class="searchContent">
			            	<li><s:a clazz="btn btn-green btn-sm"  href="/user/role/addview" node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADD %>" target="dialog" max="false" rel="user_role_addview" name="添加超级管理员" width="750" height="450" /></li>
			            	<li><s:a clazz="btn btn-green btn-sm" href="/user/role/addchiview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.ADDCHI %>"  target="dialog" max="false" rel="user_role_addchiview" name="添加子角色" width="750" height="450"/></li>
			               	<li><s:a clazz="btn btn-orange btn-sm" href="/user/role/permissionview?roleId={roleId}"   node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.PER %>" target="dialog" max="true" name="授权" width="750" height="450" title="授权" id="user_role_permissionview"/></li>
			               	<li><s:a clazz="btn btn-default btn-sm" href="/user/role/editstatus?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态" id="user_role_editstatus" /></li>
			               	<li><s:a clazz="btn btn-orange btn-sm" href="/user/role/delview?roleId={roleId}"  node="<%=RolePermission.class.getName() %>" permission="<%=RolePermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除" id="user_role_delview" />	</li>
			            </ul>
			        </div>
			    </form>
			</div>
        	
            <fieldset>
                <legend>树型菜单</legend>
                <div class="clearfix">
                    <div style="float: left; width: 220px; height: 240px; overflow: auto;">
                        <ul id="ztree1" class="ztree" attrs = '{"expandAll":true,"addHoverDom":"edit","removeHoverDom":"edit","onClick":"ZtreeClick"}' 
                            nodes='${infoUrl}'>
                        </ul>
                    </div>
                    
                    
                    <div id="ztree-detail" style=" margin-left: 230px; width: 80%; height: 80%;">
                        <div class="bs-example" data-content="详细信息">
                            <div class="form-group">
                                <label for="j_menu_fname" class="control-label x85">父级菜单：</label>
                                <input type="text" class="form-control validate[required] required" name="infoUrl.parentName" id="j_menu_fname" size="30" placeholder="菜单名称" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_name" class="control-label x85">菜单名称：</label>
                                <input type="text" class="form-control validate[required] required" name="infoUrl.name" id="j_menu_name" size="30" placeholder="菜单名称" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_url" class="control-label x85">URL：</label>
                                <input type="text" class="form-control" name="infoUrl.href" id="j_menu_url" size="30" placeholder="eg：/order/info/listview" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_rel" class="control-label x85">rel：</label>
                                <input type="text" class="form-control" name="infoUrl.rel" id="j_menu_rel" size="30" placeholder="rel" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_target" class="control-label x85">target：</label>
                                <select class="selectpicker show-tick" name="infoUrl.target" id="j_menu_target" data-style="btn-default btn-sel" data-width="auto">
                                    <option value="navTab" >navTab</option>
                                    <option value="dialog">dialog</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="j_menu_description" class="control-label x85">描述：</label>
                                <textarea class="form-control" rows="3" name="infoUrl.description" id="j_menu_description" placeholder="rel" style="width: 70%; height: 68px;"></textarea>
                            </div>
                            
                            <div class="form-group">
                            	<label for="j_form_isUsed1" class="control-label x85">是否有效：</label>
                            	<input type="radio" name="infoUrl.isUsed" id="j_form_isUsed1"  class="j-icheck" value="1">
								<label class="ilabel" for="j_form_radio1">有效&nbsp;</label>
								<input type="radio" name="infoUrl.isUsed" id="j_form_isUsed2" class="j-icheck" value="0">
								<label class="ilabel" for="j_form_radio2">无效&nbsp;</label>
                            </div>
                            <div class="form-group">
                                <label for="j_menu_sortNo" class="control-label x85">排序号：</label>
                                <input type="text" class="form-control" name="infoUrl.sortNo" id="j_menu_sortNo" size="20" />
                            </div>
                            
                            <div class="form-group">
                            	<label for="j_menu_permission" class="control-label x85">权限类：</label>
                            	<input type="text" class="form-control" name="infoUrl.permission" id="j_menu_permission" style="width: 70%;" placeholder="注意：此菜单不存在功能点即不需填写" />
                            </div>
                            
                            <div class="form-group" style="padding-top: 8px; border-top: 1px #DDD solid;">
                                <label class="control-label x85"></label>
                                <button class="btn btn-green btn-sm" onclick="M_Ts_Menu();">更新菜单</button>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>
<!-- 	</body>
	</html>  -->