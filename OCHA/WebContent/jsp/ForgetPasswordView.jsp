
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<html>
<body>

	<div class="container">
<div class="row" style="margin-top: 30px">
		<img alt="" src="<%=ORSView.APP_CONTEXT%>/img/SGSITS_Indore.png"  width="200"
					height="90">
		<span class=" col-md-offset-2 " style="font-size: 25pt;">Forget Password</span>

					<div class=" col-md-offset-3 " style="margin-top: -40px" >
<hr>
</div>
	</div>

	<h3 class=" col-md-offset-4 "><font color="red" > <%=ServletUtility.getErrorMessage(request)%>
					</font> <font color="green" > <%=ServletUtility.getSuccessMessage(request)%>
					</font></h3>
	
	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" class="form-horizontal">

		<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
			scope="request"></jsp:useBean>
			<input type="hidden" name="id" value="<%=bean.getId()%>">
		<label for="inputEmail"
							class="control-label col-md-offset-2 col-md-2">Email </label>
						<div class=" col-md-3">
							<input type="email" class="form-control" id="login" name="login"
								placeholder="Email ID" > <font
								color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font>
						</div>
							<div class="form-group">
							<input name="operation" value="<%=ForgetPasswordCtl.OP_GO%>" type="submit"
								class="btn btn-success">
								</div>
			

	</form>
	</div>
</body>
</html>