<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletestudent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="styleg.css" >
  </head>
  
  <body>
   <%
   DB db=new DB();
String sql="delete from lttiezi where lttzid="+request.getParameter("lttzid") ;
boolean i=db.executeUpdate(sql);
if(i){
	 
	sql="delete from lttiezi1 where lttzid="+request.getParameter("lttzid") ;
	db.executeUpdate(sql);
	/*
	sql="delete from sc where cid="+request.getParameter("cid") ;
	db.executeUpdate(sql);
	sql="delete from shoucang where cid="+request.getParameter("cid") ;
	db.executeUpdate(sql);
	//����ɾ�� 
	*/
	session.setAttribute("deletetiezi", "ɾ���ɹ���");
}else{
	session.setAttribute("deletetiezi", "ɾ��ʧ�ܣ�");
}

if(session.getAttribute("deletetiezi")!=null)
    {
    
    //out.println(session.getAttribute("deleteuser"));
    session.setAttribute("deletetiezi",null);
    
    String content="5;url=/wenq/jsp/admin/luntan/tiezi/showtiezi.jsp";
    response.setHeader("refresh",content);
    out.println("����5����ת�������");
    //response.sendRedirect("index.jsp");
    }


%>
  </body>
</html>
