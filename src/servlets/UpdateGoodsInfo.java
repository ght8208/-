package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.Request;

import java.sql.*;
import java.util.Calendar;

import bean.DB;

public class UpdateGoodsInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateGoodsInfo() {
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
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		
		HttpSession session =request.getSession();
		
		String ext="", url="upload/",info="",forward="";
		SmartUpload su=new SmartUpload();  //创建新的上传对象
		long maxsize=2000*1024; //设置每个上传文件最大为2000KB,2MB
		try{
		    su.initialize(this.getServletConfig(), request, response); //初始化
		    su.setMaxFileSize(maxsize); //限制上传文件的大小
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //设定允许上传的格式
		    su.upload(); //上传文件
		    Request req=su.getRequest(); //创建Request对象
		    int id=Integer.parseInt(req.getParameter("id"));
		    //System.out.println(id);
		    String name=req.getParameter("name");
		    String number=req.getParameter("number");
		    String price=req.getParameter("price");
		    String cintro=req.getParameter("cintro");
		    //格式转换
		    //System.out.println(number);
		    int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);

		    //获取上传的文件，因为只上传了一个文件，所以可直接获取
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //取得扩展名
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurl为保存图片的绝对路径
			
			//设置存到数据库中的路径
			String cimage=url+filename+"."+ext;
			boolean cmark;
			String sql="update goods set id="+id+",name='"+name+"',number="+cnumber+",price="+cprice+",intro='"+cintro+"',image= '"+cimage+"'where id="+id;
			DB db=new DB();
			cmark= db.executeUpdate(sql);


			if(cmark){
				//将文件保存到指定目录中
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="修改成功！";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/showmenpiao.jsp";
				System.out.println("添加成功！");
			}else{
				info="修改失败！";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/modifymenpiao.jsp";
				System.out.println("修改失败！");
			}

			}else{
				info="请选择要上传的文件！";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/modifymenpiao.jsp";
				System.out.println("请选择要上传的文件！");
			}
		}
		    
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="添加异常！";
		    	session.setAttribute("modifyclass",info);
		    	forward="/jsp/admin/menpiao/modifymenpiao.jsp";
		    	System.out.println("添加异常！");
		    }
		
		    //request.setAttribute("info",info);
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
		String classname="com.mysql.jdbc.Driver";
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException ce){
			throw new ServletException("加载数据库驱动失败");
		}
	}

}
