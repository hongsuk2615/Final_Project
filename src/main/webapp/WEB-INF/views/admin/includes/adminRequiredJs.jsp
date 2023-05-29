<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="/thrifty/resources/js/admin/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/thrifty/resources/js/admin/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/thrifty/resources/js/admin/adminlte.min.js"></script>
<!-- sweeetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <script>
 <c:if test="${not empty errorAlert}">
 	Swal.fire({
 		  icon: 'error', 
		  title: '${errorAlert.title}',
		  text: '${errorAlert.content}'
		});
	<c:remove var="errorAlert" />
 </c:if>
 </script>