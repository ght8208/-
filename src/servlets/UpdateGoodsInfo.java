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
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=2000*1024; //����ÿ���ϴ��ļ����Ϊ2000KB,2MB
		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    Request req=su.getRequest(); //����Request����
		    int id=Integer.parseInt(req.getParameter("id"));
		    //System.out.println(id);
		    String name=req.getParameter("name");
		    String number=req.getParameter("number");
		    String price=req.getParameter("price");
		    String cintro=req.getParameter("cintro");
		    //��ʽת��
		    //System.out.println(number);
		    int cnumber=Integer.parseInt(number);
		    float cprice=Float.parseFloat(price);

		    //��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			
			//���ô浽���ݿ��е�·��
			String cimage=url+filename+"."+ext;
			boolean cmark;
			String sql="update goods set id="+id+",name='"+name+"',number="+cnumber+",price="+cprice+",intro='"+cintro+"',image= '"+cimage+"'where id="+id;
			DB db=new DB();
			cmark= db.executeUpdate(sql);


			if(cmark){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="�޸ĳɹ���";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/showmenpiao.jsp";
				System.out.println("��ӳɹ���");
			}else{
				info="�޸�ʧ�ܣ�";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/modifymenpiao.jsp";
				System.out.println("�޸�ʧ�ܣ�");
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				session.setAttribute("modifyclass",info);
				forward="/jsp/admin/menpiao/modifymenpiao.jsp";
				System.out.println("��ѡ��Ҫ�ϴ����ļ���");
			}
		}
		    
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="����쳣��";
		    	session.setAttribute("modifyclass",info);
		    	forward="/jsp/admin/menpiao/modifymenpiao.jsp";
		    	System.out.println("����쳣��");
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
			throw new ServletException("�������ݿ�����ʧ��");
		}
	}

}
