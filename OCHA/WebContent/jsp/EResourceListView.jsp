
<%@page import="in.co.sunrays.ocha.model.EResourceModel"%>
<%@page import="in.co.sunrays.ocha.controller.EResourceListCtl"%>
<%@page import="in.co.sunrays.ocha.model.NoticeModel"%>
<%@page import="in.co.sunrays.ocha.controller.NoticeListCtl"%>
<%@page import="in.co.sunrays.ocha.controller.UserListCtl"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>ERsource List</h1>

		<form action="<%=ORSView.ERESOURCE_LIST_CTL%>">

			<table width="100%">
				<tr>
					<td align="center"><label>Table Contains:</label> <input
						type="text" name="tablesContains"
						value="<%=ServletUtility.getParameter("tablesContains", request)%>">
						&emsp; <label>Name:</label> <input type="text" name="name"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&emsp; <input type="submit" name="operation" value="<%=EResourceListCtl.OP_SEARCH %>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%">
				<tr>
				<th>ID</th>
					<th>Table Contains</th>
					<th>Name</th>
					<th>Details</th>
					<th>Edit</th>
				</tr>

				<tr>
					<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				</tr>

				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<EResourceModel> it = list.iterator();
					while (it.hasNext()) {
						EResourceModel model = it.next();
				%>
				<tr>
					<td><%=model.getId()%></td>
					<td><%=model.getTablesContains()%></td>
					<td><%=model.getName()%></td>
					<td><%=model.getDetail()%></td>
					<td><a href="EResourceCtl?id=<%=model.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td ><input type="submit" name="operation"
						value="<%=EResourceListCtl.OP_PREVIOUS%>"></td>
					 <td ><input type="submit"
						name="operation" value="<%=EResourceListCtl.OP_DELETE%>"></td>
					 <td align="right"><input type="submit" name="operation"
						value="<%=EResourceListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>