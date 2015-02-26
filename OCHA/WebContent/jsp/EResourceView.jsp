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
<form action="<%=ORSView.ERESOURCE_CTL%>">

		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="./js/calendar.js"></script>
		<jsp:useBean id="bean" class="in.co.sunrays.ocha.model.EResourceModel" 
			scope="request"></jsp:useBean>

		<center>
			<h1>E-Resource</h1>

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
					<th>Table Contains*</th>
					<td><input type="text" name="tableContains"
						value="<%=DataUtility.getStringData(bean.getTablesContains())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("tableContains", request)%></font></td>
				</tr>
				<tr>
					<th>Name*</th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
				</tr>


				<tr>
					<th>Detail</th>
					<td><input type="text" name="detail" 
					value="<%=DataUtility.getStringData(bean.getDetail())%>">
						
					<font color="red"> <%=ServletUtility.getErrorMessage("detail", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; <input type="submit" name="operation" value="<%=EResourceCtl.OP_SAVE%>">
							<%
				 	if (bean.getId() > 0) {
				 %> &emsp;<input type="submit" name="operation"
						value="<%=EResourceCtl.OP_DELETE%>"> <%
				 	}
				 %>&emsp; <input type="submit" name="operation"
						value="<%=EResourceCtl.OP_CANCEL%>">
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>