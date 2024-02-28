<title>Processing...</title>
  <%@page import="java.sql.*"%>
  <%@page import="agri.dbconnect"%>
  <jsp:useBean id="s" class="agri.dbconnect"/>
  <jsp:getProperty name="s" property="conn"/>
<%
	String id=request.getParameter("id");
	if(id==null)
	{
		out.println("<script>history.back();</script>");
	}
	{
		String pr=request.getParameter("pr");
		if(pr.equals("acpt"))
		{
			int z=s.stm.executeUpdate("update scheme_applied set sca_status='accepted' where sca_id='"+id+"'");
			response.sendRedirect("sca_view.jsp");
		}
		else if(pr.equals("rjct"))
		{
			int z=s.stm.executeUpdate("update scheme_applied set sca_status='rejected' where sca_id='"+id+"'");
			response.sendRedirect("sca_view.jsp");
		}
		else
		{
			out.println("<script>history.back();</script>");
		}
	}
%>