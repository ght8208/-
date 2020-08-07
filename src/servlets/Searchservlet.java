package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Tools;

public class Searchservlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Searchservlet() {
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
		
		String cont=Tools.CodeToString(request.getParameter("cont"));
		
		if(session.getAttribute("sjing")!=null)
		{
			if(session.getAttribute("sjing").equals("OK"))
			{
				session.setAttribute("splace", cont);
				session.setAttribute("sjing", null);
				response.sendRedirect("/wenq/jsp/admin/jingdian/test.jsp");
				
			}
		}
		
		
		if(request.getParameter("q")!=null){
			String q=request.getParameter("q").toString();
			q=Tools.CodeToString(q);
			//System.out.println(Tools.CodeToString(request.getParameter("q").toString()));
			session.setAttribute("q", q);
			session.setAttribute("search", "ok");
			response.sendRedirect("/wenq/list.jsp");
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
