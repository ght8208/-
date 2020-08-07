<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.DB" %>
<%@ page import="bean.Tools" %>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("gbk");
    response.setCharacterEncoding("gbk");
    
    
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/main/bootstrap.css" rel="stylesheet" />
    <link href="css/main/style.css" rel="stylesheet" />
    
	<script src="js/jquery-1.11.1.js"></script>
    <script src="js/zhuye/bootstrap.js"></script>
    <script type="text/javascript">
        $('#vcode_img').click(function  () {
            $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
        });
    </script>
  </head>
  
  <body>
    
	<div id="sitebar">
        <div class="container">
            <div class="row h30 lh30 f12">
            	<!-- ����½��ʼ -->
                <div class="col-lg-6">
                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>�ղ���վ</a>
                    <span class="bar-link">
						<%if(session.getAttribute("username")!=null) {
							if(session.getAttribute("username").equals("admin"))
							{%>
							<a href="/wenq/jsp/admin/admain.jsp"><img src="./images/user.png" class="userimg"></a>
							<%}
							else
							{%>
							<a href="/wenq/jsp/visitors/ownfunction.jsp"><img src="./images/user.png" class="userimg"></a>
							<%}
						}
						%>
					</span>
                    <span class="bar-link">
                        <%if(session.getAttribute("username")==null) {%>
                        	<span>���ã���ӭ�����پ�������������</span>
							<a href="jsp/loginregist/MyJsp.jsp" >��¼</a>
							<span>|</span>
							<a href="jsp/loginregist/regist-1.jsp">ע��</a>
							<%}
							else if(session.getAttribute("username").equals("admin")){
								out.print("<a href='/wenq/jsp/admin/admain.jsp'>");
								out.print("��ӭ����Ա��");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print("�˳�");
								out.print("</a>");
							}
							else{
								out.print("<a href='/wenq/jsp/visitors/ownfunction.jsp'>");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print(",�˳�");
								out.print("</a>");
								}
							 %>
                    </span>
                </div>
                <!-- ����½���� -->
                
                <!-- �Ҳ��������ʼ -->
                <div class="col-lg-6">
                    <ul class="pull-right bar-link">
                        <li><a href="/member/order.aspx">�ҵĶ���</a> | </li>
                        <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">�ͷ�����</a> | </li>
                        <li><a href="sitemap.aspx">��վ����</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-111-666</li>
                    </ul>
                </div>
                <!-- �Ҳ����������-->
            </div>
        </div>
    </div>
    <!-- sitebar -->
    
    <!-- header��ʼ -->
    <div id="header">
        <div class="container">
            <div class="row search">
            	<!-- �����logo����ʼ-->
                <div class="col-lg-4">
                    <h1 class="logo"><a href="/">
                        <img src="/wenq/images/logo.png" alt="����" class="log"/></a><img src="#" alt="��ÿ���˶����⣡" />
                    </h1>
                </div>
                <!-- �����logo������-->
                
                <!-- �м�����������ʼ-->
                <div class="col-lg-5">
                    <form action="search.aspx" method="get">
                        <label for="txt_search" class="hidden">������Ʊ ����/Ʒ��/��Ʒ</label>
                        <input id="txt_search" type="text" name="q" accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="��������������" aria-label="��������������">
                        <button id="btn_search" type="submit">����</button>
                    </form>
                </div>
                <!-- �м�������������-->
                
                <!-- �Ҳ�����������ʼ-->
                <div class="col-lg-3">
                    <div id="my_account" class="btn-group mt30 ml50 ">
                        <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">�ҵ��˻� <span class="caret"></span></button>
                        <!--��¼֮ǰ-->
                        <!--  -->
                        <!--��¼֮��-->
                        
                        	<%
                        	if(session.getAttribute("username")!=null)
                        	{ 
                        	%>
                        	<ul class="dropdown-menu p10 f12" style="width: 240px;" role="menu">
                        		<li>
                                <div class="box-title fb"><span class="pull-right"><a href="/member/" class="blue-font">�ص���ҳ</a></span><%=session.getAttribute("username").toString() %></div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="box-title">���¶���״̬��<span><a href="/member/order.aspx">�鿴���ж���</a></span></div>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/member/order.aspx?status=0">��������<i class="gray-font">(0)</i></a></li>
                            <li><a href="/member/order.aspx?status=1">��������<i class="gray-font">(1)</i></a></li>
                            <li><a href="/member/order.aspx?status=2">��������<i class="gray-font">(2)</i></a></li>
                            <li><a href="/member/order.aspx?status=3">��������<i class="gray-font">(3)</i></a></li>
                            </ul>
                        	<%
                        	}
                        	else
                        	{ 
                        	%>

							<ul class="dropdown-menu p10 f12" role="menu">
								<li><a href="/wenq/jsp/loginregist/MyJsp.jsp"
									class="btn btn-warning btn-block">������¼</a>�¿ͻ���<a
									class="blue-font" href="/wenq/jsp/loginregist/regist-1.jsp">���ע��</a>
								</li>
								<li class="divider"></li>
								<li><a href="/member/">�ҵ��˻�</a>
								</li>
								<li><a href="/member/order.aspx">�ҵĶ���</a>
								</li>
								<li><a href="#">�����ѹ���Ʒ</a>
								</li>
								<li><a href="#">Ϊ���Ƽ�</a>
								</li>
							</ul>
							<%
								}
							%>
                            
                        
                    </div>
                    <div id="mini_cart" class="btn-group mt30 ml15">
                        <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">
                            <i class="icon-main icon-cart ilb"></i>ȥ���ﳵ���� <span class="caret"></span>
                        </a>
                        <!--���ﳵΪ��-->
                        <!--<ul class="dropdown-box" role="menu">
                            <li><i class="icon-main icon-mini-cart ilb"></i>���ﳵ�л�û����Ʒ���Ͻ�ѡ���ɣ�</li>
                        </ul>-->
                        <!--���ﳵ����Ʒ-->
                        <ul class="dropdown-box" role="menu">
                            <li>
                                <div class="box-title fb p10">���¼������Ʒ</div>
                                <div class="box-content ">
                                    <ul class="box-list">
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">�����ۡ���Ȼ�ز� ����â��ζ���� 255g ̨���������</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">��779.00</b>��1<br>
                                                <span class="blue-font pull-right"><a href="">ɾ��</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">�����ۡ���Ȼ�ز� ����â��ζ���� 255g ̨���������</a></div>
                                            </div>
                                            <div class="pull-right price-info ">
                                                <b class="red-font">��779.00</b>��1<br>
                                                <span class="blue-font pull-right"><a href="">ɾ��</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">�����ۡ���Ȼ�ز� ����â��ζ���� 255g ̨���������</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">��779.00</b>��1<br>
                                                <span class="blue-font pull-right"><a href="">ɾ��</a></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="box-settlement tr">
                                    �� <b class="red-font">3</b> ����Ʒ&nbsp;&nbsp;����<b class="red-font f16">�� 2008.00</b>
                                    <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-danger">ȥ���ﳵ����</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            	<!-- �Ҳ�������������-->
            	
            </div>
            <div class="navbar navbar-red" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- dropdown open �� dropdown hover-toggle -->
                    <div id="menu" class=" dropdown hover-toggle">
                        <a class="navbar-brand dropdown-toggle" href="#">ȫ�����ܷ��� <b class="caret"></b></a>
                        <!--data-toggle="dropdown"-->
                        <div class="clearfix"></div>
                        <ul id="categories" class="dropdown-menu">
                            <li>
                            	<%
							    	DB db = new DB();
							    	
							    %>
							    <% String hr1= "/wenq/list.jsp?tehuiyou=1";%>
                                <a href="<%=hr1%>"><i class="icon-main icon-0"></i>�ػ���</a>
                                <ul class="sub-item">
                                    <li><%
									    	String sql ="select distinct thname from tehuiyou";
									    	ResultSet rs = db.executeQuery(sql);
									    	int i =1;
									    %> 
									    <a href="#">�ػ�������</a>
										<ul class="sub-item">
											<%
										    	while(rs.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thname="+rs.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
											<li><a href="<%=modifyurl%>"><%=rs.getString(1)%></a>
											</li>
										<%
    		                                   i++;
    		                                  }
                                         %>
    	
    	
										</ul></li>
                                    <li>
                                    	<%
									    	String sql1 ="select distinct thplace from tehuiyou";
									    	ResultSet rs1 = db.executeQuery(sql1);
									    	
									    %>
                                        <a href="#">�ػ���λ��</a>
                                        <ul class="sub-item">
                                        	<%
										    	while(rs1.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thplace="+rs1.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs1.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql2 ="select distinct thpingfen from tehuiyou";
									    	ResultSet rs2 = db.executeQuery(sql2);
									    	
									    %>
                                        <a href="#">�ػ�������</a>
                                        <ul class="sub-item">
                                        	<%
										    	while(rs2.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thpingfen="+rs2.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs2.getString(1)%>.0</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql3 ="select distinct thprice from tehuiyou";
									    	ResultSet rs3 = db.executeQuery(sql3);
									    	
									    %>
                                        <a href="#">�ػ��μ۸�</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs3.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thprice="+rs3.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">��<%=rs3.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql4 ="select distinct thjifendh from tehuiyou";
									    	ResultSet rs4 = db.executeQuery(sql4);
									    	
									    %>
                                        <a href="#">�ػ��εֿ�</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs4.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thjifendh="+rs4.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs4.getString(1)%>��</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                            	
								<% String hr2= "/wenq/list.jsp?menpiao=1";%>
                                <a href="<%=hr2%>"><i class="icon-main icon-1"></i>��Ʊ</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql5 ="select distinct name from goods";
									    	ResultSet rs5 = db.executeQuery(sql5);
									    	
									    %>
                                        <a href="#">��Ʊ����</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs5.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?name="+rs5.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs5.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql6 ="select distinct price from goods";
									    	ResultSet rs6 = db.executeQuery(sql6);
									    	
									    %>
                                        <a href="#">��Ʊ�۸�</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs6.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?price="+rs6.getFloat(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">��<%=rs6.getFloat(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                    
                                </ul>
                            </li>
                            <li>
                            	<% String hr3= "/wenq/list.jsp?jiudian=1";%>
                                <a href="<%=hr3%>"><i class="icon-main icon-2"></i>�Ƶ�</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql7 ="select distinct jname from jiudian";
									    	ResultSet rs7 = db.executeQuery(sql7);
									    	
									    %>
                                        <a href="#">�Ƶ�����</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs7.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jname="+rs7.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs7.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql8="select distinct jplace from jiudian";
									    	ResultSet rs8= db.executeQuery(sql8);
									    	
									    %>
                                        <a href="#">�Ƶ�λ��</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs8.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jplace="+rs8.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs8.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql9="select distinct jpingfen from jiudian";
									    	ResultSet rs9= db.executeQuery(sql9);
									    	
									    %>
                                        <a href="#">�Ƶ�����</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs9.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jpingfen="+rs9.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs9.getString(1)%>.0</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql10="select distinct jprice from jiudian";
									    	ResultSet rs10= db.executeQuery(sql10);
									    	
									    %>
                                        <a href="#">�Ƶ�۸�</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs10.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jprice="+rs10.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">��<%=rs10.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql11="select distinct jkm from jiudian";
									    	ResultSet rs11= db.executeQuery(sql11);
									    	
									    %>
                                        <a href="#">�Ƶ����</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs11.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jkm="+rs11.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs11.getString(1)%>km</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                            	<% String hr4= "/wenq/list.jsp?place=1";%>
                                <a href="<%=hr4%>"><i class="icon-main icon-8"></i>����</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql12="select distinct vname from place";
									    	ResultSet rs12= db.executeQuery(sql12);
									    	
									    %>
                                        <a href="#">��������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs12.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vname="+rs12.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs12.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql13="select distinct vplace from place";
									    	ResultSet rs13= db.executeQuery(sql13);
									    	
									    %>
                                        <a href="#">����λ��</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs13.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vplace="+rs13.getString(1);
										    		
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs13.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql14="select distinct vfamous from place";
									    	ResultSet rs14= db.executeQuery(sql14);
									    	
									    %>
                                        <a href="#">��������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs14.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vfamous="+rs14.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs14.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-5"></i>����</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql15="select distinct xdate from xinwen";
									    	ResultSet rs15= db.executeQuery(sql15);
									    	
									    %>
                                        <a href="#">��������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs15.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?xdate="+rs15.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs15.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql16="select distinct xtag from xinwen";
									    	ResultSet rs16= db.executeQuery(sql16);
									    	
									    %>
                                        <a href="#">���ű�ǩ</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs16.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?xtag="+rs16.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs16.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-4"></i>����</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql17="select distinct paymode from ordertable";
									    	ResultSet rs17= db.executeQuery(sql17);
									    	
									    %>
                                        <a href="#">֧����ʽ</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs17.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?paymode="+rs17.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs17.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="#"><i class="icon-main icon-7"></i>��̳���</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql18="select distinct ltbkname from ltbankuai";
									    	ResultSet rs18= db.executeQuery(sql18);
									    	
									    %>
                                        <a href="#">�������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs18.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?ltbkname="+rs18.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs18.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-3"></i>��̳����</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql19="select distinct lttzname from lttiezi";
									    	ResultSet rs19= db.executeQuery(sql19);
									    	
									    %>
                                        <a href="#">��������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs19.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?lttzname="+rs19.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs19.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql20="select distinct lttzjing from lttiezi";
									    	ResultSet rs20= db.executeQuery(sql20);
									    	
									    %>
                                        <a href="#">���Ӿ�Ʒ</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs20.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?lttzjing="+rs20.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs20.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-10"></i>��̳����</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql21="select distinct ltlyname from ltliuyan";
									    	ResultSet rs21= db.executeQuery(sql21);
									    	
									    %>
                                        <a href="#">��������</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs21.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?ltlyname="+rs21.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs21.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-9"></i>��������</a>
                                <ul class="sub-item">
                                    <li><a href="#">����</a></li>
                                    <li><a href="#">����</a></li>
                                    <li><a href="#">����</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav f14">
                        <li ><a href="/wenq/main.jsp">��ҳ</a></li>
                        <% String hr5= "/wenq/list.jsp?tehuiyou=1";%><li class="active"><a href="<%=hr5%>" >�ػ���</a></li>
                        <% String hr6= "/wenq/list.jsp?place=1";%><li><a href="<%=hr6%>">����</a></li>
                        <% String hr7= "/wenq/list.jsp?menpiao=1";%><li><a href="<%=hr7%>">��Ʊ</a></li>
                        <li><a href="#">��ͼ</a></li>
                        <li><a href="#">�Ż�ȯ</a></li>
                        <!--<li class="dropdown"> <a href="#">Dropdown </a> </li>-->
                    </ul>
                    <!--<ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="./">Default</a></li>
                        <li><a href="../navbar-static-top/">Static top</a></li>
                        <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                    </ul>-->
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
    <!--/#header-->

	<!-- ���ݲ��ֿ�ʼ -->
	<div class="container">
        <!-- �б�ҳ -->
        <div class="row">
        	<!-- �Ҳ��� -->
        	<div id="content" class="col-lg-10">
        		<div class="item-pro-list mt10">
                    <div class="list-item-title">
                        <div class="sort-left pull-left pl10">
                            <span>����</span>
                            <!-- <a href="">���� <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="">�۸� <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="">������ <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="">�ϼ�ʱ�� <span class="glyphicon glyphicon-arrow-down"></span></a> -->
                        </div>
                        <div class="sort-right pull-right">
                            <span><b class="red-font mr10">��10����Ʒ</b> <b class="red-font">1</b>/89</span>
                            <button type="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-chevron-left"></i>��һҳ</button>
                            <button type="button" class="btn btn-default btn-xs">��һҳ<i class="glyphicon glyphicon-chevron-right"></i></button>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="pro-list-show">
                        <ul>
                        	<%			/* ������� */
                        				//System.out.println(new String(request.getParameter("thname").getBytes("ISO-8859-1"), "gbk"));
                        				/* System.out.println(Tools.CodeToString(request.getParameter("thname"))); */
                        	            if(request.getParameter("thname")!=null)
                        	            {
                        	            	String thname=request.getParameter("thname").toString();
                        	            	/* ����ת������ */
                        	            	thname=new String(thname.getBytes("ISO-8859-1"), "gbk");
									    	String sql22="select * from tehuiyou where thname='"+thname+"'";
									    	ResultSet rs22= db.executeQuery(sql22);
									    	while(rs22.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs22.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs22.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs22.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs22.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         
                                         <%
                                         if(request.getParameter("thplace")!=null)
                        	            {
                        	            	String thplace=request.getParameter("thplace").toString();
                        	            	/* ����ת������ */
                        	            	thplace=new String(thplace.getBytes("ISO-8859-1"), "gbk");
									    	String sql23="select * from tehuiyou where thplace='"+thplace+"'";
									    	ResultSet rs23= db.executeQuery(sql23);
									    	while(rs23.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs23.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs23.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs23.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs23.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("thpingfen")!=null)
                        	            {
                        	            	String thpingfen=request.getParameter("thpingfen").toString();
                        	            	/* ����ת������ */
                        	            	thpingfen=new String(thpingfen.getBytes("ISO-8859-1"), "gbk");
									    	String sql24="select * from tehuiyou where thpingfen='"+thpingfen+"'";
									    	ResultSet rs24= db.executeQuery(sql24);
									    	while(rs24.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs24.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs24.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs24.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs24.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                           				
                           				
                           				<%
                                         if(request.getParameter("thprice")!=null)
                        	            {
                        	            	String thprice=request.getParameter("thprice").toString();
                        	            	/* ����ת������ */
                        	            	thprice=new String(thprice.getBytes("ISO-8859-1"), "gbk");
									    	String sql25="select * from tehuiyou where thprice='"+thprice+"'";
									    	ResultSet rs25= db.executeQuery(sql25);
									    	while(rs25.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs25.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs25.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs25.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs25.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("thjifendh")!=null)
                        	            {
                        	            	String thjifendh=request.getParameter("thjifendh").toString();
                        	            	/* ����ת������ */
                        	            	thjifendh=new String(thjifendh.getBytes("ISO-8859-1"), "gbk");
									    	String sql26="select * from tehuiyou where thjifendh='"+thjifendh+"'";
									    	ResultSet rs26= db.executeQuery(sql26);
									    	while(rs26.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs26.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs26.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs26.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs26.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("name")!=null)
                        	            {
                        	            	String name=request.getParameter("name").toString();
                        	            	/* ����ת������ */
                        	            	name=new String(name.getBytes("ISO-8859-1"), "gbk");
									    	String sql27="select * from goods where name='"+name+"'";
									    	ResultSet rs27= db.executeQuery(sql27);
									    	while(rs27.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?id="+rs27.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs27.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs27.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs27.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("price")!=null)
                        	            {
                        	            	Float price=Float.parseFloat(request.getParameter("price"));
                        	            	/* ����ת������ */
                        	            	/* name=new String(name.getBytes("ISO-8859-1"), "gbk"); */
									    	String sql28="select * from goods where price="+price;
									    	ResultSet rs28= db.executeQuery(sql28);
									    	while(rs28.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?id="+rs28.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs28.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs28.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs28.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("jname")!=null)
                        	            {
                        	            	String jname=request.getParameter("jname").toString();
                        	            	/* ����ת������ */
                        	            	jname=new String(jname.getBytes("ISO-8859-1"), "gbk");
									    	String sql28="select * from jiudian where jname='"+jname+"'";
									    	ResultSet rs28= db.executeQuery(sql28);
									    	while(rs28.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs28.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs28.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs28.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs28.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("jplace")!=null)
                        	            {
                        	            	String jplace=request.getParameter("jplace").toString();
                        	            	/* ����ת������ */
                        	            	jplace=new String(jplace.getBytes("ISO-8859-1"), "gbk");
									    	String sql29="select * from jiudian where jplace='"+jplace+"'";
									    	ResultSet rs29= db.executeQuery(sql29);
									    	while(rs29.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs29.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs29.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs29.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs29.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         
                                         
                                         <%
                                         if(request.getParameter("jpingfen")!=null)
                        	            {
                        	            	String jpingfen=request.getParameter("jpingfen").toString();
                        	            	/* ����ת������ */
                        	            	jpingfen=new String(jpingfen.getBytes("ISO-8859-1"), "gbk");
									    	String sql30="select * from jiudian where jpingfen='"+jpingfen+"'";
									    	ResultSet rs30= db.executeQuery(sql30);
									    	while(rs30.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs30.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs30.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs30.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs30.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                          <%
                                         if(request.getParameter("jprice")!=null)
                        	            {
                        	            	String jprice=request.getParameter("jprice").toString();
                        	            	/* ����ת������ */
                        	            	jprice=new String(jprice.getBytes("ISO-8859-1"), "gbk");
									    	String sql31="select * from jiudian where jprice='"+jprice+"'";
									    	ResultSet rs31= db.executeQuery(sql31);
									    	while(rs31.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs31.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs31.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs31.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs31.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         
                                         <%
                                         if(request.getParameter("jkm")!=null)
                        	            {
                        	            	String jkm=request.getParameter("jkm").toString();
                        	            	/* ����ת������ */
                        	            	jkm=new String(jkm.getBytes("ISO-8859-1"), "gbk");
									    	String sql32="select * from jiudian where jkm='"+jkm+"'";
									    	ResultSet rs32= db.executeQuery(sql32);
									    	while(rs32.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs32.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs32.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs32.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs32.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("vname")!=null)
                        	            {
                        	            	String vname=request.getParameter("vname").toString();
                        	            	/* ����ת������ */
                        	            	vname=new String(vname.getBytes("ISO-8859-1"), "gbk");
									    	String sql33="select * from place where vname='"+vname+"'";
									    	ResultSet rs33= db.executeQuery(sql33);
									    	while(rs33.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?vid="+rs33.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs33.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs33.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>�������</b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("vplace")!=null)
                        	            {
                        	            	String vplace=request.getParameter("vplace").toString();
                        	            	/* ����ת������ */
                        	            	vplace=new String(vplace.getBytes("ISO-8859-1"), "gbk");
									    	String sql34="select * from place where vplace='"+vplace+"'";
									    	ResultSet rs34= db.executeQuery(sql34);
									    	while(rs34.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?vid="+rs34.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs34.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs34.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>�������</b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("vfamous")!=null)
                        	            {
                        	            	String vfamous=request.getParameter("vfamous").toString();
                        	            	/* ����ת������ */
                        	            	vfamous=new String(vfamous.getBytes("ISO-8859-1"), "gbk");
									    	String sql35="select * from place where vfamous='"+vfamous+"'";
									    	ResultSet rs35= db.executeQuery(sql35);
									    	while(rs35.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?vid="+rs35.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs35.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs35.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>�������</b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("xdate")!=null)
                        	            {
                        	            	String xdate=request.getParameter("xdate").toString();
                        	            	/* ����ת������ */
                        	            	xdate=new String(xdate.getBytes("ISO-8859-1"), "gbk");
									    	String sql33="select * from xinwen where xdate='"+xdate+"'";
									    	ResultSet rs33= db.executeQuery(sql33);
									    	while(rs33.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?xid="+rs33.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs33.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs33.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��������</b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215����</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("xtag")!=null)
                        	            {
                        	            	String xtag=request.getParameter("xtag").toString();
                        	            	/* ����ת������ */
                        	            	xtag=new String(xtag.getBytes("ISO-8859-1"), "gbk");
									    	String sql34="select * from xinwen where xtag='"+xtag+"'";
									    	ResultSet rs34= db.executeQuery(sql34);
									    	while(rs34.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?xid="+rs34.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs34.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs34.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��������</b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215����</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("paymode")!=null)
                        	            {
                        	            	String paymode=request.getParameter("paymode").toString();
                        	            	/* ����ת������ */
                        	            	paymode=new String(paymode.getBytes("ISO-8859-1"), "gbk");
									    	String sql35="select * from ordertable where paymode='"+paymode+"'";
									    	ResultSet rs35= db.executeQuery(sql35);
									    	while(rs35.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?orderid="+rs35.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="/wenq/images/menpiao/slider-img-01.jpg " /></a>
				                                <div class="summary"><a href=""><%=rs35.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��110����</span><b><%=rs35.getString(3) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">У����</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("ltbkname")!=null)
                        	            {
                        	            	String ltbkname=request.getParameter("ltbkname").toString();
                        	            	/* ����ת������ */
                        	            	ltbkname=new String(ltbkname.getBytes("ISO-8859-1"), "gbk");
									    	String sql36="select * from ltbankuai where ltbkname='"+ltbkname+"'";
									    	ResultSet rs36= db.executeQuery(sql36);
									    	while(rs36.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?ltbkid="+rs36.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs36.getString(4) %>" /></a>
				                                <div class="summary"><a href=""><%=rs36.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����������</span><b><%=rs36.getString(3) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("lttzname")!=null)
                        	            {
                        	            	String lttzname=request.getParameter("lttzname").toString();
                        	            	/* ����ת������ */
                        	            	lttzname=new String(lttzname.getBytes("ISO-8859-1"), "gbk");
									    	String sql37="select * from lttiezi where lttzname='"+lttzname+"'";
									    	ResultSet rs37= db.executeQuery(sql37);
									    	while(rs37.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?lttzid="+rs37.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs37.getString(5) %>" /></a>
				                                <div class="summary"><a href=""><%=rs37.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����������</span><b><%=rs37.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("lttzjing")!=null)
                        	            {
                        	            	String lttzjing=request.getParameter("lttzjing").toString();
                        	            	/* ����ת������ */
                        	            	lttzjing=new String(lttzjing.getBytes("ISO-8859-1"), "gbk");
									    	String sql38="select * from lttiezi where lttzjing='"+lttzjing+"'";
									    	ResultSet rs38= db.executeQuery(sql38);
									    	while(rs38.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?lttzid="+rs38.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs38.getString(5) %>" /></a>
				                                <div class="summary"><a href=""><%=rs38.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����������</span><b><%=rs38.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("ltlyname")!=null)
                        	            {
                        	            	String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql39="select * from ltliuyan where ltlyname='"+ltlyname+"'";
									    	ResultSet rs39= db.executeQuery(sql39);
									    	while(rs39.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?ltlyid="+rs39.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs39.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs39.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����������</span><b><%=rs39.getString(3) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("tehuiyou")!=null)
                        	            {
                        	            	//String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	//ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql40="select * from tehuiyou ";
									    	ResultSet rs40= db.executeQuery(sql40);
									    	while(rs40.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?thid="+rs40.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs40.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs40.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font"><%=rs40.getString(3) %>����</span><b>��<%=rs40.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("menpiao")!=null)
                        	            {
                        	            	//String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	//ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql41="select * from goods ";
									    	ResultSet rs41= db.executeQuery(sql41);
									    	while(rs41.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?id="+rs41.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs41.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs41.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����</span><b>��<%=rs41.getFloat(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����215������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("place")!=null)
                        	            {
                        	            	//String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	//ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql42="select * from place ";
									    	ResultSet rs42= db.executeQuery(sql42);
									    	while(rs42.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?vid="+rs42.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs42.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs42.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font"><%=rs42.getString(3) %>����</span><b><%=rs42.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����200������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("jiudian")!=null)
                        	            {
                        	            	//String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	//ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql43="select * from jiudian ";
									    	ResultSet rs43= db.executeQuery(sql43);
									    	while(rs43.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?jid="+rs43.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs43.getString(7) %>" /></a>
				                                <div class="summary"><a href=""><%=rs43.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font"><%=rs43.getString(3) %>����</span><b><%=rs43.getString(6) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����200������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         <%
                                         if(request.getParameter("xinwen")!=null)
                        	            {
                        	            	//String ltlyname=request.getParameter("ltlyname").toString();
                        	            	/* ����ת������ */
                        	            	//ltlyname=new String(ltlyname.getBytes("ISO-8859-1"), "gbk");
									    	String sql44="select * from xinwen ";
									    	ResultSet rs44= db.executeQuery(sql44);
									    	while(rs44.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?xid="+rs44.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs44.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs44.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">����<%=rs44.getString(3) %></span><b>ϲ��:<%=rs44.getString(5) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����200������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         
                                         <%
                                         if(request.getParameter("q")!=null)
                        	            {
                        	            	//session.setAttribute("search", null);
                        	            	String q=request.getParameter("q").toString();
                        	            	/* ����ת������ */
                        	            	q=new String(q.getBytes("ISO-8859-1"), "gbk");
									    	String sql45="select * from goods where name='"+q+"'";
									    	ResultSet rs45= db.executeQuery(sql45);
									    	while(rs45.next())
									    	{
										    String modifyurl = "/wenq/detail.jsp?id="+rs45.getInt(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li>
				                                <a href="<%=modifyurl%>">
				                                    <img class="center-block" alt="" src="<%=rs45.getString(6) %>" /></a>
				                                <div class="summary"><a href=""><%=rs45.getString(2) %></a></div>
				                                <div class="price"><span class="pull-right red-font">��129����</span><b>��<%=rs45.getString(4) %></b></div>
				                                <div class="list-show-eva"><i class="icon-main icon-eva-6"></i><a href="">����21������</a></div>
				                                <button type="button" class="btn btn-default btn-xs">���ͼƬ�鿴</button>
				                                <button type="button" class="btn btn-default btn-xs">�ղ�</button>
				                            </li>
                                            <%
    		                                   
    		                                  }
    		                              }
                                         %>
                                         
                                         
                                         
                        </ul>
                    </div>
                </div>
        	
        	</div>
        	<!-- �Ҳ��� -->
        </div>
        <!-- �б�ҳ -->
    </div>
	<!-- ���ݲ��ֽ��� -->
	
	<div class="row mt20">
            <div class="col-lg-12">
                <ul class="listbar-5">
                    <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                        <p class="tc gray-font">
                            ��Ʒ��֤<br>
                            ��1��10
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                        <p class="tc gray-font">
                            ���ż���<br>
                            ������
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                        <p class="tc gray-font">
                            7�챣��<br>
                            �������˻�
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                        <p class="tc gray-font">
                            ��100Ԫ<br>
                            ���˷�
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                        <p class="tc gray-font">
                            100�Żݱ�<br>
                            =1Ԫ
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                        <p class="tc gray-font">
                            24Сʱ<br>
                            ���緢��
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                        <p class="tc gray-font">
                            7x24Сʱ<br>
                            ���߿ͷ�
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                        <p class="tc gray-font">
                            ֧�ֶ���<br>
                            ֧����ʽ
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                        <p class="tc gray-font">
                            �������<br>
                            ���ĸ���
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                        <p class="tc gray-font">
                            ɹ������<br>
                            ���۽���
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt10">
            <div class="col-lg-12 help-center">
                <ul class="help-list">
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>��������</li>
                            <li class="ontext"><a href="#">���ڴ���</a></li>
                            <li class="ontext"><a href="#">��ϵ����</a></li>
                            <li class="ontext"><a href="#">��������</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>����ָ��</li>
                            <li class="ontext"><a href="#">��������</a></li>
                            <li class="ontext"><a href="#">����Э��</a></li>
                            <li class="ontext"><a href="#">�Ż�ȯ˵��</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>֧����ʽ</li>
                            <li class="ontext"><a href="#">����֧��</a></li>
                            <li class="ontext"><a href="#">��Ǯ֧��</a></li>
                            <li class="ontext"><a href="#">֧����֧��</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>���ͷ�ʽ</li>
                            <li class="ontext"><a href="#">�˷�˵��</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>�ۺ����</li>
                            <li class="ontext"><a href="#">�˻�������</a></li>
                            <li class="ontext"><a href="#">�˻�������</a></li>
                            <li class="ontext"><a href="#">�˻�������</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>������Ϣ</li>
                            <li class="ontext"><a href="#">��������</a></li>
                            <li class="ontext"><a href="#">Ͷ�߽���</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <p class="tc lh200">
                <a href="#">��������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">��ϵ����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">��������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">�̼���פ</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">������Ƹ</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">������</a>&nbsp;&nbsp;|
                <br />
                �������������֤����³���֤ <a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">���õı���</a> <br>
                ����������88888888888888��
            </p>
        </div>
    </footer>
	
  </body>
</html>
