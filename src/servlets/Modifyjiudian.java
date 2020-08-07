package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

public class Modifyjiudian extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Modifyjiudian() {
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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/";
		String info="",forward="";
		DB db = new DB();
		
		SmartUpload su=new SmartUpload();  //创建新的上传对象
		long maxsize=100000*1024; //设置每个上传文件最大为200KB
		try{
			su.initialize(this.getServletConfig(), request, response); // 初始化
			su.setMaxFileSize(maxsize); // 限制上传文件的大小
			su.setAllowedFilesList("jpg,JPG,gif,GIF"); // 设定允许上传的格式
			su.upload(); // 上传文件
			Request req = su.getRequest(); // 创建Request对象

			String jname =req.getParameter("jname");
			String jplace =req.getParameter("jplace");
			String jpingfen = req.getParameter ("jpingfen");
			String jintro =req.getParameter("jintro");
			String jprice = req.getParameter ("jprice");
			String jkm = req.getParameter ("jkm");
			String jid = session.getAttribute("jiudian").toString();
		    //System.out.println(vname);
		    //System.out.println(vplace);
		    //System.out.println(vfamous);
		    //System.out.println(vid);
			//格式转换
		    /*int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);*/
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //取得扩展名
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurl为保存图片的绝对路径
			//设置存到数据库中的路径
			String jimage=url+filename+"."+ext;
			boolean cmark;
			
			String sql="update jiudian set jid='"+jid+
					"',jname='"+jname+"',jplace='"+jplace+
					"',jpingfen='"+jpingfen +"',jprice='"+jprice+
					"',jintro='"+jintro+"',jimage='"+jimage
					+"',jkm='"+jkm+"'where jid='"+jid+"'";
			 
			cmark= db.executeUpdate(sql);
			if(cmark){
				//将文件保存到指定目录中
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="添加成功！";
				forward="/jsp/admin/jiudian/showjiudian.jsp";
				System.out.println("添加成功！");
			}else{
				info="添加失败！";
				forward="/jsp/admin/jingdian/modifyjingdan.jsp";
				System.out.println("添加失败！");
			}

			}else{
				info="请选择要上传的文件！";
				forward="/jsp/admin/jingdian/modifyjingdan.jsp";
				System.out.println("请选择要上传的文件！");
			}
		}
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="添加异常！";
		    	forward="/jsp/admin/jingdian/modifyjingdan.jsp";
		    	System.out.println("添加异常！");
		    }finally{
		    	try {pstmt.close();}catch(Exception e){}
		    	try {conn.close();}catch(Exception e){}
		    }
		    request.setAttribute("info",info);
		    RequestDispatcher rd=request.getRequestDispatcher(forward);
		    rd.forward(request,response);
		
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
