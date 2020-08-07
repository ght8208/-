<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMyOrder.jsp' starting page</title>
    
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
  
    <%
      if(session.getAttribute("username")!=null)
      {
         DB db=new DB();
         String sql="select * from ordertable where username='"+session.getAttribute("username")+"'";
         try{
            ResultSet rs=db.executeQuery(sql);
            %>
            <table align="center" bgColor="#ffffff" border="0">
               <tr><td>商品编号</td><td>购买人</td><td>购买日期</td><td>商家地址</td><td>付款方式</td></tr>
               <%
                 int i=1;
                 while(rs.next())
                 {
                 
                   %>
                   <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(9)%></td>
                  
                   </tr>
                   
                   <% i++;
                  
                 } 
               %>
            
            
            
            </table>
         <%
          }
         catch(Exception se)
         {
           throw new ServletException(se);
         }
         finally
         {
           db.close();
         }
      }
      else
      {
         %>
          <p align="center">您未登录，请<a href="index.jsp">登录</a>！</p>
         <%
      }
     %>
     <a href="main.jsp" >返回主页</a>
  </body>
</html>
