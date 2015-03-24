
<%@page import="in.co.sunrays.ocha.controller.ChangePasswordCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
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
				Change Password
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

				<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" class="form-horizontal">
					<div class="form-group">
					<label for="inputtableoldPassword" class="control-label col-md-offset-2 col-md-2">
					Old Password</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="oldPassword" id="oldPassword"
							placeholder="Old Password" value=<%=DataUtility
					.getString(request.getParameter("oldPassword") == null ? ""
							: DataUtility.getString(request
									.getParameter("oldPassword")))%>><font
						color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%></font>
					</div>
				</div>	
				
				<div class="form-group">
					<label for="inputnewPassword" class="control-label col-md-offset-2 col-md-2">
					New Password</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="newPassword" id="newPassword"
							placeholder="New Password" value=<%=DataUtility
					.getString(request.getParameter("newPassword") == null ? ""
							: DataUtility.getString(request
									.getParameter("newPassword")))%>><font
						color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font>
					</div>
				</div>	
					<div class="form-group">
					<label for="inputconfirmPassword" class="control-label col-md-offset-2 col-md-2">
					Confirm Password</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="confirmPassword" id="confirmPassword"
							placeholder="Confirm Password"value=<%=DataUtility.getString(request
					.getParameter("confirmPassword") == null ? "" : DataUtility
					.getString(request.getParameter("confirmPassword")))%>><font
						color="red"> <%=ServletUtility
					.getErrorMessage("confirmPassword", request)%></font>
					</div>
				</div>	
				<div class="form-group">
				<div class="col-md-offset-4 ">
						<button name="operation" style="margin-left: 20px" class="btn icon-btn-save btn-success" value="<%= ChangePasswordCtl.OP_SAVE%>" type="submit">
						<span class="btn-save-label">
						<i class="glyphicon glyphicon-floppy-disk"></i>
						</span>
						save</button>
						<button name="operation" style="margin-left: 20px" class="btn icon-btn-save btn-success" value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE %>" type="submit">
						Change My Profile
						</button>
						</div>
						</div>
				</form>
			</div>
			</div>
			</div>

	

</body>
</html>