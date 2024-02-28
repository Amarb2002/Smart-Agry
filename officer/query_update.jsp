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
	    String x=request.getParameter("id");
		String e=request.getParameter("re");
		String f=request.getParameter("rd");
		int z=s.stm.executeUpdate("update queries set replay='"+e+"',r_date='"+f+"' where q_id='"+x+"'");
		out.println("<script>alert('Replied Successfully');document.location='query_view.jsp';</script>");
		
	}
					
%>