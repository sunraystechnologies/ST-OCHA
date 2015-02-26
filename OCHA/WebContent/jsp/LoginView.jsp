
<%@page import="in.co.sunrays.proj4.model.NoticeModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<html>
<body>
	<form action="<%=ORSView.LOGIN_CTL%>">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
			scope="request"></jsp:useBean>
<div style="padding-left: 170px">

			<h1 style="padding-left: 200px">Login</h1>

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
					<th>LoginId*</th>
					<td><input type="text" name="login" size=30
						value="<%=DataUtility.getStringData(bean.getLogin())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
				</tr>
				<tr>
					<th>Password*</th>
					<td><input type="password" name="password" size=30
						value="<%=DataUtility.getStringData(bean.getPassword())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2"><input type="submit" name="operation"
						value="<%=LoginCtl.OP_SIGN_IN %>"> &nbsp; <input type="submit"
						name="operation" value="<%=LoginCtl.OP_SIGN_UP %>" > &nbsp;</td>
				</tr>
				<tr><th></th>
				<td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forget my password</b></a>&nbsp;</td>
			</tr>
			</table>
			</div>
			<div style="padding-left: 800px;margin-top: -190px">
			<h2 style="margin-left:150px">Notice</h2>
			<table border="1" width="60%">
			<tr>
			<th>Subject</th>
			<th>Details</th>
			<th>Create Date</th>
			<th>Expire Date</th>
			</tr>
			
				<%
			List list = (List) request.getAttribute("noticeList");
				Iterator it = list.iterator();
				while (it.hasNext()) {
				NoticeModel	model = (NoticeModel) it.next(); %>
				<tr>
				<td><%=model.getSubject() %></td>
				<td><%=model.getDetails() %></td>
				<td><%=model.getCreatedOn() %></td>
				<td><%=model.getExpireDate() %></td>
					</tr>
			<%
					}
				%>
	
	
		</table>
		</div>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>