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
    
    <title>My JSP 'modifyUser.jsp' starting page</title>
    
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
    <li><a href="#">�޸��û���Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
  <% 
  DB db = new DB();
  String sql ="select * from visitors where id="+request.getParameter("id");
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  <form name="form1" method="post" action="ModifyUserServlet?id=<%=rs.getInt(1)%>">
  <div align="center"> 
  </div>
  <table align="center" class="tablelist">
  <tr>
  <td>�û�����</td>
  <td><input type="text" name="username" value="<%=rs.getString(2)%>"></td>
  </tr>
  <tr>
  <td>�Ա�</td>
  <td><input type="radio" name="usersex" value="Ů" <%if(rs.getString(3).equals("Ů")) out.println("checked");%>>Ů
  <input type="radio" name="usersex" value="��" <%if(rs.getString(3).equals("��")) out.println("checked");%>>��
  </td>
  </tr>
  <tr>
      <td>���룺</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value="<%=rs.getString(4) %>" /></td>
    </tr>
  <tr>
   <td>�ʼ���</td>
   <td><input type="text" name="useremail" value="<%=rs.getString(5)%>"></td>
   </tr>
   <tr>
  <td>�绰���룺</td>
  <td><input type="text" name="userphone" value="<%=rs.getString(6)%>"></td>
  </tr>
  <tr>
  <td>�������ڣ�</td>
  <td>
  <input type="text" name="userbirthday" value="<%=rs.getString(7)%>">
  </td>
  </tr>
  
  <tr>
      <td>���᣺</td>
      <td><label>
        <select name="userprovin" id="userprovin">
          <option value="�㽭" <%if(rs.getString(9).equals("�㽭"))out.println("selected"); %>>�㽭</option>
          <option value="����" <%if(rs.getString(9).equals("����"))out.println("selected"); %>>����</option>
          <option value="ɽ��"<%if(rs.getString(9).equals("ɽ��"))out.println("selected"); %>>ɽ��</option>
          <option value="����"<%if(rs.getString(9).equals("����"))out.println("selected"); %>>����</option>
          <option value="�Ϻ�"<%if(rs.getString(9).equals("�Ϻ�"))out.println("selected"); %>>�Ϻ�</option>
          <option value="���"<%if(rs.getString(9).equals("���"))out.println("selected"); %>>���</option>
        </select>
      </label></td>
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
