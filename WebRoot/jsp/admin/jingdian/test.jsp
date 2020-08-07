<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

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
	
	<!-- <link rel="stylesheet" type="text/css" href="main.css"> -->
	<link rel="stylesheet" type="text/css" href="/wenq/jsp/admin/jingdian/test.css">
<script type="text/javascript">
function destroyname(){
	   var x = document.getElementById("cont");
	   if("热门景点：浙江"==x.value){
		   x.value="";
	   }
   }
</script>

  </head>
  
  <body>
  <body>
  	<%
  	  
  	  session.setAttribute("sjing", "OK");
  	  if(session.getAttribute("splace")==null){
  	  session.setAttribute("splace", "浙江");
  	  }
   	%>
   	
   <h1>显示门票信息</h1><hr/>
<!--查询开始   -->
   <form action="Searchservlet" class="search" method="post"> 
   <input type="text" name="cont" id="cont" value="热门景点：浙江" class="searchcon" onfocus="destroyname()" > 
   <input type="submit" value=" " class="quicks">
   </form>
<!--查询结束   -->

<!--网页中部开始   -->
<div class="webmid">

<!--网页中部左侧栏开始   -->
<div class="webmid-left">
</div>
<!--网页中部左侧栏结束   -->


<!--table开始   -->
  <%
  DB db = new DB();
  //System.out.println(session.getAttribute("splace").toString());
  String sql ="select * from place where vplace='"+session.getAttribute("splace").toString()+"'";
  try{
  ResultSet rs = db.executeQuery(sql);
  %>
<div class="divtab">
  <table class="tab">
  <!-- <tr>
  <td> </td>
  <td> </td>
  </tr> -->
	  <%
	  while(rs.next())
	  {  
	  String watchurl="/wenq/jsp/admin/dingdan/buyinfo.jsp?vid="+rs.getString(1);
	  %>

    <tr>
			<td>
				<div class="tdleft">
					<div class="pic">
						<img src="<%=rs.getString(6)%>" class="show">
					</div>
					<div class="tdleft-bottom">
						<div class="name">
							景区名字:<%=rs.getString(2)%>
						</div>
						<div class="hot">
						    <%if(rs.getString(4).equals("很好"))
						    {%>
						    <img src="/wenq/images/icon/fire.png" class="fire">
						    <%}%>
						    
						</div>
					</div>
				</div>
			</td>
			<td>
				<div class="tdright">
					<div class="tdright-top">
						<div class="loca">
							景区位置:<%=rs.getString(3)%>
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
							景区介绍:<br/><br/><%=rs.getString(5)%>
						</div>
					</div>
				</div>
			</td>

		</tr>
   <%}%>
   </table>
</div>
   <% 
        }
        catch(SQLException se)
        {
         throw new ServletException(se);
        
        }
        finally
        {
          db.close();
        }
     %>
<!--table结束     -->


<!--中部右侧栏开始     -->
<div class="webmid-right">
<div class="webmid-right-top">
1</div>
<br/>
<div class="webmid-right-bottom">
1</div >
</div>
<!--中部右侧栏结束     -->

</div>

<!--网页中部结束  -->

	<a href="/wenq/jsp/admin/admain.jsp">返回上一页</a>


<!-- 底部 start-->
	<div class="webbottom">
		<div class="webbottom-left">
			<!-- 底部版权logo区 -->
			<h1 class="blogo"></h1>
		</div>
		<div class="webbottom-mid">
			<!-- 底部版权文字区 -->
			<div class="bwenzi">
				<p>版权所有 :</p>
				<p>景区地址 :</p>
				<p>官网网址 :</p>
				<p>团队介绍 :</p>
			</div>
		</div>
	</div>
<!-- 底部 end  -->
</body>
</html>
