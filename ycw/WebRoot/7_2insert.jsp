<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '7_2insert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
    <h1><font color="red">添加课程表</h1>
    <form action="InsertkcbServlet" method="post">
    	课程号:<input type="text" name="kch"/><br><br>
    	课程名:<input type="text" name="kcm"/><br><br>
    	学期:<input type="text" name="kxxq"/><br><br>
    	学分:<input type="text" name="xf"/><br><br>
    	学时:<input type="text" name="xs"/><br><br>
    	<input type="submit" value="添加"/>
    </form>
    </center>
  </body>
</html>
