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
		String a=request.getParameter("qf");
		String b=request.getParameter("qu");
		String c=request.getParameter("ad");
		//String d=request.getParameter("qp");
		String e=request.getParameter("re");
		String f=request.getParameter("rd");
		int z=s.stm.executeUpdate("insert into queries values(null,'"+a+"','"+b+"','"+c+"','noimg.webp','-','-')");
		out.println("<script>alert('Details Added. Click ok to Uplaod Photo');document.location='query_select_photo.jsp';</script>");
		
	}
%>