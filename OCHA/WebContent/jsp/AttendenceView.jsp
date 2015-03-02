
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./js/calendar.js"></script>
<title>Attendance Management</title>
</head>
<body>
<form action="<%=ORSView.ATTENDENCE_CTL%>">

		<%@ include file="Header.jsp"%>
		
		<jsp:useBean id="model" class="in.co.sunrays.ocha.model.AttendenceModel" scope="request"/>
			
       <%
			List userList = (List) request.getAttribute("userList");
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

			<input type="hidden" name="id" value="<%=model.getId()%>"> <input
				type="hidden" name="createdDatetime"
				value="<%=DataUtility.getTimestamp(model.getCreatedOn())%>">
			

			<table>

				<tr>
					<th>Student Name*</th>
					<td><%=HTMLUtility.getList("studentId", model.getStudentName(), userList)%></td>
				</tr>
				<tr>
					<th>Subject*</th>
					<td><input type="text" name="subject"
						value="<%=DataUtility.getStringData(model.getSubject())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("subject", request)%></font></td>
				</tr>
					<tr>
					<th>Attendance*</th>
					<td><input type="text" name="attendance"
						value="<%=DataUtility.getStringData(model.getAttendence())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("attendance", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; <input type="submit" name="operation"
						value="<%=BaseCtl.OP_SAVE%>"> 
							<%
				 	if (model.getId() > 0) {
				 %> &emsp;<input type="submit" name="operation"
												value="<%=BaseCtl.OP_DELETE%>"> <%
				 	}
						 %>
			 			&emsp; <input type="submit" name="operation" value="<%=BaseCtl.OP_CANCEL%>">
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>