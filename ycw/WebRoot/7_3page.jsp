<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page language="java" import="java.sql.*" errorPage=""%>
<jsp:useBean id="PageBean" scope="page" class="com.jdbc.ManageJDBC" />
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=gb2312">
	<title>��ҳ��ʾ��¼</title>
	<style type="text/css">
	<!--
		.style2
		{
			color:#ff2222;
			font-size:24px;
		}
	-->
	</style>
</head> 
<body>
	<div align="center">
		<span class="style2">��ҳ��ʾ��¼</span><br><hr><br>
	</div>
	<table border="2" bordercolor="#ffcccc" align="center">
		<tr align="center" >
			<td>ѧ��</td>
			<td>����</td>
			<td>�Ա�</td>
			<td>��������</td>
			<td>רҵ</td>
			<td>��ѧ��</td>
			<td>��ע</td>
		</tr>
		<%
			int intPageSize;  		//һҳ��ʾ�ļ�¼��   
			int intRowCount;  		//��¼����
			int intPageCount; 		//��ҳ��
			int intPage;	  		//����ʾҳ��
			int i;
			intPageSize=8;    	//����һҳ��ʾ�ļ�¼�� 
			String strPage;
			strPage=request.getParameter("page");  //ȡ�ô���ʾ��ҳ��
			if(strPage==null)
			{
				//������QueryString��û��page��һ��������ʱ��ʾ��һҳ������
				intPage=1;
			}
			else
			{
				intPage=Integer.parseInt(strPage);
				if(intPage<1) intPage=1;
			}
			String sql="select * from XSB"; 
			PageBean.createconnection();    
			ResultSet rs=PageBean.exc_query(sql);  
			rs.last();       			//��¼ָ��ָ���ѯ������е����һ����¼
			intRowCount=rs.getRow();  //��ȡ�ܼ�¼��
			intPageCount=(intRowCount+intPageSize-1)/intPageSize;  //������ҳ��
			if(intPage>intPageCount)
				intPage=intPageCount; //��������ʾ��ҳ��
			if(intPageCount>0)
			{
				//����¼ָ�붨λ������ʾҳ�ĵ�һ����¼��
				rs.absolute((intPage-1)*intPageSize+1);
				//��ʾ����
				i=0;
				while(i<intPageSize&&!rs.isAfterLast()) 
				{
		%>   
		<tr>
			<td><%=rs.getString("XH")%></td>  
			<td><%=rs.getString("XM")%></td>
			<td><%=rs.getString("XB")%></td>
			<td><%=rs.getDate("CSRQ")%></td>
			<td><%=rs.getString("ZY")%></td>
			<td><%=rs.getInt("ZXF")%></td>
			<td><%=rs.getString("BZ")%></td>
		</tr>    
		<%	
					rs.next();
					i++;
				}
			}
		%>   
	</table>
	<hr color="#999999" > 
	<div align="center">��<%=intPage %>ҳ&nbsp&nbsp&nbsp��<%=intPageCount %>ҳ&nbsp&nbsp&nbsp
		<% 
			if(intPage<intPageCount)
			{
		%>
		<a href="7_3page.jsp?page=<%=intPage+1 %>">��һҳ</a>&nbsp&nbsp&nbsp
		<%
			}
			if(intPage>1)
			{
		%>
		<a href="7_3page.jsp?page=<%=intPage-1%>">��һҳ</a>	
		<%
			}
		%>
		<%
			rs.close();
			PageBean.close();
			
		%>      
	</div>  
</body>   
</html>