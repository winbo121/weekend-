<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="writePro.bo" method="post" enctype="multipart/form-data">
<h3>글쓰기</h3>

	<input type="hidden" name="mem_name" value="${uid }">
	<table border="0" width="100%" align="center">
		<tr>
			<td width="20%">성 명</td>
			<td>${uid }</td>
		</tr>
		<tr>
			<td width="20%">제 목</td>
			<td width="80%"><input type="text" name="title" size="50"
				maxlength="30" class="title"></td>
		</tr>
		<tr>
			<td width="20%">내 용</td>
			<td width="80%"><textarea name="content" rows="10" cols="50"></textarea></td>
		</tr>
		
		<tr>
		<tr>
			<td width="20%">파일찾기</td>
			<td width="80%"><input type="file" name="filename" size="50"
				maxlength="50"></td>
		</tr>
		<tr style="height: 40px;">
			<td>내용타입</td>
			<td>HTML<input type=radio name="contentType" value="HTTP" style="margin-top: -5px;">&nbsp;&nbsp;&nbsp;
				TEXT<input type=radio name="contentType" value="TEXT" style="margin-top: -5px;" checked>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록"> <input
				type="reset" value="다시쓰기"> <input type="button" value="리스트"
				onclick="javascript:location.href='boardList.bo'"></td>
		</tr>
	</table>
	</form>
<%@include file="boardfloating.jsp"%>
</body>
</html>