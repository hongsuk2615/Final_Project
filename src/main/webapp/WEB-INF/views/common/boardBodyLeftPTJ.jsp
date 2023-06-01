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
		                <c:forEach var="location" items="${ptjLocation }">
		                	<li>${ptjLocation.locationName }</li>
		                </c:forEach>                	
                	</ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <li>지역</li>
                        <li>
                            <select name="location" id="">
                                <option>서울시</option>
                                <option>김포시</option>
                                <option>고양시</option>
                                <option>파주시</option>
                                <option>양주시</option>
                                <option>동두천시</option>
                                <option>연천군</option>
                                <option>의정부시</option>
                                <option>포천시</option>
                                <option>가평군</option>
                                <option>남양주시</option>
                                <option>구리시</option>
                                <option>하남시</option>
                                <option>양평군</option>
                                <option>광주시</option>
                                <option>이천시</option>
                                <option>여주군</option>
                                <option>용인시</option>
                                <option>성남시</option>
                                <option>의왕시</option>
                                <option>과천시</option>
                                <option>군포시</option>
                                <option>안양시</option>
                                <option>안산시</option>
                                <option>시흥시</option>
                                <option>광명시</option>
                                <option>부천시</option>
                                <option>수원시</option>
                                <option>화성시</option>
                                <option>오산시</option>
                                <option>평택시</option>
                                <option>안성시</option>
                            </select>
                        </li>
                    </ul>

                </div>

            </div>

    
</body>
</html>