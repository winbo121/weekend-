<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String pagefile = request.getParameter("pagefile");
		if (pagefile == null) {
			pagefile = "content";
		}
	%>
	<jsp:forward page="map_main.jsp">
		<jsp:param name="pagefile" value="<%=pagefile%>" />
	</jsp:forward>
</body>
</html>
