<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <script>
 <c:if test="${not empty errorAlert}">
 	Swal.fire({
 		  icon: 'error', 
		  title: '${errorAlert.title}',
		  text: '${errorAlert.content}'
		});
	<c:remove var="errorAlert" />
 </c:if>
 
 <c:if test="${not empty alert}">
	alert("${alert}");
	<c:remove var="alert" />
</c:if>
 </script>