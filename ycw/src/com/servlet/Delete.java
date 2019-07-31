package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.ManageJDBC;

public class Delete extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Delete() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		response.setContentType("text/html");
		request.setCharacterEncoding("gb2312"); 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//int kch=Integer.parseInt(request.getParameter("kch"));
		//int kch=Integer.valueOf(request.getParameter("kch"));
		String kch=request.getParameter("kch");
		String sql="DELETE FROM kcb WHERE kch='"+kch+"'";
		ManageJDBC manageJDBC=new ManageJDBC();
		manageJDBC.createconnection();
		int num=manageJDBC.exc_update(sql);
		//if(manageJDBC.delStuById(kch)){
			//response.getWriter().print("É¾³ý³É¹¦");
		//}else{
		//	response.getWriter().print("É¾³ýÊ§°Ü");
		//}
		//if(num>0)
			out.print("É¾³ý³É¹¦");
		//else
			//out.print("É¾³ýÊ§°Ü");
	}
	
	
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

doGet(request, response);
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


