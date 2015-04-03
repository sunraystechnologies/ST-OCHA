<%@page import="in.co.sunrays.util.PropertyReader"%>
<%@page import="in.co.sunrays.ocha.model.RoleModel"%>
<%@page import="in.co.sunrays.ocha.controller.LoginCtl"%>
<%@page import="in.co.sunrays.ocha.bean.UserBean"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>


<%
	UserBean userBean = (UserBean) session.getAttribute("user");

	boolean userLoggedIn = userBean != null;

	String welcomeMsg = "Hi, ";

	if (userLoggedIn) {
		String role = (String) session.getAttribute("role");
		welcomeMsg = welcomeMsg + userBean.getFirstName() + " (" + role
				+ ")";
	} else {
		welcomeMsg = welcomeMsg + "Guest";
	}
%>

<img src="<%=ORSView.IMG_FOLDER%>/logo.png" height="100px">

<span style="font-size: 40px"><%=PropertyReader.getValue("app.title")%></span>

<HR>

<table width="100%">
	<tr>
		<td width="80%" align="left"><a href="<%=ORSView.LOGIN_CTL%>">Home</a>


			<%
				if (userLoggedIn) {
					if (userBean.getRoleId() == RoleModel.ADMIN
							|| userBean.getRoleId() == RoleModel.STAFF) {
			%> |<a href="<%=ORSView.USER_LIST_CTL%>">User List</a> |<a
			href="<%=ORSView.NOTICE_CTL%>">Add Notice</a> |<a
			href="<%=ORSView.NOTICE_LIST_CTL%>">Notice List</a> | <a
			href="<%=ORSView.ERESOURCE_CTL%>">Add EResource</b></a> |<a
			href="<%=ORSView.ERESOURCE_LIST_CTL%>">EResource List</a> | <a
			href="<%=ORSView.COMMENT_LIST_CTL%>">Comment List</a> |<a
			href="<%=ORSView.ROLE_CTL%>">Add Role</b></a> |<a
			href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a> | <a
			href="<%=ORSView.ATTENDENCE_CTL%>">Add Attendance</a> | <a
			href="<%=ORSView.ATTENDENCE_LIST_CTL%>">Attendance List</a> |<a
			href="<%=ORSView.TIMETABLE_VIEW%>">Add Time Table</a> |<a
			href="<%=ORSView.TIMETABLE_CTL%>">Time Table</a> |<a
			href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a> | <a
			href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a> |<a
			href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
			<%
				} else {
			%> | <a href="<%=ORSView.GETATTENDENCE_CTL%>">Get Attendance</b></a> | <a
			href="<%=ORSView.ERESOURCE_LINK_CTL%>">EResource Link</b></a> | <a
			href="<%=ORSView.NOTICE_LIST_CTL%>">Notice List</b></a> | <a
			href="<%=ORSView.TIMETABLE_CTL%>">Time Table</b></a> | <a
			href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a> | <a
			href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a> | <a
			href="<%=ORSView.LOGIN_CTL%>">Logout</a> <%
 	}
 	}
 %></td>
		<td align="right"><%=welcomeMsg%></td>
	</tr>

</table>

<HR>

