<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
  	<style type="text/css">
  	.bt{
  	height:20px;
  	width:50px;
  	background-image:url(/wenq/images/admin/add/buttonbg.png);
  	font-size:14px; 
  	font-weight:bold; 
  	color:#fff;
  	cursor:pointer; 
  	}
  	</style>
  </head>
   <body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">修改论坛板块信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from ltbankuai where ltbkid='"+request.getParameter("ltbkid")+"'";
  session.setAttribute("ltbankuai", request.getParameter("ltbkid"));
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
    <form action="Modifybankuai" method="post"  name="form1" enctype="multipart/form-data">
      <table border="1" class="tablelist">
      
        <tr>
          <td height="40">论坛板块编号：</td>
          <td> <input name="ltbkid" type="text" value="<%=rs.getString(1)%>"></td>
        </tr>
        
        <tr>
          <td height="40">论坛板块名称：</td>
          <td> <input name="ltbkname" type="text" value="<%=rs.getString(2)%>"></td>
        </tr>
        <tr>
          <td height="40">论坛板块介绍：</td>
          <td> <textarea name="ltbkintro" cols=40 rows=4><%=rs.getString(3)%></textarea></td>
        </tr>
   <tr>  <td>论坛板块图片：</td>
          <td> <input name="ltbkimage" type="file" >   </td>
        </tr>     
	
        <tr>  <td colspan="2" align="center">
            <input type="submit" name="Submit" class="bt" value="修改">
            <input type="reset" name="Submit2" class="bt" value="重置">  </td> </tr>
      </table>
</form><br>
<% 
  }
  if(session.getAttribute("modify")!=null)
  {
  out.println(session.getAttribute("modify"));
  }
  %>
  </body>
</html>
