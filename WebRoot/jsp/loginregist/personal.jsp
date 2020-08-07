<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'personal.jsp' starting page</title>

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
#personal {
	padding-left: 570px;
	padding-top: 10px;
}

	#bg{
		background-image: url('./images/personal-bg.jpg');
	}
	
	.img_1-1,.img_2-1,.img_3-1{
		width:25px;
		height:25px;
	}
	
	#item_1{
		margin-top: 30px;
		margin-left: -20px;
		color:green;
		font-size: 20px;
	}
	
	#item_2{
		margin-top: 30px;
		margin-left: -55px;
		color:red;
		font-size: 20px;
	}
	#item_3{
		margin-top: 40px;
		margin-left: -15px;
		color:purple;
		font-size: 20px;
	}
	#item_4{
		margin-top: 50px;
		margin-left: 15px;
		color:blue;
		font-size: 20px;
	}
	
		.butt_submit{
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		margin-left: 70px;
		background-image: url('./images/next.png');
	}
	
	.butt_regist{
	margin-left:-30px;
		width:210px;
		height: 25px;
		border: none;
		margin-top: 25px;
		background-image: url('./images/previous.png');
	}
</style>
<script type="text/javascript">
	function show(){
		document.getElementsByClassName("img_1-1")[0].src="./images/img_1-2.png";
		document.getElementsByClassName("img_point-1")[0].src="./images/img_point-2.png";
		document.getElementsByClassName("img_2-1")[0].src="./images/img_2-2.png";
	}
</script>
</head>

<body id="bg" onload="show()">

<%@include file="./top.jsp" %>
	<div id="personal" >
		<h2>您的个性化定制</h2>
	</div>
	<%out.print((String)session.getAttribute("username"));%>
	<form action="PersonalServlet" method="post">
	<input value=<%=session.getAttribute("username")%> name="username" type="hidden">
	
	<div id="item_1">
	<div id="interests" align="center">1.您有哪些兴趣爱好？</div>
	<div align="center">
	<input name="hobby" type="checkbox" value="滑雪" />滑雪
	<input name="hobby" type="checkbox" value="漂流" />漂流
	<input name="hobby" type="checkbox" value="游泳" />游泳
	<input name="hobby" type="checkbox" value="泡温泉" />泡温泉
	<input name="hobby" type="checkbox" value="爬山" />爬山
	<input name="hobby" type="checkbox" value="古典文化" />古典文化
	<input name="hobby" type="checkbox" value="享受美食" />享受美食
	<input name="hobby" type="checkbox" value="地质奇观" />地质奇观
	</div>
	</div>
	<div id="item_2">
	<div align="center">2.您最想去的景点</div>
	<div align="center">
	<select name="province" style="margin-left: 20px; width:76px;" id="selid" onchange="selectCity()">
								<option >选择省份</option>
						        <option value="浙江">浙江</option>
								<option value="四川">四川</option>
								<option value="湖南">湖南</option>
								<option value="云南">云南</option>
								<option value="海南">海南</option>
								<option value="江西">江西</option>
								<option value="贵州">贵州</option>
								<option value="广西">广西</option>
								<option value="江苏">江苏</option>
								<option value="西藏">西藏</option>
						</select>
						
						<select id="subselid" style="width:76px;" name="view">
							<option>选择景点</option>
						</select>
	</div>
	</div>
	<div id="item_3">
	<div id="characters" align="center">3.您的个性特征有哪些？</div>
	<div align="center">
	<input name="character" type="checkbox" value="豪放不羁" />豪放不羁
	<input name="character" type="checkbox" value="异想天开" />异想天开
	<input name="character" type="checkbox" value="追求刺激" />追求刺激
	<input name="character" type="checkbox" value="循规蹈矩" />循规蹈矩
	<input name="character" type="checkbox" value="内向害羞" />内向害羞<br>
	<input name="character" type="checkbox" value="外向开朗" />外向开朗
	<input name="character" type="checkbox" value="脾气暴躁" />脾气暴躁
	<input name="character" type="checkbox" value="多愁善感" />多愁善感
	</div>
	</div>
	<div id="item_4">
	<div id="topics" align="center">4.您喜欢的热门话题有哪些？</div>
	<div align="center">
	<input name="topic" type="checkbox" value="景区的门票价格问题" />景区的门票价格问题
	<input name="topic" type="checkbox" value="景区的堵塞问题" />景区的堵塞问题
	<input name="topic" type="checkbox" value="不文明出游问题" />不文明出游问题<br>
	<input name="topic" type="checkbox" value="酒店的各类问题" />酒店的各类问题
	<input name="topic" type="checkbox" value="旅游安全事故问题" />旅游安全事故问题
	<input name="topic" type="checkbox" value="导游的各类问题" />导游的各类问题
	</div>
	</div>
	<div align="center">
	<a href="jsp/loginregist/regist-1.jsp"><input type="button" value="" id="reg_id"class="butt_regist"></a>
	 <input type="submit" value=""id="sub_id" class="butt_submit">
	</div>
</form>
</body>
</html>
