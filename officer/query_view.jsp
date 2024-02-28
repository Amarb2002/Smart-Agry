<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>

<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

  <div class="main-content">
        <div class="section__content section__content--p30">
          <div class="container-fluid">
            <div class="row">
			  
				 <!-- Start -->
				 <div class="col-md-12">
				   <!--<div class="card"> --> 
					 
					  <!-- USER DATA-->
                                <div class="user-data m-b-30">
                                  <h3 class="title-3 m-b-30"><strong>Queries</strong> 
								 <!-- | <a href="query_form.jsp"><button class="btn btn-success">Add New</button></a> --></h3>
                                 
                             <!-- <div class="table-responsive table-data"> -->
<div class="table-responsive">
<table width="896" class="table">
  <thead>
    <tr>
      <th width="76"><div align="center"><strong>#</strong></div></th>
      <th width="105"><div align="center"><strong>Query form</strong></div></th>
      <th width="70"><div align="center"><strong>Query</strong></div></th>
      <th width="100"><div align="center"><strong>Photo</strong></div></th>
	  <th width="71"><div align="center"><strong>Asked Date</strong></div></th>
      <th width="52"><div align="center"><strong>Reply</strong></div></th>
      <th width="95"><div align="center"><strong>Reply Date </strong></div></th>
      <th width="83"><div align="center"><strong>Action</strong></div></th>
    </tr>
      <%@page import="java.sql.*"%>
  <%@page import="agri.dbconnect"%>
  <jsp:useBean id="s" class="agri.dbconnect"/>
  <jsp:getProperty name="s" property="conn"/>
  <%
	int sn=0;
	ResultSet rs=s.stm.executeQuery("select * from queries q,farmer_details f where q.q_form=f.f_id");
	while(rs.next())
	{
		int i=rs.getInt("q_id");
		sn++;
		String rdt=rs.getString("r_date");
		String pht=rs.getString("q_photo");
		int fid=rs.getInt("f_id");
%>
  <tr>
    <td><div align="center"><%=sn%></div></td>
      <td><div align="center"><a href="farmer_profile.jsp?fid=<%=fid%>&pg=qa" title="View Profile"><%=rs.getString("f_name")%> <%=rs.getString("f_lname")%></a></div></td>
    <td><div align="center"><%=rs.getString("queriy")%></div></td>
	<td><div align="center"><a title="View" target="_blank" href="../uploads/<%=pht%>"><img src="../uploads/<%=pht%>" style="width:150px; height:100px;"/></a></div></td>
    <td><div align="center"><%=rs.getString("a_date")%></div></td>
	<td><div align="center"><%=rs.getString("replay")%></div></td>
	<td><div align="center"><%=rs.getString("r_date")%></div></td>
    <td><div align="center"><% if(rdt.equals("-")) { %><a href="query_edit.jsp?id=<%=i%>" title="Reply" class="btn btn-info btn-sm"><i class="fa fa-paper-plane"></i>Reply </a><% } else { out.println("-"); } %></div></td>
  </tr>
  <% 
  }
  %>

	</tbody>
              </table>
                                  </div>
                                    
                                </div>
                                <!-- END USER DATA-->
					
				  <!--</div> -->
                </div>
				<!-- End -->
                
            </div>
          </div>
    </div>

</div>

    </div>		


<jsp:include page="footer.jsp"></jsp:include>
<%
}
else
{
out.println("<script>alert('Your Session Expired. Please Re-Login');document.location='../index.jsp';</script>");
}
%>





