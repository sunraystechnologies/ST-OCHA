
<%@page import="in.co.sunrays.ocha.controller.AttendenceListCtl"%>
<%@page import="in.co.sunrays.ocha.model.AttendenceModel"%>
<%@page import="in.co.sunrays.ocha.controller.CommentListCtl"%>
<%@page import="in.co.sunrays.ocha.model.CommentModel"%>
<%@page import="in.co.sunrays.ocha.model.EResourceModel"%>
<%@page import="in.co.sunrays.ocha.controller.EResourceListCtl"%>
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
		<h1>Attendance List</h1>

		<form action="<%=ORSView.ATTENDENCE_LIST_CTL%>">
<table width="100%">
				<tr>
					<td align="center"><label>Student Name</label> <input
						type="text" name="studentName"
						value="<%=ServletUtility.getParameter("studentName", request)%>">
						&emsp; <label>Subject:</label> <input type="text" name="subject"
						value="<%=ServletUtility.getParameter("subject", request)%>">
						&emsp; <input type="submit" name="operation" value="<%=AttendenceListCtl.OP_SEARCH %>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%">
				<tr>
				<th>Student Name</th>
					<th>Subject</th>
					<th>Attendance</th>
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
					Iterator<AttendenceModel> it = list.iterator();
					while (it.hasNext()) {
						AttendenceModel model = it.next();
				%>
				<tr>
					<td><%=model.getStudentName()%></td>
					<td><%=model.getSubject()%></td>
					<td><%=model.getAttendence()%></td>
					<td><a href="AttendenceCtl?id=<%=model.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td ><input type="submit" name="operation"
						value="<%=AttendenceListCtl.OP_PREVIOUS%>"></td>
					 <td ><input type="submit"
						name="operation" value="<%=AttendenceListCtl.OP_DELETE%>"></td>
					 <td align="right"><input type="submit" name="operation"
						value="<%=AttendenceListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>