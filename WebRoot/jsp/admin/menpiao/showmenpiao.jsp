<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<base href="<%=basePath%>">
    
    <title>������Ʒ��Ϣ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
	<style type="text/css">
	.tupian{
	  height:100px;
	  width:200px;
	}
	</style>

  </head>
  
  <body>
  <div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">��Ʊ��Ϣ</a></li>
    <li><a href="#">��������</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    
        
        
        <ul class="toolbar1">
        <li><span><img src="/wenq/images/admin/showmd/t05.png" /></span>����</li>
        </ul>
    
    </div>
  <%
  DB db = new DB();
  String sql ="select * from goods";
  try{
  ResultSet rs = db.executeQuery(sql);
  %>
  <table border="1" class="tablelist">
  <thead>
  <tr>
  <th>��Ʒ���<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
  <th>��Ʒ����</th>
  <th>��Ʒ����</th>
  <th>��Ʒ�۸�</th>
  <th>ͼƬ</th>
  </thead>
  <tbody>
  </tr>
	  <%
	  while(rs.next())
	  {  
	
	  %>

    <tr>
	   	<td><%=rs.getString(1)%></td>
	    <td><%=rs.getString(2)%></td>
	    <td><%=rs.getString(3)%></td>
	    <td><%=rs.getString(4)%></td>
	    <td>
	    <img src="<%=rs.getString(6)%>" class="tupian">
	    </td>

   </tr>
   <%}%>
   </tbody>
   </table>
   <% 
        }
        catch(SQLException se)
        {
         throw new ServletException(se);
        
        }
        finally
        {
          db.close();
        }
     %>
  
</div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
