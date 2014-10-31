<%@page import="com.sevendosoft.access.constant.permethod.role.UserPermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.RolePermission"%>
<%@page import="com.sevendosoft.access.constant.permethod.role.MenuPermission"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script type="text/javascript">
//点击事件
//通过id查询出菜单信息
function ZtreeClick(event, treeId, treeNode) {
	
	if( 'undefined' != treeNode.id ){
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
					$("#j_menu_permission").val(infoUrl.permission);
					$("#j_menu_sortNo").val(infoUrl.sortNo);
				},
			"json" );
	}else{
		alert(treeNode.pId);
		alert(treeNode.name);
		<%-- $.post(
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
					$("#j_menu_permission").val(infoUrl.permission);
					$("#j_menu_sortNo").val(infoUrl.sortNo);
				},
			"json" ); --%>
	}
	
	
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
	alert(123)
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
			    <form onsubmit="return navTabSearch(this);" method="get" >
			        <div class="searchBar">
			            <ul class="searchContent">
			            	<li><s:a clazz="btn btn-green btn-sm" order_detail="1" href="/order/root/addview"  node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.ADDROOT %>"  target="ajax" rel="order_detail" fresh="true"  title="添加根节点" name="添加根节点" /></li>
							<li><s:a clazz="btn btn-green btn-sm" order_detail="0" href="/order/root/addview?urlId={urlId}" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.ADDCHI %>"  target="ajax"  rel="order_detail" fresh="true" title="添加子节点" name="添加子节点" id="order_list_addchinode" /></li>
							<li><s:a clazz="btn btn-default btn-sm" href="/order/root/editstatus?urlId={urlId}" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.STATUS %>" target="ajaxTodo" title="确定要修改状态吗?" name="修改状态"  id="order_list_editinfo" /></li>
							<li><s:a clazz="btn btn-orange btn-sm" href="/order/root/delview?urlId={urlId}" node="<%=MenuPermission.class.getName() %>" permission="<%=MenuPermission.DELETE %>" target="ajaxTodo" title="确定要删除吗?" name="删除"  id="order_list_deletechinode" /></li>
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
                                <input type="text" class="form-control " readonly="readonly" name="infoUrl.parentName" id="j_menu_fname" size="30" placeholder="菜单名称" />
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