<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page language="java" import="java.sql.*" errorPage=""%>
<jsp:useBean id="PageBean" scope="page" class="com.jdbc.ManageJDBC" />
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=gb2312">
	<title>分页显示记录</title>
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
		<span class="style2">分页显示记录</span><br><hr><br>
	</div>
	<table border="2" bordercolor="#ffcccc" align="center">
		<tr align="center" >
			<td>学号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>出生日期</td>
			<td>专业</td>
			<td>总学分</td>
			<td>备注</td>
		</tr>
		<%
			int intPageSize;  		//一页显示的记录数   
			int intRowCount;  		//记录总数
			int intPageCount; 		//总页数
			int intPage;	  		//待显示页码
			int i;
			intPageSize=8;    	//设置一页显示的记录数 
			String strPage;
			strPage=request.getParameter("page");  //取得待显示的页码
			if(strPage==null)
			{
				//表明在QueryString中没有page这一参数，此时显示第一页的数据
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
			rs.last();       			//记录指针指向查询结果集中的最后一条记录
			intRowCount=rs.getRow();  //获取总记录数
			intPageCount=(intRowCount+intPageSize-1)/intPageSize;  //计算总页数
			if(intPage>intPageCount)
				intPage=intPageCount; //调整待显示的页码
			if(intPageCount>0)
			{
				//将记录指针定位到待显示页的第一条记录上
				rs.absolute((intPage-1)*intPageSize+1);
				//显示数据
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
	<div align="center">第<%=intPage %>页&nbsp&nbsp&nbsp共<%=intPageCount %>页&nbsp&nbsp&nbsp
		<% 
			if(intPage<intPageCount)
			{
		%>
		<a href="7_3page.jsp?page=<%=intPage+1 %>">下一页</a>&nbsp&nbsp&nbsp
		<%
			}
			if(intPage>1)
			{
		%>
		<a href="7_3page.jsp?page=<%=intPage-1%>">上一页</a>	
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