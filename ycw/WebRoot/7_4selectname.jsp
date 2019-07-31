<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '7_4selectname.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:useBean id="manegejdbc" scope="page" class="com.jdbc.ManageJDBC"/>
  <body>
  <%
  	String kch=request.getParameter("kch");
   %>
    <center>输出课程号为<%=kch%>的信息<br>
    	<table border="1">
    		<tr>
    			<td>课程号</td>
    			<td>课程名</td>
    			<td>学期</td>
    			<td>学分</td>
    			<td>学时</td>
    			
    		</tr>
    		<%
    			manegejdbc.createconnection();
    			String sql="select * from kcb where kch='"+kch+"'";
    			ResultSet rs=manegejdbc.exc_query(sql);
    			while(rs.next()){%>
    				<tr>
    			<td><%=rs.getString("kch")%></td>
    			<td><%=rs.getString("kcm")%></td>
    			<td><%=rs.getString("kxxq")%></td>
    			<td><%=rs.getString("xf")%></td>
    			<td><%=rs.getString("xs")%></td>
 
    		</tr>
    			<%}
    			manegejdbc.close();
    		 %>
    	</table>
    </center>
    
  </body>
</html>
