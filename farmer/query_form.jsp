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
				   <div class="card">
				
					 <div class="card-header">
                                        <strong>Query</strong>
                                    </div>
                                    <div class="card-body card-block">
<!-- Form Start -->

 
   <%@page import="java.sql.*"%>
  <%@page import="agri.dbconnect"%>
  <jsp:useBean id="s" class="agri.dbconnect"/>
  <jsp:getProperty name="s" property="conn"/>
   <jsp:include page="val.jsp"></jsp:include> 
<form  id="WFS_Riz" name="form1" method="post" action="query_insert.jsp">
 <div class="row form-group">
	 <div class="col col-md-2"><label for="text-input" class="form-control-label">Query From</label></div>
	    <div class="col-12 col-md-10">
	  <select class="validate[required] form-control" readonly name="qf"  id="qf">
	         <!--   <option value="">-- select farmer_details --</option> -->
    <%
	String un=session.getAttribute("uname").toString();
    ResultSet rs1=s.stm.executeQuery("select * from farmer_details where f_mobile='"+un+"'");
    while(rs1.next())
    {
    %>
    <option value="<%=rs1.getInt("f_id")%>"><%=rs1.getString("f_name")%> <%=rs1.getString("f_lname")%></option>
    <%
    }
    %>
    </select>
	  </div>
    </div>
	
       <div class="row form-group">
	 <div class="col col-md-2"><label for="text-input" class="form-control-label">Query</label></div>
	    <div class="col-12 col-md-10">
	      <textarea name="qu" rows="2" class="validate[required] form-control" id="qu"></textarea>
	  
     </div>
    </div>
	
	<%@page import="java.util.Date"%>
	<%
		Date d=new Date();
		int dd,mm,yy;
		dd=d.getDate(); mm=d.getMonth()+1; yy=d.getYear()+1900;
		String dt=dd+"-"+mm+"-"+yy;
	%>
	
      <div class="row form-group">
	 <div class="col col-md-2"><label for="text-input" class="form-control-label">Applied date</label></div>
	    <div class="col-12 col-md-10"><input class="validate[required] form-control" readonly="" value="<%=dt%>" name="ad" type="text" id="ad">
      </div>
    </div>
	

	
	
       <div class="card-footer" align="center">
	   <button type="submit" class="btn btn-primary btn-sm" name="Submit"><i class="fa fa-dot-circle-o"></i> Submit</button>
	   <button type="reset" class="btn btn-danger btn-sm"><i class="fa fa-ban"></i> Reset</button>
	</div>
</form>
 <!-- Form End -->                                 
    
	      </div>
				  </div>
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