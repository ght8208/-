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

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		
		
		String uid;
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String number=request.getParameter("yanzheng");
		String sql = String.format("select * from visitors where username='%s' and userpass='%s'",username,userpass); //ʡ�Ժű�ʾҪ��������sql���
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
			
			//�ж���֤��
			if(session.getAttribute("rand").toString().equals(number))
			{
				uid=rs.getString(1);
				session.setAttribute("uid",uid);
				session.setAttribute("username", username);
				// �ж��Ƿ��ǹ���Ա
				if(username.equals("admin"))
				{
					session.setAttribute("admin", username);
				}
				session.setAttribute("message","��½�ɹ����𾴵��û�");
				response.sendRedirect("main.jsp");
			}
			else
			{
				session.setAttribute("message","��֤������");
				response.sendRedirect("/wenq/jsp/loginregist/MyJsp.jsp");
			}
			
		}
		else
		{
//			session.setAttribute("username", "error");
			session.setAttribute("message","�û������������");
			response.sendRedirect("main.jsp");
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
