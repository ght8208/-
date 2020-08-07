<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
  	<style type="text/css">
  	.bt{
  	height:20px;
  	width:50px;
  	background-image:url(/wenq/images/admin/add/buttonbg.png);
  	font-size:14px; 
  	font-weight:bold; 
  	color:#fff;
  	cursor:pointer; 
  	}
  	</style>

  </head>
  
   <body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">修改订单信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
   
    <% 
  DB db = new DB();
  String sql ="select * from ordertable where orderid='"+request.getParameter("orderid")+"'";
  session.setAttribute("order", request.getParameter("orderid"));
  ResultSet rs = db.executeQuery(sql);
  if(rs.next())
  {
  %>
  
  
  <form action="Modifyordertable" name="form1" method="post">
    <table  border="1" class="tablelist">
	    <tr>
	    <td>收货人：</td>
	    <td><input name="receivename" type="text"  class="ipt-t" id="receivename" value="<%=rs.getString(6)%>"/></td>
	    </tr>
	    <tr>
	       <td>联系电话：</td>
	    <td><input name="tele" type="text" class="ipt-t" id="tele" value="<%=rs.getString(7)%>"/></td>
	    </tr>
	    <tr>
	   <td>收货地址：</td>
	    <td><input name="address" type="text" class="ipt-t" id="address" value="<%=rs.getString(5)%>"/></td>
	    </tr>
	    <tr>
	     <td>邮编：</td>
	    <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" value="<%=rs.getString(8)%>"/></td>
	    </tr>
	    <tr>
	    <td>付款方式：</td>
	    <td>
	    <label>
	    <select name="paymode" >
	     <option value="货到付款 "<%if(rs.getString(9).equals("货到付款"))out.println("selected"); %>>货到付款</option>
	     <option value="微信支付 "<%if(rs.getString(9).equals("微信支付 "))out.println("selected"); %>>微信支付</option>
	     <option value="支付宝支付 "<%if(rs.getString(9).equals("支付宝支付"))out.println("selected"); %>>支付宝支付</option>
	     <option value="QQ支付"<%if(rs.getString(9).equals("QQ支付"))out.println("selected"); %>>QQ支付</option>
	      <option value="银行卡支付"<%if(rs.getString(9).equals("银行卡支付"))out.println("selected"); %>>银行卡支付</option>
	     
	    </select>
	    
	    </label></td>
	    </tr>
	   <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" class="bt" value="修改" onclick="javascript:validate(form1)" />
        <input name="reset" type="reset" id="reset" class="bt" value="重置" />
      </label></td>
      </tr>
    </table>
  </form>
    
    
  <% 
  }
  if(session.getAttribute("modify")!=null)
  {
  out.println(session.getAttribute("modify"));
  }
  %>	
  </body>
</html>
