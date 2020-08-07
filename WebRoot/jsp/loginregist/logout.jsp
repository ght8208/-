<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logout.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
 var i = 5;
    function getTime() {
        document.getElementById('num').innerHTML = "<font color='red'>" + i
                + "</font>";
        i -= 1;
        var x = setTimeout('getTime()', 1000)
        if (i <= 0) {
            clearTimeout(x);
        }
    }
    window.onload = getTime;
</script>
  </head>
  
  <body onload="show()">
         <div id="div">
<div style="margin-top:82px;text-align: center;">
     <% 
      session.setAttribute("username",null);
      //response.sendRedirect("index.jsp");
     %>
    <p> 用户已注销</p>
     <h2>

    <%
    String content ="5;url=/wenq/main.jsp";
    response.setHeader("refresh",content);
     %>
        注意!!页面将在<div id='num' style='display=inline;'>5</div>秒后跳转
    </h2>
<!--     <a href="main.jsp">返回主页</a> -->
    </div>
    </div>
  </body>
</html>
