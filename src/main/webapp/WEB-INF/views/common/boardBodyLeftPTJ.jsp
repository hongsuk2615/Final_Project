<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/common/body-left.css">
    <title>Document</title>
</head>
<body>

            <div id="body-left">
                <div id="upper-category">
                    <div>
                        <img src="/thrifty/resources/images/shopping-cart.png" alt="상위 카테고리 이미지">
                        <div id="upper-category-name">상위 카테고리</div>
                    </div>
                </div>
                <div id="sub-category" >
                	<ul class="scrollbar">
		                <c:forEach var="location" items="${locationList}">
		                	<li>${location.locationName }</li>
		                </c:forEach>
                	</ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <li>상세 카테고리</li>
	                    <c:forEach var="subCategory" items="${subCategoryList }">
							<c:if test="${subCategory.categoryUNo == 5}">
	                        	<li>${subCategory.categorySName }</li>						
							</c:if>                        
						</c:forEach>
                    </ul>

                </div>

            </div>

    
</body>
</html>