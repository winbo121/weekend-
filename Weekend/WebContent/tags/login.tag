<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form name="loginform" method="post" action="user_control.jsp"
	id="form1">
	<c:choose>
		<c:when test="${uid != null}">

			<a href="/Weekend/gta?action=getall&suid=${uid}" class="My_sns" tooltip="My sns"><i
				class="far fa-user"></i></a>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
</form>