<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="/thrifty/resources/js/common/header.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/thrifty/resources/css/common/mainHeader.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/login.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/find.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/enroll.css">
    <title>Document</title>
    <meta name ="google-signin-client_id" content="283046868248-2c2kr4u1rsvbos5t3g8dpev5mh3sn4hg.apps.googleusercontent.com">
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>
    	console.log(${locationList});
    </script>
</head>
<body>
    <div id="header" class="background_basic" style="height: 90px;">
        <div id="header_1">
            <div id="header_1_1">
                <a href="/thrifty/">
                    <div id="main_logo" class="header_img_white"></div>
                </a>
            </div>
            <div id="header_1_2">
            <c:choose>
            	<c:when test="${empty loginUser}">
	                <div href="" class="content_white change_content" onclick="login();">로그인</div>
	                <div href="" class="content_white change_content" onclick="enroll();">회원가입</div>        	
            	</c:when>
            	<c:otherwise>
	                <a href="" class="content_white change_content">내정보</a>
	                <div class="content_white change_content" onclick="logout();">로그아웃</div>
            	</c:otherwise>
            </c:choose>
	                <div id="header_search" class="search_img_white"> </div>            	
            </div>
        </div>
        <ul style="list-style-type: none;">
            <li id="GgCustomLogin">
            </li>
        </ul>

    </div>
    <script src="/thrifty/resources/js/member/modal.js"></script>
    <script src="/thrifty/resources/js/member/login-enroll.js"> </script>
    <script src="/thrifty/resources/js/member/validate.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script src="/thrifty/resources/js/googleAPI/googleLogin.js"></script>
    
</body>
</html>