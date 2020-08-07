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

public class Addluntantz extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Addluntantz() {
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

		HttpSession session =request.getSession();
		
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		Connection conn=null;
		String ext="", url="upload/",info="",forward="";
		SmartUpload su=new SmartUpload();  //创建新的上传对象
		long maxsize=2000*1024; //设置每个上传文件最大为2000KB,2MB
		try{
		    su.initialize(this.getServletConfig(), request, response); //初始化
		    su.setMaxFileSize(maxsize); //限制上传文件的大小
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //设定允许上传的格式
		    su.upload(); //上传文件
		    Request req=su.getRequest(); //创建Request对象
		    String lttzid=req.getParameter("lttzid");
		    String lttzname=req.getParameter("lttzname");
		    String lttzjing=req.getParameter("lttzjing");
		    String lttzintro=req.getParameter("lttzintro");
		    
		    String ltbkid=req.getParameter("ltbkid");
		    String Id=session.getAttribute("uid").toString();
		    //获取上传的文件，因为只上传了一个文件，所以可直接获取
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //取得扩展名
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurl为保存图片的绝对路径
			
			//设置存到数据库中的路径
			String lttzimage=url+filename+"."+ext;
			int cmark=0;
			int cmark1=0;
			String sql="insert into lttiezi(lttzid,lttzname,lttzjing,lttzintro,lttzimage) values (?,?,?,?,?)";
			String sql1="insert into lttiezi1(ltbkid,Id,lttzid) values (?,?,?)";
			DB db=new DB();
			conn=db.createConn();
			conn.setAutoCommit(true);
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,lttzid);
			pstmt.setString(2,lttzname);
			pstmt.setString(3,lttzjing);
			pstmt.setString(4,lttzintro);
			pstmt.setString(5,lttzimage);
			cmark=pstmt.executeUpdate();
			
			pstmt1=conn.prepareStatement(sql1);
			pstmt1.setString(1,ltbkid);
			pstmt1.setString(2,Id);
			pstmt1.setString(3,lttzid);
			cmark1=pstmt1.executeUpdate();
			
			
			

			if(cmark==1&&cmark1==1){
				//将文件保存到指定目录中
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="添加成功！";
				session.setAttribute("adminfo",info);
				if(session.getAttribute("username").equals("admin"))
				{
					forward="/jsp/admin/admain.jsp";
				}
				else
				{
					forward="/jsp/visitors/ownfunction.jsp";
				}
				System.out.println("添加成功！");
			}else{
				info="添加失败！";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("添加失败！");
			}

			}else{
				info="请选择要上传的文件！";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("请选择要上传的文件！");
			}
		    
		    
		    
		}
		    
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="添加异常！";
		    	session.setAttribute("adminfo",info);
		    	forward="/jsp/admin/jingdian/addview.jsp";
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
