
<%@page import="in.co.sunrays.ocha.controller.LoginCtl"%>
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.ocha.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>


<jsp:useBean id="bean" class="in.co.sunrays.ocha.bean.UserBean"
	scope="request"></jsp:useBean>

<%
	HashMap<String, String> gMap = new HashMap<String, String>();
	gMap.put("M", "Male");
	gMap.put("F", "Female");

	HashMap<String, String> collegeCodeMap = new HashMap<String, String>();
	collegeCodeMap.put("IT", "IT");
	collegeCodeMap.put("CS", "CS");
	collegeCodeMap.put("EC", "EC");
	collegeCodeMap.put("CE", "CE");
	collegeCodeMap.put("ME", "ME");

	HashMap<String, String> yearMap = new HashMap<String, String>();
	yearMap.put("11", "11");
	yearMap.put("12", "12");
	yearMap.put("13", "13");
	yearMap.put("14", "14");
	yearMap.put("15", "15");
	yearMap.put("16", "16");
%>

<%
	String userRole = "Student";
	int roleId = DataUtility.getInt(request.getParameter("roleId"));
	if (roleId == 0) {
		roleId = 2;
	}
	if (roleId == 3) {
		userRole = "Staff";
	}
%>


<h1><%=userRole%> Registration</h1>

<p class="error-header">
	<%=ServletUtility.getErrorMessage(request)%>
</p>

<p class="success-header">
	<%=ServletUtility.getSuccessMessage(request)%>
</p>

<%=ServletUtility.getErrorMessageHtml(request)%>


<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="POST">

	<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
	<input type="hidden" name="modifiedBy"
		value="<%=bean.getModifiedBy()%>"> <input type="hidden"
		name="createdDatetime"
		value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
	<input type="hidden" name="modifiedDatetime"
		value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">



	<input type="text" name="roleId" value="<%=roleId%>">

	<table>
		<tr>
			<th>First Name*</th>
			<td><input type="text" name="firstName"
				value="<%=DataUtility.getStringData(bean.getFirstName())%>"><span
				class="error"> <%=ServletUtility.getErrorMessage("firstName", request)%></span]></td>
		</tr>
		<tr>
			<th>Last Name*</th>
			<td><input type="text" name="lastName"
				value="<%=DataUtility.getStringData(bean.getLastName())%>"><span
				class="error"> <%=ServletUtility.getErrorMessage("lastName", request)%></span]></td>
		</tr>
		<tr>
			<th>Gender</th>
			<td><%=HTMLUtility.getList("gender", bean.getGender(), gMap)%></td>
		</tr>
		<tr>
			<th>College ID</th>
			<td><input type="hidden" name="collegeCode" value="0801">
				0801&nbsp; Branch &nbsp; <%=HTMLUtility.getList("branch", bean.getBranch(),
					collegeCodeMap)%> &nbsp;Year &nbsp;<%=HTMLUtility.getList("year", bean.getYear(), yearMap)%>&nbsp;
				Course Code &nbsp; <input type="text" name="collegeId"
				value="<%=DataUtility.getStringData(bean.getCollegeId())%>"></td>
		</tr>

		<tr>
			<th>Login ID</th>
			<td><input type="text" name="login"
				value="<%=DataUtility.getStringData(bean.getLogin())%>"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="text" name="password"
				value="<%=DataUtility.getStringData(bean.getPassword())%>">
			</td>
		</tr>
		<tr>
			<th>Confirm Password</th>
			<td><input type="text" name="confirmPassword"
				value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
			</td>
		</tr>
		<tr>
			<th>Mobile No*</th>
			<td><input type="text" name="mobileNo"
				value="<%=DataUtility.getStringData(bean.getMobileNo())%>"><font
				color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
		</tr>
		<tr>
			<th>Date Of Birth (mm/dd/yyyy)</th>
			<td><input type="text" name="dob" readonly="readonly"
				value="<%=DataUtility.getDateString(bean.getDob())%>"> <a
				href="javascript:getCalendar(document.forms[0].dob);"> <img
					src="<%=ORSView.IMG_FOLDER%>/cal.jpg" width="16" height="15"
					border="0" alt="Calender">
			</a></td>
		</tr>
		<tr>
			<th>Father Name</th>
			<td><input type="text" name="fatherName"
				value="<%=DataUtility.getStringData(bean.getFatherName())%>">
			</td>
		</tr>
		<tr>
			<th>Mother Name</th>
			<td><input type="text" name="motherName"
				value="<%=DataUtility.getStringData(bean.getMotherName())%>">
			</td>
		</tr>

		<tr>
			<th>Address</th>
			<td><textarea name="address"><%=DataUtility.getStringData(bean.getAddress())%></textarea>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="submit"
				name="operation" value="<%=UserRegistrationCtl.OP_SIGN_UP%>"></td>
		</tr>
	</table>
</form>

