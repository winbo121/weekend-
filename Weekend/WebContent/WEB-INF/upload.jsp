<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");


String action=request.getParameter("action");
MultipartRequest M=new MultipartRequest(request,getServletContext().getRealPath("Weekend/upload"),10*1024*1024,"utf-8",new DefaultFileRenamePolicy());

Enumeration a=M.getFileNames();

String file1=(String)a.nextElement();


String filename1=M.getFilesystemName(file1);
String uid=M.getParameter("uid");
String msg=M.getParameter("msg");
%>
<jsp:forward page="sns_control.jsp">
<jsp:param value="<%=uid %>" name="uid"/>
<jsp:param value="<%=msg %>" name="msg"/>
<jsp:param value="<%=action %>" name="action"/>
<jsp:param value="<%=filename1 %>" name="img"/>
</jsp:forward>

</body>
</html>