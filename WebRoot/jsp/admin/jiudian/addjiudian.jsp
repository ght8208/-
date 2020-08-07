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
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加酒店信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="Addjiudian" method="post"  name="form1" enctype="multipart/form-data">
      <table border="1"  class="tablelist">
      
        <tr>
          <td height="40">酒店编号：</td>
          <td> <input name="jid" type="text" ></td>
        </tr>
        
        <tr>
          <td height="40">酒店名称：</td>
          <td> <input name="jname" type="text"></td>
        </tr>
        
        <tr>
          <td height="40">酒店所处位置：</td>
          <td> <input name="jplace" type="text"></td>
        </tr>
        
        <tr>
          <td height="40">酒店评分：</td>
          <td> <input name="jpingfen" type="text"></td>
        </tr>
        
        <tr>
          <td height="40">酒店介绍：</td>
          <td> <textarea name="jintro" cols=40 rows=4></textarea></td>
        </tr>
        <tr>
          <td height="40">酒店价格：</td>
          <td> <input name="jprice" type="text"></td>
        </tr>
		<tr>
			<td>酒店图片：</td>
			<td><input name="jimage" type="file"></td>
		</tr>
		<tr>
			<td height="40">酒店距离：</td>
			<td><input name="jkm" type="text">
			</td>
		</tr>
		<tr>  <td colspan="2" align="center">
           <input type="submit" name="Submit" class="bt" value="添加">
           <input type="reset" name="Submit2" class="bt" value="重置">  </td> 
        </tr>
      </table>
</form><br>
  </body>
</html>
