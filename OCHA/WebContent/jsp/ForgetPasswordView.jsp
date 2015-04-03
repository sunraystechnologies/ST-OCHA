
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.controller.ForgetPasswordCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>

<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
	scope="request"></jsp:useBean>

<h1>Forget Password</h1>

<p class="error-header ">
	<%=ServletUtility.getErrorMessage(request)%>
</p>

<p class="success-header ">
	<%=ServletUtility.getSuccessMessage(request)%>
</p>


<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="GET">

	<table >
		<tr>
			<td>Email ID *</td>
			<td><input type="text" name="login" size="50"
				value=<%=DataUtility.getStringData(request.getParameter("login"))%>>
				<span class="error"> <%=ServletUtility.getErrorMessage("login", request)%>
			</span></td>
			<td><input type="submit" name="operation"
				value="<%=BaseCtl.OP_GO%>"></td>
		</tr>

	</table>

</form>
