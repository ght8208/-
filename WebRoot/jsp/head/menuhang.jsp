<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'menuhang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/pagelist.css">
  </head>
  
  <body>
    <div class="toptop">
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
						<div id="back_menu">
		                          <div id="menu">
		                             <ul>
		                                 <li><a href="main.jsp">首页</a></li>
                                 <li><a href="#" id="on">景色</a></li>
                                 <li><a href="introduce.jsp">杭州专区</a>
                                     <ul>
                                         <li><a href="introduce.jsp">景区概况</a></li>
                                         <li><a href="jdjspage1.jsp">西湖景区</a></li>
                                         <li><a href="#">图片欣赏</a></li>
                                         <li><a href="map.jsp">景区位置</a></li>
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
	</div>
  </body>
</html>
