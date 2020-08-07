package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.DB;
import bean.orderbean;


public class BuyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BuyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		//String orderid = request.getParameter("orderid");
		//String username = Tools.CodeToString(request.getParameter("username"));
		//String orderdate = request.getParameter("orderdate");
		//String orderstate = Tools.CodeToString(request.getParameter("orderstate"));
		String address = request.getParameter("address");
		String receivename = request.getParameter("receivename");
		String tele = request.getParameter("tele");
		String zipcode = request.getParameter("zipcode");
		String paymode = request.getParameter("paymode");
		
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		
		//获取当前的时间
		java.util.Date day=new java.util.Date();
		//格式化成yyyyMMdd格式，注意大小写
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
		String orderdate=format.format(day);
		String now=(String)(day.toLocaleString());  //当前的日期时间
		//查询当天的订单数目
		String sql="select count(*) from ordertable where orderdate='"+orderdate+"'";
		DB db=new DB();
		ResultSet rs=null;	int i=0;
		try{
			rs=db.executeQuery(sql);
			if(rs.next()){
				i=rs.getInt(1); //获取了当天的订单数目
			}
			i++;	//此订单的序号
		}catch(Exception e){e.printStackTrace();}finally{db.close();}
		String str_i=String.valueOf(i); //转成字符串格式
		while(str_i.length()<3){	//格式化成三位的字符串
		str_i="0"+str_i;
		}
		String orderid=now+str_i;	
		orderid=orderid.replace("-","");	//将日期格式中的特别符号（空格等）除去
		orderid=orderid.replace(" ","");
		orderid=orderid.replace(":","");
		String orderstate="未处理";
		
		orderbean order = new orderbean();
		order.setOrderid(orderid);
		order.setUsername(username);
		order.setOrderdate(orderdate);
		order.setOrderstate(orderstate);
		order.setAddress(address);
		order.setTele(tele);
		order.setZipcode(zipcode);
		order.setReceivename(receivename);
		order.setPaymode(paymode);
		
		ArrayList cart = (ArrayList)session.getAttribute("cart");
		boolean mark = order.add(cart);
		if(mark){
			session.setAttribute("cart", null);
			response.sendRedirect("showMyOrder.jsp");
		}
		else{
			response.sendRedirect("menpiao2.jsp");
		}

		

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
