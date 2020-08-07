<%@ page language="java" import="java.util.*"contentType="text/html;charset=UTF-8"  pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./js/regist.js" charset="utf-8"></script>
	<style type="text/css">
	#top{
		height:100px;
	}
	
	.load{
		padding-left: 20px;
	}
	
	.tip{
		
	}
	
	.text_input{
		margin-left: 20px;
		color:grey;
	}
	
	#regist{
		margin-left:540px;
		padding-top: 50px;
		margin-bottom: 20px;
	}
	
	.butt_submit{
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		margin-left: 70px;
		background-image: url('./images/regist.png');
	}
	
	.butt_regist{
	margin-left:-200px;
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		background-image: url('./images/login.png');
	}
	
	#bg{
		background-image: url('./images/regist-bg.jpg');
	}
	
	.img_1-1,.img_2-1,.img_3-1{
		width:25px;
		height:25px;
	}
	
	#weizhi{
		margin-left: 100px;
	}
	
	</style>
	<script type="text/javascript">
	function show(){
		document.getElementsByClassName("img_1-1")[0].src="./images/img_1-2.png";
		
	}
</script>
</head>

<body id="bg" onload="show()">
<%@include file="./top.jsp" %>
	<div id="regist">
		<img alt="正在努力加载中" src="./images/regist_tag.png">
	</div>
			<form action="RegServlet" method="post" id="weizhi" name="userinfo" onsubmit="return checkForm()">
				<table align="center" >
					<tr class="tip">
						<td><img alt="正在努力加载中" src="./images/user.png"></td>
						<td ><span class="load">用&nbsp;&nbsp;户</span></td>
						<td ><input type="text" name="username" size="21" value="用户名为1-7位的中文"
							class="text_input" id="loginname" onblur="checkName()" onfocus="destroyName()"><span style="color:red">*</span><span id="user_msg"></span>
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/sex.png"></td>
						<td ><span class="load">性&nbsp;&nbsp;别</span></td>
						<td style="padding-left: 20px"><input type="radio" name="sex" value="男" checked="checked">男 <input
							type="radio" name="sex" value="女">女
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/pwd.png"></td>
						<td ><span class="load">密&nbsp;&nbsp;码</span></td>
						<td ><input type="password" name="userpass" size="21" value="12345678"
							class="text_input" id="pwd" onblur="checkPwd()" onfocus="destroyPwd()"><span style="color:red">*</span><span id="pwd_msg"></span>
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/pwd1.png"></td>
						<td ><span class="load">确认密码</span></td>
						<td ><input type="password" name="userpass1" size="21" value=""
							class="text_input" id="pwd1" onblur="checkPwd1()"><span style="color:red">*</span> <span id="pwd1_msg"></span>
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/email.png"></td>
						<td ><span class="load">邮&nbsp;&nbsp;箱</span></td>
						<td ><input type="text" name="email" size="21" value="例如：26357878@126.com"
							class="text_input" id="email" onblur="checkEmail()" onfocus="destroyEmail()"> <span id="email_msg"></span>
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/phone.png"></td>
						<td ><span class="load">电话号码</span></td>
						<td ><input type="text" name="phone" size="21" value="例如：13684139863"
							class="text_input" id="telephone" onblur="checkPhone()" onfocus="destroyPhone()"> <span id="tel_msg"></span>
						</td>
					</tr>
					<tr>
						<td><img alt="正在努力加载中" src="./images/birthday.png"></td>
						<td ><span class="load">出生日期</span></td>
						<td ><input type="text" name="birthday" size="21" value="例如：1991-01-01"
							class="text_input" id="birthday" onblur="checkBir()" onfocus="destroyBir()"> <span id="bir_msg"></span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td align="left"><input type="button" value="" id="reg_id"
							class="butt_regist"> <input type="submit" value=""
							id="sub_id" class="butt_submit"></td>
					</tr>
				</table>
			</form>
</body>

</html>
