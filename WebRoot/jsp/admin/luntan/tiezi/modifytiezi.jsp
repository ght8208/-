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
    <li><a href="#">修改帖子信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from lttiezi where lttzid='"+request.getParameter("lttzid")+"'";
  String sql1 ="select * from ltbankuai where ltbkid in (select ltbkid from lttiezi1 where lttzid in( select lttzid from lttiezi where lttzid='"+request.getParameter("lttzid")+"'))";
  		
  session.setAttribute("lttiezi", request.getParameter("lttzid"));
  ResultSet rs = db.executeQuery(sql);
  ResultSet rs1 = db.executeQuery(sql1);
  if(rs.next())
  {
  %>
    <form action="Modifytiezi" method="post"  name="form1" enctype="multipart/form-data">
		<table border="1" class="tablelist">

			<tr>
				<td height="40">论坛帖子编号：</td>
				<td><input name="lttzid" type="text" value="<%=rs.getString(1)%>">
				</td>
			</tr>

			<tr>
				<td height="40">论坛帖子名称：</td>
				<td><input name="lttzname" type="text" value="<%=rs.getString(2)%>">
				</td>
			</tr>
			<tr>
				<td height="40">论坛帖子精品：</td>
				<td><input name="lttzjing" type="text" value="<%=rs.getString(3)%>">
				</td>
			</tr>
			<tr>
				<td height="40">论坛帖子介绍：</td>
				<td><textarea name="lttzintro" cols=40 rows=4><%=rs.getString(4)%></textarea>
				</td>
			</tr>
			<tr>
				<td>论坛帖子图片：</td>
				<td><input name="lttzimage" type="file"></td>
			</tr>
			 <% if(rs1.next())
  			{%>
			<tr>
				<td height="40">论坛所属板块：</td>
				<td>
				<input name="ltbkid" type="text" value="<%=rs1.getString(2)%>">
				<input name="ltbkid1" type="text" value="<%=rs1.getString(1)%>">
				</td>
			</tr>
			<% }%>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="Submit"  class="bt" value="修改"> <input type="reset"
					name="Submit2"  class="bt" value="重置"></td>
			</tr>
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
