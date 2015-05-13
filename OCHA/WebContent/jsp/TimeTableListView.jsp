<%@page import="in.co.sunrays.ocha.model.TimeTableModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="in.co.sunrays.common.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.util.AccessUtility"%>

<p class="st-title">Time Table List</p>

<form action="<%=ORSView.TIMETABLE_LIST_CTL%>">

	<table width="100%">
		<tr>
			<td align="center"><label> Subject :</label> <input type="text"
				name="subject"
				value="<%=ServletUtility.getParameter("subject", request)%>">
				&emsp; <input type="submit" name="operation"
				value="<%=BaseCtl.OP_SEARCH%>"></td>
		</tr>
	</table>
	<br>

	<table border="1" width="100%">
		<tr>
			<th>Select</th>
			<th>Date</th>
			<th>Time</th>
			<th>Subject</th>
			<th>Branch</th>
			<th>Year</th>
			<th>Semester</th>
			<th>Faculty</th>
			<th>Edit</th>
		</tr>
		<%
			if (HTMLUtility.getErrorMessage(request).length() > 0) {
		%>
		<tr>
			<td colspan="8"><%=HTMLUtility.getErrorMessage(request)%></td>
		</tr>
		<%
			}
		%>
		<%
			int i = 1;
			List list = ServletUtility.getList(request);
			Iterator<TimeTableModel> it = list.iterator();
			while (it.hasNext()) {
				TimeTableModel model = it.next();
		%>
		<tr>
			<td><%=i++%></td>
			<td><%=model.getDate()%></td>
			<td><%=model.getTime()%></td>
			<td><%=model.getSubject()%></td>
			<td><%=model.getBranch()%></td>
			<td><%=model.getYear()%></td>
			<td><%=model.getSemester()%></td>
			<td><%=model.getFaculty()%></td>
			<td><a href="#">Edit</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<table width="100%">
		<tr>
			<td align="left"><input type="submit" name="operation"
				value="<%=BaseCtl.OP_PREVIOUS%>"></td>
				
			<td><%=HTMLUtility.getSubmitButton(BaseCtl.OP_NEW,
					AccessUtility.canAdd(request), request)%><%=HTMLUtility.getSubmitButton(BaseCtl.OP_DELETE,
					AccessUtility.canDelete(request), request)%></td>
				
			<td align="right"><input type="submit" name="operation"
				value="<%=BaseCtl.OP_NEXT%>"></td>
		</tr>
	</table>
	<%
		int pageNo = ServletUtility.getPageNo(request);
		int pageSize = ServletUtility.getPageSize(request);
		int index = ((pageNo - 1) * pageSize) + 1;
	%>
	<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
		type="hidden" name="pageSize" value="<%=pageSize%>">

</form>