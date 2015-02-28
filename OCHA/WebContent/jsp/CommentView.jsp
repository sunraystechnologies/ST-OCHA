<%@page import="in.co.sunrays.ocha.model.EResourceModel"%>
<%@page import="in.co.sunrays.ocha.controller.CommentCtl"%>
<%@page import="in.co.sunrays.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.ocha.controller.EResourceCtl"%>
<%@page import="in.co.sunrays.ocha.controller.NoticeCtl"%>
<%@page import="in.co.sunrays.util.DataUtility"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=ORSView.COMMENT_CTL%>">

		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="./js/calendar.js"></script>
		<jsp:useBean id="model" class="in.co.sunrays.ocha.model.CommentModel" 
			scope="request"></jsp:useBean>
       <%
			List l = (List) request.getAttribute("resourceList");
		%>
		<center>
			<h1>Comment</h1>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>

			<input type="hidden" name="id" value="<%=model.getId()%>">
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(model.getCreatedOn())%>">
			<input type="hidden" name="resourceId" value="<%=model.getResourceId()%>">
			
			

			<table>

			<%-- 	 <tr>
					<th>Resource Name*</th>
					<td><%=HTMLUtility.getList("resourceId",
					String.valueOf(bean.getResourceId()), l) %></td>
				</tr>  --%>
				<tr>
					<th>Resource Name</th>
					<td><input type="text" name="name" readonly="readonly"
						value="<%=DataUtility.getStringData(model.getName())%>"></td>
				</tr>
				
				<tr>
					<th>Text*</th>
					<td><input type="text" name="text"
						value="<%=DataUtility.getStringData(model.getText())%>"><font
						color="red"> <%=ServletUtility.getErrorMessage("text", request)%></font></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; <input type="submit" name="operation" value="<%=CommentCtl.OP_SAVE%>">
							<%
				 	if (model.getId() > 0) {
				 %> &emsp;<input type="submit" name="operation"
						value="<%=CommentCtl.OP_DELETE%>"> <%
				 	}
				 %>&emsp; <input type="submit" name="operation"
						value="<%=CommentCtl.OP_CANCEL%>">
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>