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
    <h1><font color="red">��ӿγ̱�</h1>
    <form action="InsertkcbServlet" method="post">
    	�γ̺�:<input type="text" name="kch"/><br><br>
    	�γ���:<input type="text" name="kcm"/><br><br>
    	ѧ��:<input type="text" name="kxxq"/><br><br>
    	ѧ��:<input type="text" name="xf"/><br><br>
    	ѧʱ:<input type="text" name="xs"/><br><br>
    	<input type="submit" value="���"/>
    </form>
    </center>
  </body>
</html>
