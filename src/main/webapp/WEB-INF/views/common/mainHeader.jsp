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
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
    <script type="text/javascript" src="/thrifty/resources/js/common/header.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/thrifty/resources/css/common/mainHeader.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/login.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/find.css">
    <link rel="stylesheet" href="/thrifty/resources/css/member/enroll.css">
    <title>Document</title>
    <meta name ="google-signin-client_id" content="283046868248-2c2kr4u1rsvbos5t3g8dpev5mh3sn4hg.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" crossorigin="anonymous"></script>
    <style>
    	@font-face {
		    font-family: 'GangwonEdu_OTFBoldA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		body *{
			font-family: 'GangwonEdu_OTFBoldA';
		}

    </style>
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
	                <div  class="content_white change_content" onclick="login();">로그인</div>
	                <div  class="content_white change_content" onclick="enroll();">회원가입</div>        	
            	</c:when>
            	<c:otherwise>
	                <div class="content_white change_content" onclick="myPage()">내정보</div>
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
                <div class="content_white change_content">
                    <label for="toggle" class="toggleSwitch blue">
                        <span id="toggleButton"></span>
                    </label>
                </div>
            </div>
        </div>
        <form action="/thrifty/api/v1/oauth2/google" method="POST">
            <input type="submit" value="post">
        </form>    	
        <div class="g-signin2" data-onsuccess="onSignIn"></div>
        <ul style="list-style-type: none;">
            <li id="GgCustomLogin">
            </li>
        </ul>
        <div id="buttonDiv"></div>

    </div>
    <script>
        
        // 구글 로그인 정보 받아서 로그인
        function handleCredentialResponse(response) {
           // response.credential == 구글 로그인 토큰
           // parseJwt(token) = json web token 파싱(디코딩)
            const responsePayload = parseJwt(response.credential);
            
            let snsId = responsePayload.sub;
            let snsName = responsePayload.name;
            let snsType = 3;
            let filePath = responsePayload.picture;
            
         $.ajax({
                 url : "/thrifty/member/googleLogin",
                 data : {snsId, snsName, snsType, filePath},
                 method : 'post',
                 success: function(data){
                    alertMsg("구글로 정상 로그인되었습니다.");
                    
                    setTimeout(()=> location.replace("/thrifty/"), 1500);
                    
                    location.replace("/thrifty/");
                 },
                 error: function(){
                    console.log("구글로그인 실패");
                 }
              });
        }
        
        // jwt 알아볼수있도록 변환
        function parseJwt(token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };
        
        // 구글 로그인 버튼 만들기
        function () {
          google.accounts.id.initialize({
            client_id: "283046868248-2c2kr4u1rsvbos5t3g8dpev5mh3sn4hg.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            {theme: "filled_blue", size: "large", shape: "circle", width: "400", logo_alignment: "center" }  // customization attributes
          );
        }
    </script>
    <script>
    	function onSignIn(googleUser){
    		console.log("aaa");
    		let profile = googleUser.getBasicProfile();
    		console.log('ID: ' + profile.getId());
    		console.log('Name: ' + profile.getName());
    		console.log('Image URL: ' + profile.getImageUrl());
    		console.log('Email: ' + profile.getEmail());
    	}
    </script>
    <script>
        function kakaoLogout() {
            location.href="https://kauth.kakao.com/oauth/logout?client_id=17596a7a342e703f12c332dec822a955&logout_redirect_uri=http://localhost:8081/thrifty/member/logout";
        }
    </script> 

    <script>
        let toggleList = document.querySelectorAll(".toggleSwitch");

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
            document.getElementById("toggleButton").style.backgroundImage = 'url("/thrifty/resources/images/main/icon/moon.png")';
            document.querySelector("body").style.backgroundColor="rgb(47, 52, 55)"; 
            document.querySelector("body").style.color="white";
            document.querySelector("#body").style.backgroundColor="rgb(47, 52, 55)";
            document.querySelector("#body").style.color="white";
        }
        function light_mode() {
            document.getElementById("toggleButton").style.backgroundImage = 'url("/thrifty/resources/images/main/icon/sun.png")';
            document.querySelector("body").style.backgroundColor="white"; 
            document.querySelector("body").style.color="black";
            document.querySelector("#body").style.backgroundColor="white";
            document.querySelector("#body").style.color="black";
        }

    </script>
    <script src="/thrifty/resources/js/member/modal.js"></script>
    <script src="/thrifty/resources/js/member/login-enroll.js"> </script>
    <script src="/thrifty/resources/js/member/validate.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script src="/thrifty/resources/js/googleAPI/googleLogin.js"></script>
    
</body>
</html>
