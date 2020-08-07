package bean;

import bean.DB;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
public class GoodsBean {
	private String id;
	private String name;
	private int number;
	private float price;
	private String intro;
	private String image;
	
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	//获取所有的商品信息
	public ArrayList getGoodsByPage(int pageNo){
		ArrayList goodslist=new ArrayList();
		DB db=new DB();
		int begin=(pageNo-1)*10+1;
		int end=pageNo*10;
		int index=0;
		String sql="select * from goods";
		ResultSet rs=null;
		try{
			rs=db.executeQuery(sql);
			while(rs.next()){
				index++;
				if(index<begin) continue;
				if(index>end) break;
				String tmpId=rs.getString(1);
				String tmpName=rs.getString(2);
				float tmpPrice=rs.getFloat(4);
				String tmpImage=rs.getString(6);
				/*String tmpCimage=rs.getString(6);*/
				//InputStream in=rs.getBinaryStream(6);
				
				//写入到JavaBean中
				GoodsBean g=new GoodsBean();
				g.setId(tmpId);
				g.setName(tmpName);
				g.setPrice(tmpPrice);
				g.setImage(tmpImage);
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
		String sql="select count(*) from goods";
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
	
	public GoodsBean findGoodsById(String id){		
		try{
			String sql="select * from goods where id = '"+id+"'";
			DB db=new DB();
			ResultSet rs=null;
			rs=db.executeQuery(sql);
			if(rs.next()){
				String name=rs.getString(2);
				float price=rs.getFloat(4);
				GoodsBean temp=new GoodsBean();
				temp.setName(name);
				temp.setId(id);
				temp.setPrice(price);
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
