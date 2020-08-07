<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%@include file="/jsp/admin/xinwen/xinwenpage.jsp" %>
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
	
	<!-- <link rel="stylesheet" type="text/css" href="main.css">
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
	function go()
    {
       window.document.form1.submit();
    }
	</script>
<style type="text/css">
	.tupian{
	  height:100px;
	  width:200px;
	}
	</style>
  </head>
  
  <body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">新闻信息</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    
        
        
        <ul class="toolbar1">
        <li><span><img src="/wenq/images/admin/showmd/t05.png" /></span>设置</li>
        </ul>
    
    </div>
  <%
  	String ToPage = request.getParameter("ToPage");

  	//判断是否取得ToPage参数
  	if (ToPage != null) {
  		//取得指定显示的分页页数
  		ShowPage = Integer.parseInt(ToPage);

  		//下面的语句判断用户输入的页数是否正确
  		if (ShowPage >= PageCount) {
  			ShowPage = PageCount;
  		} else if (ShowPage <= 0) {
  			ShowPage = 1;
  		}
  	}

  	//DB db = new DB(); //导入的文件中已经打开了数据库和
  	//String sql ="select * from place";
  	try {
  		ResultSet rs = db.executeQuery(sql);
  		//计算欲显示页的第一笔记录位置
  		rs.absolute((ShowPage - 1) * PageSize + 1);
  %>
  <table border="1" class="tablelist">
  <thead>
  <tr>
  <th>新闻编号<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
  <th>新闻标题</th>
  <th>新闻时间：</th>
  <th>新闻介绍：</th>
  <th>新闻标签：</th>
  <th>新闻图片：</th>
  </tr>
  </thead>
	  <%
	  for(int i=1;i<=PageSize;i++)
     {
       
	  %>
	<tbody>
    <tr>
	   	<td><%=rs.getString(1)%></td>
	    <td><%=rs.getString(2)%></td>
	    <td><%=rs.getString(3)%></td>
	    <td><%=rs.getString(4)%></td>
	    <td><%=rs.getString(5)%></td>
	    <td>
	    <img src="<%=rs.getString(6)%>" class="tupian">
	    </td>

   </tr>
	<%
		//下面的语句用于输出最后一条记录时,将指针移到最后一笔记录之后
				if (!rs.next()) {
					//跳出for循环
					break;
				}
			}
	%>
	</tbody>
	</table>
	<%
		} catch (SQLException se) {
			throw new ServletException(se);

		} finally {
			db.close();
		}
	%>
	



	<table class="tablelist">
		<tr>
			<%
       //判断当前是否在第一页,不是第一页，则显示到第一页与下一页的连接
       if(ShowPage!=1)
       {
      %>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=1 %>">第一页</a></td>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=ShowPage-1 %>">上一页</a>
			</td>
			<% 
       }
       //判断是否在最后一页，是，则显示到最后一页和下一页
       if(ShowPage!=PageCount)
       {
       %>
			<td width=150>
				<!--在文件外面设置一些全局变量，防止在每一次的跳转过程中，对变量进行重新的初始化和赋值  --> 
				<a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=ShowPage + 1%>">
					下一页 </a>
			</td>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=PageCount %>">最后一页</a>
			</td>
			<%
         }
         %>
		</tr>
		<tr>
				<td>
					<h3>
						当前在第 <font size="4" color="red"><%=ShowPage%></font> 页,共<%=PageCount%>页
					</h3>
				</td>
				<td colspan="4" align="center">
				<form action="/wenq/jsp/admin/xinwen/showxinwen.jsp" method="post" name="form1">
					<input type="text" name="ToPage" value="<%=ShowPage %>"
						style="height:25px;width:40px">页 <a
						href="javascript:window.document.form1.submit();">GO</a>
				</form></td>
		</tr>
	</table>



	</div>
</div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
