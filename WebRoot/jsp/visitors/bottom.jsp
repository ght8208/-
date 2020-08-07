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
	
	<link rel="stylesheet" type="text/css" href="css/visit/style.css">
	
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
	height:60px;
	width:60px;
	top:10px;
	position:relative;
	}
	.bottom{
	width:100%;
	/* top:550px;
	position:fixed; */
	/* border:solid red 1px; */
	}
	</style>
  </head>
  
  <body style="background:url(/wenq/images/visitor/top/cbg.png) repeat-x;">
    <div class="bottom" >
    <div class="topleft" >
    <a href="/wenq/WebRoot/jsp/visitors/ownfunction.jsp" target="_parent">
    <img src="/wenq/images/admin/tools/i07.png" class="log" title="系统首页" />
    <b style="color:white;font-size:16px;">用户中心</b>
    </a>
    </div>
        
    <ul class="nav" >
    <li><a href="/wenq/jsp/visitors/main.jsp" target="rightFrame" class="selected"><img src="/wenq/images/visitor/bottom/bottom1.png" title="首页" /><h2>首页</h2></a></li>
    <li><a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom2.png" title="特惠游" /><h2>特惠游</h2></a></li>
    <li><a href="/wenq/jsp/admin/menpiao/showmenpiao.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom3.png" title="门票功能" /><h2>门票功能</h2></a></li>
    <li><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom4.png" title="酒店功能" /><h2>酒店功能</h2></a></li>
    <li><a href="/wenq/jsp/visitors/luntan/bankuai/addbankuai.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom5.png" title="旅游论坛" /><h2>旅游论坛</h2></a></li>
    <li><a href="/wenq/jsp/admin/tab/tab.jsp"  target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom6.png" title="会员专区" /><h2>会员专区</h2></a></li>
    <li><a href="/wenq/showUserInfo.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom7.png" title="信息查询" /><h2>信息查询</h2></a></li>
    <li><a href="/wenq/jsp/visitors/ditu/map.jsp" target="rightFrame"><img src="/wenq/images/visitor/bottom/bottom8.png" title="地图查询" /><h2>地图查询</h2></a></li>
    </ul>
            
    <!-- <div class="topright">    
    <ul>
    <li><span><img src="images/admin/top/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="/wenq/main.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>admin</span>
    <i>消息</i>
    <b>5</b>
    </div>   -->  
    
    </div>
    
 </div>
  </body>
</html>
