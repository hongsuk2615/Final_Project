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
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" crossorigin="anonymous"></script>
    
</head>
<style>
    #dark_icon{
        position: absolute;
        top: 0;
        left: 500px;
    }

    .toggleSwitch {
      width: 100px;
      margin: 30px;
      height: 50px;
      display: block;
      position: relative;
      border-radius: 30px;
      background-color: #fff;
      box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
      cursor: pointer;
    }
    
    .toggleSwitch .toggleButton {
      width: 40px;
      height: 40px;
      position: absolute;
      top: 50%;
      left: 4px;
      transform: translateY(-50%);
      border-radius: 50%;
      background: #f03d3d;
    }
    
    
    .toggleSwitch.active .toggleButton {
      left: calc(100% - 44px);
      background: #fff !important;
    }
    
    .toggleSwitch, .toggleButton {
      transition: all 0.2s ease-in;
    }
    
    .toggleSwitch.blue.active {
      background: #5151e5;
    }
    
    .toggleSwitch.blue .toggleButton {  
      background: #5151e5;
    }
    
    </style>
<body>
    <script>
        Kakao.init('812fa162a908f2e0e2a8addf2bbd6869'); // 사용하려는 앱의 JavaScript 키 입력
      </script>
    <div id="header" class="background_basic">
        
        <div id="header_1">
            <div id="header_1_1">
                <a href="/thrifty/">
                    <div id="main_logo" class="header_img_white"></div>
                </a>
            </div>
            
            <div id="dark_icon">
                <label for="toggle" class="toggleSwitch blue">
                    <span class="toggleButton"></span>
                </label>
            </div>


            <div id="header_1_2">
            <c:choose>
            	<c:when test="${empty loginUser}">
	                <div class="content_white change_content" onclick="login();">로그인</div>
	                <div class="content_white change_content" onclick="enroll();">회원가입</div>        	
            	</c:when>
            	<c:otherwise>
	                <div class="content_white change_content" onclick="myPage();" >내정보</div>
	                <c:choose>
						<c:when test="${loginUser.loginMethod eq 'K' }">
							<div class="content_white change_content" onclick="kakaoLogout();">로그아웃</div>
						</c:when>	                
						<c:otherwise>
							<div class="content_white change_content" onclick="logout();">로그아웃</div>
						</c:otherwise>
		                
	                </c:choose>
            	</c:otherwise>
            </c:choose>
	                <div id="header_search" class="search_img_white"> </div>            	
            </div>
        </div>
        <div id="header_2">
            <div id="header_2_1">
            	<c:forEach var="upperCategory" items="${upperCategoryList}">
            		<div>
                        <a class="main_category content_white change_content" href="/thrifty/${upperCategory.categoryPath}">${upperCategory.categoryUName}</a>
                        <div></div>
                    </div>
            	</c:forEach>
                <!-- <div>
                    <a class="main_category content_white change_content">공지사항</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">쉐어하우스</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">카풀</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">중고거래</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">심부름/알바</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">공동구매</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">소모임</a>
                    <div></div>
                </div>
                <div>
                    <a class="main_category content_white change_content">자유게시판</a>
                    <div></div>
                </div> -->
            </div>
        </div>
        
        <ul style="list-style-type: none;">
            <li id="GgCustomLogin">
            </li>
        </ul>

    </div>
    <script>
        const toggleList = document.querySelectorAll(".toggleSwitch");
    
        toggleList.forEach(($toggle) => {
        $toggle.onclick = () => {
        $toggle.classList.toggle('active');
        if(toggleList[0].classList.contains('active')){
            dark_mode();
        }else{
            light_mode();
        }
      }
      
    });
    
                function dark_mode() {
                    
                   
                  
                    document.querySelector("body").style.backgroundColor="rgb(47, 52, 55)"; 
                    document.querySelector("body").style.color="white";
                    document.querySelector("#body").style.backgroundColor="rgb(47, 52, 55)";
                    document.querySelector("#body").style.color="white";
                }
                function light_mode() {
                 
    
                    document.querySelector("body").style.backgroundColor="white"; 
                    document.querySelector("body").style.color="black";
                    document.querySelector("#body").style.backgroundColor="white";
                    document.querySelector("#body").style.color="black";
                }
    
      </script>
    <script>
        function kakaoLogout() {
            location.href="https://kauth.kakao.com/oauth/logout?client_id=17596a7a342e703f12c332dec822a955&logout_redirect_uri=http://localhost:8081/thrifty/member/logout";
        }
    </script>    
    <script src="/thrifty/resources/js/member/modal.js"></script>
    <script src="/thrifty/resources/js/member/login-enroll.js"> </script>
    <script src="/thrifty/resources/js/member/validate.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script src="/thrifty/resources/js/googleAPI/googleLogin.js"></script>
    
</body>
</html>
