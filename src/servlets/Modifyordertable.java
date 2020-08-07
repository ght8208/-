package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;
import bean.Tools;

public class Modifyordertable extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Modifyordertable() {
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

		doPost(request,response);
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

		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		
		HttpSession session =request.getSession();
		
		String receivename=Tools.CodeToString(request.getParameter("receivename"));
		String address=Tools.CodeToString(request.getParameter("address"));
		String tele=request.getParameter("tele");
		String zipcode=request.getParameter("zipcode");
		String paymode=Tools.CodeToString(request.getParameter("paymode"));
		String orderid=session.getAttribute("order").toString();
		//System.out.println(orderid);
		//System.out.println(receivename);
		String sql="update ordertable set receivename='"+receivename+
				"',address='"+address+"',tele='"+tele+
				"',zipcode='"+zipcode+"',paymode='"+paymode+
				"'where orderid='"+orderid+"'";
		/*StringBuffer newsql=new StringBuffer();
		newsql.append("update ordertable set receivename='");
		newsql.append(receivename);
		newsql.append("',address='");
		newsql.append(address);
		newsql.append("',tele='");
		newsql.append(tele);
		newsql.append("',zipcode='");
		newsql.append(zipcode);
		newsql.append("',paymode='");
		newsql.append(paymode);
		newsql.append("' where orderid=");
		newsql.append(request.getParameter("orderid"));*/
		
		DB db=new DB();
		boolean a=db.executeUpdate(sql);
		if(a)
		{
			session.setAttribute("modify", "修改成功！");
			session.setAttribute("order", null);
			response.sendRedirect("/wenq/jsp/admin/dingdan/buyinfo.jsp");
		}
		else
		{
			session.setAttribute("modify", "修改失败！");
			session.setAttribute("order", null);
			response.sendRedirect("/wenq/jsp/admin/dingdan/buyinfo.jsp");
			
		}
		
		
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
