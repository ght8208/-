<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
	<link rel="stylesheet" type="text/css" href="style.css">
	

  </head>
  
  <body style="background:url('images/bg/textured_stripes.png');">

   <p align="center">用户购物信息</p><hr/>
    <form action="BuyServlet" name="form1" method="post">
    <table align="center" border=0>
    <tr>
    <td>收货人：</td>
    <td><input name="receivename" type="text"  class="ipt-t" id="receivename"/></td>
    </tr>
    <tr>
       <td>联系电话：</td>
    <td><input name="tele" type="text" class="ipt-t" id="tele"/></td>
    </tr>
    <tr>
   <td>收货地址：</td>
    <td><input name="address" type="text" class="ipt-t" id="address"/></td>
    </tr>
    <tr>
     <td>邮编：</td>
    <td><input name="zipcode" type="text" class="ipt-t" id="zipcode"/></td>
    </tr>
    <tr>
    <td>付款方式：</td>
    <td>
    <label>
    <select name="paymode" >
     <option value="货到付款 "selected>货到付款</option>
     <option value="微信支付 ">微信支付</option>
     <option value="支付宝支付 ">支付宝支付</option>
     <option value="QQ支付">QQ支付</option>
      <option value="银行卡支付">银行卡支付</option>
     
    </select>
    
    </label></td>
    </tr>
   <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="提交" onclick="javascript:validate(form1)" />
        <input name="reset" type="reset" id="reset" value="重置" />
      </label></td>
      </tr>
    </table>
    </form>
    <p align="center"><a href="/wenq/main.jsp">返回购物</a></p>
    
 
    </table>
  </body>
</html>
