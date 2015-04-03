<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>

<jsp:useBean id="model" class="in.co.sunrays.ocha.model.EResourceModel"
	scope="request"></jsp:useBean>

<h1>E-Resource</h1>

<p class="error-header">
	<%=ServletUtility.getErrorMessage(request)%>
</p>
<p class="success-header">
	<%=ServletUtility.getSuccessMessage(request)%>
</p>

<%=ServletUtility.getErrorMessageHtml(request)%>


<form action="<%=ORSView.ERESOURCE_CTL%>" method="GET">

	<input type="hidden" name="id" value="<%=model.getId()%>">

	<table>

		<tr>
			<th>Link</th>
			<td><input type="text" name="name" width="300px"
				value="<%=DataUtility.getStringData(model.getName())%>"></td>
		</tr>

		<tr>
			<th valign="top">Detail</th>
			<td><textarea rows="3" cols="40" name="detail"><%=DataUtility.getStringData(model.getDetail())%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				name="operation" value="<%=BaseCtl.OP_SAVE%>"> &nbsp; <%
 	if (model.getId() > 0) {
 %> <input type="submit" name="operation" value="<%=BaseCtl.OP_DELETE%>">
				&nbsp; <%
 	}
 %> <input type="submit" name="operation" value="<%=BaseCtl.OP_CANCEL%>">
			</td>
		</tr>
	</table>
</form>

