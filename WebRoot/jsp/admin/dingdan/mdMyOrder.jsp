<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'showMyOrder.jsp' starting page</title>
    
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

	</script>
	<style type="text/css">
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
    <li><a href="#">订单修改删除信息</a></li>
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
      if(session.getAttribute("username")!=null)
      {
         DB db=new DB();
         /* String sql="select * from ordertable where username='"+session.getAttribute("username")+"'";
          */
          String sql="select * from ordertable ";
         try{
            ResultSet rs=db.executeQuery(sql);
            %>
            <table class="tablelist">
            <thead>
               <tr>
	               <th>商品编号<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
	               <th>购买人</th>
	               <th>购买日期</th>
	               <th>商家地址</th>
	               <th>付款方式</th>
	               <th>操作</th>
               </tr>
            </thead>
            <tbody>
               <%
                 int i=1;
                 while(rs.next())
                 {
                 String modifyurl="/wenq/jsp/admin/dingdan/buyinfo.jsp?orderid="+rs.getString(1);
                 String deleteurl="/wenq/jsp/admin/dingdan/deletedingdan.jsp?orderid="+rs.getString(1);
                   %>
                   <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td>
                    <a href="<%=modifyurl%>" class="ad">修改订单</a>
					<a href="<%=deleteurl%>" class="ad">删除订单</a>
					</td>
                  
                   </tr>
                   
                   <% i++;
                  
                 } 
               %>
            
            
            </tbody>
            </table>
         <%
          }
         catch(Exception se)
         {
           throw new ServletException(se);
         }
         finally
         {
           db.close();
         }
      }
      else
      {
         %>
          <p align="center">您未登录，请<a href="index.jsp">登录</a>！</p>
         <%
      }
     %>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
