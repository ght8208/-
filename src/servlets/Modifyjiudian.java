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
		
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=100000*1024; //����ÿ���ϴ��ļ����Ϊ200KB
		try{
			su.initialize(this.getServletConfig(), request, response); // ��ʼ��
			su.setMaxFileSize(maxsize); // �����ϴ��ļ��Ĵ�С
			su.setAllowedFilesList("jpg,JPG,gif,GIF"); // �趨�����ϴ��ĸ�ʽ
			su.upload(); // �ϴ��ļ�
			Request req = su.getRequest(); // ����Request����

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
			//��ʽת��
		    /*int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);*/
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			//���ô浽���ݿ��е�·��
			String jimage=url+filename+"."+ext;
			boolean cmark;
			
			String sql="update jiudian set jid='"+jid+
					"',jname='"+jname+"',jplace='"+jplace+
					"',jpingfen='"+jpingfen +"',jprice='"+jprice+
					"',jintro='"+jintro+"',jimage='"+jimage
					+"',jkm='"+jkm+"'where jid='"+jid+"'";
			 
			cmark= db.executeUpdate(sql);
			if(cmark){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="��ӳɹ���";
				forward="/jsp/admin/jiudian/showjiudian.jsp";
				System.out.println("��ӳɹ���");
			}else{
				info="���ʧ�ܣ�";
				forward="/jsp/admin/jingdian/modifyjingdan.jsp";
				System.out.println("���ʧ�ܣ�");
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				forward="/jsp/admin/jingdian/modifyjingdan.jsp";
				System.out.println("��ѡ��Ҫ�ϴ����ļ���");
			}
		}
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="����쳣��";
		    	forward="/jsp/admin/jingdian/modifyjingdan.jsp";
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
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
