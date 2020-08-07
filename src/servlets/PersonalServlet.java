package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PersonalServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PersonalServlet() {
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
		String[] interests = request.getParameterValues("hobby");
		String interests_str = "";
		for(int i=0;i<interests.length;i++){
			if(i==(interests.length-1)){
			interests_str  = interests_str + interests[i];
			}
			else{
				interests_str  = interests_str + interests[i]+",";
			}
		}
		String province = request.getParameter("province");
		String view = request.getParameter("view");
		String[] characters = request.getParameterValues("character");
		String characters_str = "";
		for(int i=0;i<characters.length;i++){
			if(i==(characters.length-1)){
				characters_str  = characters_str + characters[i];
				}
				else{
					characters_str  = characters_str + characters[i]+",";
				}
		}
		String[] topics = request.getParameterValues("topic");
		String topics_str = "";
		for(int i=0;i<topics.length;i++){
			if(i==(topics.length-1)){
				topics_str  = topics_str + topics[i];
				}
				else{
					topics_str  = topics_str +topics[i]+",";
				}
		}
		String sql = "select * from visitors where username='"+username+"'"; //省略号表示要输入具体的sql语句
		//创建各个对象
		Connection conn=null; //建立数据库连接的对象
		Statement stmt=null; //创建用于执行SQL语句的Statement对象
		ResultSet rs=null; //创建结果集对象
		try{
		       //建立连接并执行语句
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		HttpSession session=request.getSession();
		//其它操作
		if(rs.next())
		{
			StringBuffer newsql=new StringBuffer();
			newsql.append("update visitors set interests='");
			newsql.append(interests_str);
			newsql.append("',province='");
			newsql.append(province);
			newsql.append("',view='");
			newsql.append(view);
			newsql.append("',characters='");
			newsql.append(characters_str);
			newsql.append("',topics='");
			newsql.append(topics_str);
			newsql.append("' where username='");
			newsql.append(username);
			newsql.append("'");
			int a = stmt.executeUpdate(newsql.toString());
			if(a > 0)
			{
				session.setAttribute("message","注册成功");
				response.sendRedirect("jsp/loginregist/finish.jsp");
			}
			else
			{
				session.setAttribute("message","注册失败");
				response.sendRedirect("jsp/loginregist/personal.jsp");
			}
			/*session.setAttribute("message_error","用户名已经存在");
			response.sendRedirect("MyJsp.jsp");*/
		}
		else
		{
			
			
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
		String classname="com.mysql.jdbc.Driver";
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException ce){
			throw new ServletException("加载数据库驱动失败");
		}
	}

}
