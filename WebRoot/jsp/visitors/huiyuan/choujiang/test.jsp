<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="/wenq/js/jquery-1.11.1.js" type="text/javascript"></script>
<style type="text/css">
body,h1,h2,h3,h4,h5,h6,p,ul,ol,li,form,img,dl,dt,dd,table,th,td,blockquote,fieldset,div,strong,label,em
	{
	margin: 0;
	padding: 0;
	border: 0;
}

ul,ol,li {
	list-style: none;
}

input,button {
	margin: 0;
	font-size: 12px;
	vertical-align: middle;
}

body {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
	margin: 0 auto;
	background: url(../images/BG.jpg) repeat-y;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.box {
	padding: 9px 0 0 11px;
	width: 759px;
	height: 611px;
	background: #ccc;
	margin: 20px auto;
}

.inbox {
	width: 751px;
	height: 596px;
	position: relative;
}

#random_box li {
	position: absolute;
	width: 144px;
	overflow: hidden;
	height: 144px;
	border: 3px solid #c7c5ca;
	background: #fff;
}

#random_box li img {
	width: 144px;
	display: block;
	height: 144px;
}

.ok {
	display: block;
	width: 442px;
	height: 294px;
	background: #c00;
	color: #fff;
	font-size: 48px;
	position: absolute;
	top: 149px;
	left: 148px;
	cursor: pointer;
	text-align: center;
	line-height: 280px;
}

#random_1 {
	left: 0;
	top: 0;
}

#random_2 {
	left: 148px;
	top: 0;
}

#random_3 {
	left: 296px;
	top: 0;
}

#random_4 {
	left: 444px;
	top: 0;
}

#random_5 {
	left: 592px;
	top: 0;
}

#random_6 {
	left: 592px;
	top: 148px;
}

#random_7 {
	left: 592px;
	top: 298px;
}

#random_8 {
	left: 592px;
	top: 446px;
}

#random_9 {
	left: 444px;
	top: 446px;
}

#random_10 {
	left: 296px;
	top: 446px;
}

#random_11 {
	left: 148px;
	top: 446px;
}

#random_12 {
	left: 0;
	top: 446px;
}

#random_13 {
	left: 0;
	top: 298px;
}

#random_14 {
	left: 0;
	top: 148px;
}

#random_box li.random_current {
	border: 1px solid red;
}

.nd{
   width:750px;
   height:600px;
}
</style>


</head>
  
  <body>
    <div class="box">
 <div class="inbox">
 <ul id="random_box">
 <li id="random_1"><img src="/wenq/images/menpiao/slider-img-01.jpg" class="nd"></li>
 <li id="random_2"><img src="/wenq/images/menpiao/slider-img-02.jpg" class="nd"></li>
 <li id="random_3"><img src="/wenq/images/menpiao/slider-img-03.jpg" class="nd"></li>
 <li id="random_4"><img src="/wenq/images/introduce/i1.jpg" class="nd"></li>
 <li id="random_5"><img src="/wenq/images/introduce/i2.jpg" class="nd"></li>
 <li id="random_6"><img src="/wenq/images/introduce/i3.jpg" class="nd"></li>
 <li id="random_7"><img src="/wenq/images/introduce/i4.jpg" class="nd"></li>
 <li id="random_8"><img src="/wenq/images/introduce/center2.jpg" class="nd"></li>
 <li id="random_9"><img src="/wenq/images/introduce/center3.jpg" class="nd"></li>
 <li id="random_10"><img src="/wenq/images/introduce/center6.jpg" class="nd"></li>
 <li id="random_11"><img src="/wenq/images/introduce/center7.jpg" class="nd"></li>
 <li id="random_12"><img src="/wenq/images/medium/03.jpg" class="nd"></li>
 <li id="random_13"><img src="/wenq/images/medium/04.jpg" class="nd"></li>
 <li id="random_14"><img src="/wenq/images/medium/01.jpg" class="nd"></li> 
 </ul>
 <b class="ok" onClick="StartGame()">抽奖</b>
 </div>
</div>
<script>
var index=1,   //当前亮区位置
prevIndex=14,   //前一位置
Speed=300,   //初始速度
Time,   //定义对象
arr_length = 14; //GetSide(5,5),   //初始化数组
EndIndex=1,   //决定在哪一格变慢
cycle=0,   //转动圈数 
EndCycle=3,   //计算圈数
flag=false,   //结束转动标志
random_num=1,  //中奖数
quick=0;   //加速
  
  
function StartGame(){
$("#random_box li").removeClass("random_current"); //取消选中
 //random_num = parseInt($("#txtnum").val());//
 random_num = Math.floor(Math.random()*13+2); //产出随机中奖数2--12之间
 index=1; //再来一次,从1开始
 cycle=0;
 flag=false;
 //EndIndex=Math.floor(Math.random()*12);
 if(random_num>5) {
 EndIndex = random_num - 5; //前5格开始变慢
 } else {
 EndIndex = random_num + 14 - 5; //前5格开始变慢
 }
 //EndCycle=Math.floor(Math.random()*3);
 Time = setInterval(Star,Speed);
  
}
function Star(num){
 //跑马灯变速
 if(flag==false){
  //走五格开始加速
  if(quick==5){
   clearInterval(Time);
   Speed=50;
   Time=setInterval(Star,Speed);
  }
  //跑N圈减速
  if(cycle==EndCycle+1 && index-1==EndIndex){
  clearInterval(Time);
   Speed=300;
   flag=true;   //触发结束
   Time=setInterval(Star,Speed);
  }
 }
  
 if(index>arr_length){
  index=1;
  cycle++;
 }
  
 //结束转动并选中号码
 if(flag==true && index==parseInt(random_num)){ 
  quick=0;
  clearInterval(Time);
 }
 $("#random_"+index).addClass('random_current'); //设置当前选中样式
 if(index>1)
  prevIndex=index-1;
 else{
  prevIndex=arr_length;
 }
 $("#random_"+prevIndex).removeClass('random_current'); //取消上次选择样式 
 index++;
 quick++;
}
</script>
  </body>
</html>
