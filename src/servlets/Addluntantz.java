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
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=2000*1024; //����ÿ���ϴ��ļ����Ϊ2000KB,2MB
		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    Request req=su.getRequest(); //����Request����
		    String lttzid=req.getParameter("lttzid");
		    String lttzname=req.getParameter("lttzname");
		    String lttzjing=req.getParameter("lttzjing");
		    String lttzintro=req.getParameter("lttzintro");
		    
		    String ltbkid=req.getParameter("ltbkid");
		    String Id=session.getAttribute("uid").toString();
		    //��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			
			//���ô浽���ݿ��е�·��
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
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="��ӳɹ���";
				session.setAttribute("adminfo",info);
				if(session.getAttribute("username").equals("admin"))
				{
					forward="/jsp/admin/admain.jsp";
				}
				else
				{
					forward="/jsp/visitors/ownfunction.jsp";
				}
				System.out.println("��ӳɹ���");
			}else{
				info="���ʧ�ܣ�";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("���ʧ�ܣ�");
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("��ѡ��Ҫ�ϴ����ļ���");
			}
		    
		    
		    
		}
		    
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="����쳣��";
		    	session.setAttribute("adminfo",info);
		    	forward="/jsp/admin/jingdian/addview.jsp";
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
