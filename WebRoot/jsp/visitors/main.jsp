<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
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
  
  <body>
  	<div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <!-- <li><a href="#">������</a></li> -->
    </ul>
    </div>
  
  
	<div class="formbody">
    
    <div class="formtitle"><span>���ù���</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu1.png" /></a><h2>��ѯ�Լ��ĸ�����Ϣ</h2></li>
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu2.png" /></a><h2>�޸ĸ�����Ϣ</h2></li>
    <li><a href="/wenq/jsp/admin/user/addGUser.jsp"><img src="/wenq/images/visitor/content/tu3.png" /></a><h2>��Ϊ��Ա</h2></li> 
    <li><a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp"><img src="/wenq/images/visitor/content/tu5.png" /></a><h2>��ѯ�ػ���</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/cuxiao/showtehuiyoucx.jsp"><img src="/wenq/images/visitor/content/tu12.png" /></a><h2>�۸��������</h2></li>
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> --> 
    </div>
    
    <div class="formtitle"><span>��Ϣ��ѯ</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu1.png" /></a><h2>��ѯ�Լ��ĸ�����Ϣ</h2></li>
    <li><a href="/wenq/showUserInfo.jsp"><img src="/wenq/images/visitor/content/tu2.png" /></a><h2>�޸ĸ�����Ϣ</h2></li>
    <li><a href="/wenq/jsp/admin/user/addGUser.jsp"><img src="/wenq/images/visitor/content/tu3.png" /></a><h2>��Ϊ��Ա</h2></li>   
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    <div class="formtitle"><span>��ͼģ��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/ditu/map.jsp"><img src="/wenq/images/visitor/content/tu4.png" /></a><h2>��ͼ��ѯ</h2></li>   
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    <div class="formtitle"><span>�ػ���ģ��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/tehuiyou/showtehuiyou.jsp"><img src="/wenq/images/visitor/content/tu5.png" /></a><h2>��ѯ�ػ���</h2></li>     
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    
    <div class="formtitle"><span>��Ʊģ��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/admin/user/MDeleteGuser.jsp"><img src="/wenq/images/admin/tools/i07.png" /></a><h2>��Ա����</h2></li>
    <li><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp"><img src="/wenq/images/admin/tools/i06.png" /></a><h2>��Ʊ����</h2></li>
    <li><a href="/wenq/jsp/admin/dingdan/mdMyOrder.jsp"><img src="/wenq/images/admin/tools/i08.png" /></a><h2>��������</h2></li>
    <li><a href="/wenq/jsp/admin/luntan/liuyan/mdliuyan.jsp"><img src="/wenq/images/admin/tools/i09.png" /></a><h2>���Թ���</h2></li>      
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    <div class="formtitle"><span>�Ƶ�ģ��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp"><img src="/wenq/images/visitor/content/tu7.png" /></a><h2>�Ƶ��ѯ</h2></li>    
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    <div class="formtitle"><span>��̳ģ��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/luntan/bankuai/addbankuai.jsp"><img src="/wenq/images/visitor/content/tu8.png" /></a><h2>�������</h2></li>
    <li><a href="/wenq/jsp/visitors/luntan/tiezi/addtiezi.jsp"><img src="/wenq/images/visitor/content/tu9.png" /></a><h2>��������</h2></li>
    <li><a href="/wenq/jsp/visitors/luntan/liuyan/addliuyan.jsp"><img src="/wenq/images/visitor/content/tu10.png" /></a><h2>�������</h2></li>    
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    <div class="formtitle"><span>��Աר��</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="/wenq/jsp/visitors/huiyuan/addGUser.jsp"><img src="/wenq/images/visitor/content/tu11.png" /></a><h2>��Աע��</h2></li>
    <li><a href="#"><img src="/wenq/images/admin/tools/i06.png" /></a><h2>���Ƹ���ϲ��</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/cuxiao/showtehuiyoucx.jsp"><img src="/wenq/images/visitor/content/tu12.png" /></a><h2>�۸��������</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/duihuan/showtehuiyoudh.jsp"><img src="/wenq/images/visitor/content/tu13.png" /></a><h2>���ֶһ�����</h2></li>
    <li><a href="/wenq/jsp/visitors/huiyuan/choujiang/test.jsp"><img src="/wenq/images/visitor/content/tu14.png" /></a><h2>תת�ֹ���</h2></li>      
    </ul>
    <!-- <span class="tooladd"><img src="images/add.png" title="���" /></span> -->  
    </div>
    
    
    
    </div>



  </body>
</html>
