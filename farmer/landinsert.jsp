<title>PROCESSING.....</title>
<%@page import="java.sql.*"%>
<%@page import="agri.dbconnect"%>
<jsp:useBean id="s" class="agri.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
	String ch=request.getParameter("Submit");
	if(ch==null)
	{
		out.println("<script>history.back();</script>");
	}
	else
	{
		String a=request.getParameter("fi");
		String b=request.getParameter("ls");
		String c=request.getParameter("st");
		String d=request.getParameter("wr");
		int z=s.stm.executeUpdate("insert into land_details values(null,'"+a+"','"+b+"','"+c+"','"+d+"')");
		out.println("<script>alert('Details Added Successfully');document.location='landview.jsp';</script>");
		
	}
					
%>