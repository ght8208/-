<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
	
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	  <script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
	</script>
	<style type="text/css">
	.log{
	height:50;
	width:100px;
	}
	</style>
  </head>
  
  <body style="background:url(images/admin/top/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="/wenq/jsp/admin/admain.jsp" target="_parent"><img src="/wenq/images/logo.png" class="log" title="系统首页" /><b style="color:white;font-size:16px;">信息管理系统</b></a>
    </div>
        
    <ul class="nav">
    <li><a href="/wenq/jsp/admin/tongji/infotongji.jsp" target="rightFrame" class="selected"><img src="images/admin/top/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="/wenq/jsp/admin/tehuiyou/mdtehuiyou.jsp" target="rightFrame"><img src="images/admin/top/icon02.png" title="产品管理" /><h2>产品管理</h2></a></li>
    <li><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp"  target="rightFrame"><img src="images/admin/top/icon03.png" title="景区管理" /><h2>景区管理</h2></a></li>
    <li><a href="/wenq/jsp/admin/tab/tools.jsp"  target="rightFrame"><img src="images/admin/top/icon04.png" title="常用功能" /><h2>常用功能</h2></a></li>
    <li><a href="/wenq/jsp/admin/user/MDeleteuser.jsp" target="rightFrame"><img src="images/admin/top/icon05.png" title="用户管理" /><h2>用户管理</h2></a></li>
    <li><a href="/wenq/jsp/admin/tab/tab.jsp"  target="rightFrame"><img src="images/admin/top/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="images/admin/top/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="/wenq/main.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>admin</span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>
  </body>
</html>
