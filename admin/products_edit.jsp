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
                                        <strong>Product</strong>
                                    </div>
                                    <div class="card-body card-block">
<!-- Form Start -->

<%@page import="java.sql.*"%>
<%@page import="agri.dbconnect"%>
<jsp:useBean id="s" class="agri.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%String m=request.getParameter("id");%>
<%
	ResultSet rs=s.stm.executeQuery("select * from products where pr_id="+m+"");
	rs.next();
	%>
	<form name="form1" method="post" action="products_update.jsp">
	<input type="hidden" name="id" value="<%=m%>"/>
  <div class="form-group">
  	<label>Product Name</label>
  <input class="form-control" name="pn" value="<%=rs.getString("pr_name")%>" type="text" id="pn"></td>
   </div>
	 
  <div class="form-group">
  	<label>Description</label>
  <input class="form-control" name="pd" value="<%=rs.getString("pr_description")%>" type="text" id="pd"></td>
  </div>
	 
    <div class="form-group">
  	<label>Code</label>
  <input class="form-control" value="<%=rs.getString("pr_code")%>" name="pc" type="text" id="pc"></td>
    </div>
	 
    <div class="form-group">
  	<label>Price</label>
  <input class="form-control" value="<%=rs.getString("pr_price")%>" name="pp" type="text" id="pp"></td>
   </div>
	 
   <div class="form-group">
  	<label>Photo</label>
  <input class="form-control" value="<%=rs.getString("pr_photo")%>" name="ph" type="text" id="ph"></td>
</div>
	 
  <div class="card-footer" align="center">
      <button type="update" class="btn btn-primary btn-sm" name="update"><i class="fa fa-dot-circle-o"></i> update</button>
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




