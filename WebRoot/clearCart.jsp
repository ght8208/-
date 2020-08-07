<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'claerCart.jsp' starting page</title>
    
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
       <div id="div" style="width:1000px; height:1000px; border:1px solid #000;">
<div style="margin-top:82px;text-align: center;">
   <% 
      session.setAttribute("cart",null);
      //response.sendRedirect("cart.jsp");
     %>
     <p>购物车已清空</p>
     <a href="cart.jsp">返回</a>
     
     <%
    String content ="5;url=cart.jsp";
    response.setHeader("refresh",content);
     %>
        注意!!页面将在<div id='num' style='display=inline;'>5</div>秒后跳转
    </h2>
<!--     <a href="main.jsp">返回主页</a> -->
     </div>
     </div>
  </body>
</html>
