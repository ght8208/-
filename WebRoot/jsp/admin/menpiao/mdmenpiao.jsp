<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<base href="<%=basePath%>">
    
    <title>所有物品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})
	function go()
    {
       window.document.form1.submit();
    }
	</script>
	<style type="text/css">
	.tupian{
	  height:100px;
	  width:188px;
	}
	.ad{
	color:grey;
	}
	</style>

  </head>
  
  <body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">门票修改删除信息</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    	
        <ul class="toolbar">
        <li class="click"><span><img src="/wenq/images/admin/showmd/t01.png" /></span>添加</li>
        <li class="click"><span><img src="/wenq/images/admin/showmd/t02.png" /></span>修改</li>
        <li><span><img src="/wenq/images/admin/showmd/t03.png" /></span>删除</li>
        <li><span><img src="/wenq/images/admin/showmd/t04.png" /></span>统计</li>
        </ul>
        
        <ul class="toolbar1">
        <li><span><img src="/wenq/images/admin/showmd/t05.png" /></span>设置</li>
        </ul>
    	
    </div>
     <%
  if(session.getAttribute("msg")!=null)
  {
  out.println(session.getAttribute("msg"));
  }
   %>
    <%
  DB db = new DB();
  String sql ="select * from goods";
  ResultSet rs = db.executeQuery(sql);
  %>
  <ul class="imglist">
  <%
 while(rs.next())
{  
	String modifyurl="/wenq/jsp/admin/menpiao/modifymenpiao.jsp?id="+rs.getString(1);
	String deleteurl="/wenq/jsp/admin/menpiao/deletemenpiao.jsp?id="+rs.getString(1);
%>
     
  
  
  <li>
  	<img src="<%=rs.getString(6)%>" class="tupian"/>
    <h2>门票名称：<%=rs.getString(2)%></h2>
    <h2>门票数量：<%=rs.getString(3)%></h2>
    <h2>门票价格：<%=rs.getString(4)%></h2>
	<p>
	<a href="<%=modifyurl%>">修改</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=deleteurl%>">删除</a>
	</p>
	
	
</li>
 <%}%>
  </ul>
  
</div>
  </body>
</html>
