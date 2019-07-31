<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
      <h1><center><font color="red">学生信息管理系统</font></center></h1>
      <center>
        <a href="7_2insert.jsp">增添数据<br/><br/>
       
        <a href="7_6delete.jsp">删除数据<br/><br/>
        
        <a href="7_5select.jsp">更改数据<br/><br/>
        
        <a href="7_4select.jsp">查询数据<br/><br/>
        </center>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
  <center>      
<div id="footer">CopyRight@copy1712310111易楚文</div></center>
  </body>
  
</html>
