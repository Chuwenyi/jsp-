<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.sql.*"%> 
<jsp:useBean id="UpdateBean" scope="page" class="com.jdbc.ManageJDBC" />
<html>
<body>
	<% 
		String KCH=request.getParameter("kch"); 	//获取课程号
		if(KCH==null)
		{
			KCH="";
		}
		String XF=request.getParameter("xf");  	//获取学分
		if(XF==null)
		{
			XF="-1";
		}
    		String sql="update KCB set XF = "+XF+" where KCH='"+KCH+"'";
		UpdateBean.createconnection();                   
		UpdateBean.exc_update(sql);   
	%>
	<p>更新后数据库记录：</p>
	<table border="2" bordercolor="#ffcccc">
		<tr bgcolor="cccccc" align="center">
			<td>课程号</td>
			<td>课程名</td>
			<td>学期</td>
			<td>学时</td>
			<td>学分</td>
		</tr>
	<%  
		UpdateBean.createconnection();  
    		ResultSet rs=UpdateBean.exc_query("select * from KCB");
		while(rs.next()) 
		{
	%>   
		<tr>
			<td><%=rs.getString("KCH")%></td>  
			<td><%=rs.getString("KCM")%></td>
			<td><%=rs.getInt("KXXQ")%></td>
			<td><%=rs.getInt("XS")%></td>
			<td><%=rs.getInt("XF")%></td>
		</tr>    
	<%  
		}
	%>
	<%
		rs.close();   
		UpdateBean.close();
		
 	%>
	</table>
</body>
</html>