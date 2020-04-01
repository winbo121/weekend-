<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ attribute name="type" %>

<c:if test="${uid != null}">
<c:choose> 
	<c:when test="${type == 'msg'}"><input  type="text" name="msg" placeholder="제목을 작성하세요." maxlength="100" class="SNS_Msg" style="height:80px; border: none;" required>
			<p>
			
			<div class="image-upload-wrap">
			<input class="file-upload-input" multiple="multiple" type="file" name="File1"
				onchange="readURL(this);" accept="image/*" style="height:210px;" />
			<div class="drag-text">
				<h3>select add Image</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" src="#" alt="your image" style="width: 330px;" />
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					Remove
				</button>
			</div>
		</div>
		</c:when>
	<c:when test="${type == 'rmsg'}"><input  type="text" name="rmsg" maxlength="50" size="60" placeholder="댓글을 입력하세요..." required></c:when>
</c:choose>
</c:if>

<c:if test="${uid == null}">
<c:choose> 
	<c:when test="${type == 'msg'}"><input type="text" name="msg" maxlength="100" disabled="disabled"  value="작성하려면 로그인 하세요!!"></c:when>
	<c:when test="${type == 'rmsg'}"><input type="text" name="rmsg" maxlength="50" size="60" disabled="disabled" value="작성하려면 로그인 하세요!!"></c:when>
</c:choose>
</c:if>