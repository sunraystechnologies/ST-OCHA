
<%@page import="java.io.File"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="in.co.sunrays.ocha.model.NoticeModel"%>
<%@page import="in.co.sunrays.ocha.controller.NoticeListCtl"%>
<%@page import="in.co.sunrays.ocha.controller.UserListCtl"%>
<%@page import="in.co.sunrays.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<body>
<%-- <div class="container">
    <div class="row">
        <div  class="col-md-2">
	<%@include file="Header.jsp"%>
        </div>
        <div class="col-md-10">
        
					<h2 align="Center"  style="margin-top: 140px">
					<hr>
					Notice List
					</h2>
					<form action="<%=ORSView.NOTICE_LIST_CTL%>" class="form-inline">
							<div class="form-group">
				<label for="inputSubject" class="control-label col-md-4">Subject</label>
					<div class="col-md-2">
						<input type="text" class="form-control" name="subject" id="subject"
						value="<%=ServletUtility.getParameter("subject", request)%>"	placeholder="Subject">
					</div>
		</div>
					    	 <div class="form-group">
					<label for="inputDetail" class="control-label  col-md-4">Detail</label>
		<div class="col-md-2">
						<input type="text" class="form-control" name="detail" id="detail"
							placeholder="Detail" value="<%=ServletUtility.getParameter("detail", request)%>">
					</div>
					</div>
			
				<div class="form-group">
						<button name="operation" value="<%=NoticeListCtl.OP_SEARCH %>" type="submit" class="col-md-offset-1 btn btn-info">
							<span class="btn-save-label">
						<i class="glyphicon glyphicon-search"></i>
						</span>
						Search
						</button>
						</div>
			<br>
		<br>
		
		<div class="table-responsive">
		<table class="table table-bordered table-hover" >
				<tr>
				<th>ID</th>
					<th>Subject</th>
					<th>Detail</th>
					<th>Create Date</th>
					<th>Expire Date</th>
								   <%
			if (userBean.getRoleId() == RoleModel.ADMIN ||userBean.getRoleId() == RoleModel.STAFF ) {
		%>
					<th>Edit</th>
					<%} %>
				</tr>

				<tr>
					<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				</tr>

				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<NoticeModel> it = list.iterator();
					while (it.hasNext()) {
						NoticeModel model = it.next();
				%>
				<tr>
					<td><%=model.getId()%></td>
					<td><%=model.getSubject()%></td>
					<td><%=model.getDetails()%></td>
					<td><%=model.getCreatedOn()%></td>
					<td><%=model.getExpireDate()%></td>
									   <%
			if (userBean.getRoleId() == RoleModel.ADMIN ||userBean.getRoleId() == RoleModel.STAFF ) {
		%>
					<td><a href="NoticeCtl?id=<%=model.getId()%>">Edit</a></td>
					<%} %>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td ><input type="submit" name="operation" class="btn btn-info"
						value="<%=NoticeListCtl.OP_PREVIOUS%>"></td>
					 <td >
					   <%
			if (userBean.getRoleId() == RoleModel.ADMIN ||userBean.getRoleId() == RoleModel.STAFF ) {
		%>
					 <input type="submit" class="btn btn-info"
						name="operation" value="<%=NoticeListCtl.OP_DELETE%>"></td>
						<%} %>
					 <td align="right"><input type="submit" name="operation" class="btn btn-info"
						value="<%=NoticeListCtl.OP_NEXT%>"></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</div>
		
		</form>
        </div>
        </div>
        </div>

</body>
</html> --%>

 <div class="container">
    <div class="row">
        <div  class="col-md-2">
        <%@include file="Header.jsp"%>
        </div>
        <div class="col-md-10">
        	
					<h2 align="Center"  style="margin-top: 140px">
					<hr>
					Notice List
					</h2>
					<div class="table-responsive">
						<table class="table table-bordered table-hover" >
				<tr>
				<th>ID</th>
					<th>FileName</th>
             <th>Download</th>
         <%
			if (userBean.getRoleId() == RoleModel.ADMIN  || userBean.getRoleId() == RoleModel.STAFF) {
		%>      <th>Delete</th>
		<%} %>
				</tr>
    <% 
      final  ResourceBundle resourceBundle = ResourceBundle
	.getBundle("in.co.sunrays.bundle.system");
    String UPLOAD_DIRECTORY = resourceBundle.getString("log.noticepath");
    File jsp = new File(UPLOAD_DIRECTORY);

 String f = "";
 File[] list = jsp.listFiles();
int index=1;
 for(int i=0;i<list.length;i++)
 {

    f = list[i].getName();


	%>
	<tr>
		<td><%=index+i%></td>
		<td><%=f%></td>
<td><a href="<%=ORSView.NOTICE_LIST_CTL %>?fileName=<%=f%>&operation=Download">Download</a></td>
 <%
			if (userBean.getRoleId() == RoleModel.ADMIN) {
		%>
<td><a href="<%=ORSView.NOTICE_LIST_CTL %>?fileName=<%=f%>&operation=Delete">Delete</a></td>
<%} %>
	</tr>
	<%
		}
	%>
						</table>
						</div>
					</div>
					</div>
					</div>
	
    </body>
</html>