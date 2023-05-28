<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Starter</title>
  <jsp:include page="./includes/adminHead.jsp" />

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="./includes/adminNavigation.jsp" />
		<jsp:include page="./includes/adminSidebar.jsp" />
		<c:choose>
			<c:when test="${contents eq 'home'}">
				<jsp:include page="./includes/contents/adminHomeContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.sidebar-member'}">
				<jsp:include page="./includes/contents/adminMemberContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.sidebar-report'}">
				<jsp:include page="./includes/contents/adminReportContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.sidebar-board'}">
				<jsp:include page="./includes/contents/adminBoardContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.sidebar-notice'}">
				<jsp:include page="./includes/contents/adminNoticeContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.sidebar-faq'}">
				<jsp:include page="./includes/contents/adminFaqContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.btn-write'}">
				<jsp:include page="./includes/contents/adminEditorContents.jsp" />
			</c:when>
		</c:choose>
		<jsp:include page="./includes/adminControllSidebar.jsp" />
		<jsp:include page="./includes/adminFooter.jsp" />
	</div>
	<jsp:include page="./includes/adminRequiredJs.jsp" />
	<script>
		<c:if test="${contents ne 'home' }">
			$("${contents}").children("a").addClass("active");
		</c:if>
	</script>
		<c:if test="${contents eq 'home' }">
			<jsp:include page="./includes/adminHomeJs.jsp" />
		</c:if>
		<c:if test="${contents eq '.btn-write' }">
			<jsp:include page="./includes/adminEnrollFormJs.jsp" />
		</c:if>
	
</body>
</html>