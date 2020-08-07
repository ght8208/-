<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_add.jsp' starting page</title>
    
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
	
  </head>
   <body >
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">旅游论坛</a></li>
    <li><a href="#">旅游帖子</a></li>
    </ul>
    </div>
   <div class="formbody">
  <div class="formtitle"><span>论坛帖子添加</span></div>
    <form action="Addluntantz" method="post"  name="form1" enctype="multipart/form-data">
		<ul class="forminfo">

			<li>
				<td height="40">论坛帖子编号：</td>
				<td><input name="lttzid" type="text" class="dfinput">
				</td> 
			</li>

			<li>
				<td height="40">论坛帖子名称：</td>
				<td><input name="lttzname" type="text" class="dfinput">
				</td>
			</li>
			<li>
				<td height="40">论坛帖子精品：</td>
				<td><input name="lttzjing" type="text" class="dfinput">
				</td>
			</li>
			<li>
				<td height="40">论坛帖子介绍：</td>
				<td><textarea name="lttzintro" cols=40 rows=4 class="textinput"></textarea>
				</td>
			</li>
			<li>
				<td>论坛帖子图片：</td>
				<td><input name="lttzimage" type="file"></td>
			</li>
			<li>
				<td height="40">论坛所属板块：</td>
				<td><input name="ltbkid" type="text" class="dfinput">
				</td>
			</li>

			<li>
				<td colspan="2" align="center"><input type="submit"
					name="Submit" value="提交" class="tejiao"> <input type="reset"
					name="Submit2" value="重置" class="tejiao"></td>
			</li>
		</ul>
	</form><br>

  </body>
</html>
