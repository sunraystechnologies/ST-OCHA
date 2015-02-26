
<%@page import="in.co.sunrays.ocha.model.NoticeModel"%>
<%@page import="in.co.sunrays.ocha.controller.NoticeListCtl"%>
<%@page import="in.co.sunrays.ocha.controller.UserListCtl"%>
<%@page import="in.co.sunrays.ocha.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>Notice List</h1>

		<form action="<%=ORSView.NOTICE_LIST_CTL%>">

			<table width="100%">
				<tr>
					<td align="center"><label>Subject:</label> <input
						type="text" name="subject"
						value="<%=ServletUtility.getParameter("subject", request)%>">
						&emsp; <label>Detail:</label> <input type="text" name="detail"
						value="<%=ServletUtility.getParameter("detail", request)%>">
						&emsp; <input type="submit" name="operation" value="<%=NoticeListCtl.OP_SEARCH %>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%">
				<tr>
				<th>ID</th>
					<th>Subject</th>
					<th>Detail</th>
					<th>Create Date</th>
					<th>Expire Date</th>
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
					Iterator<NoticeModel> it = list.iterator();
					while (it.hasNext()) {
						NoticeModel model = it.next();
				%>
				<tr>
					<td><%=model.getId()%></td>
					<td><%=model.getSubject()%></td>
					<td><%=model.getDetails()%></td>
					<td><%=model.getCreatedOn()%></td>
					<td><%=model.getExpireDate()%></td>
					<td><a href="NoticeCtl?id=<%=model.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td ><input type="submit" name="operation"
						value="<%=NoticeListCtl.OP_PREVIOUS%>"></td>
					 <td ><input type="submit"
						name="operation" value="<%=NoticeListCtl.OP_DELETE%>"></td>
					 <td align="right"><input type="submit" name="operation"
						value="<%=NoticeListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>