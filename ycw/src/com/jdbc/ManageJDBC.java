package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ManageJDBC{
	private Connection con=null;
	public void createconnection(){//�������Ӷ���
		try{
			Class.forName("com.mysql.jdbc.Driver");
			//String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Leave";
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ycw?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT","root","1234");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
	}
	public ResultSet exc_query(String sql){//ִ�в�ѯ��䷵�ؽ��
		ResultSet rs=null;
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);//����sqlִ�ж���
			rs=statement.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return rs;
	}
	public int exc_update(String sql){//ִ�и�����䷵����Ӱ�������
		int num=0;
		try {
			Statement statement=con.createStatement();//����sqlִ�ж���
			num=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
	public void close(){//�ر�����
		try {
			if(con!=null)
				con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		ManageJDBC manageJDBC=new ManageJDBC();
		manageJDBC.createconnection();
		ResultSet rs=manageJDBC.exc_query("select * from id");
		try {
			while(rs.next()){
				System.out.println(rs.getString("id"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		manageJDBC.close();
		
	}
	
}