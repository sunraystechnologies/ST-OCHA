
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
    </head>
 
    <body> 
    <%@ include file="Header.jsp"%>
    <div id="result">
            <h3>${requestScope["message"]}</h3>
        </div>
        <div>
            <h3> Choose File to Upload in Server </h3>
            <form action="<%=ORSView.TIMETABLE_CTL%>" method="post" enctype="multipart/form-data">
                <input type="file" name="file" />
                <input type="submit" value="upload" />
            </form>          
        </div>
      	<%@ include file="Footer.jsp"%>
    </body>
</html>
