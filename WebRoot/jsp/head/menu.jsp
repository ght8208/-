<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <%-- <base href="<%=basePath%>">  --> --%>

    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 	css样式 -->
	<link rel="stylesheet" type="text/css" href="./css/main_list.css">
    
	
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/main.js"></script>
	
  </head>
  
  <body>
    <!-- 头部 start -->
		<div class="header">
        		<!-- 背景音乐 -->
                <!-- <div class="music">
                
                    <audio controls height="100" width="100" autoplay="true"  loop="true">
                    <source src="song.mp3" type="audio/mp3" />
                    <source src="song.ogg" type="audio/ogg" />
                    <embed height="100" width="100" src="song.mp3" loop="true"/>
                    </audio>
                </div> -->
				<!-- 背景图片区 -->
				<div class="top">
				 <div class="first_image">
					<img id="d3" src="./images/head/1.jpg" style="position: absolute; top:0px;z-index:3"> 
					<img id="d2" src="./images/head/2.jpg" style="position: absolute; top:0px;z-index:3"> 
					<img id="d1" src="./images/head/3.jpg" style="position: absolute; top:0px;z-index:3">
					<!-- 切换图片按钮区 -->
						     <div class="change_images" id="d4">
					 <input id="b1" type="button" onclick="change1();" /> 
					 <input id="b2"	type="button" onclick="change2();" /> 
					 <input id="b3" type="button" onclick="change3();" />
				     </div> 
				</div>
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
				<div class="top-image">
					<%if(session.getAttribute("username")!=null) {
						if(session.getAttribute("username").equals("admin"))
						{%>
						<a href="/wenq/jsp/admin/admain.jsp"><img src="./images/user.png" ></a>
						<%}
						else
						{%>
						<a href="/wenq/jsp/visitors/ownfunction.jsp"><img src="./images/user.png" ></a>
						<%}
					}
					%>
				</div>
				<div class="top-userstatus">
					<%if(session.getAttribute("username")==null) {%>
					<a href="jsp/loginregist/MyJsp.jsp" style="color:#FFF;font-size:16px;">登录</a>
					<span>|</span>
					<a href="jsp/loginregist/regist-1.jsp"style="color:#FFF;font-size:16px;">注册</a>
					<%}
					else if(session.getAttribute("username").equals("admin")){
						out.print("<a href='/wenq/jsp/visitors/ownfunction.jsp'>");
						out.print("欢迎管理员，");
						out.print(session.getAttribute("username"));
						out.print("</a>");
						out.print("<a href='jsp/loginregist/logout.jsp'>");
						out.print(",退出");
						out.print("</a>");
					}
					else{
						out.print("<a href='/wenq/jsp/visitors/ownfunction.jsp'>");
						out.print(session.getAttribute("username"));
						out.print("</a>");
						out.print("<a href='jsp/loginregist/logout.jsp'>");
						out.print(",退出");
						out.print("</a>");
						}
					 %>
				</div>
			</div>
	  		<!-- 右侧导航区 -->
				<div id="back_menu">
                          <div id="menu">
                             <ul>
                                 <li><a href="main.jsp">首页</a></li>
                                 <li><a href="#" id="on">景色</a></li>
                                 <li><a href="jsp/hangzhou/introduce.jsp">杭州专区</a>
                                     <ul>
                                         <li><a href="jsp/hangzhou/introduce.jsp">景区概况</a></li>
                                         <li><a href="jsp/hangzhou/jdjspage1.jsp">西湖景区</a></li>
                                         <li><a href="#">图片欣赏</a></li>
                                         <li><a href="jsp/hangzhou/map.jsp">景区位置</a></li>
                                         <li><a href="video.jsp">视频欣赏</a></li>
                                     </ul>
                                 </li>
                                 <li><a href="#" id="on">玩转景点</a>
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
                                         <li><a href="#">跟团旅游</a></li>
                                         <li><a href="#">自助旅游</a></li>
                                         <li><a href="#">订制旅游</a></li>
                                         <li><a href="#">游玩攻略</a></li>
                                    </ul>
                                 </li>
                                 
                             </ul>
                        </div>
                   </div>
			</div>
                  
		</div>
	</div>
</div>


  </body>
</html>
