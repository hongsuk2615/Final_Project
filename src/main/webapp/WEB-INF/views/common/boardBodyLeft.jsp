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
                        <div id="upper-category-name">중고거래</div>
                    </div>
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                    <c:forEach var="subCategory" items="${subCategoryList}">
                    	<c:if test="${subCategory.categoryUNo eq 4}">
                        <li>${subCategory.categorySName}</li>
                        </c:if>
                    </c:forEach>    
                    </ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <li>가격</li>
                        <li><input type="number" name="minPrice"> ~ <input type="number" name="maxPrice"> </li>
                        <li>지역</li>
                        <li>
                            <select name="location" id="">
<%--                             <c:forEach var="location" items="${locationList}">
                            	<option value="${locationNo}">${location.locationName}</option>
                            </c:forEach> --%>
                                
                            </select>
                        </li>

                        <li>거래방법</li>
                        <li>
                            <input type="radio" name="filterTradeMethod" id="filter-direct">
                            <label for="filter-direct">직거래</label>
                            <input type="radio" name="filterTradeMethod" id="filter-parcel">
                            <label for="filter-parcel">택배</label>
                            <input type="radio" name="filterTradeMethod" id="filter-both">
                            <label for="filter-both">둘다</label>

                        </li>
                    </ul>

                </div>

            </div>

    
</body>
</html>