<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menpiao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	

	<!-- 	css样式 -->
<!-- 	<link rel="stylesheet" type="text/css" href="css/topmenu.css"> -->
	<link rel="stylesheet" type="text/css" href="./css/main_list.css">
	
	<link rel="stylesheet" type="text/css" href="css/menpiao/style.css">
	<link rel="stylesheet" type="text/css" href="css/menpiao/boxed.css">
	<link rel="stylesheet" type="text/css" href="css/menpiao/green.css">
	
	<style type="text/css">
	html,body{margin:0;padding:0;}
     
	</style>
	
	<!--    	 菜单事件 -->
	<!-- 
	<script src="js/menu.js"></script> -->
	
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/main.js"></script>
	<script src="js/menpiao/carousel.js"></script>
	<script src="js/menpiao/selectnav.js"></script>
	<script src="js/menpiao/flexslider.js"></script>
	<script src="js/menpiao/twitter.js"></script>
	<script src="js/menpiao/tooltip.js"></script>
	<script src="js/menpiao/effects.js"></script>
	<script src="js/menpiao/fancybox.js"></script>
	<script src="js/menpiao/custom.js"></script>
	<script src="js/menpiao/isotope.js"></script>
	
	
	
  </head>
  
  <body>
  	
   <!-- 头部 start -->
	  <div class="header">

	  <!-- 背景图片区 -->
	<div class="top">
	<div class="first_image">
		<img id="d3" src="./images/head/1.jpg" style="position: absolute; top:0px;z-index:3"> 
		<img id="d2" src="./images/head/2.jpg" style="position: absolute; top:0px;z-index:3"> 
		<img id="d1" src="./images/head/3.jpg" style="position: absolute; top:0px;z-index:3">
	    
	</div>
   </div>
   
  <!-- 顶部的主要盒子 -->
			<div class="top-box">
			<div class="top">
				<!-- 无效左侧logo区 -->
				
				<!-- 右侧综合功能区 -->
				<div class="top-right">
					<!-- 右侧用户登录区 -->
					<div class="top-admin">
						<div class="top-userstatus">
							<%if(session.getAttribute("username")==null) {%>
					<a href="MyJsp.jsp" style="color:#FFF;font-size:16px;">登录</a>
					<span>|</span>
					<a href="regist-1.jsp"style="color:#FFF;font-size:16px;">注册</a>
					<%}
					else{
						out.print("<a href='showUserInfo.jsp'>");
						out.print(session.getAttribute("username"));
						out.print("</a>");
						out.print("<a href='logout.jsp'>");
						out.print(",退出");
						out.print("</a>");
						}
					 %>
						</div>
					</div>
			  		<!-- 右侧导航区 -->
						
		                  
				</div>
			</div>
		</div>


	
<!-- Wrapper Start -->
<div id="wrapper">


<!-- Header
================================================== -->

<!-- 960 Container -->
<div class="container ie-dropdown-fix">

	<!-- Header -->
	<div id="header">

		<!-- Logo -->
		<div class="eight columns">
			<div id="logo">
				<a href="#"><img src="./images/menpiao/twitter-ico.png" alt="logo" /></a>
				<div id="tagline">欢迎您的到来！</div>
				<div class="clear"></div>
			</div>
		</div>

		<!-- Social / Contact -->
		<div class="eight columns">
			
			<!-- Social Icons -->
			<ul class="social-icons">
				<li class="facebook"><a href="#">Facebook</a></li>
				<li class="twitter"><a href="#">Twitter</a></li>
				<li class="dribbble"><a href="#">Dribbble</a></li>
				<li class="linkedin"><a href="#">LinkedIn</a></li>
				<li class="pintrest"><a href="#">Pintrest</a></li>
			</ul>
			
			<div class="clear"></div>
			
			<!-- Contact Details -->
			<div id="contact-details">
				<!-- <ul>
					<li><i class="mini-ico-envelope"></i><a href="#">support@centum.com</a></li>
					<li><i class="mini-ico-user"></i>+48 880 450 120</li>
				</ul> -->
			</div>

		</div>

	</div>
	<!-- Header / End -->
	
	<!-- Navigation -->
	<div class="sixteen columns">

		<div id="navigation">
			<ul id="nav">
				
				<li><a href="main.jsp">首页</a></li>

				<li><a href="#">杭州专区</a>
					<ul>
					<li><a href="introduce.jsp">景区概况</a></li>
		            <li><a href="jdjspage1.jsp">西湖景区</a></li>
		            <li><a href="#">图片欣赏</a></li>
		            <li><a href="map.jsp">景区位置</a></li>
		            <li><a href="video.jsp">视频欣赏</a></li>
		            </ul>
		            </li>
		       <li><a href="#">玩转景点</a>
					<ul>
					<li><a href="menpiao.jsp">门票购买</a></li>
                    <li><a href="ditu.jsp">地图指南</a></li>
                    <li><a href="#">新闻推荐</a></li>
                    <li><a href="#">景区景点</a></li>
                    <li><a href="#">舌尖美食</a></li>
					</ul>
				</li>

				<li><a href="#">特色专题</a>
				<ul>
							<li><a href="#">跟团旅游</a>
							</li>
							<li><a href="#">自助旅游</a>
							</li>
							<li><a href="#">订制旅游</a>
							</li>
							<li><a href="#">游玩攻略</a>
							</li>
						</ul>
				</li>

				<!-- 

				<li><a href="blog.html">Blog</a></li>
				<li><a href="contact.html">Contact</a></li> -->

			</ul>

			<!-- Search Form -->
			<div class="search-form">
				<form method="get" action="#" />
					<input type="text" class="search-text-box" />
				</form>
			</div>

		</div> 
		<div class="clear"></div>
		
	</div>
	<!-- Navigation / End -->

</div>
<!-- 960 Container / End -->


<!-- Content
================================================== -->
<div align=center>
<div style=“width:960px; margin:0 auto; height:90px;”>
<script>
(function() {
    var s = "_" + Math.random().toString(36).slice(2);
    document.write('<div id="' + s + '"></div>');
    (window.slotbydup=window.slotbydup || []).push({
        id: '730419',
        container: s,
        size: '960,90',
        display: 'inlay-fix'
    });
})();
</script>
<script src="http://dup.baidustatic.com/js/os.js"></script>
</div>
</div>
<!-- 960 Container -->
<div class="container">

	<!-- Flexslider -->
	<div class="sixteen columns">
		<section class="slider">
			<div class="flexslider home">
				<ul class="slides">
				
					<li>
						<img src="./images/menpiao/slider-img-01.jpg" alt="" />
						<div class="slide-caption n">
							<h3>潘帕斯草原</h3>
							<p>南美亚热带湿润气候下的高草草原。分布在拉普拉塔平原的南部，包括乌拉圭、阿根廷东部、巴西南部等地区，面积约76万平方公里.</p>
						</div>
					</li>
					
					<li>
						<img src="images/menpiao/slider-img-02.jpg" alt="" />
						<div class="slide-caption">
							<h3>巴厘岛</h3>
							<p>巴厘岛是印尼13600多个岛屿中最耀眼的一个岛，位于印度洋赤道南方8度，爪哇岛东部，岛上东西宽140公里，南北相距80公里，全岛总面积为5620㎞².</p>
						</div>
					</li>
					
					<li>
						<img src="images/menpiao/slider-img-03.jpg" alt="" />
						<div class="slide-caption">
							<h3>黄山</h3>
							<p>世界文化与自然双重遗产，世界地质公园，国家AAAAA级旅游景区，国家级风景名胜区，全国文明风景旅游区示范点，中华十大名山，天下第一奇山.</p>
						</div>
					</li>
					
				</ul>
			</div>
			<div >
			
			</div>
			 
		</section>
  	</div>
	<!-- Flexslider / End -->
	
</div>
<!--  Container / End -->



<!-- 960 Container -->
<div class="container">

	<!-- Icon Boxes -->
	<div class="icon-box-container">

		<!-- Icon Box Start -->
		<div class="one-third column">
			<div class="icon-box">
				<i class="ico-display" style="margin-left: -10px;"></i>
				<h3>旅行 &amp; 自由爱好</h3>
				<p>你可以做自己想做的任何一件事情;</p>
			</div>
		</div>
		<!-- Icon Box End -->
		
		<!-- Icon Box Start -->
		<div class="one-third column">
			<div class="icon-box">
				<i class="ico-cogwheel"></i>
				<h3>简单的旅行</h3>
				<p>做自己想做的事情</p>
			</div>
		</div>
		<!-- Icon Box End -->
		
		<!-- Icon Box Start -->
		<div class="one-third column">
			<div class="icon-box">
				<i class="ico-iphone"></i>
				<h3>充分地准备</h3>
				<p>你需要做很多的事情，去轻松地旅行</p>
			</div>
		</div>
		<!-- Icon Box End -->
		
	</div>
	<!-- Icon Boxes / End -->
	
</div>
<!-- 960 Container / End -->

<!-- 960 Container -->
<div class="container">

	<div class="sixteen columns">
		<!-- Headline -->
		<div class="headline no-margin"><h3>Recent Work</h3></div>
	</div>
	
	<!-- Project -->
	<div class="four columns">
		<div class="picture"><a href="single_project.html"><img src="images/portfolio/portoflio-09.jpg" alt="" /><div class="image-overlay-link"></div></a></div>
		<div class="item-description">
			<h5><a href="#">景点浏览</a></h5>
			<p>Mauris sit amet ligula est, eget conseact etur lectus maecenas hendrerit suscipit.</p>
		</div>
	</div>
	
	<!-- Project -->
	<div class="four columns">
		<div class="picture"><a href="images/portfolio/portoflio-08-large.jpg" rel="image" title="Coffee Time"><img src="images/portfolio/portoflio-08.jpg" alt="" /><div class="image-overlay-zoom"></div></a></div>
		<div class="item-description">
			<h5><a href="#">休闲时光</a></h5>
			<p>Amet sit lorem ligula est, eget conseact etur lectus hendrerit suscipit maecenas.</p>
		</div>
	</div>
	
	<!-- Project -->
	<div class="four columns">
		<div class="picture"><a href="single_project.html"><img src="images/portfolio/portoflio-10.jpg" alt="" /><div class="image-overlay-link"></div></a></div>
		<div class="item-description">
			<h5><a href="#">网站浏览</a></h5>
			<p>Lorem sit amet ligula est, eget conseact etur lectus maecenas hendrerit suscipit.</p>
		</div>
	</div>
	
	<!-- Project -->
	<div class="four columns">
		<div class="picture"><a href="single_project.html"><img src="images/portfolio/portoflio-07.jpg" alt="" /><div class="image-overlay-link"></div></a></div>
		<div class="item-description">
			<h5><a href="#">Wireless Keyboard</a></h5>
			<p>Ligula mauris sit amet est eget consat etur lectus maecenas hendrerit suscipit.</p>
		</div>
	</div>
	
</div>
<!-- 960 Container / End -->


<!-- 960 Container -->
<div class="container">
	<div class="sixteen columns">
	
		<!-- Headline -->
		<div class="headline no-margin"><h3>Our Clients</h3></div>
		
		<ul class="client-list">
			<li><img src="./images/medium/01.jpg" alt="" /></li>
			<li><img src="./images/medium/02.png" alt="" /></li>
			<li><img src="./images/medium/03.jpg" alt="" /></li>
			<li><img src="./images/medium/04.jpg" alt="" /></li>
			<li><img src="./images/logo-05.png" alt="" /></li>
		</ul>
		
	</div>
</div>
<!-- 960 Container / End -->

</div>
<!-- Wrapper / End -->


<!-- 
================================================== -->

<!-- Footer 开始-->
<div id="footer">
	<!-- 960 Container -->
	<div class="container">
	
		<!-- About -->
		<div class="four columns">
			<div class="footer-headline"><h4>关于我们</h4></div>
			<p>Lorem sequat ipsum dolor lorem sit amet, consectetur adipiscing dolor elit. Aenean nisl orci, condimentum.</p>
			<p>Consectetur adipiscing elit aeneane lorem lipsum, condimentum ultrices consequat eu, vehicula mauris lipsum adipiscing lipsum aenean orci lorem.</p>
		</div>
		
		<!-- Useful Links -->
		<div class="four columns">
			<div class="footer-headline"><h4>可用的链接</h4></div>
			<ul class="links-list">
				<li><a href="#">服务更新</a></li>
				<li><a href="#">讨论论坛</a></li>
				<li><a href="#">求助窗</a></li>
				<li><a href="#">百词典</a></li>
				<li><a href="#">许可证</a></li>
				<li><a href="#">收藏夹</a></li>
				<li><a href="#">知识库</a></li>
			</ul>
		</div>
		
		<!-- Photo Stream -->
		<div class="four columns">
			<div class="footer-headline"><h4>照片墙</h4></div>
			<div class="flickr-widget">
				
				<div class="clear"></div>
			</div>
		</div>
		
		<!-- Latest Tweets -->
		<div class="four columns">
			<div class="footer-headline"><h4>最新更新</h4></div>
			<ul id="twitter"></ul>
				
			<div class="clear"></div>
		</div>

		<!-- 底部 start-->
		<div class="footer-box">
			<div class="footer">
				<!-- 底部版权logo区 -->
				<h1 class="footer-logo"></h1>
				<!-- 底部版权文字区 -->
				<div class="copyright">
				<p>版权所有 :</p>
				<p>景区地址 :</p>
				<p>官网网址 :</p>
				<p>团队介绍 :</p>
			</div>
			</div>
		</div>
		
		

	</div>
	<!-- 960 Container / End -->

</div>
<!-- Footer / End -->


<!-- Styles Switcher
================================================== -->

<!-- 
<div id="style-switcher">
	<h2>Style Switcher <a href="#"></a></h2>
	
	<div><h3>Predefined Colors</h3>
		<ul class="colors" id="color1">
			<li><a href="#" class="green" title="Green"></a></li>
			<li><a href="#" class="blue" title="Blue"></a></li>
			<li><a href="#" class="orange" title="Orange"></a></li>
			<li><a href="#" class="navy" title="Navy"></a></li>
			<li><a href="#" class="yellow" title="Yellow"></a></li>
			<li><a href="#" class="peach" title="Peach"></a></li>
			<li><a href="#" class="beige" title="Beige"></a></li>
			<li><a href="#" class="purple" title="Purple"></a></li>
			<li><a href="#" class="red" title="Red"></a></li>
			<li><a href="#" class="pink" title="Pink"></a></li>
			<li><a href="#" class="celadon" title="Celadon"></a></li>
			<li><a href="#" class="brown" title="Brown"></a></li>
			<li><a href="#" class="cherry" title="Cherry"></a></li>
			<li><a href="#" class="gray" title="Gray"></a></li>
			<li><a href="#" class="dark" title="Dark"></a></li>
			<li><a href="#" class="cyan" title="Cyan"></a></li>
			<li><a href="#" class="olive" title="Olive"></a></li>
			<li><a href="#" class="dirty-green" title="Dirty Green"></a></li>
		</ul>
		
	<h3>Layout Style</h3>
	<div class="layout-style">
		<select id="layout-switcher">
			<option value="css/boxed" />Boxed
			<option value="css/wide" />Wide
		</select>
	</div>
	
	<h3>Background Image</h3>
		 <ul class="colors bg" id="bg">
			<li><a href="#" class="bg1"></a></li>
			<li><a href="#" class="bg2"></a></li>
			<li><a href="#" class="bg3"></a></li>
			<li><a href="#" class="bg4"></a></li>
			<li><a href="#" class="bg5"></a></li>
			<li><a href="#" class="bg6"></a></li>
			<li><a href="#" class="bg7"></a></li>
			<li><a href="#" class="bg8"></a></li>
			<li><a href="#" class="bg9"></a></li>
			<li><a href="#" class="bg10"></a></li>
			<li><a href="#" class="bg11"></a></li>
			<li><a href="#" class="bg12"></a></li>
			<li><a href="#" class="bg13"></a></li>
			<li><a href="#" class="bg14"></a></li>
			<li><a href="#" class="bg15"></a></li>
			<li><a href="#" class="bg16"></a></li>
			<li><a href="#" class="bg17"></a></li>
			<li><a href="#" class="bg18"></a></li>
		</ul>
		
	<h3>Background Color</h3>
		<ul class="colors bgsolid" id="bgsolid">
			<li><a href="#" class="green-bg" title="Green"></a></li>
			<li><a href="#" class="blue-bg" title="Blue"></a></li>
			<li><a href="#" class="orange-bg" title="Orange"></a></li>
			<li><a href="#" class="navy-bg" title="Navy"></a></li>
			<li><a href="#" class="yellow-bg" title="Yellow"></a></li>
			<li><a href="#" class="peach-bg" title="Peach"></a></li>
			<li><a href="#" class="beige-bg" title="Beige"></a></li>
			<li><a href="#" class="purple-bg" title="Purple"></a></li>
			<li><a href="#" class="red-bg" title="Red"></a></li>
			<li><a href="#" class="pink-bg" title="Pink"></a></li>
			<li><a href="#" class="celadon-bg" title="Celadon"></a></li>
			<li><a href="#" class="brown-bg" title="Brown"></a></li>
			<li><a href="#" class="cherry-bg" title="Cherry"></a></li>
			<li><a href="#" class="gray-bg" title="Gray"></a></li>
			<li><a href="#" class="dark-bg" title="Dark"></a></li>
			<li><a href="#" class="cyan-bg" title="Cyan"></a></li>
			<li><a href="#" class="olive-bg" title="Olive"></a></li>
			<li><a href="#" class="dirty-green-bg" title="Dirty Green"></a></li>
		</ul></div>
	
		<div id="reset"><a href="#" class="button color green boxed">Reset</a></div>
		
</div>


<div style="display:none">
<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'>
</script>
</div>
 -->

	
  </body>
</html>
