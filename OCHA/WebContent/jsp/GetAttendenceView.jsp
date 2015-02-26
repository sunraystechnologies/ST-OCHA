
<%@page import="in.co.sunrays.proj4.controller.GetAttendenceCtl"%>
<%@page import="in.co.sunrays.proj4.controller.AttendenceListCtl"%>
<%@page import="in.co.sunrays.proj4.model.AttendenceModel"%>
<%@page import="in.co.sunrays.proj4.controller.CommentListCtl"%>
<%@page import="in.co.sunrays.proj4.model.CommentModel"%>
<%@page import="in.co.sunrays.proj4.model.EResourceModel"%>
<%@page import="in.co.sunrays.proj4.controller.EResourceListCtl"%>
<%@page import="in.co.sunrays.proj4.model.NoticeModel"%>
<%@page import="in.co.sunrays.proj4.controller.NoticeListCtl"%>
<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>

	<%@include file="Header.jsp"%>

	<center>
		<h1>GetAttendance </h1>

		<form action="<%=ORSView.GETATTENDENCE_CTL%>">

			<table border="1" width="100%">
				<tr>
				<th>Student Name</th>
					<th>Subject</th>
					<th>Attendance</th>
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
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td ><input type="submit" name="operation"
						value="<%=GetAttendenceCtl.OP_PREVIOUS%>"></td>
					 <td align="right"><input type="submit" name="operation"
						value="<%=GetAttendenceCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>