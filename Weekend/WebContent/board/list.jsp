<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
	function goWrite() {

		location.href = "write.bo";
	}
    
</script>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<!-- CONTENT -->
	<h3 class="boardheader">게시판</h3>
	<form action="boardList.bo" method="post"
		class="btn1 btn-default1 pull-right">
		<div class="boardSearch">
			<select id="select" name="keyField">
				<option value="title" selected="selected">제목</option>
				<option value="reg_date">날짜</option>
				<option value="mem_name">작성자</option>
			</select> <input type="text" id="txt" name="keyWord" placeholder="Search..." />
			<button type="submit" class="icon">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</form>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
			<c:forEach var="article" items="${ga.getContent() }">
				<tr>
					<td>${article.getIdx() }</td>
					<td class="boardTitle"><a
						href="read.bo?num=${article.getIdx() }&pageNo=${ga.getCurrentPage()}&keyField=${ga.getKeyFeild()}&keyWord=${ga.getKeyWord()}">${article.getTitle() }</a></td>
					<td>${article.getName() }</td>
					<td>${article.getReg_date() }</td>
					<td>${article.getCount() }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" onclick="goWrite()" value="글쓰기"
			class="btn btn-default pull-right1">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${ga.getStartpage()>=6 }">
					<li><a
						href="boardList.bo?pageNo=${ga.getStartpage() - 5}&keyField=${ga.getKeyFeild()}&keyWord=${ga.getKeyWord()}">이전</a></li>
				</c:if>
				<c:forEach var="pno" begin="${ga.getStartpage() }"
					end="${ga.getEndpage() }">
					<li><a
						href="boardList.bo?pageNo=${pno}&keyField=${ga.getKeyFeild()}&keyWord=${ga.getKeyWord()}">${pno}</a></li>
				</c:forEach>

				<c:if test="${ga.getEndpage() <ga.getTotalpage() }">
					<li><a
						href="boardList.bo?pageNo=${ga.getStartpage() + 5}&keyField=${ga.getKeyFeild()}&keyWord=${ga.getKeyWord()}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<%
		
	%>

 <%@include file="boardfloating.jsp"%>
</body>
</html>