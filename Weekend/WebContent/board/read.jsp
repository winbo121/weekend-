<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/boardstyle.css" type="text/css" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


</head>
<body>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#BDBDBD" width="10%">이 름</td>
			<td bgcolor="f9f9f9">${selectga.getName() }</td>
			<td align="center" bgcolor="#BDBDBD" width=10%>등록날짜</td>
			<td bgcolor="#f9f9f9">${selectga.getReg_date() }</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#BDBDBD">제 목</td>
			<td bgcolor="f9f9f9" colspan="3">${selectga.getTitle() }</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#BDBDBD">첨부파일</td>
			<td bgcolor="f9f9f9" colspan="3"><a
				href="fileDownload.jsp?filename=${selectga.getFilename() }">${selectga.getFilename() }</a>
			</td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="#ffffff">${selectga.getContent() }<br></td>
		</tr>

	</table>


	<a
		href="boardList.bo?&pageNo=${page }&keyField=${keyfield }&keyWord=${keyword }">리스트
	</a> |
	<a href="# ">수 정</a> |
	<c:choose>
		<c:when test="${uid==selectga.getName() }">
			<a href="delete.bo?idx=${selectga.getIdx() }">삭 제</a> 
	</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>

	<br>
	<form method="post" action="reply.bo">
		<input type="hidden" name="pageNo" value=${page }> <input
			type="hidden" name="keyField" value=${keyfield }> <input
			type="hidden" name="keyWord" value=${keyword }> <input
			type="hidden" name="num" value=${selectga.getIdx() }> <input
			type="hidden" name="mem_name" value="${uid }"> <br /> <label>댓글
			작성자</label>&nbsp;${uid } <br />
		<div class="txtEnter">
			<textarea name="content" cols="80" rows="3" placeholder="댓글을 입력하세요."
				required wrap="hard" class="replytxt"></textarea>
			<button type="submit" class="icon">
				<i class="fa fa-reply fa-2x"></i>
			</button>
		</div>
	</form>

	<c:forEach var="reply" items="${r}">
		<table class="reply_txt">
			<tr>

				<td>댓글 작성자 : ${reply.getMem_name()}</td>
				<td>내용 : ${reply.getContent()}</td>
				<td>날짜 : ${reply.getReg_date()}</td>
				<c:choose>
					<c:when test="${uid==reply.getMem_name() }">
						<td><a
							href="deleteRe.bo?idx=${reply.getIdx() }&num=${selectga.getIdx() }&pageNo=${page}&keyField=${keyfield }&keyWord=${keyword}"><i
								class="fa fa-trash" aria-hidden="true"
								style="position: relative; top: -1px;"></i></a></td>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
				</c:choose>

			</tr>
		</table>
	</c:forEach>
<%@include file="boardfloating.jsp"%>
</body>
</html>