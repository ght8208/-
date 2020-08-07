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



public class RegServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
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
		String url="jdbc:mysql://localhost:3306/visit";
		String user="root";
		String password="123456";
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String sql = "select * from visitors where username='"+username+"'"; //ʡ�Ժű�ʾҪ��������sql���
		//������������
		Connection conn=null; //�������ݿ����ӵĶ���
		Statement stmt=null; //��������ִ��SQL����Statement����
		ResultSet rs=null; //�������������
		try{
		       //�������Ӳ�ִ�����
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		HttpSession session=request.getSession();
		//��������
		if(rs.next())
		{
			session.setAttribute("message_error","�û����Ѿ�����");
			response.sendRedirect("jsp/loginregist/MyJsp.jsp");
		}
		else
		{
			StringBuffer newsql=new StringBuffer();
			newsql.append("insert into visitors (username,userpass,sex,email,phone,birthday) values ('");
			newsql.append(username);
			newsql.append("','");
			newsql.append(userpass);
			newsql.append("','");
			newsql.append(sex);
			newsql.append("','");
			newsql.append(email);
			newsql.append("','");
			newsql.append(phone);
			newsql.append("','");
			newsql.append(birthday);
			newsql.append("')");
			int a = stmt.executeUpdate(newsql.toString());
			if(a > 0)
			{
				session.setAttribute("message","ע��ɹ�");
				session.setAttribute("username",username);
			}
			else
			{
				session.setAttribute("message","ע��ʧ��");
			}
			response.sendRedirect("jsp/loginregist/personal.jsp");
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
			throw new ServletException("�������ݿ�����ʧ��");
		}
	}

}
