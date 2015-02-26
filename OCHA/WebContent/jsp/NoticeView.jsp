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
<form action="<%=ORSView.NOTICE_CTL%>">

		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean" class="in.co.sunrays.ocha.model.NoticeModel" 
			scope="request"></jsp:useBean>

		<center>
			<h1>Notice</h1>

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
					<th>Subject*</th>
					<td><input type="text" name="subject"
						value="<%=DataUtility.getStringData(bean.getSubject())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("subject", request)%></font></td>
				</tr>
				<tr>
					<th>Detail*</th>
					<td><input type="text" name="detail"
						value="<%=DataUtility.getStringData(bean.getDetails())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("detail", request)%></font></td>
				</tr>


				<tr>
					<th>Expire Date</th>
					<td>
					
					<input type="text" name="expireDate" readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getExpireDate())%>">
					<a href="javascript:getCalendar(document.forms[0].expireDate);">
							<img src="../img/cal.jpg" width="16" height="15" border="0"
							alt="Calender">
					</a>
						
					<font color="red"> <%=ServletUtility.getErrorMessage("expireDate", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; <input type="submit" name="operation" value="<%=NoticeCtl.OP_SAVE%>">
							<%
				 	if (bean.getId() > 0) {
				 %> &emsp;<input type="submit" name="operation"
						value="<%=NoticeCtl.OP_DELETE%>"> <%
				 	}
				 %>&emsp; <input type="submit" name="operation"
						value="<%=NoticeCtl.OP_CANCEL%>">
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>