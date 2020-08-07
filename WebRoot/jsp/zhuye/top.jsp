<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
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
    
  </body>
</html>
