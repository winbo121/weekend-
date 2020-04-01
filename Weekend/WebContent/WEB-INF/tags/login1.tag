<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
<c:when test="${uid != null}">
	
	<li id="Boardlabel">${uid}님</li>
	
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>