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
<%String m=request.getParameter("id");%>
<%
	ResultSet rs=s.stm.executeQuery("select * from queries where q_id="+m+"");
	rs.next();
	%>
	<form name="form1" method="post" action="query_update.jsp">
	<input type="hidden" name="id" value="<%=m%>"/>

	 
   <div class="form-group">
  	<label>Replay</label>
    <textarea name="re" rows="2" class="form-control" id="re"></textarea>

     </div>
	 <%@page import="java.util.Date"%>
	<%
		Date d=new Date();
		int dd,mm,yy;
		dd=d.getDate(); mm=d.getMonth()+1; yy=d.getYear()+1900;
		String dt=dd+"-"+mm+"-"+yy;
	%>
     <div class="form-group">
  	<label>Replay Date</label>
  <input class="form-control" name="rd" value="<%=dt%>" readonly="" type="text" id="rd">
     </div>
	 
          <div class="card-footer" align="center">
      <button type="submit" class="btn btn-primary btn-sm" name="Submit"><i class="fa fa-dot-circle-o"></i> Reply</button>
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






