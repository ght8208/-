<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'finish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#bg{
		background-image: url('./images/finish-bg.jpg');
	}
	
	#finish{
		margin-top: 150px;
		margin-left: 550px;
	}
	
	#tiaozhuan{
		margin-left: 550px;
		color: red;
	}
	</style>
	<script type="text/javascript">
	function show(){
		document.getElementsByClassName("img_1-1")[0].src="./images/img_1-2.png";
		document.getElementsByClassName("img_point-1")[0].src="./images/img_point-2.png";
		document.getElementsByClassName("img_point-1")[1].src="./images/img_point-2.png";
		document.getElementsByClassName("img_2-1")[0].src="./images/img_2-2.png";
		document.getElementsByClassName("img_3-1")[0].src="./images/img_3-2.png";
	}
	
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
  
  <body id="bg" onload="show()">
    <%@include file="./top.jsp" %>
    <div id="finish"><img alt="正在努力加载中" src="./images/finish.png"></div>
    <div id="tiaozhuan">
    <h2>
    <% 
     	if((String)session.getAttribute("msg")!=null)
       out.println((String)session.getAttribute("msg"));
    %>
    <%
    String content ="5;url=/wenq/main.jsp";
    response.setHeader("refresh",content);
     %>
        注意!!页面将在<div id='num' style='display=inline;'>5</div>秒后跳转
    </h2>
    </div>
  </body>
</html>
