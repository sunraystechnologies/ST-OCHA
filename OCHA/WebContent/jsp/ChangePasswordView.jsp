
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.controller.ChangePasswordCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>

<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
	scope="request"></jsp:useBean>

<h1>Change Password</h1>

<H2>
	<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
	</font>
</H2>

<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="POST">

	<input type="hidden" name="id" value="<%=bean.getId()%>">

	<table>

		<tr>
			<th>Old Password*</th>
			<td><input type="password" name="oldPassword"
				value=<%=DataUtility
					.getString(request.getParameter("oldPassword") == null ? ""
							: DataUtility.getString(request
									.getParameter("oldPassword")))%>><font
				color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%></font></td>
		</tr>

		<tr>
			<th>New Password*</th>
			<td><input type="password" name="newPassword"
				value=<%=DataUtility
					.getString(request.getParameter("newPassword") == null ? ""
							: DataUtility.getString(request
									.getParameter("newPassword")))%>><font
				color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font></td>
		</tr>

		<tr>
			<th>Confirm Password*</th>
			<td><input type="password" name="confirmPassword"
				value=<%=DataUtility.getString(request
					.getParameter("confirmPassword") == null ? "" : DataUtility
					.getString(request.getParameter("confirmPassword")))%>><font
				color="red"> <%=ServletUtility
					.getErrorMessage("confirmPassword", request)%></font></td>
		</tr>

		<tr>
			<th></th>
			<td colspan="2"><input type="submit" name="operation"
				value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>"> &nbsp;
				<input type="submit" name="operation"
				value="<%=ChangePasswordCtl.OP_SAVE%>"> &nbsp;</td>
		</tr>

	</table>
	<H3>
		<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
		</font>
	</H3>
</form>



