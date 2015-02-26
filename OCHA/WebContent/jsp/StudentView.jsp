
<%@page import="in.co.sunrays.proj4.controller.StudentCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>

<html>
<body>
	<form action="StudentCtl">
		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.StudentBean"
			scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("collegeList");
		%>

		<center>
			<h1>Add Student</h1>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<input type="hidden" name="id" value="<%=bean.getId()%>">
			<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
			

			<table>
				<tr>
					<th>College*</th>
					<td><%=HTMLUtility.getList("collegeId",
					String.valueOf(bean.getCollegeId()), l)%></td>

				</tr>
				<tr>
					<th>First Name*</th>
					<td><input type="text" name="firstName"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>"
						<%=(bean.getId() > 0) ? "readonly" : ""%>><font
						color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
				</tr>
				<tr>
					<th>Last Name*</th>
					<td><input type="text" name="lastName"
						value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
				</tr>
				<tr>
					<th>Date Of Birth (mm/dd/yyyy)</th>
					<td><input type="text" name="dob" readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getDob())%>"> <a
						href="javascript:getCalendar(document.forms[0].dob);"> <img
							src="../img/cal.jpg" width="16" height="15" border="0"
							alt="Calender">
					</a><font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>
				<tr>
					<th>MobileNo*</th>
					<td><input type="text" name="mobileNo"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
				</tr>
				<tr>
					<th>Email ID*</th>
					<td><input type="text" name="email"
						value="<%=DataUtility.getStringData(bean.getEmail())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("email", request)%></font></td>
				</tr>


				<tr>
					<th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=StudentCtl.OP_SAVE%>"> <%
 	if (bean.getId() > 0) {
 %> &emsp;<input type="submit" name="operation"
						value="<%=StudentCtl.OP_DELETE%>"> <%
 	}
 %>&emsp; <input type="submit" name="operation"
						value="<%=StudentCtl.OP_CANCEL%>"></td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>
