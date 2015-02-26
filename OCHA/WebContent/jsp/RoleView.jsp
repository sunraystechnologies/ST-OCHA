
<%@page import="in.co.sunrays.ocha.controller.RoleCtl"%>
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.util.DataUtility"%>
<%@page import="in.co.sunrays.ocha.util.ServletUtility"%>
<html>
<body>
	<form action="<%=ORSView.ROLE_CTL%>">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="model" class="in.co.sunrays.ocha.model.RoleModel"
			scope="request"></jsp:useBean>

		<center>
			<h1>Add Role</h1>
			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<input type="hidden" name="id" value="<%=model.getId()%>">
			<input type="hidden" name="createdBy" value="<%=model.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=model.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(model.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(model.getModifiedDatetime())%>">
			

			<table>
				<tr>
					<th>Name*</th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(model.getName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
				</tr>
				<tr>
					<th>Description*</th>
					<td><input type="text" name="description"
						value="<%=DataUtility.getStringData(model.getDescription())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("description", request)%></font></td>
				</tr>
				<tr>
				    <th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=RoleCtl.OP_SAVE%>">&emsp; <input type="submit"
						name="operation" value="<%=RoleCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>