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

public class ModifyUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyUserServlet() {
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
		
		String username=Tools.CodeToString(request.getParameter("username"));
		String usersex=Tools.CodeToString(request.getParameter("usersex"));
		String userpass=request.getParameter("userpass");
		String useremail=request.getParameter("useremail");
		String userphone=request.getParameter("userphone");
		String userbirthday=request.getParameter("userbirthday");
		String userprovin=Tools.CodeToString(request.getParameter("userprovin"));
		
		StringBuffer newsql=new StringBuffer();
		newsql.append("update visitors set username='");
		newsql.append(username);
		newsql.append("',sex='");
		newsql.append(usersex);
		newsql.append("',userpass='");
		newsql.append(userpass);
		newsql.append("',email='");
		newsql.append(useremail);
		newsql.append("',phone='");
		newsql.append(userphone);
		newsql.append("',birthday='");
		newsql.append(userbirthday);
		newsql.append("',province='");
		newsql.append(userprovin);
		newsql.append("' where Id=");
		newsql.append(request.getParameter("id"));
		/*String sql="update student set stuname='" +stuname+"',stupass='"+stupass+"',stusex='"+stusex+"',sbirthdate='"+sbirthdate+"',stuaddress='"+stuaddress
				+"',stuemail='"+stuemail+"',stuage="+stuage+",stuintro='"+stuintro+"',stuprovin='"+stuprovin+"',stusfzheng='"+stusfzheng+"',stutelep='"+stutelep
				+"' where stuid="+request.getParameter("stuid");*/
		//System.out.print(request.getParameter("id"));
		//System.out.print(username);
		
		//System.out.print(id);
		DB db=new DB();
		boolean a=db.executeUpdate(newsql.toString());
		if(a)
		{
			session.setAttribute("stumodify", "修改成功！");
			response.sendRedirect("/wenq/jsp/admin/user/MDeleteuser.jsp");
		}
		else
		{
			session.setAttribute("stumodify", "修改失败！");
			response.sendRedirect("/wenq/jsp/admin/admain.jsp");
			
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
