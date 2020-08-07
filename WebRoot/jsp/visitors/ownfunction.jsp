<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ownfunction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="/wenq/jsp/visitors/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset rows="*,88" frameborder="no" border="0" framespacing="0">
    
    <frame src="/wenq/jsp/visitors/main.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
    <frame src="/wenq/jsp/visitors/bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
  </frameset>
</frameset>
  
  <body>
  	<!-- <a href="/wenq/jsp/visitors/ownfunction.jsp" >个人中心：</a>
  	<br></br>
    <a href="/wenq/showUserInfo.jsp" target="rightFrame">查询自己的个人信息功能</a>
    <a href="/wenq/showUserInfo.jsp" target="rightFrame">修改个人信息功能</a>
    <a href="/wenq/jsp/admin/user/addGUser.jsp" target="rightFrame">成为会员功能</a>
    <br></br>
    <br></br>
    <a href="">地图模块：</a>
    <br></br>
    <a href="/wenq/jsp/visitors/ditu/map.jsp" target="rightFrame">查询地图功能</a>
    <br></br>
    <br></br>
    <a href="">特惠游：</a>
    <br></br>
    <a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp" target="rightFrame">购买特惠游功能</a>
    <a href="">支付系统功能</a>
    <br></br>
    <br></br>
    <a href="">购票：</a>
    <br></br>
    <a href="/wenq/getAllGoods.jsp" target="rightFrame">购买门票功能</a>
    <a href="/wenq/cart.jsp" target="rightFrame">购物车功能</a>
    <a href="/wenq/buyinfo.jsp" target="rightFrame">预购订单功能</a>
    <a href="">支付系统功能</a>
    <br></br>
    <br></br>
    <a href="">酒店预定：</a>
    <br></br>
    <a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp" target="rightFrame">预定酒店功能</a>
    <br></br>
    <br></br>
    <a href="">旅游论坛：</a>
    <br></br>
    <a href="/wenq/jsp/visitors/luntan/bankuai/addbankuai.jsp" target="rightFrame">论坛版块功能</a>
    <a href="/wenq/jsp/visitors/luntan/tiezi/addtiezi.jsp" target="rightFrame">发帖功能</a>
    <a href="/wenq/jsp/visitors/luntan/liuyan/addliuyan.jsp" target="rightFrame">论坛留言功能</a>
    <br></br>
    <br></br>
    <a href="">会员专区：</a>
    <br></br>
    <a href="/wenq/jsp/visitors/huiyuan/addGUser.jsp" target="rightFrame">会员注册</a>
    <a href="">定制个人喜好路线功能</a>
    <a href="/wenq/jsp/visitors/huiyuan/cuxiao/showtehuiyoucx.jsp" target="rightFrame">价格促销功能</a>
    <a href="/wenq/jsp/visitors/huiyuan/duihuan/showtehuiyoudh.jsp" target="rightFrame">积分兑换功能</a>
    <a href="/wenq/jsp/visitors/huiyuan/choujiang/test.jsp" target="rightFrame">转转乐功能</a>
   -->
  </body>
</html>
