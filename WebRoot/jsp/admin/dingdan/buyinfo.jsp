<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
    
    <title>������Ϣ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
    <li><a href="#">�޸Ķ�����Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
   
    <% 
  DB db = new DB();
  String sql ="select * from ordertable where orderid='"+request.getParameter("orderid")+"'";
  session.setAttribute("order", request.getParameter("orderid"));
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  
  
  <form action="Modifyordertable" name="form1" method="post">
    <table  border="1" class="tablelist">
	    <tr>
	    <td>�ջ��ˣ�</td>
	    <td><input name="receivename" type="text"  class="ipt-t" id="receivename" value="<%=rs.getString(6)%>"/></td>
	    </tr>
	    <tr>
	       <td>��ϵ�绰��</td>
	    <td><input name="tele" type="text" class="ipt-t" id="tele" value="<%=rs.getString(7)%>"/></td>
	    </tr>
	    <tr>
	   <td>�ջ���ַ��</td>
	    <td><input name="address" type="text" class="ipt-t" id="address" value="<%=rs.getString(5)%>"/></td>
	    </tr>
	    <tr>
	     <td>�ʱࣺ</td>
	    <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" value="<%=rs.getString(8)%>"/></td>
	    </tr>
	    <tr>
	    <td>���ʽ��</td>
	    <td>
	    <label>
	    <select name="paymode" >
	     <option value="�������� "<%if(rs.getString(9).equals("��������"))out.println("selected"); %>>��������</option>
	     <option value="΢��֧�� "<%if(rs.getString(9).equals("΢��֧�� "))out.println("selected"); %>>΢��֧��</option>
	     <option value="֧����֧�� "<%if(rs.getString(9).equals("֧����֧��"))out.println("selected"); %>>֧����֧��</option>
	     <option value="QQ֧��"<%if(rs.getString(9).equals("QQ֧��"))out.println("selected"); %>>QQ֧��</option>
	      <option value="���п�֧��"<%if(rs.getString(9).equals("���п�֧��"))out.println("selected"); %>>���п�֧��</option>
	     
	    </select>
	    
	    </label></td>
	    </tr>
	   <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" class="bt" value="�޸�" onclick="javascript:validate(form1)" />
        <input name="reset" type="reset" id="reset" class="bt" value="����" />
      </label></td>
      </tr>
    </table>
  </form>
    
    
  <% 
  }
  if(session.getAttribute("modify")!=null)
  {
  out.println(session.getAttribute("modify"));
  }
  %>	
  </body>
</html>
