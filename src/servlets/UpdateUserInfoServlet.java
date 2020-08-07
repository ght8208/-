package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.*;

import bean.DB;


public class UpdateUserInfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateUserInfoServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String url="jdbc:mysql://localhost:3306/visit";
		String user="root";
		String password="123456";
		String username = request.getParameter("username");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String sql = "select * from visitors where username='"+username+"'";
		//创建各个对象
		Connection conn=null; //建立数据库连接的对象
		Statement stmt=null; //创建用于执行SQL语句的Statement对象
		ResultSet rs=null; //创建结果集对象
		try{
		       //建立连接并执行语句
			DB db = new DB();
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		HttpSession session=request.getSession();
		//其它操作
		if(rs.next())
		{	
			StringBuffer newsql=new StringBuffer();
			newsql.append("update visitors set username='");
			newsql.append(username);
			newsql.append("',sex='");
			newsql.append(sex);
			newsql.append("',email='");
			newsql.append(email);
			newsql.append("',phone='");
			newsql.append(phone);
			newsql.append("',birthday='");
			newsql.append(birthday);
			newsql.append("' where id=");
			newsql.append(request.getParameter("id"));
			boolean b= db.executeUpdate(newsql.toString());
			if(b)
			{
				session.setAttribute("msg","修改成功");
			}
			else
			{
				session.setAttribute("msg","修改失败");
			}
			response.sendRedirect("showUserInfo.jsp");
		}
		
		}catch(SQLException se){
			throw new ServletException(se);
		}finally{
		try{rs.close();}catch(SQLException se){}
		try{stmt.close();}catch(SQLException se){}
		try{conn.close();}catch(SQLException se){}
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
