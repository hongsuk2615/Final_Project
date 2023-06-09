<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./includes/adminHead.jsp" />
<title>Insert title here</title>
</head>
<body class="login-page">
	<div class="login-box">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<img alt="" src="/thrifty/resources/images/main/icon/logo2.1.png" width="160px" height="160px">
			</div>
			<div class="card-body">
				<form action="${contextPath}/admin/login" method="post">
					<h1 class="mb-4 text-bold text-center">LOGIN</h1>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">
								<i class="fas fa-user"></i>
							</span>
						</div>
						<input type="text" class="form-control" name="userId" placeholder="ID">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">
								<i class="fas fa-lock"></i>
							</span>
						</div>
						<input type="password" class="form-control" name="userPwd" placeholder="Password">
					</div>
					<div class="mt-5">
						<button type="submit" class="btn btn-primary btn-block text-bold">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="./includes/adminRequiredJs.jsp" />
</body>
</html>