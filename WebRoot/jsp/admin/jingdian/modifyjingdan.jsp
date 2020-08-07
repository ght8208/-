<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <li><a href="#">修改景区信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from place where vid='"+request.getParameter("vid")+"'";
  session.setAttribute("vplace", request.getParameter("vid"));
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  
    <form action="ModifyplaceServlet" method="post"  name="form1" enctype="multipart/form-data">
      <table border="1" class="tablelist">
      
        <tr>
          <td height="40">景点编号：</td>
          <td> <input name="vid" type="text"  value="<%=rs.getString(1)%>"></td>
        </tr>
        
        <tr>
          <td height="40">景点名称：</td>
          <td> <input name="vname" type="text" value="<%=rs.getString(2)%>"></td>
        </tr>
        
        <tr>
          <td height="40">所处位置：</td>
          <td> <input name="vplace" type="text" value="<%=rs.getString(3)%>"></td>
        </tr>
        
        <tr>
          <td height="40">景点 人气：</td>
          <td> <input name="vfamous" type="text" value="<%=rs.getString(4)%>"></td>
        </tr>
        
        <tr>
          <td height="40">景点介绍：</td>
          <td> <textarea name="vintro" cols=40 rows=4  ><%=rs.getString(5)%></textarea></td>
        </tr>
   <tr>  <td>景点图片：</td>
          <td> <input name="vimage" type="file" >   </td>
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
