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
                                        <strong>Farmer</strong> Details
                                    </div>
                                    <div class="card-body card-block">
<!-- Form Start -->


<%@page import="java.sql.*"%>
<%@page import="agri.dbconnect"%>
<jsp:useBean id="s" class="agri.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>

<jsp:include page="val.jsp"></jsp:include> 


<%
	String un=session.getAttribute("uname").toString();
	ResultSet rs=s.stm.executeQuery("select * from farmer_details where f_mobile="+un+"");
	rs.next();
	%>
	
	<div style="margin-left:10px">
		<img src="../uploads/<%=rs.getString("f_photo")%>" width="150px" height="150px"/>
		</br>
		<a style="font-size:14px; margin-left:20px;" href="farmer_select_photo.jsp">Change Picture</a>
	</div> 
	</br>
	<form id="WFS_Riz" name="form1" method="post" action="farmer_update.jsp">
	<input type="hidden" name="id" value="<%=rs.getInt("f_id")%>"/>
	 <div class="form-group">
	 <label>First Name</label>
	<input class="validate[required,custom[onlyLetter]] form-control" value="<%=rs.getString("f_name")%>" name="fn" type="text" id="fn">
   </div>
   
     <div class="form-group">
	 <label>Last Name</label>
	 <input class="validate[required,custom[onlyLetter]] form-control" value="<%=rs.getString("f_lname")%>" name="ln" type="text" id="ln">
    </div>

    <div class="form-group">
	 <label>Mobile</label>
	 <input class="validate[required,custom[mobile] form-control" readonly="" value="<%=rs.getString("f_mobile")%>" name="mn" type="text" id="mn">
    </div>
	 <div class="form-group">
	 <label>Address</label>
	 <textarea name="ad" class="validate[required] form-control" id="ad"><%=rs.getString("f_address")%></textarea>
    </div>
	
	
 
		 <div class="card-footer" align="center">
       <button type="submit" class="btn btn-primary btn-sm" name="Submit"><i class="fa fa-dot-circle-o"></i> Update</button>
      <button type="reset" class="btn btn-danger btn-sm"><i class="fa fa-ban"></i> Reset</button>
      </div>
</form>
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
