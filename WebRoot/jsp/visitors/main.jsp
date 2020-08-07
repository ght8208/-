<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="css/visit/style.css">
	
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	
  </head>
  
  <body>
  	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <!-- <li><a href="#">工具箱</a></li> -->
    </ul>
    </div>
  
  
	<div class="formbody">
    
    <div class="formtitle"><span>常用功能</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu1.png" /></a><h2>查询自己的个人信息</h2></li>
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu2.png" /></a><h2>修改个人信息</h2></li>
    <li><a href="/wenq/jsp/admin/user/addGUser.jsp"><img src="/wenq/images/visitor/content/tu3.png" /></a><h2>成为会员</h2></li> 
    <li><a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp"><img src="/wenq/images/visitor/content/tu5.png" /></a><h2>查询特惠游</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/cuxiao/showtehuiyoucx.jsp"><img src="/wenq/images/visitor/content/tu12.png" /></a><h2>价格促销功能</h2></li>
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> --> 
    </div>
    
    <div class="formtitle"><span>信息查询</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu1.png" /></a><h2>查询自己的个人信息</h2></li>
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu2.png" /></a><h2>修改个人信息</h2></li>
    <li><a href="/wenq/jsp/admin/user/addGUser.jsp"><img src="/wenq/images/visitor/content/tu3.png" /></a><h2>成为会员</h2></li>   
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    <div class="formtitle"><span>地图模块</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/ditu/map.jsp"><img src="/wenq/images/visitor/content/tu4.png" /></a><h2>地图查询</h2></li>   
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    <div class="formtitle"><span>特惠游模块</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp"><img src="/wenq/images/visitor/content/tu5.png" /></a><h2>查询特惠游</h2></li>     
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    
    <div class="formtitle"><span>门票模块</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/admin/user/MDeleteGuser.jsp"><img src="/wenq/images/admin/tools/i07.png" /></a><h2>会员管理</h2></li>
    <li><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp"><img src="/wenq/images/admin/tools/i06.png" /></a><h2>门票管理</h2></li>
    <li><a href="/wenq/jsp/admin/dingdan/mdMyOrder.jsp"><img src="/wenq/images/admin/tools/i08.png" /></a><h2>订单管理</h2></li>
    <li><a href="/wenq/jsp/admin/luntan/liuyan/mdliuyan.jsp"><img src="/wenq/images/admin/tools/i09.png" /></a><h2>留言管理</h2></li>      
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    <div class="formtitle"><span>酒店模块</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp"><img src="/wenq/images/visitor/content/tu7.png" /></a><h2>酒店查询</h2></li>    
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    <div class="formtitle"><span>论坛模块</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/luntan/bankuai/addbankuai.jsp"><img src="/wenq/images/visitor/content/tu8.png" /></a><h2>创建板块</h2></li>
    <li><a href="/wenq/jsp/visitors/luntan/tiezi/addtiezi.jsp"><img src="/wenq/images/visitor/content/tu9.png" /></a><h2>创建帖子</h2></li>
    <li><a href="/wenq/jsp/visitors/luntan/liuyan/addliuyan.jsp"><img src="/wenq/images/visitor/content/tu10.png" /></a><h2>添加留言</h2></li>    
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    <div class="formtitle"><span>会员专区</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/huiyuan/addGUser.jsp"><img src="/wenq/images/visitor/content/tu11.png" /></a><h2>会员注册</h2></li>
    <li><a href="#"><img src="/wenq/images/admin/tools/i06.png" /></a><h2>定制个人喜好</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/cuxiao/showtehuiyoucx.jsp"><img src="/wenq/images/visitor/content/tu12.png" /></a><h2>价格促销功能</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/duihuan/showtehuiyoudh.jsp"><img src="/wenq/images/visitor/content/tu13.png" /></a><h2>积分兑换功能</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/choujiang/test.jsp"><img src="/wenq/images/visitor/content/tu14.png" /></a><h2>转转乐功能</h2></li>      
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="添加" /></span> -->  
    </div>
    
    
    
    </div>



  </body>
</html>
