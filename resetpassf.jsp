<%@page import="java.sql.*"%>
<%@page import="agri.dbconnect"%>
<jsp:useBean id="s" class="agri.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String un=request.getParameter("un");
String sa=request.getParameter("sa");
ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"' and s_ans='"+sa+"'");
if(!rs.next())
{
  out.println("<script>alert('Invalid Answer..!');history.back();</script>");
}
else
{
%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Reset Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="lgn_tmp/css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(lgn_tmp/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Reset Password</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	
		      	<form action="resetpass.jsp" method="post" class="signin-form">
				<input type="hidden" name="un" value="<%=un%>">
		      		<div class="form-group">
		      			<input type="password" name="npass" autofocus="on" class="form-control" placeholder="New Password" required>
		      		</div>
					<div class="form-group">
		      			<input type="password" name="cpass" class="form-control" placeholder="Confirm Password" required>
		      		</div>
	           
	            <div class="form-group">
	            	<button type="submit" name="Submit" class="form-control btn btn-primary submit px-3">Reset Now</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	
								</div>
								<div class="w-50 text-md-right">
									<a href="index.jsp" style="color: #fff">Back to Login</a>
								</div>
	            </div>
	          </form>
	          
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="lgn_tmp/js/jquery.min.js"></script>
  <script src="lgn_tmp/js/popper.js"></script>
  <script src="lgn_tmp/js/bootstrap.min.js"></script>
  <script src="lgn_tmp/js/main.js"></script>

	</body>
</html>


<%
}
%>
