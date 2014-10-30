<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<title>(B-JUI) - Bootstrap for DWZ富客户端框架</title>
<meta name="Keywords" content="Bootstrap,DWZ,jquery,ui,前端,框架,开源,OSC,开源框架,knaan"/>
<meta name="Description" content="Bootstrap for DWZ富客户端框架，基于DWZ富客户端框架修改。主要针对皮肤，编辑器，表单验证等方面进行了大量修改，引入了Bootstrap，Font Awesome，KindEditor，jquery.validationEngine，iCheck等众多开源项目。交流QQ群：232781006。"/> 

<!-- jsp 支持font awesome -->
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" />
<!-- bootstrap - css -->
<link href="<%=basePath %>/dwz/themes/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
<!-- uploadify -->
<link href="<%=basePath %>/dwz/plugins/uploadify/css/uploadify.css" rel="stylesheet" media="screen"/>
<link href="<%=basePath %>/dwz/plugins/Huploadify/Huploadify.css" rel="stylesheet" media="screen"/>
<!-- core - css -->
<link href="<%=basePath %>/dwz/themes/css/style.css" rel="stylesheet" media="screen"/>
<link href="<%=basePath %>/dwz/themes/purple/core.css" rel="stylesheet" media="screen"/>
<!-- plug - css -->
<link href="<%=basePath %>/dwz/plugins/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet" media="screen" />
<link href="<%=basePath %>/dwz/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" media="screen" />
<link href="<%=basePath %>/dwz/plugins/validationEngine/validationEngine.jquery.css" rel="stylesheet" media="screen" />
<link href="<%=basePath %>/dwz/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet" media="screen" />
<link href="<%=basePath %>/dwz/themes/css/FA/css/font-awesome.min.css" rel="stylesheet" media="screen" />
<!--[if lte IE 7]>
<link href="<%=basePath %>/dwz/themes/css/ie7.css" rel="stylesheet" />
<![endif]-->
<!--[if lte IE 9]>
<script src="<%=basePath %>/dwz/js/speedup.js"></script>
<script src="<%=basePath %>/dwz/plugins/other/respond.js"></script>
<![endif]-->
<!-- jquery -->
<script src="<%=basePath %>/dwz/js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath %>/dwz/js/jquery.cookie.js"></script>
<!-- DWZ.min 分模块压缩版 -->
<script src="<%=basePath %>/dwz/js/dwz.min.js"></script>
<!-- 以下是DWZ的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
<!-- 
<script src="<%=basePath %>/dwz/js/dwz.core.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.util.date.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.drag.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.barDrag.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.ui.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.theme.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.alertMsg.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.contextmenu.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.navTab.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.tab.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.resize.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.dialog.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.dialogDrag.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.stable.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.taskBar.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.ajax.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.pagination.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.database.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.datepicker.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.effects.js"></script>
<script src="<%=basePath %>/dwz/js/dwz.history.js"></script>
-->
<!-- plugins -->
<!-- swfupload -->
<script src="<%=basePath %>/dwz/plugins/swfupload/swfupload.min.js"></script>
<!-- uploadify -->
<script src="<%=basePath %>/dwz/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<!-- html5 uploadify -->
<script src="<%=basePath %>/dwz/plugins/Huploadify/jquery.Huploadify.min.js"></script>
<!-- kindeditor -->
<script src="<%=basePath %>/dwz/plugins/kindeditor_4.1.10/kindeditor-all.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>
<!-- colorpicker -->
<script src="<%=basePath %>/dwz/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="<%=basePath %>/dwz/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/ztree/jquery.ztree.exedit-3.5.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/ztree/jquery.ztree.exhide-3.5.min.js"></script>
<!-- form validate -->
<script src="<%=basePath %>/dwz/plugins/validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=basePath %>/dwz/plugins/validationEngine/jquery.validationEngine.min.js"></script>
<!-- bootstrap plugins -->
<script src="<%=basePath %>/dwz/plugins/bootstrap.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/dwz/plugins/bootstrapTags/bootstrap-tags.min.js"></script>
<!-- icheck -->
<script src="<%=basePath %>/dwz/plugins/icheck/icheck.min.js"></script>
<!-- dragsort -->
<script src="<%=basePath %>/dwz/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
<!-- clock -->
<script src="<%=basePath %>/dwz/plugins/clock/jqClock.min.js"></script>
<!-- other plugins -->
<script src="<%=basePath %>/dwz/plugins/other/jquery.autosize.js"></script>
<!-- init -->
<script type="text/javascript">
$(function(){
    DWZ.init("<%=basePath %>/dwz/dwz.frag.xml", {
        loginUrl:"logintimeout.html", loginTitle:"登录",    // 弹出登录对话框
        statusCode:{ok:200, error:300, timeout:301}, //【可选】
        pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
        keys: {statusCode:"statusCode", message:"message"}, //【可选】
        ui:{hideMode:'display'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
        debug:false,    // 调试模式 【true|false】
        callback:function(){
            initEnv();
            $("#topTheme").theme({themeBase:"<%=basePath %>/dwz/themes"}); // themeBase 相对于index页面的主题base路径
            setTimeout( function() {
				//$("#sidebar .toggleCollapse div").click();
				navTab.openTab( "welcome", "<%=basePath %>/welcome", { title:'我的主页', fresh:true, external:false });
			}, 1000 );
        }
    });
    //jquery时钟
    var nowtime = new Date().getTime();
    $("#clock").clock({"timestamp":nowtime, "format":"24", "calendar":"false"});
});
//菜单-事件
function MainMenuClick(event, treeId, treeNode) {
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId);
        zTree.expandNode(treeNode);
        return;
    }
    if (treeNode.target && treeNode.target == 'dialog') {
        $.pdialog.open(treeNode.nurl, treeNode.rel, treeNode.name, {});
    } else if (treeNode.target && treeNode.target == 'navTab') {
        navTab.openTab(treeNode.rel, treeNode.nurl, { title: treeNode.name});
    }
}
function onLoadMenuInfo(){
	var url = "<%=basePath%>/hotel/bind/hotelinfo" ;
	$.ajax({
         type: "post" ,
         url: url ,
         data: {tvalue:tvalue,cvalue:cvalue},
         dataType:"json",
         success: function(data){
        	 if( 200 == data.statusCode)
       		 {
       		 	dialogAjaxDone( data );
        		document.getElementById("button_bind"+rowCount).value =  "绑定成功";
        		document.getElementById("button_bind"+rowCount).disabled = true;
       		 }else if(302 == data.statusCode)
       		 {
       		 	dialogAjaxDone( data );
       		 	document.getElementById("button_bind"+rowCount).value =  "已存在绑定";
        		document.getElementById("button_bind"+rowCount).disabled = true;
       		 }else{
       			dialogAjaxDone( data );
    		}
         }
     });
}

</script>
</head>
<body scroll="no">
    <!--[if lte IE 7]>
        <div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
    <![endif]-->
    <div id="layout">
    	<!-- header 标题头部 -->
        <div id="header">
            <div class="headerNav">
                <div class="logo"><a href="http://www.xknaan.com/"><img src="images/logo.png" height="50" />&nbsp;&nbsp;<img src="images/logo_bootstrap.png" height="50" /></a></div>
                <ul class="topnav">
                    <li>2014-07-23&nbsp;<span id="clock"></span></li>
                    <li>当前用户：admin</li>
                    <li><a href="<%=basePath %>/changePwd" >修改密码</a></li>
                    <li><a href="<%=basePath %>/main" >网站首页</a></li>
                    <li><a href="<%=basePath %>/login" >退出</a></li>
                </ul>
                <ul class="topTheme" id="topTheme">
                    <li theme="default" class="theme_default" title="黑白分明"><i class="fa fa-circle"></i></li>
                    <li theme="orange" class="theme_orange" title="橘子红了"><i class="fa fa-circle"></i></li>
                    <li theme="purple" class="theme_purple" title="紫罗兰"><i class="fa fa-circle"></i></li>
                    <li theme="blue" class="theme_blue" title="青出于蓝"><i class="fa fa-circle"></i></li>
                    <li theme="green" class="theme_green" title="绿草如茵"><i class="fa fa-circle"></i></li>
                </ul>
            </div>
        </div>
		
		<!-- 左边 菜单 -->
        <div id="leftside">
            <div id="sidebar_s">
                <div class="collapse">
                    <div class="toggleCollapse"><div title="展开菜单"><i class="fa fa-angle-double-right"></i></div></div>
                </div>
            </div>
            <div id="sidebar">
                <div class="toggleCollapse"><h2>主菜单</h2><div title="收缩菜单"><i class="fa fa-angle-double-left"></i></div></div>
                <div class="panel-group panel-main j-accordion" id="accordion_menu" data-heightbox="#sidebar" data-offsety="24">
                    
                    <!-- 菜单 -->
                    <div class="panel panel-default">
                        <div class="panel-heading panelContent">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion_menu" href="#collapse_0" class="active"><i class="fa fa-caret-square-o-down"></i>&nbsp;基本信息</a></h4>
                        </div>
                        <div id="collapse_0" class="panel-collapse panelContent collapse in">
                            <div class="panel-body">
                                <ul id="main_treeDemo_0" class="ztree ztree_main" 
                                	attrs = '{"onClick":"MainMenuClick", "expandAll":true}' nodes='${infoUrl }'>
                                </ul>
                            </div>
                        </div>
                        <div class="panelFooter"><div class="panelFooterContent"></div></div>
                    </div>
                    <!-- 菜单 -->
                </div>
            </div>
        </div>
        
		<!-- 内容信息 -->        
        <div id="container">
            <div id="navTab" class="tabsPage">
                <div class="tabsPageHeader">
                    <div class="tabsPageHeaderContent">
                        <ul class="navTab-tab nav nav-tabs">
                            <li tabid="welcome" class="select"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                        </ul>
                    </div>
                    <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                    <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                    <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
                </div>
                <ul class="tabsMoreList">
                    <li tabid="welcome" ><a href="javascript:;" class="home_icon">我的主页</a></li>
                </ul>
                <div class="navTab-panel tabsPageContent layoutBox">
                    <div class="page unitBox">
                        <div class="accountInfo">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 内容信息 结束 -->   
    </div>
    
    <!-- 底部 -->
    <div id="footer">启笃 - 权限管理系统</div>
</body>
</html>