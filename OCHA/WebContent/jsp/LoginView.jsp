
<%@page import="java.util.ResourceBundle"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.model.NoticeModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.ocha.controller.LoginCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>


<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
	scope="request"></jsp:useBean>


<p class="error-header">
	<%=ServletUtility.getErrorMessage(request)%>
</p>

<table>
	<TR>
		<td><h2>Login</h2></td>
		<td><h2>Notice board</h2></td>
	</TR>
	<tr>
		<td width="50%">

			<form action="<%=ORSView.LOGIN_CTL%>" method="POST">

				<table>
					<tr>
						<th>LoginId*</th>
						<td><input type="text" name="login" size=30
							value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
					</tr>
					<tr>
						<th>Password*</th>
						<td><input type="password" name="password" size=30
							value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
							color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
					</tr>
					<tr>
						<th></th>
						<td colspan="2"><input type="submit" name="operation"
							value="<%=LoginCtl.OP_SIGN_IN%>"></td>
					</tr>
					<tr>
						<th></th>
						<td><BR><a href="<%=ORSView.USER_REGISTRATION_CTL%>?roleId=2">Student
								Sign UP</a></td>
					</tr>
					<tr>
						<th></th>
						<td><a href="<%=ORSView.USER_REGISTRATION_CTL%>?roleId=3">Staff
								Sign UP</a></td>
					</tr>
					<tr>
						<th></th>
						<td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>">Forget my
								password</a>&nbsp;</td>
					</tr>
				</table>

			</form>
		</td>
		<td valign="top">
			<table border="1" width="100%">
				<tr>
					<th>Sq. No</th>
					<th>Subject</th>
					<th>Details</th>
					<th>Create Date</th>
					<th>Expire Date</th>
				</tr>

				<%
					int i = 1;
					List list = (List) request.getAttribute("noticeList");
					Iterator it = list.iterator();
					while (it.hasNext()) {
						NoticeModel model = (NoticeModel) it.next();
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=model.getSubject()%></td>
					<td><%=model.getDetails()%></td>
					<td><%=model.getCreatedOn()%></td>
					<td><%=model.getExpireDate()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</td>
	</tr>
</table>
