<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%@ page import="bean.DB"%>
<%@ page import="java.sql.*"%>
<%@include file="/jsp/visitors/jiudian/jiudianpage.jsp" %>
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
	 <link rel="stylesheet" type="text/css" href="/wenq/css/visit/test.css">
	<link rel="stylesheet" type="text/css" href="css/visit/style.css">
	
	<script type="text/javascript">
	function go()
    {
       window.document.form1.submit();
    }
	</script>

  </head>
  
  <body>
  <body>
   <h1>显示信息</h1><hr/>
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
  <table border="0">
  
	  <%
	  for(int i=1;i<=PageSize;i++)
     {
       String watchurl="/wenq/jsp/admin/dingdan/buyinfo.jsp?jid="+rs.getString(1);
	  %>
<tr>
			<td>
				<div class="tdleft">
					<div class="pic">
						<img src="<%=rs.getString(7)%>" class="show">
					</div>
					<div class="tdleft-bottom">
						<div class="name">
							名字:<%=rs.getString(2)%>
						</div>
						<div class="hot">
						    <%-- <%if(rs.getString(4).equals("很好"))
						    {%>
						    <img src="/wenq/images/icon/fire.png" class="fire">
						    <%}%> --%>
						    距离：<%=rs.getString(8)%>
						</div> 
					</div>
				</div>
			</td>
			<td>
				<div class="tdright">
					<div class="tdright-top">
						<div class="loca">
							位置:<%=rs.getString(3)%>
						</div>
						<div class="look">
							<a href="<%=watchurl%>">
							<img src="/wenq/images/icon/lookbt.png" class="lookbt">
							<div class="lookwz">点击查询</div> 
							</a>
						</div>
					</div>
					<div class="tdright-bottom">
						<div class="intro">
							介绍:<br/><br/><%=rs.getString(5)%>
						</div>
					</div>
				</div>
			</td>

		</tr>
    <%-- <tr>
	   	<td><%=rs.getString(1)%></td>
	    <td><%=rs.getString(2)%></td>
	    <td><%=rs.getString(3)%></td>
	    <td><%=rs.getString(4)%></td>
	    <td><%=rs.getString(5)%></td>
	    <td><%=rs.getString(6)%></td>
	    <td>
	    <img src="<%=rs.getString(7)%>" >
	    </td>
	    <td><%=rs.getString(8)%></td>

   </tr> --%>
	<%
		//下面的语句用于输出最后一条记录时,将指针移到最后一笔记录之后
				if (!rs.next()) {
					//跳出for循环
					break;
				}
			}
	%>

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
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=1 %>">第一页</a></td>
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=ShowPage-1 %>">上一页</a>
			</td>
			<% 
       }
       //判断是否在最后一页，是，则显示到最后一页和下一页
       if(ShowPage!=PageCount)
       {
       %>
			<td width=150>
				<!--在文件外面设置一些全局变量，防止在每一次的跳转过程中，对变量进行重新的初始化和赋值  --> 
				<a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=ShowPage + 1%>">
					下一页 </a>
			</td>
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=PageCount %>">最后一页</a>
			</td>
			<%
         }
         %>
		</tr>
		<tr>
			<td>
			<h3>
				当前在第 <font size="4" color="red"><%=ShowPage%></font>
				页,共<%=PageCount%>页
			</h3>
			</td>
			<td colspan="4" align="center">
				<form action="/wenq/jsp/visitors/jiudian/showjiudian.jsp" method="post" name="form1">
					<input type="text" name="ToPage" value="<%=ShowPage %>"
						style="height:25px;width:40px">页 <a
						href="javascript:window.document.form1.submit();">GO</a>
				</form></td>
		</tr>
	</table>



	</div>
  
  </body>
</html>
