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
    
    <title>������Ʒ��Ϣ</title>
    
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
	   if("���ž��㣺�㽭"==x.value){
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
  	  session.setAttribute("splace", "�㽭");
  	  }
   	%>
   	
   <h1>��ʾ��Ʊ��Ϣ</h1><hr/>
<!--��ѯ��ʼ   -->
   <form action="Searchservlet" class="search" method="post"> 
   <input type="text" name="cont" id="cont" value="���ž��㣺�㽭" class="searchcon" onfocus="destroyname()" > 
   <input type="submit" value=" " class="quicks">
   </form>
<!--��ѯ����   -->

<!--��ҳ�в���ʼ   -->
<div class="webmid">

<!--��ҳ�в��������ʼ   -->
<div class="webmid-left">
</div>
<!--��ҳ�в����������   -->


<!--table��ʼ   -->
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
							��������:<%=rs.getString(2)%>
						</div>
						<div class="hot">
						    <%if(rs.getString(4).equals("�ܺ�"))
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
							����λ��:<%=rs.getString(3)%>
						</div>
						<div class="look">
							<a href="<%=watchurl%>">
							<img src="/wenq/images/icon/lookbt.png" class="lookbt">
							<div class="lookwz">�����ѯ</div> 
							</a>
						</div>
					</div>
					<div class="tdright-bottom">
						<div class="intro">
							��������:<br/><br/><%=rs.getString(5)%>
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
<!--table����     -->


<!--�в��Ҳ�����ʼ     -->
<div class="webmid-right">
<div class="webmid-right-top">
1</div>
<br/>
<div class="webmid-right-bottom">
1</div >
</div>
<!--�в��Ҳ�������     -->

</div>

<!--��ҳ�в�����  -->

	<a href="/wenq/jsp/admin/admain.jsp">������һҳ</a>


<!-- �ײ� start-->
	<div class="webbottom">
		<div class="webbottom-left">
			<!-- �ײ���Ȩlogo�� -->
			<h1 class="blogo"></h1>
		</div>
		<div class="webbottom-mid">
			<!-- �ײ���Ȩ������ -->
			<div class="bwenzi">
				<p>��Ȩ���� :</p>
				<p>������ַ :</p>
				<p>������ַ :</p>
				<p>�Ŷӽ��� :</p>
			</div>
		</div>
	</div>
<!-- �ײ� end  -->
</body>
</html>
