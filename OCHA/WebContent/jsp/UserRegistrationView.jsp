
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.ocha.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">

	<script>
$(function() {
    $('.date-picker').datepicker( );
});
</script>
<html>
<body>

<div class="container">

	<div class="row" style="margin-top: 30px">
		<img alt="" src="<%=ORSView.APP_CONTEXT%>/img/SGSITS_Indore.png"  width="200"
					height="90">
		<span class=" col-md-offset-3 " style="font-size: 25pt;">User Registration</span>

					<div class=" col-md-offset-3 " style="margin-top: -40px" >
<hr>
</div>
	</div>

	<h3 class=" col-md-offset-4 ">
	<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font><font color="red" > <%=ServletUtility.getErrorMessage(request)%>
					</font></h3>
					<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
			scope="request"></jsp:useBean>		
			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
			
					
	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" class="form-horizontal">

     <%
			List l = (List) request.getAttribute("roleList");
		%>

		<div class="form-group">
					<label for="inputfirstName" class="control-label col-md-offset-3 col-md-2">
					First Name</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="firstName" id="firstName"
							placeholder="First Name" value="<%=DataUtility.getStringData(bean.getFirstName())%>">  <font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font>
					</div>
				</div>	
						<div class="form-group">
					<label for="inputlastName" class="control-label col-md-offset-3 col-md-2">Last Name</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="lastName" id="lastName"
							placeholder="Last Name" value="<%=DataUtility.getStringData(bean.getLastName())%>"> <font color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font>
					</div>
				</div>
				
						<div class="form-group ">
					<label for="inputCollegeId" class="control-label col-md-offset-3 col-md-2">College ID</label>
					<div class="col-md-7 ">
					<input type="text"   name="collegeCode"
						value="0801" readonly="readonly" style="width: 60px;height: 35px">
						<select  id="branch" name="branch" style="width: 52px;height: 35px">
							<option value="IT">IT</option>
						<option value="CS">CS</option>
						<option value="EC">EC</option>
						<option value="CE">CE</option>
						<option value="ME">ME</option>
							
						</select> 
						<select  name="year" style="width: 52px;height: 35px">
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						</select>
						<input type="text" name="collegeId" 
						value="<%=DataUtility.getStringData(bean.getCollegeId())%>" style="width: 85px;height: 35px">
						<font color="red"> <%=ServletUtility.getErrorMessage("branch", request)%></font>
						<font
						color="red"> <%=ServletUtility.getErrorMessage("collegeId", request)%></font>
							<font
						color="red"> <%=ServletUtility.getErrorMessage("year", request)%></font>
					</div>
				</div>
				<div class="form-group">
					<label for="inputfatherName" class="control-label col-md-offset-3 col-md-2">
					Father Name</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="fatherName" id="fatherName"
							placeholder="Father Name" value="<%=DataUtility.getStringData(bean.getFatherName())%>">  <font color="red"> <%=ServletUtility.getErrorMessage("fatherName", request)%></font>
					</div>
				</div>	
				<div class="form-group">
					<label for="inputmotherName" class="control-label col-md-offset-3 col-md-2">
					Mother Name</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="motherName" id="motherName"
							placeholder="Mother Name" value="<%=DataUtility.getStringData(bean.getFatherName())%>">  <font color="red"> <%=ServletUtility.getErrorMessage("motherName", request)%></font>
					</div>
				</div>	
				
				<div class="form-group">
						<label for="inputEmail"
							class="control-label col-md-offset-2 col-md-3">Email</label>
								<div class="col-md-3">
							<input type="email" class="form-control" id="login" name="login"
								placeholder="Email ID" value="<%=DataUtility.getStringData(bean.getLogin())%>">
							<font
						color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font>
						</div>
				</div>
					<div class="form-group ">
						<label for="inputPassword"
							class="control-label col-md-offset-2 col-md-3">Password</label>
							<div class="col-md-3">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="Password" value="<%=DataUtility.getStringData(bean.getLogin())%>"> 
								<font color="red">
								<%=ServletUtility.getErrorMessage("password", request)%></font>
						</div>
					</div>
					
							<div class="form-group ">
						<label for="inputconfirmPassword"
							class="control-label col-md-offset-2 col-md-3">Confirm Password</label>
							<div class="col-md-3">
							<input type="password" class="form-control" name="confirmPassword"
								id="confirmPassword" placeholder="Confirm Password" value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"> 
								<font color="red">
								<%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
						</div>
					</div>
					
			<div class="form-group">
							<label for="inputGender" class="control-label col-md-offset-2 col-md-3">Gender
								</label>
							<div class="col-md-3">
						<%
							HashMap map = new HashMap();
							map.put("M", "Male");
							map.put("F", "Female");

							String htmlList = HTMLUtility.getList("gender", bean.getGender(),
									map);
						%> <%=htmlList%>
							
								<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
							</div>
							</div>
							
							<div class="form-group">
							<label for="inputRole" class="control-label col-md-offset-2 col-md-3">Role
								</label>
							<div class="col-md-3">
					<%=HTMLUtility.getList("roleId",
					String.valueOf(bean.getRoleId()), l)%>
								<font color="red"> <%=ServletUtility.getErrorMessage("roleId", request)%></font>
							</div>
						</div>
				
					<div class="form-group">
					<label for="inputdob" class="control-label col-md-offset-3 col-md-2">Date Of Birth</label>
					<div class="col-md-3">
						<input type="text"  name="dob" id="dob"
							 class="form-control date-picker"
							placeholder="Date of Birth" value="<%=DataUtility.getDateString(bean.getDob())%>"><font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font>
					</div>
				</div>
					<div class="form-group">
					<label for="inputmobileNo" class="control-label col-md-offset-3 col-md-2">
					Mobile No</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="mobileNo" id="mobileNo"
							placeholder="Mobile No" value="<%=DataUtility.getStringData(bean.getMobileNo())%>">  <font color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
					</div>
				</div>	
					<div class="form-group">
					<label for="inputaddress" class="control-label col-md-offset-3 col-md-2">
					Address</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="address" id="address"
							placeholder="Address" value="<%=DataUtility.getStringData(bean.getAddress())%>">  <font color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font>
					</div>
				</div>
					<div class="form-group">
				<div class="col-md-offset-6 ">
						<button name="operation" class="btn icon-btn-save btn-success" value="<%=UserRegistrationCtl.OP_SIGN_UP %>" type="submit">
						<span class="btn-save-label">
						<i class="glyphicon glyphicon-floppy-disk"></i>
						</span>
						save</button>
						</div>
						</div>
	
	</form>
	</div>
</body>
</html>