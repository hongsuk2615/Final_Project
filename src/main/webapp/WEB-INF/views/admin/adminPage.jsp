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
  <c:if test="${contents eq '.btn-write'}">
  	<jsp:include page="./includes/ckeditorStyle.jsp" />
  </c:if>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="./includes/adminNavigation.jsp" />
		<jsp:include page="./includes/adminSidebar.jsp" />
		<c:choose>
			<c:when test="${contents eq 'home'}">
				<jsp:include page="./includes/contents/adminHomeContent.jsp" />
			</c:when>
			<c:when test="${contents eq 'member'}">
				<jsp:include page="./includes/contents/adminMemberContent.jsp" />
			</c:when>
			<c:when test="${contents eq 'report'}">
				<jsp:include page="./includes/contents/adminReportContent.jsp" />
			</c:when>
			<c:when test="${contents eq 'board'}">
				<jsp:include page="./includes/contents/adminBoardContent.jsp" />
			</c:when>
			<c:when test="${contents eq 'notice'}">
				<jsp:include page="./includes/contents/adminNoticeContent.jsp" />
			</c:when>
			<c:when test="${contents eq 'faq'}">
				<jsp:include page="./includes/contents/adminFaqContent.jsp" />
			</c:when>
			<c:when test="${contents eq '.btn-write'}">
				<jsp:include page="./includes/contents/adminErollFormContents.jsp" />
			</c:when>
		</c:choose>
		<jsp:include page="./includes/adminControllSidebar.jsp" />
		<jsp:include page="./includes/adminFooter.jsp" />
	</div>
	<jsp:include page="./includes/adminRequiredJs.jsp" />
<%-- 	<script src="${contextPath}/resources/js/admin/adminTables.js"></script> --%>
	<c:choose>
		<c:when test="${contents eq 'home'}">
			<!-- 홈 차트 생성 스크립트 -->
			<script src="${contextPath}/resources/js/admin/Chart.min.js"></script>
			<script src="${contextPath}/resources/js/admin/addHomeCharts.js"></script>
		</c:when>
		<c:when test="${contents eq 'member'}">
		
		</c:when>
		<c:when test="${contents eq 'report'}">
			
		</c:when>
		<c:when test="${contents eq 'board'}">
			
		</c:when>
		<c:when test="${contents eq 'notice'}">
		
		</c:when>
		<c:when test="${contents eq 'faq'}">
			
		</c:when>
		<c:when test="${contents eq '.btn-write'}">
			<!-- ckeditor CDN -->
			<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
			<!-- ckeditor 설정 스크립트 -->
			<script src="${contextPath}/resources/js/admin/addCkeditor.js"></script>
		</c:when>
	</c:choose>
	<c:if test="${contents ne 'home' }">
		<script>
			$(".sidebar-${contents}").children("a").addClass("active");
		</script>
	</c:if>
</body>
</html>