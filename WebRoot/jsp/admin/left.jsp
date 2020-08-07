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
		//导航切换
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
    <div class="lefttop"><span></span>导航栏</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="/wenq/images/admin/left/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
    	<li class="active"><cite></cite><a href="/wenq/jsp/admin/tongji/infotongji.jsp" target="rightFrame">默认页</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/showUser.jsp" target="rightFrame">查看用户信息</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/MDeleteuser.jsp" target="rightFrame">修改、删除用户信息</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/addGUser.jsp" target="rightFrame">添加会员数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/showGuser.jsp" target="rightFrame">查看会员信息</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/user/MDeleteGuser.jsp" target="rightFrame">修改、删除会员信息</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tab/tools.jsp" target="rightFrame">常用工具</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tab/tab.jsp" target="rightFrame">Tab:系统设置</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/error/error.jsp" target="rightFrame">404页面</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="/wenq/images/admin/left/leftico02.png" /></span>景点管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/addview.jsp" target="rightFrame">添加景点数据</a></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/showjingdian.jsp" target="rightFrame">查看景点数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp" target="rightFrame">修改、删除景点数据</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico03.png" /></span>特惠游管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/addtehuiyou.jsp" target="rightFrame">添加特惠游数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/showtehuiyou.jsp" target="rightFrame">查看特惠游数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/tehuiyou/mdtehuiyou.jsp" target="rightFrame">修改、删除特惠游数据</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico04.png" /></span>新闻管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/addxinwen.jsp" target="rightFrame">添加新闻数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp" target="rightFrame">查看新闻数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/xinwen/mdxinwen.jsp" target="rightFrame">修改、删除新闻数据</a><i></i></li>
    </ul>
    </dd>   
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico01.png" /></span>门票管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/c_add.jsp" target="rightFrame">添加门票数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/showmenpiao.jsp" target="rightFrame">查看门票数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp" target="rightFrame">修改、删除门票数据</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico02.png" /></span>订单管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/dingdan/showMyOrder.jsp" target="rightFrame">查看订单数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/dingdan/mdMyOrder.jsp" target="rightFrame">修改、删除订单数据</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico03.png" /></span>酒店管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/addjiudian.jsp" target="rightFrame">添加酒店数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/showjiudian.jsp" target="rightFrame">查看酒店数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/jiudian/mdjiudian.jsp" target="rightFrame" >修改、删除酒店数据</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico04.png" /></span>论坛板块管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/addbankuai.jsp" target="rightFrame">添加论坛板块数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/showbankuai.jsp" target="rightFrame">查看论坛板块数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/bankuai/mdbankuai.jsp" target="rightFrame">修改、删除论坛板块数据</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico01.png" /></span>论坛帖子管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/addtiezi.jsp" target="rightFrame">添加论坛帖子数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/showtiezi.jsp" target="rightFrame">查看论坛帖子数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/tiezi/mdtiezi.jsp" target="rightFrame">修改、删除论坛帖子数据</a><i></i></li>
    </ul>    
    </dd> 
    
    <dd><div class="title"><span><img src="/wenq/images/admin/left/leftico02.png" /></span>论坛留言管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/addliuyan.jsp" target="rightFrame">添加论坛留言数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/showliuyan.jsp" target="rightFrame">查看论坛留言数据</a><i></i></li>
        <li><cite></cite><a href="/wenq/jsp/admin/luntan/liuyan/mdliuyan.jsp" target="rightFrame">修改、删除论坛留言数据</a><i></i></li>
    </ul>    
    </dd> 
    
    </dl>
    
  </body>
</html>
