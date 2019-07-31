package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.jdbc.ManageJDBC;
import com.model.Login;
import com.model.Message;

public class LoginDao {
	public Login checkLogin(String name,String password){ //验证用户名密码
			ManageJDBC manageJDBC=new ManageJDBC();
			manageJDBC.createconnection();
			String sql="select * from login where name='"+name+"' and password='"+password+"'";
			//System.out.println(sql);
			ResultSet rs=manageJDBC.exc_query(sql);
			try {
				if(rs.next()){
					Login login=new Login();
					login.setId(rs.getInt("id"));
					login.setName(rs.getString("name"));
					login.setPassword(rs.getString("password"));
					login.setRole(rs.getInt("role"));
					return login;
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
	}
	//public boolean addInfo(String name,String title,Date time,String messages){//添加留言
	public boolean addInfo(Message mess){
		String name=mess.getName();
		String title=mess.getTitle();
		Date time=mess.getTime();
		String messages=mess.getMessages();
		ManageJDBC manageJDBC=new ManageJDBC();
		manageJDBC.createconnection();
		String sql=
			"insert into message(name,title,time,messages) " +
			"values('"+name+"','"+title+"','"+time+"','"+messages+"')";
		System.out.println(sql);
		int num=manageJDBC.exc_update(sql);
		manageJDBC.close();
		if(num>0)
			return true;
		else
			return false;
	}
	public boolean insertuser(int id,String name,String password,int role){
		
		
		return false;
	}
	public ArrayList<Message> findMbInfo(){//查询留言信息,返回一个arraylist
		ArrayList<Message> arrayList=new ArrayList<Message>();
		ManageJDBC manageJDBC=new ManageJDBC();
		manageJDBC.createconnection();
		String sql="select * from message";
		ResultSet rs=manageJDBC.exc_query(sql);
		try {
			while(rs.next()){
				Message ms=new Message();//初始化一条留言
				ms.setName(rs.getString("name"));
				ms.setTime(rs.getDate("time"));
				ms.setTitle(rs.getString("title"));
				ms.setMessages(rs.getString("messages"));
				arrayList.add(ms);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		manageJDBC.close();
		return arrayList;
	}
	
	}


