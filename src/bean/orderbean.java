package bean;

import java.util.*;
import java.sql.*;
import bean.DB;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class orderbean {
	private String orderid;
	private String username;
	private String orderdate;
	private String orderstate;
	private String address;
	private String tele;
	private String zipcode;
	private String receivename;
	private String paymode;
	
	public void setOrderid(String orderid)
	{
		this.orderid=orderid;
	}	
	public String getOrderid()
	{
		return orderid;
	}
	
	public void setUsername(String username)
	{
		this.username=username;
	}	
	public String getUsername()
	{
		return username;
	}
	
	public void setOrderdate(String orderdate)
	{
		this.orderdate=orderdate;
	}	
	public String getOrderdate()
	{
		return orderdate;
	}
	
	public void setOrderstate(String orderstate)
	{
		this.orderstate=orderstate;
	}	
	public String getOrderstate()
	{
		return orderstate;
	}
	
	public void setAddress(String address)
	{
		this.address=address;
	}	
	public String getAddress()
	{
		return address;
	}
	
	public void setTele(String tele)
	{
		this.tele=tele;
	}	
	public String getTele()
	{
		return tele;
	}
	
	public void setZipcode(String zipcode)
	{
		this.zipcode=zipcode;
	}	
	public String getZipcode()
	{
		return zipcode;
	}
	
	public void setReceivename(String receivename)
	{
		this.receivename=receivename;
	}	
	public String getReceivename()
	{
		return receivename;
	}
	
	public void setPaymode(String paymode)
	{
		this.paymode=paymode;
	}	
	public String getPaymode()
	{
		return paymode;
	}
	
	public boolean add(ArrayList cart)
	{
		boolean mark = false;
		DB db = new DB();
		Connection conn=db.createConn();
		Statement stmt=db.getStmt();
		try{
			conn.setAutoCommit(false);  
			stmt=conn.createStatement();
			StringBuffer newsql=new StringBuffer();
			newsql.append("insert into ordertable (orderid, username, orderdate,orderstate,address,tele,zipcode,receivename,paymode)values('");
			newsql.append(orderid);
			newsql.append("','");
			newsql.append(username);
			newsql.append("','");
			newsql.append(orderdate);
			newsql.append("','");
			newsql.append(orderstate);
			newsql.append("','");
			newsql.append(address);
			newsql.append("','");
			newsql.append(tele);
			newsql.append("','");
			newsql.append(zipcode);
			newsql.append("','");
			newsql.append(receivename);
			newsql.append("','");
			newsql.append(paymode);
			newsql.append("')");
			stmt.executeUpdate(newsql.toString());
			
			Iterator icart=cart.iterator();
			while(icart.hasNext()){
				ItemBean temp=(ItemBean)icart.next();
				String id=temp.getGoods().getId();
				int quantity=temp.getQuantity();
				StringBuffer newsql2=new StringBuffer();
				newsql2.append("insert into orderlist (orderid, id, quantity)values('");
				newsql2.append(orderid);
				newsql2.append("','");
				newsql2.append(id);
				newsql2.append("','");
				newsql2.append(quantity);
				newsql2.append("')");
				stmt.executeUpdate(newsql2.toString());
			}
			
			conn.commit();	//提交事务
			conn.close();
			mark=true;
			 }catch(SQLException e){
			try{
				conn.rollback();	//出错回滚
			}catch(SQLException ee){
				ee.printStackTrace();
			    }
				e.printStackTrace();
			}
			return mark;
	}

}
