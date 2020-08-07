<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'showUserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-image: url('./images/UserInfo-bg.jpg');">
    <%
    if(session.getAttribute("username")!=null)
    {
    	DB db = new DB();
    	String sql ="select * from visitors where username='"+session.getAttribute("username")+"'";
    	ResultSet rs = db.executeQuery(sql);
    	int i =1;
    	while(rs.next())
    	{
    		String modifyurl = "updateUserInfo.jsp?id="+rs.getInt(1);
    %>
    <table>
    <tr>
    <td width="200px">序号</td>
    <td width="200px">用户名</td>
    <td width="200px">性别</td>
    <td width="200px">邮件</td>
    <td width="200px">电话号码</td>
    <td width="200px">出生日期</td>
    <td width="200px">操作</td>
    </tr>
    <tr>
    <td><%=i%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td>
    <td>
    	<a href="<%=modifyurl%>">修改</a>
    </td>
    </tr>
    </table>
 <%
    		i++;
    		 
 
    	}
    	if(session.getAttribute("msg")!=null){
    		out.println(session.getAttribute("msg"));
    		session.setAttribute("msg",null);
    		
    	}
    }
%>   
<%
	if(session.getAttribute("username")==null)
	{
%>
  		用户未登录
  		<a href="main.jsp">请重新输入</a>
<%
	}
%>

<a href="javascript:history.back(-1)">返回上一页</a><br>	
<a href="main.jsp">返回主页</a><br>
  </body>
</html>
