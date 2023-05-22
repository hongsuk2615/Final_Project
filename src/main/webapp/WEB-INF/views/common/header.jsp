<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            /* border: 1px solid white !important; */
        }
        #header{
            height: 150px;
            background-color: rgb(0, 60, 120);
        }

        #header_1_1{
            display: flex;
            align-items: center;
        }

        #header_1{
            display: flex;
            justify-content: space-between;
            padding: 10px 300px;
        }

        #main_logo{
            height: 70px;
            width: 70px;
        }

        #header_1_2{
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 300px;
            color: white;
            font-weight: 900;
        }

        #header_search{
            height: 20px;
            width: 20px;
        }
        
        #header_2{
            width: 1000px;
            padding-left: 350px;
        }
        
        #header_2_1{
            display: flex;
            justify-content: space-between;
            padding-top: 20px;
            padding-bottom: 10px;
            color: white;
            font-size: larger;
            font-weight: 900;
        
        }
        /* 
        #header_2_1>div{ 
            height: 30px;
            border-bottom: 3px solid white;
        } */

        .main_category{
            height: 30px;
        }

        .main_underline{
            border-radius: 5px;
            border-top: 3px solid white;
        }
    </style>
</head>
<body>
    <div id="header">
        <div id="header_1">
            <div id="header_1_1">
                <img src="resources/images/main/icon/logo1.1.png" alt="" id="main_logo">
            </div>
            <div id="header_1_2">
                <div>로그인</div>
                <div>회원가입</div>
                <div>내정보</div>
                <div><img src="resources/images/main/icon/search-3.png" alt="" id="header_search"></div>
            </div>
        </div>
        <div id="header_2">
            <div id="header_2_1">
                <div>
                    <div class="main_category">공지사항</div>
                    <div></div>
                </div>
                <div>
                    <div class="main_category">쉐어하우스</div>
                    <div></div>
                </div>
                <div>
                    <div class="main_category">카풀</div>
                    <div></div>
                </div>
                <div>
                    <div class="main_category">중고거래</div>
                    <div></div>
                </div>
                <div>
                    <div class="main_category">심부름/알바</div>
                    <div></div>
                </div>
                <div>
                    <div class="main_category">공동구매</div>
                    <div class="main_underline"></div>
                </div>
                <div>
                    <div class="main_category">소모임</div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>