<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'map.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/pagelist1.css">
	<!-- 	css样式 -->
	<link rel="stylesheet" type="text/css" href="css/topmenu.css">
	<!--    	 菜单事件 -->
	<script src="js/menu.js"></script>
	
	<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
	div{
	border:0px solid red;
	margin:0 auto;
	}
	</style>
	<script type="text/javascript" 
	src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>

	
	
  </head>
  
  <body>
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
		
		
		
	
	<!-- 滚动图片区 -->
	<div class="sliping">
		<img class="slip" src="./images/slip/xihu1.png" style="width:1280px;height:290px"/>
	</div>
	
	
	<!-- 当前位置区 -->
	<div class="position">
	您所在的位置：<a href="/main.jsp">首页</a>&gt;<span>玩转景点</span>&gt;<span>交通指南</span>
 	</div>
 	
	<!-- 主要区 -->
	<div class="main">
		<!--百度地图容器-->
 		 <div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
	</div>
  

	<!-- 版权区 -->
	<div class="copy" style="text-align:center">
		<img  src="./images/xhlogo.png" align="left" style="width: 120px;height: 105px;">
		<br/>
		<p>版权所有：浙江省杭州市西湖风景区版权所有Copyright © 2017      备案号：xxxxxxxx</p>
		<p>联系电话：0510-xxxxxxx 传真:0510-xxxxxxx</p>
		<p>
			官网网址：http://www.xxxxx.com/     http://www.杭州西湖.com/
		</p>
		<p>团队介绍 :</p>
	</div>	
		
  </body>
  
  
<!-- 	创建地图 -->
	<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(120.157282,30.352428);//定义一个中心点坐标
        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //标注点数组
    var markerArr = [{title:"独城生态公园",content:"独城生态公园",point:"120.159413|30.362353",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("./images/position.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    /*"http://app.baidu.com/map/images/us_mk_icon.png"*/
    initMap();//创建和初始化地图
</script>


</html>
