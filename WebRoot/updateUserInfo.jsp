<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'updateUserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body style="background-image: url('./images/userinfo1-bg.jpg');">
     <% 
  DB db = new DB();
  String sql ="select * from visitors where id="+request.getParameter("id");
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  <form name="form1" method="post" action="UpdateUserInfoServlet?id=<%=rs.getInt(1)%>">
  <div align="center"> 
  </div><table align="center">
  <h1 align="center">用户修改</h1>
  <tr>
  <td>用户名：</td>
  <td><input type="text" name="username" value="<%=rs.getString(2)%>"></td>
  </tr>
  <tr>
  <td>性别：</td>
  <td><input type="radio" name="sex" value="女" <%if(rs.getString(3).equals("女")) out.println("checked");%>>女
  <input type="radio" name="sex" value="男" <%if(rs.getString(3).equals("男")) out.println("checked");%>>男
  </td>
  </tr>
  <tr>
   <td>邮件：</td>
   <td><input type="text" name="email" value="<%=rs.getString(5)%>"></td>
   </tr>
   <tr>
  <td>电话号码：</td>
  <td><input type="text" name="phone" value="<%=rs.getString(6)%>"></td>
  </tr>
  <tr>
  <tr>
  <td>出生日期：</td>
  <td><input type="text" name="birthday" value="<%=rs.getString(7)%>"></td>
  </tr>
  <tr>
  <tr>
  <td><input type="submit" value="提交" ></td>
  <td><input type="reset" value="重置" ></td>
  </tr>
  </table>
  </form>
  <% 
  }
  %>	

  </body>
</html>
