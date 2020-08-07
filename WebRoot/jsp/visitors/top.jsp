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
	.topr{
	height:88px;
	background:url(./wenq/images/admin/top/topright.jpg) no-repeat right;
	float:right;
	top:15px;
	position:relative;
	/* border:red 1px solid; */
	}
	.top ul{padding-top:15px; float:right; padding-right:12px;}
	.topr ul li{float:left; padding-left:9px; padding-right:9px; background:url(../images/line.gif) no-repeat right;}
	.topr ul li:last-child{background:none;}
	.topr ul li a{font-size:13px; color:#e9f2f7;}
	.topr ul li a:hover{color:#fff;}
	.topr ul li span{margin-top:2px;float:left;padding-right:3px;}
	
	
	</style>
  </head>
  
  <body style="background:url(/wenq/images/visitor/top/cbg.png) repeat-x;">
    <div class="topleft">
    <a href="/wenq/jsp/admin/admain.jsp" target="_parent"><img src="/wenq/images/logo.png" class="log" title="系统首页" /><b style="color:white;font-size:16px;">个人中心</b></a>
    </div>
        
    <ul class="nav">
    </ul>
            
    <div class="topr">    
    <ul>
    <li><span><img src="images/admin/top/help.png" title="帮助"  class="helpimg" target="rightFrame"/></span><a href="#">帮助</a></li>
    <li><a href="#">设置</a></li>
    <li><a href="/wenq/main.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><%=session.getAttribute("username").toString() %></span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>
  </body>
</html>
