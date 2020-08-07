<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<%-- <base href="<%=basePath%>"> --%>
    
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
   <%!
     //设置每张网页显示三笔记录(每页显示的记录数)
     int PageSize=3;
     
     //设置欲显示的页数(初始页)
     int ShowPage=1;
     
     //ResultSet的记录笔数(总记录数)
     int RowCount=0;
     
     //ResultSet分页后的总数(总页数)
     int PageCount=0;
     

  %>
  <%
  	DB db = new DB();
  	String sql = "select * from ltliuyan";
  	try {
  		ResultSet rs = db.executeQuery(sql);
  		//将指标移至最后一条记录
  		rs.last();

  		//获取记录总数

  		RowCount = rs.getRow();

  		//计算显示的页数(关键)
  		PageCount = ((RowCount % PageSize) == 0 ? (RowCount / PageSize)
  				: (RowCount / PageSize) + 1);
  		//System.out.println(PageCount);
  	} catch (SQLException se) {
  		throw new ServletException(se);

  	} finally {
  		db.close();
  	}
  %>
  
  
  
  </body>
</html>
