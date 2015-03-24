<%@page import="in.co.sunrays.ocha.model.RoleModel"%>
<%@page import="in.co.sunrays.ocha.controller.LoginCtl"%>
<%@page import="in.co.sunrays.ocha.bean.UserBean"%>
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<div class="container">

	<div class="row" style="margin-top: 30px;width: 200px" >
		<img alt="" src="<%=ORSView.APP_CONTEXT%>/img/SGSITS_Indore.png"  width="200"
					height="90">
					<hr>
		<span class=" col-md-offset-2 " style="font-size: 25pt;">
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
	
		</span>
		<ul class="nav nav-pills nav-stacked">
  <li role="presentation" style="font-size: 15pt;"><%=welcomeMsg%></li>
	<%
		if (userLoggedIn) {
	%>
		  <%
			if (userBean.getRoleId() == RoleModel.ADMIN ||userBean.getRoleId() == RoleModel.STAFF ) {
		%>
  <li role="presentation"><a href="<%=ORSView.USER_LIST_CTL%>">User List</b></a></li>
  <li role="presentation"><a href="<%=ORSView.NOTICE_VIEW%>">Add Notice</b></a></li>
   <li role="presentation"><a href="<%=ORSView.NOTICE_LIST_VIEW%>">Notice List</b></a></li>
   
      <li role="presentation"><a href="<%=ORSView.ERESOURCE_CTL%>">Add EResource</b></a> </li>
        <li role="presentation"><a href="<%=ORSView.ERESOURCE_LIST_CTL%>">Add EResource List</b></a></li>
         <li role="presentation">	<a href="<%=ORSView.COMMENT_LIST_CTL%>">Comment List</b></a></li>
           <li role="presentation"><a href="<%=ORSView.ROLE_CTL%>">Add Role</b></a> </li>
              <li role="presentation"><a
			href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a></li>
              <li role="presentation"> <a
			href="<%=ORSView.ATTENDENCE_CTL%>">Add Attendance</b></a></li>
               <li role="presentation"> <a href="<%=ORSView.ATTENDENCE_LIST_CTL%>">Attendance List</b></a></li>
               
                   <li role="presentation"><a href="<%=ORSView.TIMETABLE_VIEW%>">Add Time Table</b></a></li>
                       <li role="presentation"><a href="<%=ORSView.TIMETABLE_LIST_VIEW%>">Time Table</b></a></li>
                           <li role="presentation"><a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a> </li>
                       <li role="presentation">  <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a> </li>
<li role="presentation"><a href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a></li>
		<%
 	}else{
 %>
	<li role="presentation">  <a href="<%=ORSView.GETATTENDENCE_CTL%>">Get Attendance</b></a> </li>
 	 <li role="presentation"> 	<a href="<%=ORSView.ERESOURCE_LINK_CTL%>">EResource Link</b></a>  </li>
 	 <li role="presentation"> 	<a href="<%=ORSView.NOTICE_LIST_VIEW%>">Notice List</b></a>  </li>
 	 <li role="presentation"> 	<a href="<%=ORSView.TIMETABLE_LIST_VIEW%>">Time Table</b></a>  </li>
		<li role="presentation">  <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a>  </li>
		<li role="presentation">   <a
			href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b></a>  </li>
		<li role="presentation"><a href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a></li>	
	<%
 	}}
	%>
	
	</ul>
	</div>
	</div>
