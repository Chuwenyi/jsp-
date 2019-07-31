<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page language="java" import="java.sql.*"%> 
<jsp:useBean id="SelectBean" scope="page" class="com.jdbc.ManageJDBC" />
<html>
<head>
	<title>更新课程表</title>
</head>
<body>
<center>
	<font size="5" color="blue">更新课程表</font><br><hr><br>
	<form action="7_5update.jsp" method="post">
		输入课程号： <input type="text" name="kch"><br>
		输入新的学分：<input type="text" name="xf" size="10">
		<input type="submit" value="提交更新">
	</form>
	<p>数据库更新前记录：</p>
	<table border="2" bordercolor="#ffcccc">
		<tr bgcolor="cccccc" align="center">
			<td>课程号</td>
			<td>课程名</td>
			<td>学期</td>
			<td>学时</td>
			<td>学分</td>
		</tr>
		<%
			String sql="select * from KCB";     
			SelectBean.createconnection();		  	 
			ResultSet rs=SelectBean.exc_query(sql); 
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
			SelectBean.close();
		%>
	</table>  
	</center> 
</body>   
</html>