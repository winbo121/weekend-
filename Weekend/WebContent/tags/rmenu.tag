<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="rid" %>
<%@ attribute name="ruid" %>
<%@ attribute name="muid" %>
<%@ attribute name="curmsg" %>

<c:choose>
<c:when test="${uid == ruid}">
<a href="/Weekend/gta?action=delreply&rid=${rid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}" style="top: -3px;
    position: relative;">
<i class="fa fa-times fa-2x" aria-hidden="true" style="width: 12px; height: 12px;"></i></a>
</c:when>
<c:when test="${uid == muid}">
<a href="/Weekend/gta?action=delreply&rid=${rid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}"><i class="fa fa-times fa-2x" aria-hidden="true" style="width: 12px; height: 12px;"></i></a>
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>