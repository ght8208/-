<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'infotongji.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/admin/jsapi.js"></script>
	<script type="text/javascript" src="js/admin/format+zh_CN,default,corechart.I.js"></script>		
	<script type="text/javascript" src="js/admin/jquery.gvChart-1.0.1.min.js"></script>
	<script type="text/javascript" src="js/admin/jquery.ba-resize.min.js"></script>
	<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){

		jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'No of players'},
					hAxis: {title: 'Month'},
					width: 650,
					height: 250
					}
			});
		});
		</script>
  </head>
  
  <body>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">默认页</a></li>
    </ul>
    </div>
    
    
    <div class="mainbox">
    
    <div class="mainleft">
    
    
    <div class="leftinfo">
    <div class="listtitle"><a href="#" class="more1">更多</a>数据统计</div>
        
    <div class="maintj">  
    <table id='myTable5'>
				<caption>每月新闻数量统计表</caption>
				<thead>
					<tr>
						<th></th>
						<th>Jan</th>
						<th>Feb</th>
						<th>Mar</th>
						<th>Apr</th>
						<th>May</th>
						<th>Jun</th>
						<th>Jul</th>
						<th>Aug</th>
						<th>Sep</th>
						<th>Oct</th>
						<th>Nov</th>
						<th>Dec</th>
					</tr>
				</thead>
					<tbody>
					<tr>
						<th>2010</th>
						<td>125</td>
						<td>185</td>
						<td>327</td>
						<td>359</td>
						<td>376</td>
						<td>398</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>  
    </div>
    
    </div>
    <!--leftinfo end-->
    
    
    <div class="leftinfos">
    
   
    <div class="infoleft">
    
    <div class="listtitle"><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp" class="more1">更多</a>待办事项</div>    
    <ul class="newlist">
    <li><a href="#">上海自贸区今日正式挂牌成立</a><b>10-09</b></li>
    <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a><b>10-08</b></li>
    <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a><b>10-09</b></li>
    <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a><b>10-06</b></li>
    <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a><b>10-05</b></li>
    <li><a href="#">中央巡视组：重庆对一把手监督不到位</a><b>10-04</b></li>
    <li><a href="#">囧!悍马没改好成华丽马车(图)</a><b>10-03</b></li>
    </ul>   
    
    </div>
    
    
    <div class="inforight">
    <div class="listtitle"><a href="/wenq/jsp/admin/tab/tools.jsp" class="more1">添加</a>常用工具</div>
    
    <ul class="tooli">
    <li><a href="/wenq/jsp/admin/jingdian/mdjingdian.jsp"><img src="/wenq/images/admin/tools/i01.png" /></a><h2>景区管理</h2></li>
    <li><a href="/wenq/jsp/admin/user/showUser.jsp"><img src="/wenq/images/admin/tools/i02.png" /></a><h2>用户管理</h2></li>
    <li><a href="/wenq/jsp/admin/menpiao/mdmenpiao.jsp"><img src="/wenq/images/admin/tools/i03.png" /></a><h2>门票管理</h2></li>
    <li><a href="/wenq/jsp/admin/dingdan/showMyOrder.jsp"><img src="/wenq/images/admin/tools/i04.png" /></a><h2>订单查询</h2></li>
    <li><a href="/wenq/jsp/admin/tongji/infotongji.jsp"><img src="/wenq/images/admin/tools/i05.png" /></a><h2>信息统计</h2></li>  
    </ul>
    
    </div>
    
    
    </div>
    
    
    </div>
    <!--mainleft end-->
    
    
    <div class="mainright">
    
    
    <div class="dflist">
    <div class="listtitle"><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp" class="more1">更多</a>最新信息</div>    
    <ul class="newlist">
    <li><a href="#">上海自贸区今日正式挂牌成立</a></li>
    <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a></li>
    <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a></li>
    <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a></li>
    <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a></li>
    <li><a href="#">中央巡视组：重庆对一把手监督不到位</a></li>
    <li><a href="#">囧!悍马没改好成华丽马车(图)</a></li>
    <li><a href="#">澳门黄金周加派稽查人员监察出租车违规行为</a></li>
    <li><a href="#">香港环境局长吁民众支持政府扩建堆填区</a></li> 
    </ul>        
    </div>
    
    
    <div class="dflist1">
    <div class="listtitle"><a href="#" class="more1">更多</a>信息统计</div>    
    <ul class="newlist">
    <li><i>会员数：</a></i>2535462</li>
    <li><i>留言数：</a></i>5546</li>
    <li><i>普通文章：</a></i>2315</li>
    <li><i>景点数：</a></i>1585</li>
    <li><i>旅游路线：</a></i>5342</li>    
    </ul>        
    </div>
    
    

    
    
    </div>
    <!--mainright end-->
    
    
    </div>

  </body>
  <script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>
