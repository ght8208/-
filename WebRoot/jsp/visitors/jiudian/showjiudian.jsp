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
    
    <title>������Ʒ��Ϣ</title>
    
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
   <h1>��ʾ��Ϣ</h1><hr/>
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
							����:<%=rs.getString(2)%>
						</div>
						<div class="hot">
						    <%-- <%if(rs.getString(4).equals("�ܺ�"))
						    {%>
						    <img src="/wenq/images/icon/fire.png" class="fire">
						    <%}%> --%>
						    ���룺<%=rs.getString(8)%>
						</div> 
					</div>
				</div>
			</td>
			<td>
				<div class="tdright">
					<div class="tdright-top">
						<div class="loca">
							λ��:<%=rs.getString(3)%>
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
							����:<br/><br/><%=rs.getString(5)%>
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
		//������������������һ����¼ʱ,��ָ���Ƶ����һ�ʼ�¼֮��
				if (!rs.next()) {
					//����forѭ��
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
       //�жϵ�ǰ�Ƿ��ڵ�һҳ,���ǵ�һҳ������ʾ����һҳ����һҳ������
       if(ShowPage!=1)
       {
      %>
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=1 %>">��һҳ</a></td>
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=ShowPage-1 %>">��һҳ</a>
			</td>
			<% 
       }
       //�ж��Ƿ������һҳ���ǣ�����ʾ�����һҳ����һҳ
       if(ShowPage!=PageCount)
       {
       %>
			<td width=150>
				<!--���ļ���������һЩȫ�ֱ�������ֹ��ÿһ�ε���ת�����У��Ա����������µĳ�ʼ���͸�ֵ  --> 
				<a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=ShowPage + 1%>">
					��һҳ </a>
			</td>
			<td width=150><a href="/wenq/jsp/visitors/jiudian/showjiudian.jsp?ToPage=<%=PageCount %>">���һҳ</a>
			</td>
			<%
         }
         %>
		</tr>
		<tr>
			<td>
			<h3>
				��ǰ�ڵ� <font size="4" color="red"><%=ShowPage%></font>
				ҳ,��<%=PageCount%>ҳ
			</h3>
			</td>
			<td colspan="4" align="center">
				<form action="/wenq/jsp/visitors/jiudian/showjiudian.jsp" method="post" name="form1">
					<input type="text" name="ToPage" value="<%=ShowPage %>"
						style="height:25px;width:40px">ҳ <a
						href="javascript:window.document.form1.submit();">GO</a>
				</form></td>
		</tr>
	</table>



	</div>
  
  </body>
</html>
