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
    
    <title>My JSP 'showUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  </head>
  
  <body>
  <div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">��Ա�û���Ϣ</a></li>
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
    if(session.getAttribute("username")!=null)
    {
    	DB db = new DB();
    	String sql ="select * from visitors";
    	ResultSet rs = db.executeQuery(sql);
    	int i =1;
    %>
   <table border="2" class="tablelist">
   <thead>
    <tr>
    <th >���<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
    <th >�û���</th>
    <th >�Ա�</th>
    <th >�ʼ�</th>
    <th >��������</th>
    <th >����</th>
    <th >��Ա�ʸ�</th>
    <!-- <th >����</th> -->
    </tr>
   </thead>
   <tbody>
    <%
    	while(rs.next())
    	{
    		String modifyurl = "modifyUser.jsp?id="+rs.getInt(1);
    		String deleteurl = "deleteUser.jsp?id="+rs.getInt(1);
    %>
  
    <tr>
    <td><%=i%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(13)%></td>
    <%-- <td>
    	<a href="<%=modifyurl%>">�޸�</a>
    	<a href="<%=deleteurl%>">ɾ��</a>
    </td> --%>
   
 <%
    		i++;
    		 
 
    	}
    	%>
    	 </tr>
    	 </tbody>
    </table>
    <% 
    	if(session.getAttribute("msg")!=null){
    		out.println(session.getAttribute("msg"));
    		session.setAttribute("msg",null);
    		
    	}
    }
%>   
<%
	if(session.getAttribute("username")==null)
	{
%>
  		�û�δ��¼
  		<a href="index.jsp">����������</a>
<%
	}
%>

</div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
