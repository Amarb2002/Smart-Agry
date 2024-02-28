<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")!=null)
{
%>

  <%@page import="java.sql.*"%> 
  <%@page import="agri.dbconnect"%>
  <jsp:useBean id="s" class="agri.dbconnect"/>
  <jsp:getProperty name="s" property="conn"/>
  
<jsp:include page="meta.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

  <div class="main-content">
        <div class="section__content section__content--p30">

<section class="statistic-chart">
  <div class="container">
	<div class="row">
	   <div class="col-md-12">
	        <h3 class="title-5 m-b-35">Products</h3>
	   </div>
	</div>
	
	
	
	<div class="row"> 
	<%
	ResultSet rs=s.stm.executeQuery("select * from products");
	while(rs.next())
	{
		int i=rs.getInt("pr_id");
    %>
	   <div class="col-md-6 col-lg-4">
	
   
	        <div class="statistic-chart-1" align="center">
	            <h3 class="title-3 m-b-30"><%=rs.getString("pr_name")%></h3>
	               <div class="chart-wrap">
	                    <img style="width:150px;height:150px;" src="../uploads/<%=rs.getString("pr_photo")%>"/>
	               </div>
	              <div class="statistic-chart-1-note">
	                   <span>Pr. Code: <%=rs.getString("pr_code")%></span></br
					   <span><%=rs.getString("pr_description")%></span></br>
					   <span class="big">Rs. <%=rs.getString("pr_price")%></span></br>
					  <!-- <a href="">Order Now</a> -->
	              </div> 
	      </div>
	</div>
	
 <% } %>   




     </div>
   </div>
 </div>
</section>
							
                                
                
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






