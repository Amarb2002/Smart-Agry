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
                                  <h3 class="title-3 m-b-30"><strong>Order Details</strong> 
								  | <a href="query_form.jsp"><button class="btn btn-success">Ask New</button></a></h3>
                                 
                             <!-- <div class="table-responsive table-data"> -->
<div class="table-responsive">
<table width="896" class="table">
  <thead>
    <tr>
      <th width="76" height="30"><div align="center"><strong>#</strong></div></th>
      <th width="105"><div align="center"><strong>Query Form</strong></div></th>
      <th width="70"><div align="center"><strong>Query</strong></div></th>
      <th width="100"><div align="center"><strong>Photo</strong></div></th>
	  <th width="71"><div align="center"><strong>Askd Date</strong></div></th>
      <th width="52"><div align="center"><strong>Replay</strong></div></th>
      <th width="95"><div align="center"><strong>Replied Date</strong></div></th>
      <th width="83"><div align="center"><strong>Action</strong></div></th>
    </tr>
      <%@page import="java.sql.*"%>
  <%@page import="agri.dbconnect"%>
  <jsp:useBean id="s" class="agri.dbconnect"/>
  
  <jsp:getProperty name="s" property="conn"/>
  <%
	int sn=0;
	String un=session.getAttribute("uname").toString();
	ResultSet rs=s.stm.executeQuery("select * from queries q,farmer_details f where q.q_form=f.f_id and f.f_mobile='"+un+"'");
	while(rs.next())
	{
		int i=rs.getInt("q_id");
		sn++;
		String rdt=rs.getString("r_date");
		String pht=rs.getString("q_photo");
%>
  <tr>
    <td><div align="center"><%=sn%></div></td>
    <td><div align="center"><%=rs.getString("f_name")%> <%=rs.getString("f_lname")%></div></td>
    <td><div align="center"><%=rs.getString("queriy")%></div></td>
    <td><div align="center"><a title="View" target="_blank" href="../uploads/<%=pht%>"><img src="../uploads/<%=pht%>" style="width:150px; height:100px;"/></a></div></td>
	<td><div align="center"><%=rs.getString("a_date")%></div></td>
	<td><div align="center"><%=rs.getString("replay")%></div></td>
	<td><div align="center"><%=rdt%></div></td>
    <td><div align="center"><% if(rdt.equals("-")) { %><a onClick="return confirm('Are you sure?')" href="query_delete.jsp?id=<%=i%>" title="Delete" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a><% } else { out.println("-"); } %></div></td>
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





