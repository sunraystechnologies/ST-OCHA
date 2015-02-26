
<%@page import="in.co.sunrays.ocha.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>Role List</h1>

		<form action="<%=ORSView.ROLE_LIST_CTL%>">
			<table width="100%">
				<tr>
					<td align="center"><label>Name :</label> <input type="text"
						name="name"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&nbsp; <input type="submit" name="operation" value="<%=RoleListCtl.OP_SEARCH %>">
					</td>
				</tr>
			</table>
			<table border="1" width="100%">
				<tr>
					<th>S.No.</th>
					<th>Id</th>
					<th>Name</th>
					<th>Descriptiop</th>
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
					Iterator<RoleModel> it = list.iterator();
					while (it.hasNext()) {
						RoleModel model = it.next();
				%>
				<tr>
					<td><%=index++%></td>
					<td><%=model.getId()%></td>
					<td><%=model.getName()%></td>
					<td><%=model.getDescription()%></td>
					<td><a href="RoleCtl?id=<%=model.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_PREVIOUS%>"></td>
					<td></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>