<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Starter</title>
  <jsp:include page="adminHead.jsp" />

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="adminHeader.jsp" />
		<jsp:include page="adminSidebar.jsp" />
		<jsp:include page="adminHomeContent.jsp" />
		<jsp:include page="adminControllSidebar.jsp" />
		<jsp:include page="adminFooter.jsp" />
	</div>
	<jsp:include page="adminJs.jsp" />
<!-- ./wrapper -->


</body>
</html>