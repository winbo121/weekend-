<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="mysns.sns.*,mysns.member.*,java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	String uid=request.getParameter("uid");
	String mid=request.getParameter("mid");
	MessageDAO m=new MessageDAO();	
	m.favorite(Integer.parseInt(mid),uid);
	String cnt=request.getParameter("cnt");
	String suid=request.getParameter("suid");
	String action=request.getParameter("action");
	request.setAttribute("uid", uid);
	request.setAttribute("mid", mid);
	request.setAttribute("cnt", cnt);
	request.setAttribute("suid", suid);
	request.setAttribute("action", action);
	pageContext.forward("sns_control.jsp");
	


%>
</body>
</html>