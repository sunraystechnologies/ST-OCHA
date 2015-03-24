
<%@page import="in.co.sunrays.ocha.controller.MyProfileCtl"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>

<!-- Latest compiled and minified JavaScript -->
<script src="../js/bootstrap.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	<script>
$(function() {
    $('.date-picker').datepicker( );
});
</script>
<html>
<body>
		<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
			scope="request"></jsp:useBean>
<div class="container">
    <div class="row">
        <div  class="col-md-2">
        <%@include file="Header.jsp"%>
        </div>
        <div class="col-md-10">
        	<h3 align="Center"  style="margin-top: 140px">
					<hr>
				My Profile
					</h3>
					<h3 class="col-md-offset-4">
					<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
					<font color="red" >  <%=ServletUtility.getErrorMessage(request)%>
					</font></h3>
			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
			

			<form action="<%=ORSView.MY_PROFILE_CTL%>" class="form-horizontal">
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
				<div class="col-md-offset-5 ">
					<button name="operation" class="btn icon-btn-save btn-success" value="<%=MyProfileCtl.OP_SAVE %>" type="submit">
						<span class="btn-save-label">
						<i class="glyphicon glyphicon-floppy-disk"></i>
						</span>
						save</button>
						<button name="operation" class="btn icon-btn-save btn-success" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD %>"type="submit">
						ChangePassword
						</button>
						</div>
						</div>
	</form>
			
			</div>
			</div>
			</div>


</body>
</html>