<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/common/body-left-co.css">
    <title>Document</title>
    <style>
    	.sub-category:hover{
			background : lightgray;
			color : black;
		}
		.sub-category-selected{
			background : lightgray;
			color : black;
		}
    </style>
</head>
<body>
	<div id="body-left">
	    <div id="upper-category">
	        <div>
	            <img src="/thrifty/resources/images/main/icon/supply-chain.png" alt="상위 카테고리 이미지" onerror="this.src='/thrifty/resources/images/common/noImage.png'">
	            <a href="/thrifty/co_purchase/" id="upper-category-name">공동구매</a>
	        </div>
	    </div>
	    <div id="sub-category" >
	        <ul class="scrollbar">
	        <c:forEach var="subCategory" items="${subCategoryList}">
	        	<c:if test="${subCategory.categoryUNo eq 6}">
	            <li class="sub-category ${scNo eq subCategory.categorySNo? 'sub-category-selected':'' }" onclick="location.href = '${contextPath}/co_purchase?scNo=${subCategory.categorySNo }'">${subCategory.categorySName}</li>
	            </c:if>
	        </c:forEach>    
	        </ul>
	    </div>
	</div>
</body>
</html>