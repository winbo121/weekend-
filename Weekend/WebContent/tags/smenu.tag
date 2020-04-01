<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ attribute name="mid"%>
<%@ attribute name="auid"%>
<%@ attribute name="curmsg"%>
<c:if test="${uid == auid}">
	<a
		href="/Weekend/gta?action=delmsg&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}" class="delete"><i class="far fa-trash-alt" aria-hidden="true" 
		style=" width: 25px; height: 25px; margin-top: -20px;"></i></a>
</c:if>
<a
	href="/Weekend/gta?action=fav&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}&uid=${uid}"><svg
		class="heart"></svg></a>