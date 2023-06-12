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
                        <!-- <img src="/thrifty/resources/images/shopping-cart.png" alt="상위 카테고리 이미지"> -->
                        <div id="upper-category-name">지역별 카테고리</div>
                    </div>
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                        <c:forEach var="location" items="${locationList}">
		                	<li onclick="location.href = '${contextPath}/carPool/drive?lNo=${location.locationNo }'">${location.locationName }</li>
		                </c:forEach>
                    </ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <li><b>상세 카테고리</b></li>
	                    <c:forEach var="subCategory" items="${subCategoryList }">
							<c:if test="${subCategory.categoryUNo == 3}">
	                        	<li name="flocation" onclick="location.href = '${contextPath}/carPool/drive?scNo=${subCategory.categorySNo }'">${subCategory.categorySName }</li>						
							</c:if>                        
						</c:forEach>
                    </ul>
					<!-- <li style="display: flex; justify-content: flex-end; padding-right:15px ;"><button onclick="resetFilter();">필터초기화</button><button onclick="filter();">필터적용</button></li> -->
                </div>
            </div>
            <c:if test="${scNo != null}">
            	<script>
                	let scNo = ${scNo};
            	</script>
            </c:if>
</body>
</html>