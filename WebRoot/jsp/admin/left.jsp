<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
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
	<script type="text/javascript">
	$(function(){	
		//�����л�
		$(".menuson li").click(function(){
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});
		
		$('.title').click(function(){
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if($ul.is(':visible')){
				$(this).next('ul').slideUp();
			}else{
				$(this).next('ul').slideDown();
			}
		});
	})	
</script>
  </head>
  
  <body  style="background:#f0f9fd;">
    <div class="lefttop"><span></span>������</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="/wenq/images/admin/left/leftico01.png" /></span>�û�����
    </div>
    	<ul class="menuson">
    	<li class="active"><cite></cite><a href="/wenq/jsp/admin/tongji/infotongji.jsp" target="rightFrame">Ĭ��ҳ</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/showUser.jsp" target="rightFrame">�鿴�û���Ϣ</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/MDeleteuser.jsp" target="rightFrame">�޸ġ�ɾ���û���Ϣ</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/addGUser.jsp" target="rightFrame">��ӻ�Ա����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/showGuser.jsp" target="rightFrame">�鿴��Ա��Ϣ</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/MDeleteGuser.jsp" target="rightFrame">�޸ġ�ɾ����Ա��Ϣ</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tab/tools.jsp" target="rightFrame">���ù���</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tab/tab.jsp" target="rightFrame">Tab:ϵͳ����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/error/error.jsp" target="rightFrame">404ҳ��</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="/wenq/images/admin/left/leftico02.png" /></span>�������
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/addview.jsp" target="rightFrame">��Ӿ�������</a></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/showjingdian.jsp" target="rightFrame">�鿴��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp" target="rightFrame">�޸ġ�ɾ����������</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico03.png" /></span>�ػ��ι���</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/addtehuiyou.jsp" target="rightFrame">����ػ�������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/showtehuiyou.jsp" target="rightFrame">�鿴�ػ�������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/mdtehuiyou.jsp" target="rightFrame">�޸ġ�ɾ���ػ�������</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico04.png" /></span>���Ź���</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/addxinwen.jsp" target="rightFrame">�����������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp" target="rightFrame">�鿴��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/mdxinwen.jsp" target="rightFrame">�޸ġ�ɾ����������</a><i></i></li>
    </ul>
    </dd>   
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico01.png" /></span>��Ʊ����</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/c_add.jsp" target="rightFrame">�����Ʊ����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/showmenpiao.jsp" target="rightFrame">�鿴��Ʊ����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp" target="rightFrame">�޸ġ�ɾ����Ʊ����</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico02.png" /></span>��������</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/dingdan/showMyOrder.jsp" target="rightFrame">�鿴��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/dingdan/mdMyOrder.jsp" target="rightFrame">�޸ġ�ɾ����������</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico03.png" /></span>�Ƶ����</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/addjiudian.jsp" target="rightFrame">��ӾƵ�����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/showjiudian.jsp" target="rightFrame">�鿴�Ƶ�����</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/mdjiudian.jsp" target="rightFrame" >�޸ġ�ɾ���Ƶ�����</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico04.png" /></span>��̳������</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/addbankuai.jsp" target="rightFrame">�����̳�������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/showbankuai.jsp" target="rightFrame">�鿴��̳�������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/mdbankuai.jsp" target="rightFrame">�޸ġ�ɾ����̳�������</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico01.png" /></span>��̳���ӹ���</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/addtiezi.jsp" target="rightFrame">�����̳��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/showtiezi.jsp" target="rightFrame">�鿴��̳��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/mdtiezi.jsp" target="rightFrame">�޸ġ�ɾ����̳��������</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico02.png" /></span>��̳���Թ���</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/addliuyan.jsp" target="rightFrame">�����̳��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/showliuyan.jsp" target="rightFrame">�鿴��̳��������</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/mdliuyan.jsp" target="rightFrame">�޸ġ�ɾ����̳��������</a><i></i></li>
    </ul>    
    </dd> 
    
    </dl>
    
  </body>
</html>
