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
    
    <title>������Ʒ��Ϣ</title>
    
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
     //����ÿ����ҳ��ʾ���ʼ�¼(ÿҳ��ʾ�ļ�¼��)
     int PageSize=3;
     
     //��������ʾ��ҳ��(��ʼҳ)
     int ShowPage=1;
     
     //ResultSet�ļ�¼����(�ܼ�¼��)
     int RowCount=0;
     
     //ResultSet��ҳ�������(��ҳ��)
     int PageCount=0;
     

  %>
  <%
  	DB db = new DB();
  	String sql = "select * from ltliuyan";
  	try {
  		ResultSet rs = db.executeQuery(sql);
  		//��ָ���������һ����¼
  		rs.last();

  		//��ȡ��¼����

  		RowCount = rs.getRow();

  		//������ʾ��ҳ��(�ؼ�)
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
