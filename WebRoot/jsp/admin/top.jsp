<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
	
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	  <script type="text/javascript">
	$(function(){	
		//���������л�
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
	</script>
	<style type="text/css">
	.log{
	height:50;
	width:100px;
	}
	</style>
  </head>
  
  <body style="background:url(images/admin/top/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="/wenq/jsp/admin/admain.jsp" target="_parent"><img src="/wenq/images/logo.png" class="log" title="ϵͳ��ҳ" /><b style="color:white;font-size:16px;">��Ϣ����ϵͳ</b></a>
    </div>
        
    <ul class="nav">
    <li><a href="/wenq/jsp/admin/tongji/infotongji.jsp" target="rightFrame" class="selected"><img src="images/admin/top/icon01.png" title="����̨" /><h2>����̨</h2></a></li>
    <li><a href="/wenq/jsp/admin/tehuiyou/mdtehuiyou.jsp" target="rightFrame"><img src="images/admin/top/icon02.png" title="��Ʒ����" /><h2>��Ʒ����</h2></a></li>
    <li><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp"  target="rightFrame"><img src="images/admin/top/icon03.png" title="��������" /><h2>��������</h2></a></li>
    <li><a href="/wenq/jsp/admin/tab/tools.jsp"  target="rightFrame"><img src="images/admin/top/icon04.png" title="���ù���" /><h2>���ù���</h2></a></li>
    <li><a href="/wenq/jsp/admin/user/MDeleteuser.jsp" target="rightFrame"><img src="images/admin/top/icon05.png" title="�û�����" /><h2>�û�����</h2></a></li>
    <li><a href="/wenq/jsp/admin/tab/tab.jsp"  target="rightFrame"><img src="images/admin/top/icon06.png" title="ϵͳ����" /><h2>ϵͳ����</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="images/admin/top/help.png" title="����"  class="helpimg"/></span><a href="#">����</a></li>
    <li><a href="#">����</a></li>
    <li><a href="/wenq/main.jsp" target="_parent">�˳�</a></li>
    </ul>
     
    <div class="user">
    <span>admin</span>
    <i>��Ϣ</i>
    <b>5</b>
    </div>    
    
    </div>
  </body>
</html>
