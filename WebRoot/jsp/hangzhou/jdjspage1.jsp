<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jdjspage1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<!-- 	css样式 -->
	<link rel="stylesheet" type="text/css" href="css/topmenu.css">
	
	<!--    	 菜单事件 -->
	<script src="js/menu.js"></script>
	<style>
	.slip{
		left:150px;
    	position:relative;
	}
	.raids_imgs{
		left:550px;
    	position:relative;
	}
	.clearfix{
		list-style-type:none;
	}
	
	</style>
	
  </head>
  
  <body>
  

	<!-- 头部 开始 -->
    	<%@include file="/jsp/head/menu.jsp" %>
	<!-- 头部 end -->

	<!-- 顶部导航区结束 -->
	
	<!-- 滚动图片区 -->
	<!-- <div class="sliping">
		<img class="slip"  src="./images/slip/xihu1.png" style="width:1280px;height:280px"/>
	</div> -->
	
	<!-- 当前位置区 -->
	<div class="position">
	您所在的位置：<a href="/index.htm">首页</a>&gt;<span>景区介绍</span>&gt;<span>景点介绍</span>
 	</div>
 	
	<!-- 主要区 -->
	<div class="main">
		 <ul class="clearfix">
                
                <li>
                    <a href="/page/info.htm?id=2384">
                        <img class="raids_imgs" src="./images/page/11.jpg" alt="新金顶" style="width: 376px;height: 273px;" />
                    	<h3 style="text-align:center">澄庐</h3>
                        <span class="bg"></span>
                    </a>
                </li>
                <li>
                    <a href="/page/info.htm?id=2342">
                        <img class="raids_imgs" src="./images/page/12.jpg" alt="老金顶" style="width: 376px;height: 273px;" />
                        <h3 style="text-align:center">三潭映月</h3>
                        <span class="bg"></span>
                    </a>
                </li>
                <li>
                    <a href="/page/info.htm?id=2383">
                        <img class="raids_imgs" src="./images/page/13.jpg" alt="蘑菇石" style="width: 376px;height: 273px;" />
                        <h3 style="text-align:center">岳飞墓</h3>
                        <span class="bg"></span>
                    </a>
                </li>
                <li>
                    <a href="/page/info.htm?id=2341">
                        <img class="raids_imgs" src="./images/page/14.jpg" alt="承恩寺" style="width: 376px;height: 273px;" />
                        <h3 style="text-align:center">岳王庙</h3>
                        <span class="bg"></span>
                    </a>
                </li>
                <li>
                    <a href="/page/info.htm?id=2387">
                        <img class="raids_imgs" src="./images/page/15.jpg" alt="万宝岩" style="width: 376px;height: 273px;" />
                        <h3 style="text-align:center">钱王祠</h3>
                        <span class="bg"></span>
                    </a>
                </li>
                <li>
                    <a href="/page/info.htm?id=2382">
                        <img class="raids_imgs" src="./images/page/16.jpg" alt="万卷书" style="width: 376px;height: 273px;" />
                        <h3 style="text-align:center">孙东坡纪念馆</h3>
                        <span class="bg"></span>
                    </a>
                </li>
            </ul>
       </div>
           <!--攻略列表 end-->
        <!--分页-->
        <div class="list_bot" id="pagers" style="text-align:center">
			<div class="list_bot">
				<a class="list_bot_hov">1</a>
				<a href="jdjspage2.jsp">2</a>
				<a href="">3</a>
				<a href="jdjspage2.jsp">下一页</a>
			</div>
	   </div>

	<!-- 版权区 -->
	<div class="copy" style="text-align:center">
		<img  src="./images/xhlogo.png" align="left" style="width: 120px;height: 105px;">
		<br/>
		<p>版权所有：浙江省杭州市西湖风景区版权所有Copyright © 2017      备案号：xxxxxxxx</p>
		<p>联系电话：0510-xxxxxxx 传真:0510-xxxxxxx</p>
		<p>
			官网网址：http://www.xxxxx.com/     http://www.杭州西湖.com/
		</p>
		<p>团队介绍 :</p>
	</div>



  </body>
</html>
