<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>就是旅游网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/main/bootstrap.css" rel="stylesheet" />
    <link href="css/main/style.css" rel="stylesheet" />
    
	<script src="js/jquery-1.11.1.js"></script>
    <script src="js/zhuye/bootstrap.js"></script>
	

  </head>
  
  <body>
    <div id="sitebar">
        <div class="container">
            <div class="row h30 lh30 f12">
            	<!-- 左侧登陆开始 -->
                <div class="col-lg-6">
                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏网站</a>
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
                        	<span>您好，欢迎您光临就是旅游网！请</span>
							<a href="jsp/loginregist/MyJsp.jsp" >登录</a>
							<span>|</span>
							<a href="jsp/loginregist/regist-1.jsp">注册</a>
							<%}
							else if(session.getAttribute("username").equals("admin")){
								out.print("<a href='/wenq/jsp/admin/admain.jsp'>");
								out.print("欢迎管理员，");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print("退出");
								out.print("</a>");
							}
							else{
								out.print("<a href='/wenq/jsp/visitors/ownfunction.jsp'>");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print(",退出");
								out.print("</a>");
								}
							 %>
                    </span>
                </div>
                <!-- 左侧登陆结束 -->
                
                <!-- 右侧服务栏开始 -->
                <div class="col-lg-6">
                    <ul class="pull-right bar-link">
                        <li><a href="/member/order.aspx">我的订单</a> | </li>
                        <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">客服服务</a> | </li>
                        <li><a href="sitemap.aspx">网站导航</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-111-666</li>
                    </ul>
                </div>
                <!-- 右侧服务栏结束-->
            </div>
        </div>
    </div>
    <!-- sitebar -->
    
    <!-- header开始 -->
    <div id="header">
        <div class="container">
            <div class="row search">
            	<!-- 左侧栏logo区开始-->
                <div class="col-lg-4">
                    <h1 class="logo"><a href="/">
                        <img src="/wenq/images/logo.png" alt="旅游" class="log"/></a><img src="#" alt="让每个人都满意！" />
                    </h1>
                </div>
                <!-- 左侧栏logo区结束-->
                
                <!-- 中间栏搜索区开始-->
                <div class="col-lg-5">
                    <form action="/wenq/list.jsp" method="get">
                        <label for="txt_search" class="hidden">搜索门票 分类/品牌/商品</label>
                        <input id="txt_search" type="text" name="q" value=" " accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字">
                        <button id="btn_search" type="submit">搜索</button>
                    </form>
                </div>
                <!-- 中间栏搜索区结束-->
                
                <!-- 右侧栏购物区开始-->
                <div class="col-lg-3">
                    <div id="my_account" class="btn-group mt30 ml50 ">
                        <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">我的账户 <span class="caret"></span></button>
                        <!--登录之前-->
                        <!--  -->
                        <!--登录之后-->
                        
                        	<%
                        	if(session.getAttribute("username")!=null)
                        	{ 
                        	%>
                        	<ul class="dropdown-menu p10 f12" style="width: 240px;" role="menu">
                        		<li>
                                <div class="box-title fb"><span class="pull-right"><a href="/member/" class="blue-font">回到首页</a></span><%=session.getAttribute("username").toString() %></div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="box-title">最新订单状态：<span><a href="/member/order.aspx">查看所有订单</a></span></div>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/member/order.aspx?status=0">待处理订单<i class="gray-font">(0)</i></a></li>
                            <li><a href="/member/order.aspx?status=1">待处理订单<i class="gray-font">(1)</i></a></li>
                            <li><a href="/member/order.aspx?status=2">待处理订单<i class="gray-font">(2)</i></a></li>
                            <li><a href="/member/order.aspx?status=3">待处理订单<i class="gray-font">(3)</i></a></li>
                            </ul>
                        	<%
                        	}
                        	else
                        	{ 
                        	%>

							<ul class="dropdown-menu p10 f12" role="menu">
								<li><a href="/wenq/jsp/loginregist/MyJsp.jsp"
									class="btn btn-warning btn-block">立即登录</a>新客户？<a
									class="blue-font" href="/wenq/jsp/loginregist/regist-1.jsp">免费注册</a>
								</li>
								<li class="divider"></li>
								<li><a href="/member/">我的账户</a>
								</li>
								<li><a href="/member/order.aspx">我的订单</a>
								</li>
								<li><a href="#">评论已购商品</a>
								</li>
								<li><a href="#">为我推荐</a>
								</li>
							</ul>
							<%
								}
							%>
                            
                        
                    </div>
                    <div id="mini_cart" class="btn-group mt30 ml15">
                        <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">
                            <i class="icon-main icon-cart ilb"></i>去购物车结算 <span class="caret"></span>
                        </a>
                        <!--购物车为空-->
                        <!--<ul class="dropdown-box" role="menu">
                            <li><i class="icon-main icon-mini-cart ilb"></i>购物车中还没有商品，赶紧选购吧！</li>
                        </ul>-->
                        <!--购物车有商品-->
                        <ul class="dropdown-box" role="menu">
                            <li>
                                <div class="box-title fb p10">最新加入的商品</div>
                                <div class="box-content ">
                                    <ul class="box-list">
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info ">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="box-settlement tr">
                                    共 <b class="red-font">3</b> 件商品&nbsp;&nbsp;共计<b class="red-font f16">￥ 2008.00</b>
                                    <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-danger">去购物车结算</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            	<!-- 右侧栏购物区结束-->
            	
            </div>
            <div class="navbar navbar-red" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- dropdown open 和 dropdown hover-toggle -->
                    <div id="menu" class=" dropdown open">
                        <a class="navbar-brand dropdown-toggle" href="#">全部功能分类 <b class="caret"></b></a>
                        <!--data-toggle="dropdown"-->
                        <div class="clearfix"></div>
                        <ul id="categories" class="dropdown-menu">
                            <li>
                            	<%
							    	DB db = new DB();
							    	
							    %>
							    <% String hr1= "/wenq/list.jsp?tehuiyou=1";%>
                                <a href="<%=hr1%>"><i class="icon-main icon-0"></i>特惠游</a>
                                <ul class="sub-item">
                                    <li><%
									    	String sql ="select distinct thname from tehuiyou";
									    	ResultSet rs = db.executeQuery(sql);
									    	int i =1;
									    %> 
									    <a href="#">特惠游名称</a>
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
                                        <a href="#">特惠游位置</a>
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
                                        <a href="#">特惠游评分</a>
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
                                        <a href="#">特惠游价格</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs3.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thprice="+rs3.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs3.getString(1)%></a></li>
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
                                        <a href="#">特惠游抵扣</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs4.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thjifendh="+rs4.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs4.getString(1)%>分</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                            	
								<% String hr2= "/wenq/list.jsp?menpiao=1";%>
                                <a href="<%=hr2%>"><i class="icon-main icon-1"></i>门票</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql5 ="select distinct name from goods";
									    	ResultSet rs5 = db.executeQuery(sql5);
									    	
									    %>
                                        <a href="#">门票名称</a>
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
                                        <a href="#">门票价格</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs6.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?price="+rs6.getFloat(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs6.getFloat(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                    
                                </ul>
                            </li>
                            <li>
                            	<% String hr3= "/wenq/list.jsp?jiudian=1";%>
                                <a href="<%=hr3%>"><i class="icon-main icon-2"></i>酒店</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql7 ="select distinct jname from jiudian";
									    	ResultSet rs7 = db.executeQuery(sql7);
									    	
									    %>
                                        <a href="#">酒店名称</a>
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
                                        <a href="#">酒店位置</a>
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
                                        <a href="#">酒店评分</a>
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
                                        <a href="#">酒店价格</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs10.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jprice="+rs10.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs10.getString(1)%></a></li>
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
                                        <a href="#">酒店距离</a>
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
                                <a href="<%=hr4%>"><i class="icon-main icon-8"></i>景点</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql12="select distinct vname from place";
									    	ResultSet rs12= db.executeQuery(sql12);
									    	
									    %>
                                        <a href="#">景点名称</a>
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
                                        <a href="#">景区位置</a>
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
                                        <a href="#">景区人气</a>
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
                                <a href="#"><i class="icon-main icon-5"></i>新闻</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql15="select distinct xdate from xinwen";
									    	ResultSet rs15= db.executeQuery(sql15);
									    	
									    %>
                                        <a href="#">新闻日期</a>
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
                                        <a href="#">新闻标签</a>
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
                                <a href="#"><i class="icon-main icon-4"></i>订单</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql17="select distinct paymode from ordertable";
									    	ResultSet rs17= db.executeQuery(sql17);
									    	
									    %>
                                        <a href="#">支付方式</a>
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
                                <a href="#"><i class="icon-main icon-7"></i>论坛板块</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql18="select distinct ltbkname from ltbankuai";
									    	ResultSet rs18= db.executeQuery(sql18);
									    	
									    %>
                                        <a href="#">板块名称</a>
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
                                <a href="#"><i class="icon-main icon-3"></i>论坛帖子</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql19="select distinct lttzname from lttiezi";
									    	ResultSet rs19= db.executeQuery(sql19);
									    	
									    %>
                                        <a href="#">帖子名称</a>
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
                                        <a href="#">帖子精品</a>
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
                                <a href="#"><i class="icon-main icon-10"></i>论坛留言</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql21="select distinct ltlyname from ltliuyan";
									    	ResultSet rs21= db.executeQuery(sql21);
									    	
									    %>
                                        <a href="#">留言名称</a>
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
                                <a href="#"><i class="icon-main icon-9"></i>关于我们</a>
                                <ul class="sub-item">
                                    <li><a href="#">帮助</a></li>
                                    <li><a href="#">关于</a></li>
                                    <li><a href="#">设置</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav f14">
                        <li ><a href="/wenq/main.jsp">首页</a></li>
                        <% String hr5= "/wenq/list.jsp?tehuiyou=1";%><li class="active"><a href="<%=hr5%>" >特惠游</a></li>
                        <% String hr6= "/wenq/list.jsp?place=1";%><li><a href="<%=hr6%>">景区</a></li>
                        <% String hr7= "/wenq/list.jsp?menpiao=1";%><li><a href="<%=hr7%>">门票</a></li>
                        <li><a href="#">地图</a></li>
                        <li><a href="#">优惠券</a></li>
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
    <div class="container">
        <!-- 内容部分开始 -->




        <!-- 第一行 轮播广告 开始 -->
        <div class="row first lazy">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div id="focus_carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#focus_carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#focus_carousel" data-slide-to="1" class=""></li>
                        <li data-target="#focus_carousel" data-slide-to="2" class=""></li>
                        <li data-target="#focus_carousel" data-slide-to="3" class=""></li>
                    </ol>
                    <!-- 广告区开始 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="/wenq/images/zhuye/advertise/huanghe.jpg" />
                        </div>
                        <%
						String sql56="select * from tehuiyou LIMIT 0,3";
						ResultSet rs56= db.executeQuery(sql56);
						while(rs56.next())
						{
						String modifyurl = "/wenq/detail.jsp?thid="+rs56.getString(1);			    	
						%>
                        <div class="item">
                            <a href="<%=modifyurl%>" target="rightFrame">
                            <img src="<%=rs56.getString(7)%>" />
                            </a>
                        </div>
                        <%}%>
                        
                    </div>
                    <!-- 广告区结束-->
                    <a class="left carousel-control" href="#focus_carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#focus_carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
                <div id="topic_scroll" class="topic-scroll slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <ul class="topic-list">
                            	<%
								String sql57="select * from goods LIMIT 0,4";
								ResultSet rs57= db.executeQuery(sql57);
								while(rs57.next())
								{
								String modifyurl = "/wenq/detail.jsp?id="+rs57.getString(1);			    	
								%>
								<li>
								<a href="<%=modifyurl%>" target="rightFrame">
                                <img alt="" src="<%=rs57.getString(6)%>" />
                                </a>
                                </li>
		                        <%}%>
                                
                                
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="topic-list">
                               <%
								String sql58="select * from place LIMIT 0,4";
								ResultSet rs58= db.executeQuery(sql58);
								while(rs58.next())
								{
								String modifyurl = "/wenq/detail.jsp?id="+rs58.getString(1);			    	
								%>
								<li>
								<a href="<%=modifyurl%>" target="rightFrame">
                                <img alt="" src="<%=rs58.getString(6)%>" />
                                </a>
                                </li>
		                        <%}%>
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="topic-list">
                                <%
								String sql59="select * from tehuiyou LIMIT 0,4";
								ResultSet rs59= db.executeQuery(sql59);
								while(rs59.next())
								{
								String modifyurl = "/wenq/detail.jsp?thid="+rs59.getString(1);			    	
								%>
								<li>
								<a href="<%=modifyurl%>" target="rightFrame">
                                <img alt="" src="<%=rs59.getString(7)%>" />
                                </a>
                                </li>
		                        <%}%>
                            </ul>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#topic_scroll" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
                    <a class="right carousel-control" href="#topic_scroll" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
            	<%
						String sql60="select * from xinwen LIMIT 0,5";
						ResultSet rs60= db.executeQuery(sql60);
						while(rs60.next())
						{
						String modifyurl = "/wenq/detail.jsp?xid="+rs60.getString(1);			    	
						%>
                        <div class="mb10">
                            <a href="<%=modifyurl%>" target="rightFrame">
                            <img src="<%=rs60.getString(6)%>" class="mb"/>
                            </a>
                        </div>
                        <%}%>
                
            </div>
        </div>
        <!-- 第一行 轮播广告 结束 -->

        <!-- 促销和特价模块开始 -->
        <div class="row mb10 lazy">
            <div class="col-lg-12">
                <ul class="nav-orange nav-justified" id="myTab">
                    <li class="active"><a href="#special" data-toggle="tab">特价旅游</a></li>
                    <li><a href="#new" data-toggle="tab">新品上架</a></li>
                    <li><a href="#hot" data-toggle="tab">热评路线</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="special">
                        <ul class="listbar">
                        	<%
                        	String sql22="select * from tehuiyou LIMIT 0,6";
                        	ResultSet rs22= db.executeQuery(sql22);
                        	while(rs22.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs22.getString(1);
                        	%>
                            <li><a href="<%=modifyurl%>">
                                <img alt="" class="center-block" src="<%=rs22.getString(7)%>"></a>
                                <div class="summary"><a href="">【五折】自然风光 <%=rs22.getString(2)%> <%=rs22.getString(3)%>地区</a></div>
                                <div class="price mt5">抢购价：<b>¥<%=rs22.getString(8)%></b><i class="fr">原价<%=rs22.getString(5)%></i></div>
                            </li>
                            <% }%>
                            
                        </ul>
                    </div>
                    <div class="tab-pane" id="new">
                        <ul class="listbar">
                            <%
                        	String sql23="select * from goods LIMIT 0,6";
                        	ResultSet rs23= db.executeQuery(sql23);
                        	while(rs23.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?id="+rs23.getString(1);
                        	%>
                            <li><a href="<%=modifyurl%>">
                                <img alt="" class="center-block" src="<%=rs23.getString(6)%>"></a>
                                <div class="summary"><a href="">【五折】自然风光 <%=rs23.getString(2)%> 自然风光地区</a></div>
                                <div class="price mt5">抢购价：<b>¥<%=rs23.getFloat(4)%></b><i class="fr">送200优惠包</i></div>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                    <div class="tab-pane" id="hot">
                        <ul class="listbar">
                            <%
                        	String sql24="select * from tehuiyou LIMIT 0,6";
                        	ResultSet rs24= db.executeQuery(sql24);
                        	while(rs24.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs24.getString(1);
                        	%>
                            <li><a href="<%=modifyurl%>">
                                <img alt="" class="center-block" src="<%=rs24.getString(7)%>"></a>
                                <div class="summary"><a href="">【五折】自然风光 <%=rs24.getString(2)%> <%=rs24.getString(3)%>地区</a></div>
                                <div class="price mt5">抢购价：<b>¥<%=rs24.getString(8)%></b><i class="fr">原价<%=rs24.getString(5)%></i></div>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 促销模块结束 -->

        <!-- 楼层1 节日促销开始 -->
        <div class="row mb10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-1 floor-text"><i class="icon-main icon-floor-1 pull-left mt10"></i>优惠推荐</div>
                <div class="floor-show">
                    <img src="/wenq/images/zhuye/advertise/floor-2.jpg">
                </div>
            </div>
            <div class="col-lg-10">
                <div class="floor-title floor-bb-1 tr f12"><a href="">未过期的活动名称</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">春节活动</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">免运费活动</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <% String hre= "/wenq/list.jsp?tehuiyou=1";%><a href="<%=hre%>">更多&gt;&gt;</a></div>
                <div class="floor-product">
                    <ul class="listbar-2">
                    	<%
                        	String sql25="select * from tehuiyou LIMIT 0,4";
                        	ResultSet rs25= db.executeQuery(sql25);
                        	while(rs25.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs25.getString(1);
                        	%>
                        <li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block" src="<%=rs25.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs25.getString(2)%> <%=rs25.getString(3)%>地区</a></div>
                            <div class="price mt5">抢购价：<b>¥<%=rs25.getString(8)%></b><i class="fr">原价<%=rs25.getString(5)%></i></div>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 楼层1 节日促销结束 -->

        <!-- 楼层2  -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-2 floor-text"><i class="icon-main icon-floor-2 pull-left mt10"></i>特惠游推荐</div>
                <!-- 广告区开始 -->
                <div class="floor-brand">
                    <ul class="brand-list">
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-2.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-3.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-4.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-5.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                    </ul>
                    <a href="">
                        <img class="position" src="/wenq/images/zhuye/advertise/floor-2.jpg"></a>
                </div>
                <!-- 广告区结束 -->
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-1 tab-bg-1" id="floor-fir-tab">
                    <li class="active"><a href="#fol-fir-1" data-toggle="tab">首页</a></li>
                    <li><a href="#fol-fir-2" data-toggle="tab">浙江</a></li>
                    <li><a href="#fol-fir-3" data-toggle="tab">杭州</a></li>
                    <li><a href="#fol-fir-4" data-toggle="tab">衢州</a></li>
                    <li><a href="#fol-fir-5" data-toggle="tab">温州</a></li>
                    <li><a href="#fol-fir-6" data-toggle="tab">宁波</a></li>
                    <li><a href="#fol-fir-7" data-toggle="tab">江苏</a></li>
                    <li><a href="#fol-fir-8" data-toggle="tab">南京</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="fol-fir-1">
                        <ul class="listbar-3">
                        	<%
                        	String sql26="select * from tehuiyou LIMIT 0,8";
                        	ResultSet rs26= db.executeQuery(sql26);
                        	
                        	while(rs26.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs26.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs26.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs26.getString(2)%> <%=rs26.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs26.getString(8)%></b><i class="fr">原价<%=rs26.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                            
                        </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-2">
                        <ul class="listbar-3">
                            <%
                        	String sql27="select * from tehuiyou where thplace='浙江' LIMIT 0,8";
                        	ResultSet rs27= db.executeQuery(sql27);
                        	while(rs27.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs27.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs27.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs27.getString(2)%> <%=rs27.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs27.getString(8)%></b><i class="fr">原价<%=rs27.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                        </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-3">
                    <ul class="listbar-3">
                    <%
                        	String sql28="select * from tehuiyou where thplace='杭州' LIMIT 0,8";
                        	ResultSet rs28= db.executeQuery(sql28);
                        	while(rs28.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs28.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs28.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs28.getString(2)%> <%=rs28.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs28.getString(8)%></b><i class="fr">原价<%=rs28.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-4">
                    <ul class="listbar-3">
                    <%
                        	String sql29="select * from tehuiyou where thplace='衢州' LIMIT 0,8";
                        	ResultSet rs29= db.executeQuery(sql29);
                        	while(rs29.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs29.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs29.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs29.getString(2)%> <%=rs29.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs29.getString(8)%></b><i class="fr">原价<%=rs29.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-5">
                    <ul class="listbar-3">
                    <%
                        	String sql30="select * from tehuiyou where thplace='温州' LIMIT 0,8";
                        	ResultSet rs30= db.executeQuery(sql30);
                        	while(rs30.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs30.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs30.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs30.getString(2)%> <%=rs30.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs30.getString(8)%></b><i class="fr">原价<%=rs30.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-6">
                    <ul class="listbar-3">
                    <%
                        	String sql31="select * from tehuiyou where thplace='宁波' LIMIT 0,8";
                        	ResultSet rs31= db.executeQuery(sql31);
                        	while(rs31.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs31.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs31.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs31.getString(2)%> <%=rs31.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs31.getString(8)%></b><i class="fr">原价<%=rs31.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-7">
                    <ul class="listbar-3">
                    <%
                        	String sql32="select * from tehuiyou where thplace='江苏' LIMIT 0,8";
                        	ResultSet rs32= db.executeQuery(sql32);
                        	while(rs32.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs32.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs32.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs32.getString(2)%> <%=rs32.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs32.getString(8)%></b><i class="fr">原价<%=rs32.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fir-8">
                    <ul class="listbar-3">
                    <%
                        	String sql33="select * from tehuiyou where thplace='南京' LIMIT 0,8";
                        	ResultSet rs33= db.executeQuery(sql33);
                        	while(rs33.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs33.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs33.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs33.getString(2)%> <%=rs33.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs33.getString(8)%></b><i class="fr">原价<%=rs33.getString(5)%></i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-2 tr f12"><% String hre1= "/wenq/list.jsp?tehuiyou=1";%><a href="<%=hre1%>">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    <img src="/wenq/images/zhuye/advertise/f5-r-ad.jpg">
                </div>
            </div>
        </div>
        <!-- 楼层2 结束 -->

        <!-- 楼层3 开始 -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-3 floor-text"><i class="icon-main icon-floor-3 pull-left mt10"></i>门票推荐</div>
                <div class="floor-brand">
                    <ul class="brand-list">
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-2.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-3.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-4.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-5.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                    </ul>
                    <a href="">
                        <img class="position" src="/wenq/images/zhuye/advertise/floor-2.jpg"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-2 tab-bg-2" id="floor-sec-tab">
                    <li class="active"><a href="#fol-sec-1" data-toggle="tab">门票</a></li>
                    <!-- <li><a href="#fol-sec-2" data-toggle="tab">下装</a></li>
                    <li><a href="#fol-sec-3" data-toggle="tab">包包</a></li>
                    <li><a href="#fol-sec-4" data-toggle="tab">配饰</a></li>
                    <li><a href="#fol-sec-5" data-toggle="tab">内衣</a></li>
                    <li><a href="#fol-sec-6" data-toggle="tab">鞋子</a></li>
                    <li><a href="#fol-sec-7" data-toggle="tab">护肤</a></li>
                    <li><a href="#fol-sec-8" data-toggle="tab">彩妆</a></li> -->
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="fol-sec-1">
                        <ul class="listbar-3">
                            <%
                        	String sql34="select * from goods LIMIT 0,8";
                        	ResultSet rs34= db.executeQuery(sql34);
                        	while(rs34.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?id="+rs34.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs34.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【五折】自然风光 <%=rs34.getString(2)%> 地区</a></div>
                            <div class="price ">抢购价：<b>¥<%=rs34.getFloat(4)%></b><i class="fr">原价<%=rs34.getFloat(4)%></i></div>
                        	</li>
                        	<% }%>
                        </ul>
                    </div>
                    <!-- <div class="tab-pane" id="fol-sec-2">2</div>
                    <div class="tab-pane" id="fol-sec-3">3</div>
                    <div class="tab-pane" id="fol-sec-4">4</div>
                    <div class="tab-pane" id="fol-sec-5">5</div>
                    <div class="tab-pane" id="fol-sec-6">6</div>
                    <div class="tab-pane" id="fol-sec-7">7</div>
                    <div class="tab-pane" id="fol-sec-8">8</div> -->
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-3 tr f12"><% String hre2= "/wenq/list.jsp?menpiao=1";%><a href="<%=hre2%>">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    <img src="/wenq/images/zhuye/advertise/f2-r-ad.jpg">
                </div>
            </div>
        </div>
        <!-- 楼层3  -->

        <!-- 楼层4  -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-4 floor-text"><i class="icon-main icon-floor-4 pull-left mt10"></i>景点推荐</div>
                <div class="floor-brand">
                    <ul class="brand-list">
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-2.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-3.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-4.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-5.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                    </ul>
                    <a href="">
                        <img class="position" src="/wenq/images/zhuye/advertise/floor-2.jpg"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-3 tab-bg-3" id="floor-thi-tab">
                    <li class="active"><a href="#fol-thi-1" data-toggle="tab">首页</a></li>
                    <li><a href="#fol-thi-2" data-toggle="tab">浙江</a></li>
                    <li><a href="#fol-thi-3" data-toggle="tab">杭州</a></li>
                    <li><a href="#fol-thi-4" data-toggle="tab">衢州</a></li>
                    <li><a href="#fol-thi-5" data-toggle="tab">温州</a></li>
                    <li><a href="#fol-thi-6" data-toggle="tab">宁波</a></li>
                    <li><a href="#fol-thi-7" data-toggle="tab">江苏</a></li>
                    <li><a href="#fol-thi-8" data-toggle="tab">南京</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="fol-thi-1">
                        <ul class="listbar-3">
                            <%
                        	String sql35="select * from place LIMIT 0,8";
                        	ResultSet rs35= db.executeQuery(sql35);
                        	while(rs35.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs35.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs35.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                        </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-2">
                    <ul class="listbar-3">
                    <%
                        	String sql36="select * from place where vplace='浙江' LIMIT 0,8";
                        	ResultSet rs36= db.executeQuery(sql36);
                        	while(rs36.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs36.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs36.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
					</div>
                    <div class="tab-pane" id="fol-thi-3">
                    <ul class="listbar-3">
                    <%
                        	String sql37="select * from place where vplace='杭州' LIMIT 0,8";
                        	ResultSet rs37= db.executeQuery(sql37);
                        	while(rs37.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs37.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs37.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-4">
                    <ul class="listbar-3">
                    <%
                        	String sql38="select * from place where vplace='衢州' LIMIT 0,8";
                        	ResultSet rs38= db.executeQuery(sql38);
                        	while(rs38.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs38.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs38.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-5">
                    <ul class="listbar-3">
                    <%
                        	String sql39="select * from place where vplace='温州' LIMIT 0,8";
                        	ResultSet rs39= db.executeQuery(sql39);
                        	while(rs39.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs39.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs39.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-6">
                    <ul class="listbar-3">
                    <%
                        	String sql40="select * from place where vplace='宁波' LIMIT 0,8";
                        	ResultSet rs40= db.executeQuery(sql40);
                        	while(rs40.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs40.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs40.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-7">
                    <ul class="listbar-3">
                    <%
                        	String sql41="select * from place where vplace='江苏' LIMIT 0,8";
                        	ResultSet rs41= db.executeQuery(sql41);
                        	while(rs41.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs41.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs41.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-thi-8">
                    <ul class="listbar-3">
                    <%
                        	String sql42="select * from place where vplace='南京' LIMIT 0,8";
                        	ResultSet rs42= db.executeQuery(sql42);
                        	while(rs42.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?vid="+rs42.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs42.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【景区】自然风光   地区</a></div>
                            <div class="price ">抢购：<b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-4 tr f12"><% String hre3= "/wenq/list.jsp?place=1";%><a href="<%=hre3%>">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    <img src="/wenq/images/zhuye/advertise/f5-r-ad.jpg">
                </div>
            </div>
        </div>
        <!-- 楼层4  -->

        <!-- 楼层5  -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-5 floor-text"><i class="icon-main icon-floor-5 pull-left mt10"></i>酒店推荐</div>
                <div class="floor-brand">
                    <ul class="brand-list">
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-2.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-3.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-4.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-5.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                    </ul>
                    <a href="">
                        <img class="position" src="/wenq/images/zhuye/advertise/floor-2.jpg"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-4 tab-bg-4" id="floor-fou-tab">
                    <li class="active"><a href="#fol-fou-1" data-toggle="tab">首页</a></li>
                    <li><a href="#fol-fou-2" data-toggle="tab">浙江</a></li>
                    <li><a href="#fol-fou-3" data-toggle="tab">杭州</a></li>
                    <li><a href="#fol-fou-4" data-toggle="tab">衢州</a></li>
                    <li><a href="#fol-fou-5" data-toggle="tab">温州</a></li>
                    <li><a href="#fol-fou-6" data-toggle="tab">宁波</a></li>
                    <li><a href="#fol-fou-7" data-toggle="tab">江苏</a></li>
                    <li><a href="#fol-fou-8" data-toggle="tab">南京</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="fol-fou-1">
                        <ul class="listbar-3">
                            <%
                        	String sql43="select * from jiudian LIMIT 0,8";
                        	ResultSet rs43= db.executeQuery(sql43);
                        	while(rs43.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs43.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs43.getString(7)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs43.getString(2)%><%=rs43.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs43.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                        </ul>
                    </div>
                    <div class="tab-pane" id="fol-fou-2">
                    <ul class="listbar-3">
                    <%
                        	String sql44="select * from jiudian where jplace='浙江' LIMIT 0,8";
                        	ResultSet rs44= db.executeQuery(sql44);
                        	while(rs44.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs44.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs44.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs44.getString(2)%><%=rs44.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs44.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
					</div>
                    <div class="tab-pane" id="fol-fou-3">
                    <ul class="listbar-3">
                    <%
                        	String sql45="select * from jiudian where jplace='杭州' LIMIT 0,8";
                        	ResultSet rs45= db.executeQuery(sql45);
                        	while(rs45.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs45.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs45.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs45.getString(2)%><%=rs45.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs45.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
					</div>
                    <div class="tab-pane" id="fol-fou-4">
                    <ul class="listbar-3">
                    <%
                        	String sql46="select * from jiudian where jplace='衢州' LIMIT 0,8";
                        	ResultSet rs46= db.executeQuery(sql46);
                        	while(rs46.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs46.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs46.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs46.getString(2)%><%=rs46.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs46.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fou-5">
                    <ul class="listbar-3">
                    <%
                        	String sql47="select * from jiudian where jplace='温州' LIMIT 0,8";
                        	ResultSet rs47= db.executeQuery(sql47);
                        	while(rs47.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs47.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs47.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs47.getString(2)%><%=rs47.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs47.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fou-6">
                    <ul class="listbar-3">
                    <%
                        	String sql48="select * from jiudian where jplace='宁波' LIMIT 0,8";
                        	ResultSet rs48= db.executeQuery(sql48);
                        	while(rs48.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs48.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs48.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs48.getString(2)%><%=rs48.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs48.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fou-7">
                    <ul class="listbar-3">
                    <%
                        	String sql49="select * from jiudian where jplace='江苏' LIMIT 0,8";
                        	ResultSet rs49= db.executeQuery(sql49);
                        	while(rs49.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs49.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs49.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs49.getString(2)%><%=rs49.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs49.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <div class="tab-pane" id="fol-fou-8">
                    <ul class="listbar-3">
                    <%
                        	String sql50="select * from jiudian where jplace='南京' LIMIT 0,8";
                        	ResultSet rs50= db.executeQuery(sql50);
                        	while(rs50.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?jid="+rs50.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs50.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【酒店】自然风光<%=rs50.getString(2)%><%=rs50.getString(3)%>地区</a></div>
                            <div class="price ">抢购价：<%=rs50.getString(6)%><b>¥点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-5 tr f12"><% String hre4= "/wenq/list.jsp?jiudian=1";%><a href="<%=hre4%>">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    <img src="/wenq/images/zhuye/advertise/f2-r-ad.jpg">
                </div>
            </div>
        </div>
        <!-- 楼层5 结束 -->

        <!-- 楼层6 开始 -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-6 floor-text"><i class="icon-main icon-floor-6 pull-left mt10"></i>新闻推荐</div>
                <div class="floor-brand">
                    <ul class="brand-list">
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-2.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-3.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-4.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-5.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-0.jpg"></a></li>
                        <li><a href="">
                            <img src="/wenq/images/zhuye/advertise/brand-1.jpg"></a></li>
                    </ul>
                    <a href="">
                        <img class="position" src="/wenq/images/zhuye/advertise/floor-2.jpg"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-5 tab-bg-5" id="floor-fif-tab">
                    <li class="active"><a href="#fol-fif-1" data-toggle="tab">首页</a></li>
                    <li><a href="#fol-fif-2" data-toggle="tab">登山</a></li>
                    <!-- <li><a href="#fol-fif-3" data-toggle="tab">包包</a></li>
                    <li><a href="#fol-fif-4" data-toggle="tab">配饰</a></li>
                    <li><a href="#fol-fif-5" data-toggle="tab">内衣</a></li>
                    <li><a href="#fol-fif-6" data-toggle="tab">鞋子</a></li>
                    <li><a href="#fol-fif-7" data-toggle="tab">护肤</a></li>
                    <li><a href="#fol-fif-8" data-toggle="tab">彩妆</a></li> -->
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="fol-fif-1">
                        <ul class="listbar-3">
                            <%
                        	String sql51="select * from xinwen LIMIT 0,8";
                        	ResultSet rs51= db.executeQuery(sql51);
                        	while(rs51.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?xid="+rs51.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs51.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【新闻】奇闻趣事<%=rs51.getString(2)%> 地区</a></div>
                            <div class="price ">查看：<b>点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                        </ul>
                    </div>
                    <div class="tab-pane" id="fol-fif-2">
                    <ul class="listbar-3">
                    <%
                        	String sql52="select * from xinwen where xtag='登山' LIMIT 0,8";
                        	ResultSet rs52= db.executeQuery(sql52);
                        	while(rs52.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?xid="+rs52.getString(1);
                        	%>
                        	<li><a href="<%=modifyurl%>">
                            <img alt="" class="center-block1" src="<%=rs52.getString(6)%>"></a>
                            <div class="summary mt20"><a href="">【新闻】奇闻趣事<%=rs52.getString(2)%> 地区</a></div>
                            <div class="price ">查看：<b>点击</b><i class="fr">送200</i></div>
                        	</li>
                        	<% }%>
                    </ul>
                    </div>
                    <!-- <div class="tab-pane" id="fol-fif-3">3</div>
                    <div class="tab-pane" id="fol-fif-4">4</div>
                    <div class="tab-pane" id="fol-fif-5">5</div>
                    <div class="tab-pane" id="fol-fif-6">6</div>
                    <div class="tab-pane" id="fol-fif-7">7</div>
                    <div class="tab-pane" id="fol-fif-8">8</div> -->
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-6 tr f12"><% String hre5= "/wenq/list.jsp?xinwen=1";%><a href="<%=hre5%>">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    <img src="/wenq/images/zhuye/advertise/f5-r-ad.jpg">
                </div>
            </div>
        </div>
        <!-- 楼层6 结束 -->

        <!-- 最新晒单模块开始 -->
        <div class="row mt10 lazy">
            <div class="col-lg-4">
                <div class="mod-title mod-bb-1 mod-text"><i class="icon-main icon-mod-1 pull-left"></i><span class="pull-right f12"><a href="">更多&gt;</a></span>最新晒单</div>
                <div class="mod-wrap">
                    <ul class="listbar-4">
                        
                        <%
                        	String sql53="select * from goods  LIMIT 0,2";
                        	ResultSet rs53= db.executeQuery(sql53);
                        	while(rs53.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?id="+rs53.getString(1);
                        	%>
                        	<li>
                            <div class="pull-left mod-posi-div">
                                <i class="icon-main mod-posi-i icon-mod-show pull-left"></i><a href="">
                                    <img alt="" class="center-block" src="<%=rs53.getString(6)%>"></a>
                            </div>
                            <div class="green-font summary"><a href="">你的名字：<%=rs53.getString(2)%></a></div>
                            <div class="summary gray-font"><%=rs53.getString(5)%></div>
                        	</li>
                        	<% }%>
                        
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="mod-title mod-bb-2 mod-text"><i class="icon-main icon-mod-2 pull-left"></i><span class="pull-right f12"><a href="">更多&gt;</a></span>热门商品</div>
                <div class="mod-wrap">
                    <ul class="listbar-4">
                    	<%
                        	String sql54="select * from tehuiyou  LIMIT 0,2";
                        	ResultSet rs54= db.executeQuery(sql54);
                        	while(rs54.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?thid="+rs54.getString(1);
                        	%>
                        	<li>
                            <div class="pull-left mod-posi-div">
                                <i class="icon-main mod-posi-i icon-mod-show pull-left"></i><a href="">
                                    <img alt="" class="center-block" src="<%=rs54.getString(7)%>"></a>
                            </div>
                            <div class="green-font summary"><a href="">商品名称:<%=rs54.getString(2)%></a></div>
                            <div class="summary gray-font"><%=rs54.getString(3)%></div>
                        	</li>
                        	<% }%>
                        
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="mod-title mod-bb-3 mod-text"><i class="icon-main icon-mod-3 pull-left"></i>大家在省</div>
                <div class="mod-wrap">
                    <ul class="listbar-4">
                        <%
                        	String sql55="select * from goods  LIMIT 0,2";
                        	ResultSet rs55= db.executeQuery(sql55);
                        	while(rs55.next())
                        	{
                        	String modifyurl = "/wenq/detail.jsp?id="+rs55.getString(1);
                        	%>
                        	<li>
                            <div class="pull-left mod-posi-div">
                                <i class="icon-main mod-posi-i icon-mod-show pull-left"></i><a href="">
                                    <img alt="" class="center-block" src="<%=rs55.getString(6)%>"></a>
                            </div>
                            <div class="green-font summary"><a href="">大家都在省：<%=rs55.getString(2)%></a></div>
                            <div class="summary gray-font"><%=rs55.getString(5)%></div>
                        	</li>
                        	<% }%>
                    </ul>
                   
                </div>
            </div>
        </div>
        <!-- 最新晒单模块结束 -->




        <!-- 内容部分结束 -->
        <div class="row mt20">
            <div class="col-lg-12">
                <ul class="listbar-5">
                    <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                        <p class="tc gray-font">
                            正品保证<br>
                            假1赔10
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                        <p class="tc gray-font">
                            质优价廉<br>
                            买贵就赔
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                        <p class="tc gray-font">
                            7天保障<br>
                            无理由退换
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                        <p class="tc gray-font">
                            满100元<br>
                            免运费
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                        <p class="tc gray-font">
                            100优惠宝<br>
                            =1元
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                        <p class="tc gray-font">
                            24小时<br>
                            闪电发货
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                        <p class="tc gray-font">
                            7x24小时<br>
                            在线客服
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                        <p class="tc gray-font">
                            支持多种<br>
                            支付方式
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                        <p class="tc gray-font">
                            开箱验货<br>
                            放心付款
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                        <p class="tc gray-font">
                            晒单奖励<br>
                            评论奖励
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
                            <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>关于我们</li>
                            <li class="ontext"><a href="#">关于传智</a></li>
                            <li class="ontext"><a href="#">联系我们</a></li>
                            <li class="ontext"><a href="#">加入我们</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>购物指南</li>
                            <li class="ontext"><a href="#">购物流程</a></li>
                            <li class="ontext"><a href="#">服务协议</a></li>
                            <li class="ontext"><a href="#">优惠券说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>支付方式</li>
                            <li class="ontext"><a href="#">银联支付</a></li>
                            <li class="ontext"><a href="#">快钱支付</a></li>
                            <li class="ontext"><a href="#">支付宝支付</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>配送方式</li>
                            <li class="ontext"><a href="#">运费说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>售后服务</li>
                            <li class="ontext"><a href="#">退换货政策</a></li>
                            <li class="ontext"><a href="#">退换货流程</a></li>
                            <li class="ontext"><a href="#">退换货申请</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>帮助信息</li>
                            <li class="ontext"><a href="#">常见问题</a></li>
                            <li class="ontext"><a href="#">投诉建议</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <p class="tc lh200">
                <a href="#">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商家入驻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络招聘</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">广告服务</a>&nbsp;&nbsp;|
                <br />
                互联网出版许可证编号新出网证 <a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">你妹的备案</a> <br>
                京公网安备88888888888888号
            </p>
        </div>
    </footer>
    
</body>
</html>
