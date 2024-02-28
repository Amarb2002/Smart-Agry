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
		String b=request.getParameter("pi");
		String c=request.getParameter("qa");
		String d=request.getParameter("st");
		String e=request.getParameter("prc");
		int pr=Integer.parseInt(e);
		int qa=Integer.parseInt(c);
		int tprc=pr*qa;
		int z=s.stm.executeUpdate("insert into order_details values(null,'"+a+"','"+b+"','"+c+"','"+tprc+"','"+d+"')");
		out.println("<script>alert('Order Request Sent Successfully');document.location='order_view.jsp';</script>");
		
	}
%>