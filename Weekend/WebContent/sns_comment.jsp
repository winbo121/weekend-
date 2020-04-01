<%@page import="java.util.ArrayList"%>
<%@page import="mysns.sns.MessageDAO"%>
<%@page import="mysns.sns.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>sns</title>
<link rel="stylesheet" href="css/sns_comment.css" type="text/css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
	function sns() {
		location.href="/gta?action=getall";
	}
</script>
</head>
<body>
	<header class="Comment">
		<button onclick="sns()">
			<i class="fas fa-angle-left" aria-hidden="true"></i>
		</button>
		<h1>댓글</h1>
	</header>
	<section>
		<%
			request.setCharacterEncoding("utf-8");
			MessageDAO M = new MessageDAO();
			int num = Integer.parseInt(request.getParameter("ww"));

			ArrayList<Reply> g = M.showreply(num);
			for (int i = 0; i < g.size(); i++) {
				out.println("<p>"+"<b>" + g.get(i).getUid()+"</b>" + "<span>" + g.get(i).getRmsg() + "</span>" +"<span>"+ "<" + g.get(i).getDate()+ ">"+ "</span>"+"</p>");
			}
		%>
	</section>
</body>
</html>