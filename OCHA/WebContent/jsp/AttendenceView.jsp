<%@page import="in.co.sunrays.ocha.controller.AttendenceCtl"%>
<%@page import="in.co.sunrays.ocha.controller.CommentCtl"%>
<%@page import="in.co.sunrays.ocha.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.ocha.controller.EResourceCtl"%>
<%@page import="in.co.sunrays.ocha.controller.NoticeCtl"%>
<%@page import="in.co.sunrays.ocha.util.DataUtility"%>
<%@page import="in.co.sunrays.ocha.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=ORSView.ATTENDENCE_CTL%>">

		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="./js/calendar.js"></script>
		<jsp:useBean id="bean" class="in.co.sunrays.ocha.model.AttendenceModel" 
			scope="request"></jsp:useBean>
       <%
			List l = (List) request.getAttribute("userList");
		%>
		<center>
			<h1>Attendance</h1>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedOn())%>">
			

			<table>

				<tr>
					<th>Student Name*</th>
					<td><%=HTMLUtility.getList("studentId",
					String.valueOf(bean.getStudentName()), l) %></td>
				</tr>
				<tr>
					<th>Subject*</th>
					<td><input type="text" name="subject"
						value="<%=DataUtility.getStringData(bean.getSubject())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("subject", request)%></font></td>
				</tr>
					<tr>
					<th>Attendance*</th>
					<td><input type="text" name="attendance"
						value="<%=DataUtility.getStringData(bean.getAttendence())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("attendance", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; <input type="submit" name="operation" value="<%=AttendenceCtl.OP_SAVE%>">
							<%
				 	if (bean.getId() > 0) {
				 %> &emsp;<input type="submit" name="operation"
						value="<%=AttendenceCtl.OP_DELETE%>"> <%
				 	}
				 %>&emsp; <input type="submit" name="operation"
						value="<%=AttendenceCtl.OP_CANCEL%>">
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>