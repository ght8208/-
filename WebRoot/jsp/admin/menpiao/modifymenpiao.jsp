<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUserInfo.jsp' starting page</title>
    
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
	<!-- <style type="text/css">
		.file {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 20px;
		}
		.file input {
		    position: absolute;
		    font-size: 100px;
		    right: 0;
		    top: 0;
		    opacity: 0;
		}
		.file:hover {
		    background: #AADFFD;
		    border-color: #78C3F3;
		    color: #004974;
		    text-decoration: none;
		}
	</style> -->

  </head>
  
  <body>

	<div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">�޸���Ʊ��Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
     <% 
  DB db = new DB();
  String sql ="select * from goods where id="+request.getParameter("id").toString();
  String id=request.getParameter("id").toString();
  session.setAttribute("id", id);
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  <form name="form1" method="post" enctype="multipart/form-data"  action="UpdateGoodsInfo?id=<%=rs.getInt(1)%>">
  <div align="center"> 
  </div>
  <table align="center" class="tablelist">
  <tr>
  <td>��Ʒ��ţ�</td>
  <td><input type="text" name="id" value="<%=rs.getString(1)%>" readonly="readonly"></td>
  </tr>
  <tr>
  <td>��Ʒ���ƣ�</td>
  <td><input type="text" name="name" value="<%=rs.getString(2)%>"></td>
  </tr>
 <tr>
   <td>��Ʒ������</td>
   <td><input type="text" name="number" value="<%=rs.getString(3)%>"></td>
   </tr>
<tr>
  <td>��Ʒ�۸�</td>
  <td><input type="text" name="price" value="<%=rs.getString(4)%>"></td>
  </tr> 
  <tr>
  <td>��Ʒ���ܣ�</td>
  <td>
  <textarea name="cintro" cols=40 rows=4><%=rs.getString(5)%></textarea>
  </td>
  </tr>
  <tr>
  <td>��ƷͼƬ��</td>
  <td> 
  
  <input name="image" type="file"  > 

  </td>
  </tr>
  
  <tr>
  <td><input type="submit" class="bt" value="�޸�">
  <input type="reset" class="bt" value="����"></td>
  </tr>
  </table>
  </form>
  <% 
  }
  %>	
  </body>
</html>
