<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.bean.UserBean"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%
	UserBean userBean = (UserBean) session.getAttribute("user");

	boolean userLoggedIn = userBean != null;

	String welcomeMsg = "Hi, ";

	if (userLoggedIn) {
		String role = (String) session.getAttribute("role");
		welcomeMsg += userBean.getFirstName() + " (" + role + ")";
	} else {
		welcomeMsg += "Guest";
	}
%>

<table width="100%" border="0">
	<tr>
		<td width="90%" ><a href="<%=ORSView.WELCOME_CTL%>">Welcome</b></a> |
			<%
			if (userLoggedIn) {
		%> <a href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a>

			<%
				} else {
			%> <a href="<%=ORSView.LOGIN_CTL%>">Login</b></a> <%
 	}
 %></td>
		<td rowspan="2">
			<h1 align="Right">
				<img src="<%=ORSView.APP_CONTEXT%>/img/SGSITS_Indore.png" width="318"
					height="90">
			</h1>
		</td>

	</tr>
	
	<tr>
		<td >
			<h3>
				<%=welcomeMsg%></h3>
		</td>
	</tr>
	

	<%
		if (userLoggedIn) {
	%>

	<tr>
		<td colspan="2" >
	
			
		  <%
			if (userBean.getRoleId() == RoleBean.ADMIN ||userBean.getRoleId() == RoleBean.STAFF ) {
		%>
			<a href="<%=ORSView.USER_LIST_CTL%>">User List</b></a> |
			<a href="<%=ORSView.NOTICE_CTL%>">Add Notice</b></a> |
			<a href="<%=ORSView.NOTICE_LIST_CTL%>">Notice List</b></a> |
			<a href="<%=ORSView.ERESOURCE_CTL%>">Add EResource</b></a> |
				<a href="<%=ORSView.ERESOURCE_LIST_CTL%>">Add EResource List</b></a> |
			<a href="<%=ORSView.COMMENT_LIST_CTL%>">Comment List</b></a> |  <a
			href="<%=ORSView.ROLE_CTL%>">Add Role</b></a> |
				<a
			href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a> |
			 <a
			href="<%=ORSView.ATTENDENCE_CTL%>">Add Attendance</b></a> | 
			 <a href="<%=ORSView.ATTENDENCE_LIST_CTL%>">Attendance List</b></a> |
			 	<a href="<%=ORSView.TIMETABLE_VIEW%>">Add Time Table</b></a> |
			 	<a href="<%=ORSView.TIMETABLE_LIST_VIEW%>">Time Table</b></a> |
		 <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a> | <a
			href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a> 
		| | <%
 	}else{
 %>
 <a href="<%=ORSView.GETATTENDENCE_CTL%>">Get Attendance</b></a> | 
 	 	<a href="<%=ORSView.ERESOURCE_LINK_CTL%>">EResource Link</b></a> | 
 	 	<a href="<%=ORSView.NOTICE_LIST_CTL%>">Notice List</b></a> |
 	 	<a href="<%=ORSView.TIMETABLE_LIST_VIEW%>">Time Table</b></a> |
		 <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a> | <a
			href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a> |</td>
	
	</tr>
	<%
 	}}
	%>
</table>
<hr>