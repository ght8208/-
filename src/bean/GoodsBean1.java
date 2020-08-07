package bean;

import bean.DB;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
public class GoodsBean1 {
	private String vid;
	private String vname;
	private String vplace;
	private String vfamous;
	private String vintro;
	private String vimage;
	
	
	
	
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVplace() {
		return vplace;
	}
	public void setVplace(String vplace) {
		this.vplace = vplace;
	}
	public String getVfamous() {
		return vfamous;
	}
	public void setVfamous(String vfamous) {
		this.vfamous = vfamous;
	}
	public String getVintro() {
		return vintro;
	}
	public void setVintro(String vintro) {
		this.vintro = vintro;
	}
	public String getVimage() {
		return vimage;
	}
	public void setVimage(String vimage) {
		this.vimage = vimage;
	}
	//获取所有的商品信息
	public ArrayList getGoodsByPage(int pageNo){
		ArrayList goodslist=new ArrayList();
		DB db=new DB();
		int begin=(pageNo-1)*10+1;
		int end=pageNo*10;
		int index=0;
		String sql="select * from place";
		ResultSet rs=null;
		try{
			rs=db.executeQuery(sql);
			while(rs.next()){
				index++;
				if(index<begin) continue;
				if(index>end) break;
				String tmpId=rs.getString(1);
				String tmpName=rs.getString(2);
				String tmpPlace=rs.getString(3);
				String tmpFamous=rs.getString(4);
				String tmpIntro=rs.getString(5);
				String tmpImage=rs.getString(6);
				/*String tmpCimage=rs.getString(6);*/
				//InputStream in=rs.getBinaryStream(6);
				
				//写入到JavaBean中
				GoodsBean1 g=new GoodsBean1();
				g.setVid(tmpId);
				g.setVname(tmpName);
				g.setVplace(tmpPlace);
				g.setVfamous(tmpFamous);
				g.setVintro(tmpIntro);
				g.setVimage(tmpImage);
				goodslist.add(g);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return goodslist;
	}
	//获取页码总数
	public int getPageCount(){
		DB db=new DB();
		String sql="select count(*) from place";
		ResultSet rs=null;
		int pageCount=1;
		try{
			rs=db.executeQuery(sql);
			rs.next();
			int n=rs.getInt(1);
			pageCount=(int)((n-1)/10+1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return pageCount;
	}
	
	public GoodsBean1 findGoodsById(String id){		
		try{
			String sql="select * from place where vid = '"+id+"'";
			DB db=new DB();
			ResultSet rs=null;
			rs=db.executeQuery(sql);
			if(rs.next()){
				String name=rs.getString(2);
				String famous=rs.getString(4);
				GoodsBean1 temp=new GoodsBean1();
				temp.setVname(name);
				temp.setVid(id);
				temp.setVfamous(famous);
				db.close();
				return temp;
			}else{
				return null;
			}
		}catch(Exception e){
			System.out.print(e.toString());
			return null;
		}
		
		
	}
	
}
