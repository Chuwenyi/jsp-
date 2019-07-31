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
    
    <title>My JSP '7_1select.jsp' starting page</title>
    
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
    <h1><center><font color="red">学生信息管理系统</font></center></h1>
    <hr/><center>
    <table border="1">
    	<tr>
    	<td>课程号</td>
    	<td>课程名</td>
    	<td>学期</td>
    	<td>学分</td>
    	<td>学时</td>
    	</tr>
    	</center>
    	<%
    	manegejdbc.createconnection();
    	ResultSet rs=manegejdbc.exc_query("select * from kcb");
    	while(rs.next()){%>
    		<tr>
	    		<td><%=rs.getString("kch") %></td>
	    		<td><%=rs.getString("kcm") %></td>
	    		<td><%=rs.getInt("kxxq") %></td>
	    		<td><%=rs.getInt("xf") %></td>
	    		<td><%=rs.getInt("xs") %></td>
    		</tr>
    	<%}
     %>
    </table>
    
    
  </body>
</html>
