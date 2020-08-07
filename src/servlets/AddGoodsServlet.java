package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import bean.DB;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;


public class AddGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddGoodsServlet() {
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
		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/";
		String info="",forward="";
		DB db = new DB();
		
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=100000*1024; //����ÿ���ϴ��ļ����Ϊ200KB
		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    Request req=su.getRequest(); //����Request����
		    String id=req.getParameter("id");
		    String name=req.getParameter("name");
		    String number=req.getParameter("number");
		    String price=req.getParameter("price");
		    String intro=req.getParameter("intro");
		    //��ʽת��
		    int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			//���ô浽���ݿ��е�·��
			String image=url+filename+"."+ext;
			int cmark=0;
			String sql="insert into goods(id,name,number,price,intro,image) values (?,?,?,?,?,?)";
			conn=db.createConn();
			conn.setAutoCommit(true);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setInt(3,cnumber);
			pstmt.setFloat(4,cprice);
			pstmt.setString(5,intro);
			pstmt.setString(6,image);
			cmark=pstmt.executeUpdate();
			if(cmark==1){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="��ӳɹ���";
				forward="/jsp/admin/menpiao/showmenpiao.jsp";
				System.out.println("��ӳɹ���");
			}else{
				info="���ʧ�ܣ�";
				forward="/jsp/admin/menpiao/c_add.jsp";
				System.out.println("���ʧ�ܣ�");
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				forward="/jsp/admin/menpiao/c_add.jsp";
				System.out.println("��ѡ��Ҫ�ϴ����ļ���");
			}
		}
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="����쳣��";
		    	forward="/jsp/admin/menpiao/c_add.jsp";
		    	System.out.println("����쳣��");
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
