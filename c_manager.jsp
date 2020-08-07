<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_manager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <body style="background:url('images/2.jpg') no-repeat;">
      <div id="div" style="width:100%; height:100%; border:1px solid #000;">
<div style="margin-top:82px;text-align: center;">
  <p>门票添加成功</p>
    <a href="c_add.jsp">继续添加</a><br>
    <a href="GetAllGoodsServlet">显示门票</a><br>
    <a href="userinfo.jsp">返回主页</a>
    </div>
    </div>
  </body>
</html>
