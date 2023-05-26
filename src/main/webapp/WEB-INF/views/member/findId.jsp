<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/member/find.css">
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
        flex-direction: column;
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
                    <div><img src="/thrifty/resources/images/main/icon/logo1.1.png" alt="로고이미지" width="60" height="60"></div>
                    <div>아이디 찾기</div>
                </div>
                <div id="find-form">
                    <form action="/login" method="post">
                        <div>
                            <div>
                                <div>이름</div>
                                <input type="text" name="userName" placeholder="이름">
                            </div>
                            <div>
                                <div>이메일</div>
                                <input type="email" name="email" placeholder="이메일">
                            </div>
                            <div id="btns">
                                <button id="findId-btn">확인</button>
                                <button id="findPwd-btn">비밀번호 찾기</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
            <button id="loginMenu-btn">로그인 창으로</button>
        </div>  
    </div>
</body>
</html>