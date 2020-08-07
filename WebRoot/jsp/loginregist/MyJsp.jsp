<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#login{
		background-image: url('./images/login-bg.jpg');
	}
	
	#form{
		margin-top: 50px;
		margin-left: 50px;
	}
	
		.butt_submit{
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		margin-left: 70px;
		background-image: url('./images/login.png');
		
	}
	
	.butt_regist{
	margin-left:-200px;
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		background-image: url('./images/regist.png');
	}
	
	#mid_mid_img{
		margin-top: 150px;
		margin-left: -100px;
	}
	.pull-right{
		top: 8px;
		position:relative;
	}
	h{
		font-size:12px;
		top: 5px;
		position:relative;
	}
	</style>
	
	<script type="text/javascript">
	function loadimage(){
          document.getElementById("randImage").src="<%=basePath%>jsp/loginregist/yanzhengma.jsp?"+Math.random();
      }
	</script>
	
  </head>
  
  <body id="login">
    	<div id="mid_mid_img" align="center"><img alt="正在加载中" src="./images/login_tag.png"></div>
    		<div id="mid_mid_load" align="center">
    			<form action="LoginServlet" method="post" name="login" id="">
    				<table id="form">
    					<tr> 
    						<td align="center">
    								<span class="load">用户名</span>
    							</td>
    							<!-- 服务器不接收没有name属性的input -->
    							<td align="left">
    								<input class="text_input" type="text" name="username" id="name">
    							</td>
    						</tr>
    						<tr> 
    							<td align="center">
    								<span class="load">密&nbsp;码</span>
    							</td>
    							<!-- 服务器不接收没有name属性的input -->
    							<td align="left">
    								<input class="text_input" type="password" name="userpass" id="pwd">
    							</td>
    						</tr>
							<!--验证码行 -->
    						<tr>
    						<td>验证码：</td>
    						<td>
    						<input class="text_input" type="text" name="yanzheng" id="yanzheng" onblur="">
    						<img class="pull-right" name="randImage"  id="randImage" src="/wenq/jsp/loginregist/yanzhengma.jsp" border="1" onclick="loadimage()"/>
   							<h> 看不清？点击图片</h>
    						</td>
    						</tr>
    						<tr>
    							<td></td>
    							<td align="left">
    							<a href="jsp/loginregist/regist-1.jsp"><input type="button" value="" id="reg_id"
							class="butt_regist"> </a>
							<input type="submit" value=""
							id="sub_id" class="butt_submit"></td>
    						</tr>
    						
    					</table>
    				</form>
    				</div>
    				
  </body>
</html>
