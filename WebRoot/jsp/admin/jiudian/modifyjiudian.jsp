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
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">�޸ľƵ���Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from jiudian where jid='"+request.getParameter("jid")+"'";
  session.setAttribute("jiudian", request.getParameter("jid"));
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
    <form action="Modifyjiudian" method="post"  name="form1" enctype="multipart/form-data">
      <table border="1" class="tablelist">
      
        <tr>
          <td height="40">�Ƶ��ţ�</td>
          <td> <input name="jid" type="text" value="<%=rs.getString(1)%>"></td>
        </tr>
        
        <tr>
          <td height="40">�Ƶ����ƣ�</td>
          <td> <input name="jname" type="text" value="<%=rs.getString(2)%>"></td>
        </tr>
        
        <tr>
          <td height="40">�Ƶ�����λ�ã�</td>
          <td> <input name="jplace" type="text" value="<%=rs.getString(3)%>"></td>
        </tr>
        
        <tr>
          <td height="40">�Ƶ����֣�</td>
          <td> <input name="jpingfen" type="text" value="<%=rs.getString(4)%>"></td>
        </tr>
        
        <tr>
          <td height="40">�Ƶ���ܣ�</td>
          <td> <textarea name="jintro" cols=40 rows=4><%=rs.getString(5)%></textarea></td>
        </tr>
        <tr>
          <td height="40">�Ƶ�۸�</td>
          <td> <input name="jprice" type="text" value="<%=rs.getString(6)%>"></td>
        </tr>
		<tr>
			<td>�Ƶ�ͼƬ��</td>
			<td><input name="jimage" type="file"></td>
		</tr>
		<tr>
			<td height="40">�Ƶ���룺</td>
			<td><input name="jkm" type="text" value="<%=rs.getString(8)%>">
			</td>
		</tr>
		<tr>  <td colspan="2" align="center">
           <input type="submit" name="Submit" class="bt" value="�޸�">
           <input type="reset" name="Submit2" class="bt" value="����">  </td> 
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
