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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/visit/style.css">
	
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
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
  <body>
  <%-- <% 
  //System.out.println(1);
  String a=session.getAttribute("uid").toString();
  System.out.println(a);
   %> --%>
  <% 
   if(session.getAttribute("uid")!=null)
   {
		  DB db = new DB();
		  int id=Integer.parseInt(session.getAttribute("uid").toString());
		  String sql ="select * from visitors where id="+id;
		  ResultSet rs = db.executeQuery(sql);
		  if(rs.next())
		  {
  %>
  <form name="form1" method="post" action="ModifyGUserServlet?id=<%=rs.getInt(1)%>">
  <div align="center"> 
  </div><table align="center" class="tablelist">
  <h1 align="center">用户修改</h1>
  <tr>
  <td>用户名：</td>
  <td><input type="text" name="username" value="<%=rs.getString(2)%>"></td>
  </tr>
  <tr>
  <td>性别：</td>
  <td><input type="radio" name="usersex" value="女" <%if(rs.getString(3).equals("女")) out.println("checked");%>>女
  <input type="radio" name="usersex" value="男" <%if(rs.getString(3).equals("男")) out.println("checked");%>>男
  </td>
  </tr>
  <tr>
      <td>密码：</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value="<%=rs.getString(4) %>" /></td>
    </tr>
  <tr>
   <td>邮件：</td>
   <td><input type="text" name="useremail" value="<%=rs.getString(5)%>"></td>
   </tr>
   <tr>
  <td>电话号码：</td>
  <td><input type="text" name="userphone" value="<%=rs.getString(6)%>"></td>
  </tr>
  <tr>
  <td>出生日期：</td>
  <td>
  <input type="text" name="userbirthday" value="<%=rs.getString(7)%>">
  </td>
  </tr>
  
  <tr>
      <td>籍贯：</td>
      <td><label>
        <select name="userprovin" id="userprovin">
          <option value="浙江" <%if(rs.getString(9).equals("浙江"))out.println("selected"); %>>浙江</option>
          <option value="江苏" <%if(rs.getString(9).equals("江苏"))out.println("selected"); %>>江苏</option>
          <option value="山东"<%if(rs.getString(9).equals("山东"))out.println("selected"); %>>山东</option>
          <option value="北京"<%if(rs.getString(9).equals("北京"))out.println("selected"); %>>北京</option>
          <option value="上海"<%if(rs.getString(9).equals("上海"))out.println("selected"); %>>上海</option>
          <option value="天津"<%if(rs.getString(9).equals("天津"))out.println("selected"); %>>天津</option>
        </select>
      </label></td>
    </tr>
  
  <tr>
  <td>会员资格：</td>
  <td><label>
        <select name="userhuiyuan" id="userhuiyuan">
          <option value="0" >再想想</option>
          <option value="1" selected>想成为会员</option>
          </select>
      </label></td>
  </tr>
  
  <tr>
  <td><input type="submit" value="提交" class="bt">
  <input type="reset" value="重置" class="bt"></td>
  </tr>
  </table>
  </form>
  
  <% 
		  }
  }
  else
  {%>
  	<a href="/wenq/main.jsp">请先登录</a>
  	<a href="/wenq/main.jsp">返回主页</a>
  <% 
  }
  %>	
  
  
    
  </body>
</html>
