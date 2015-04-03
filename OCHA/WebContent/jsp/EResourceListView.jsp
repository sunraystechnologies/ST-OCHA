
<%@page import="in.co.sunrays.ocha.controller.ORSView"%>
<%@page import="in.co.sunrays.ocha.controller.BaseCtl"%>
<%@page import="in.co.sunrays.ocha.model.EResourceModel"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<h1>ERsource List</h1>

<form action="<%=ORSView.ERESOURCE_LIST_CTL%>">

	<table width="100%">
		<tr>
			<td align="center"><label> Link :</label> <input type="text"
				name="name"
				value="<%=ServletUtility.getParameter("name", request)%>">
				&nbsp; <label>Detail :</label> <input type="text" name="detail"
				value="<%=ServletUtility.getParameter("detail", request)%>">&nbsp;
				<input type="submit" name="operation" value="<%=BaseCtl.OP_SEARCH%>"></td>
		</tr>
	</table>
	<br>

	<table border="1" width="100%">

		<tr>
			<th>Sq.No</th>
			<th>Link</th>
			<th>Details</th>
			<th>Edit</th>
		</tr>

		<%
			int i = 1;
			List list = ServletUtility.getList(request);
			Iterator<EResourceModel> it = list.iterator();
			while (it.hasNext()) {
				EResourceModel model = it.next();
		%>
		<tr>
			<td><%=i++%></td>
			<td><%=model.getName()%></td>
			<td><%=model.getDetail()%></td>
			<td><a href="EResourceCtl?id=<%=model.getId()%>">Edit</a></td>
		</tr>
		<%
			}
		%>
	</table>

	<table width="100%">
		<tr>
			<td align="left"><input type="submit" name="operation"
				value="<%=BaseCtl.OP_PREVIOUS%>"></td>
			<td colspan="3" align="center"><input type="submit"
				name="operation" value="<%=BaseCtl.OP_NEW%>"> <input
				type="submit" name="operation" value="<%=BaseCtl.OP_DELETE%>"></td>
			<td align="right"><input type="submit" name="operation"
				value="<%=BaseCtl.OP_NEXT%>"></td>
		</tr>
	</table>

	<%
		int pageNo = ServletUtility.getPageNo(request);
		int pageSize = ServletUtility.getPageSize(request);
		int index = ((pageNo - 1) * pageSize) + 1;
	%>
	<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
		type="hidden" name="pageSize" value="<%=pageSize%>">
</form>
