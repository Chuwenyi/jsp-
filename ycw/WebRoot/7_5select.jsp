<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page language="java" import="java.sql.*"%> 
<jsp:useBean id="SelectBean" scope="page" class="com.jdbc.ManageJDBC" />
<html>
<head>
	<title>���¿γ̱�</title>
</head>
<body>
<center>
	<font size="5" color="blue">���¿γ̱�</font><br><hr><br>
	<form action="7_5update.jsp" method="post">
		����γ̺ţ� <input type="text" name="kch"><br>
		�����µ�ѧ�֣�<input type="text" name="xf" size="10">
		<input type="submit" value="�ύ����">
	</form>
	<p>���ݿ����ǰ��¼��</p>
	<table border="2" bordercolor="#ffcccc">
		<tr bgcolor="cccccc" align="center">
			<td>�γ̺�</td>
			<td>�γ���</td>
			<td>ѧ��</td>
			<td>ѧʱ</td>
			<td>ѧ��</td>
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