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
    <li><a href="#">�޸���̳������Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from ltliuyan where ltlyid='"+request.getParameter("ltlyid")+"'";
  String sql1 ="select * from lttiezi where lttzid in (select lttzid from ltliuyan1 where ltlyid in (select ltlyid from ltliuyan where ltlyid='"+request.getParameter("ltlyid")+"'))";
  String sql2 ="select * from ltbankuai where ltbkid in (select ltbkid from ltliuyan1 where ltlyid in (select ltlyid from ltliuyan where ltlyid='"+request.getParameter("ltlyid")+"'))";
  	
  session.setAttribute("ltliuyan", request.getParameter("ltlyid"));
  ResultSet rs = db.executeQuery(sql);
  ResultSet rs1 = db.executeQuery(sql1);
  ResultSet rs2 = db.executeQuery(sql2);
  if(rs.next())
  {
  %>
    <form action="Modifyliuyan" method="post"  name="form1" enctype="multipart/form-data">
		<table border="1"  class="tablelist">

			<tr>
				<td height="40">��̳���Ա�ţ�</td>
				<td><input name="ltlyid" type="text" value="<%=rs.getString(1)%>">
				</td>
			</tr>

			<tr>
				<td height="40">��̳�������ƣ�</td>
				<td><input name="ltlyname" type="text" value="<%=rs.getString(2)%>">
				</td>
			</tr>

			<tr>
				<td height="40">��̳���Խ��ܣ�</td>
				<td><textarea name="ltlyintro" cols=40 rows=4><%=rs.getString(3)%></textarea>
				</td>
			</tr>
			<tr>
				<td height="40">��̳����֧�֣�</td>
				<td><input name="ltlyzhichi" type="text" value="<%=rs.getString(4)%>">
				</td>
			</tr>
			<tr>
				<td height="40">��̳���Է��ԣ�</td>
				<td><input name="ltlyfandui" type="text" value="<%=rs.getString(5)%>">
				</td>
			</tr>
			<tr>
				<td>��̳����ͼƬ��</td>
				<td><input name="ltlyimage" type="file"></td>
			</tr>
			<% if(rs2.next())
  			{%>
			<tr>
				<td height="40">��̳������飺</td>
				<td>
				<input name="ltbkid" type="text" value="<%=rs2.getString(2)%>">
				<input name="ltbkid1" type="text" value="<%=rs2.getString(1)%>">
				</td>
			</tr>
			<% }
			if(rs1.next())
  			{%>
			<tr>
				<td height="40">��̳�������ӣ�</td>
				<td>
				<input name="lttzid" type="text" value="<%=rs1.getString(2)%>">
				<input name="lttzid1" type="text" value="<%=rs1.getString(1)%>">
				</td>
			</tr>
			<% }%>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="Submit" class="bt" value="�޸�"> <input type="reset"
					name="Submit2" class="bt" value="����"></td>
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
