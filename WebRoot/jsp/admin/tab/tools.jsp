<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tools.jsp' starting page</title>
    
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
	
  </head>
  
  <body>
    
	<div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">������</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>���ù���</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp"><img src="/wenq/images/admin/tools/i01.png" /></a><h2>��������</h2></li>
    <li><a href="/wenq/jsp/admin/user/showUser.jsp"><img src="/wenq/images/admin/tools/i02.png" /></a><h2>�û�����</h2></li>
    <li><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp"><img src="/wenq/images/admin/tools/i03.png" /></a><h2>��Ʊ����</h2></li>
    <li><a href="/wenq/jsp/admin/dingdan/showMyOrder.jsp"><img src="/wenq/images/admin/tools/i04.png" /></a><h2>������ѯ</h2></li>
    <li><a href="/wenq/jsp/admin/tongji/infotongji.jsp"><img src="/wenq/images/admin/tools/i05.png" /></a><h2>��Ϣͳ��</h2></li>
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> --> 
    </div>
    
    <div class="formtitle"><span>������</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/admin/user/MDeleteGuser.jsp"><img src="/wenq/images/admin/tools/i07.png" /></a><h2>��Ա����</h2></li>
    <li><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp"><img src="/wenq/images/admin/tools/i06.png" /></a><h2>��Ʊ����</h2></li>
    <li><a href="/wenq/jsp/admin/dingdan/mdMyOrder.jsp"><img src="/wenq/images/admin/tools/i08.png" /></a><h2>��������</h2></li>
    <li><a href="/wenq/jsp/admin/luntan/liuyan/mdliuyan.jsp"><img src="/wenq/images/admin/tools/i09.png" /></a><h2>���Թ���</h2></li>      
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    
    
    </div>


  </body>
</html>
