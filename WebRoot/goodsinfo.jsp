<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>所有物品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="main.css">
	

  </head>
  
  <body>
  <body>
   <h1>显示门票信息</h1><hr/>
     <%
  if(session.getAttribute("msg")!=null)
  {
  out.println(session.getAttribute("msg"));
  }
   %>
    <%
  DB db = new DB();
  String sql ="select * from goods";
  ResultSet rs = db.executeQuery(sql);
  %>
  <table border="1">
  <tr><td>物品编号</td><td>物品名称</td><td>物品数量</td><td>物品价格</td><td>图片</td><td>操作</td></tr>
  <%
 while(rs.next())
{  String modifyurl="updateGoodsInfo.jsp?id="+rs.getString(1);
%>
     
  
  
  <tr>
   	<td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><img src="<%=rs.getString(6)%>" /></td>
	<td><a href="<%=modifyurl%>">修改商品</a></td>
	
	
</tr>
 <%}%>
  </table>
  <div id="back">
  <c:if test="${pageNo==1}">
  	第一页 上一页
  </c:if>
  <c:if test="${pageNo!=1}">
  	<a href="getallgoods?pageNo=1">第一页</a> <a href="getallgoods?pageNo=${pageNo-1}">上一页</a>
  </c:if>
  <c:if test="${pageNo==pageCount}">
  	下一页 最后一页
  </c:if>
  <c:if test="${pageNo!=pageCount}">
  	<a href="getallgoods?pageNo=${pageNo+1}">下一页</a> <a href="getallgoods?pageNo=${pageCount}">最后一页</a>
  </c:if>
  <form action="getallgoods">
  	跳转到<input type="text" name="pageNo" />页<input type="submit" value="跳转" />
  </form>
  
 
  <a href="javascript:history.back(-1)">返回上一页</a>
  </div>
  
  </body>
</html>
