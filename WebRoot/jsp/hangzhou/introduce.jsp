<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'introduce.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<link rel="stylesheet" type="text/css" href="css/pagelist.css">
	<script src="js/jquery-1.11.1.js"></script>
	<script>


	
	window.onload =function(){menuFix()};
	function menuFix()
	{
		  var sfEles=document.getElementById("menu").getElementsByTagName("li"); 
		 
		  for(var i=0;i<sfEles.length;i++)
			  {
			  sfEles[i].onmouseover=function()
			     {
				  this.className="listshow";
				  //this.className+=(this.className.length>0?" ":"")+"listshow";
			     };
			  sfEles[i].onmouseout=function()
			     {
				  this.className="";
				  //this.className=this.className.replace("listshow","");
			     };
			  }
	}



</script>
  
  
  </head>
  
  <body>
  <!-- 头部 开始 -->
    	<%@include file="/jsp/head/menuhang.jsp" %>
		<!-- 头部 end -->
	<!-- 滚动图片区 -->
	
	<div class="slipimg" >
	<center>
	<MARQUEE width=1080 scrollAmount=10 height=120 behavior="alternate" onMouseOut="this.start()" onMouseOver="this.stop()" > 
	 
	<A><img height=120 src="./images/introduce/apic21.jpg" width=1080></A>
	
	<A><img height=120 src="./images/introduce/apic23.jpg" width=1080></A>
	
	<A><img height=120 src="./images/introduce/apic24.jpg" width=1080></A>
	
	</MARQUEE>
	</center>
	</div>
	<!-- 
	<div style="position:absolute;background-color:#FFF;top:100px;width:410px;height:120px;">
	</div>
	<div style="position:absolute;background-color:#FFF;top:300px;width:900px;height:120px;left:1490px;z-index:999;">
	</div><br/>
	 -->
	<!-- 当前位置区 -->
	<div class="position">当前位置区
	您所在的位置：<a href="/index.htm">杭州专区</a>&gt;
	<span>景区概况</span>
	</div>
	
	
	<!-- 主要区 -->
	<div class="main">
		<!-- 内容区 -->
		<div class="content">
		 <h1 style="text-align:center">景区概况</h1>
		 <br/>
	  
	  <div class="news-info">
	  <p>
	  <a class="tags" href="#">杭州西湖国家级自然保护区简介<i>|</i></a>
	  <span class="data">2017-08-31</span>
	  <br/><br/>
	  </p>
	  </div>
	
	   
	  <p style="line-height: 1.5em;">
	 &nbsp;&nbsp;杭州西湖风景名胜区位于浙江省杭州市中心，
	分为湖滨区、湖心区、北山区、南山区和钱塘区；
	秀丽的湖光山色和众多的名胜古迹闻名中外，
	 是中国著名的旅游胜地，也被誉为人间天堂。
	景区内群山高度都不超过400米，
	环布在西湖的南、西、北三面，
	景区总面积达49平方公里，其中湖面6.5平方公里，以湖为主体，旧称武林水、钱塘湖、西子湖，宋代始称西湖。
	由大量乔灌木组成疏落有致、大小不同的空间；以植物造景为主，辅以亭、台、楼、阁、廊、榭、桥、汀。西湖傍杭州而盛，杭州因西湖而名。
	“天下西湖三十六，就中最美是杭州”。2007年5月8日经国家旅游局正式批准为国家AAAAA级旅游景区。2011年6月24日“中国杭州西湖文化景观”正式被列入《世界遗产名录》。
	 </p>
	 <br/> 
	 <img src="./images/introduce/center2.jpg">
	 <br/><br/>
	 <h2>自然资源</h2>
	 <p style="line-height: 1.5em;">
	&nbsp;&nbsp;&nbsp;
	1979年的《西湖鱼类志》中提到，当时朱元鼎调查发现，西湖里有32种鱼；1981年，西湖水域管理处的调查显示，当时西湖里有51种鱼。到了2004年，据各大媒体报道的统计数据，西湖里的鱼只有白鲢、花鲢、鲤鱼、鲫鱼、河鳗等共20多种鱼、虾</p>
	<br/><br/>
	<img src="./images/introduce/center3.jpg">
	<br/><br/>
	<h2>人文西湖</h2>
	<br/>
	 <p style="line-height: 1.5em;">
	&nbsp;&nbsp;&nbsp;
	西湖与佛教、道教等都有着密切的联系。在长远的历史中，各种宗教团体和道观佛寺聚集在西湖及周边群山之中，增添了西湖浓厚的宗教色彩。这其中尤以吴越国时期为鼎盛。当时各代国王热心佛学，在西湖周围兴建许多寺庙、宝塔、经幢和石窟。</p>
	<br/>
	<img src="./images/introduce/center6.jpg">
	<br/><br/>
	<h2>文学作品</h2>
	<br/>
	<p style="line-height: 1.5em;">
	 &nbsp;&nbsp;&nbsp;西湖以其湖光山色和深厚人文底蕴，吸引了历代文人墨客的眷顾，因此在文学方面也留下了诸多名篇和典籍。《武林掌故丛编》、《西湖梦寻》、《西湖集览》与新旧《西湖志》、《湖山便览》等记载了大量关于西湖和古代杭州的史迹掌故。另外，近现代众多作家也与西湖结缘。在诗词方面，白居易、苏轼、柳永、杨万里、林逋、徐志摩、胡适等诗人留下了无数佳句；在散文方面，张岱、鲁迅、俞平伯、郁达夫、宗璞等名家则写下了众多名篇。以下例举部分与西湖紧密关联的文学作品。
	</p>
	<br/>
	<img src="./images/introduce/center7.jpg">
	 
		</div>
		
		<!-- 动态信息区 -->
		<div class="dynamic">
			<!-- 广告区 -->
			<div class="ad">
			<img src="./images/introduce/i4.jpg">
			</div>
			<!-- 购票区 -->
			<div class="ticket">购票区
			   
	          <p>Online booking</p>	
	          <div class="buybuy">  
		          <div class="buy">
		              <img src="./images/introduce/i3.jpg">                          
		              <img src="./images/introduce/i2.jpg" style="position:relative;top:10px;">
		          </div>
				  <div class="silder-lstinfor">		   
		                <h3>
		                                                西湖游船门票
		                </h3>
		                <P>
		                <label style="color:#CD0000;"><b><em>￥</em></b><b>110</b></label>
		                <a href=".news_info p .tags {color:#ae8f18;}" class="ydbtn">立即预订</a>
		               </P>
		             &nbsp;&nbsp;&nbsp;
		             &nbsp;&nbsp;&nbsp;           
		               <p>               
		                <h3>
		                                             雷峰塔套票
		                </h3>
		                <label style="color:#CD0000;"><b><em>￥</em></b><b>290</b></label>
		                <a href="menpiao.jsp" class="ydbtn">立即预订</a>           
		           	</div>
	          </div>
	              
			</div>
			<!-- 信息区 -->
			<div class="info">
			 <!-- <div class="silder-txt"> -->
	            <h4>实用信息</h4>
	            <p>information</p>
	             <ul  style="list-style-type:none" class="silder-list2">
	          <li>
	            <span><a href="/page/trafficGuide.htm"> </a></span>
	            <label><a href="/page/trafficGuide.htm">交通指南</a></label>
	          </li>
	          <li>
	            <span><a href="/page/dietaryGuide.htm"></a></span>
	            <label><a href="/page/dietaryGuide.htm">餐饮指南</a></label>
	          </li>
	          <li>
	            <span><a href="/page/stayGuide.htm"></a></span>
	            <label><a href="/page/stayGuide.htm">住宿指南</a></label>
	          </li>
	          <li>
	            <span><a href="/page/touristGuide.htm"></a></span>
	            <label><a href="/page/touristGuide.htm">游览指南</a></label>
	          </li>
	          <li>
	            <span><a href="/page/productsGuide.htm"></a></span>
	            <label><a href="/page/productsGuide.htm">购物指南</a></label>
	          </li>
	          <li>
	            <span><a href="/page/entertainmentGuide.htm"></a></span>
	            <label><a href="/page/entertainmentGuide.htm">娱乐指南</a></label>
	          </li>
	        </ul>
	          
			
			</div>
			<!-- 二维码区 -->
			<div class="photo">
			 
	           <span>
	              <h4>新浪微博</h4>
	              <img src="./images/introduce/del1.jpg">
	         </span>
	          <span>
	              <h4>官方微信</h4>
	              <img src="./images/introduce/del2.jpg">
	            </span>
	          
			</div>
		</div>
		
	</div>
  	<!-- 版权区 -->
    <div class="copy" style="text-align:center;font-size:12px;color:#D3D3D3">
<br/><p>版权区</p>
	
	<p>版权所有：浙江省嘉兴市版权所有Copyright © 2017      备案号：xxxxxxxx</p>
		<p>联系电话：0510-xxxxxxx 传真:0510-xxxxxxx</p>
		<p>
			官网网址：http://www.xxxxx.com/     http://www.嘉兴.com/
		</p>
		<p>团队介绍 :</p>
	</div>
  </body>
</html>
