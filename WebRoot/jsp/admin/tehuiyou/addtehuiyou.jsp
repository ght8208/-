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
   <div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">����ػ�����Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
    <form action="Addtehuiyou" method="post"  name="form1" enctype="multipart/form-data">
      <table border="1" class="tablelist">
      
        <tr>
          <td height="40">�ػ��α�ţ�</td>
          <td> <input name="thid" type="text" ></td>
        </tr>
        
        <tr>
          <td height="40">�ػ������ƣ�</td>
          <td> <input name="thname" type="text"></td>
        </tr>
        
        <tr>
          <td height="40">�ػ�������λ�ã�</td>
          <td> <input name="thplace" type="text"></td>
        </tr>
        
        <tr>
          <td height="40">�ػ������֣�</td>
          <td> <input name="thpingfen" type="text"></td>
        </tr>
        <tr>
          <td height="40">�ػ��μ۸�</td>
          <td> <input name="thprice" type="text"></td>
        </tr>
        <tr>
          <td height="40">�ػ��ν��ܣ�</td>
          <td> <textarea name="thintro" cols=40 rows=4></textarea></td>
        </tr>
   <tr>  <td>�ػ���ͼƬ��</td>
          <td> <input name="thimage" type="file" >   </td>
        </tr>     
	
        <tr>  <td colspan="2" align="center">
            <input type="submit" name="Submit" class="bt" value="���">
            <input type="reset" name="Submit2" class="bt" value="����">  </td> </tr>
      </table>
</form><br>
  </body>
</html>
