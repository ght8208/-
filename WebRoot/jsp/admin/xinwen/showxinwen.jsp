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
    
    <title>������Ʒ��Ϣ</title>
    
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
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">������Ϣ</a></li>
    <li><a href="#">��������</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <div class="tools">
    
        
        
        <ul class="toolbar1">
        <li><span><img src="/wenq/images/admin/showmd/t05.png" /></span>����</li>
        </ul>
    
    </div>
  <%
  	String ToPage = request.getParameter("ToPage");

  	//�ж��Ƿ�ȡ��ToPage����
  	if (ToPage != null) {
  		//ȡ��ָ����ʾ�ķ�ҳҳ��
  		ShowPage = Integer.parseInt(ToPage);

  		//���������ж��û������ҳ���Ƿ���ȷ
  		if (ShowPage >= PageCount) {
  			ShowPage = PageCount;
  		} else if (ShowPage <= 0) {
  			ShowPage = 1;
  		}
  	}

  	//DB db = new DB(); //������ļ����Ѿ��������ݿ��
  	//String sql ="select * from place";
  	try {
  		ResultSet rs = db.executeQuery(sql);
  		//��������ʾҳ�ĵ�һ�ʼ�¼λ��
  		rs.absolute((ShowPage - 1) * PageSize + 1);
  %>
  <table border="1" class="tablelist">
  <thead>
  <tr>
  <th>���ű��<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
  <th>���ű���</th>
  <th>����ʱ�䣺</th>
  <th>���Ž��ܣ�</th>
  <th>���ű�ǩ��</th>
  <th>����ͼƬ��</th>
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
		//������������������һ����¼ʱ,��ָ���Ƶ����һ�ʼ�¼֮��
				if (!rs.next()) {
					//����forѭ��
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
       //�жϵ�ǰ�Ƿ��ڵ�һҳ,���ǵ�һҳ������ʾ����һҳ����һҳ������
       if(ShowPage!=1)
       {
      %>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=1 %>">��һҳ</a></td>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=ShowPage-1 %>">��һҳ</a>
			</td>
			<% 
       }
       //�ж��Ƿ������һҳ���ǣ�����ʾ�����һҳ����һҳ
       if(ShowPage!=PageCount)
       {
       %>
			<td width=150>
				<!--���ļ���������һЩȫ�ֱ�������ֹ��ÿһ�ε���ת�����У��Ա����������µĳ�ʼ���͸�ֵ  --> 
				<a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=ShowPage + 1%>">
					��һҳ </a>
			</td>
			<td width=150><a href="/wenq/jsp/admin/xinwen/showxinwen.jsp?ToPage=<%=PageCount %>">���һҳ</a>
			</td>
			<%
         }
         %>
		</tr>
		<tr>
				<td>
					<h3>
						��ǰ�ڵ� <font size="4" color="red"><%=ShowPage%></font> ҳ,��<%=PageCount%>ҳ
					</h3>
				</td>
				<td colspan="4" align="center">
				<form action="/wenq/jsp/admin/xinwen/showxinwen.jsp" method="post" name="form1">
					<input type="text" name="ToPage" value="<%=ShowPage %>"
						style="height:25px;width:40px">ҳ <a
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
