<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/member/login.css">
    <title>Document</title>
<style>
    *{
        /* border: 1px solid blue !important; */
        box-sizing: border-box;
    }
    body{
        margin: 0;
    }
    #wrapper{
        min-width: 1180px;
    }

    #body{
        width: 100vw;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <div id="body">
           <div id="content">
                <div id="title">
                    <img src="/thrifty/resources/images/main/icon/logo1.1.png" alt="로고이미지" width="60" height="60">
                    <div>알뜰살뜰 로그인</div>
                </div>
                <div id="login-form">
                    <form action="/admin/login" method="post">
                        <div>
                            <img src="/thrifty/resources/images/login/help.png" alt="로그인 이미지" width="40" height="40">
                            <input type="text" name="userId" placeholder="아이디">
                        </div>
                        <div>
                            <img src="/thrifty/resources/images/login/unlock.png" alt="비밀번호 이미지" width="40" height="40">
                            <input type="password" name="userPwd" placeholder="비밀번호">
                        </div>
                        <button>로그인</button>
                    </form>
                </div>
                <div id="login-others-btns">
                    <div>회원가입</div>
                    <div>아이디/비밀번호 찾기</div>
                </div>
                <div id="sns-login">
                    <div>-------------------------또는-------------------------</div>
                    <div id="kakao-login-btn">
                        <img src="/thrifty/resources/images/login/kakao/kakao_login_large_wide.png" alt="카카오 로그인 이미지" width="310" height="60">
                    </div>
                </div>
           </div>
        </div>  
    </div>
</body>
</html>