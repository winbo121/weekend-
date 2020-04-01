<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mysns.sns.MessageDAO" %>
<%@ page import="mysns.sns.Goods" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<link rel="stylesheet" href="css/heart.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
	function sns() {
		location.href="/gta?action=getall";
	}
</script>
</head>
<body>
<header class="hearthader">
		<button onclick="sns()">
			<i class="fas fa-angle-left" aria-hidden="true"></i>
		</button>
<h1>좋아요</h1>
</header>
<%
request.setCharacterEncoding("utf-8");
MessageDAO M=new MessageDAO();
int num=Integer.parseInt(request.getParameter("ww"));

ArrayList<Goods> g=M.showfavor(num);
for(int i=0; i<g.size();  i++){
	out.println("<p>"+g.get(i).getUid()+"</p>");
}
%>

</body>
</html>