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
            /* border: 1px solid blue !important; */
            box-sizing: border-box;
        }
        body{
            margin: 0;
        }
        #wrapper{
            min-width: 1180px;
        }

        #header{
            height: 140px;
        }
        #body{
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        #body-right{
            display: inline-block;
            margin-left: 10px;
            padding-left: 30px;
            width: 55%;
            min-width: 700px;
            min-height: 900px;
        }

        #footer{
            
        }
    
        #cat_title_1{
            padding-top: 30px;
            padding-bottom: 30px;
            font-weight: 500;
            font-size: 3em;
        }

        #detail_header{
            padding-bottom: 10px;
            border-bottom: 2px solid rgb(160, 160, 160);
        }
        #detail_header_1{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #detail_header_1_title{
            font-size: 30px;
        }

        #profile{
            padding-top: 20px;
            padding-bottom: 10px;
            justify-content: space-between;
        }
        
        #profile_1{
            align-items: center;
        }

        #profile_img{
            width: 40px;
            height: 40px;
        }

        #nickname{
            padding-left: 10px;
            font-weight: 900;
        }

        #recruit_2{
            margin-left: 5px;
            width: 20px;
            height: 20px;
            color: white;
            background-color: rgb(19, 137, 255);
            border-radius: 100px;
            text-align: center;
            font-weight: 900;
        }

        .header_text{
            font-size: 12px;
            color: rgb(160, 160, 160);
        }

        #views{
            margin-left: 14px;
            margin-right: 5px;
        }

        #end_date{
            margin-right: 5px;
            font-size: 15px;
        }

        #body_description{
            margin-top: 20px;
        }
        #body_description_1{
            width: 500px;
            height: 300px;
            padding-right: 20px;
            border-right: 1px solid rgb(160, 160, 160);
        }

        #body_img{
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        #body_description_2{
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            padding-left: 20px;
            width: 360px;
        }

        .body_text{
            font-size: 25px;
            font-weight: 600;
        }

        .body_text+.body_text{
            padding-top: 10px;
        }

        #chatting{
            align-self: center;
            color: white;
            font-size: 20px;
            font-weight: 600;
            padding: 10px;
            background-color: rgb(19, 137, 255);
            border-radius: 5px;
        }

        #body_text{
            margin-top: 30px;
            font-size: 20px;
        }

        .flex{
            display: flex;
        }
        .justify{
            justify-content: space-between;
        }
        .align{
            align-items: center;
        }

    </style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <div id="cat_title_1">게시글 상세</div>
                <div id="detail_header">
                    <div id="detail_header_1">
                        <div id="detail_header_1_title">넷플릭스 패밀리 2명 구합니다</div> <!-- 글 제목 -->
                        <div class="flex">
                            <img src="resources/images/main/icon/alarm.png" alt="" style="width: 20px; height: 20px; margin-right: 5px;">
                            <div>신고</div>
                        </div>
                    </div>
                    <div id="profile" class="flex">
                        <div id="profile_1" class="flex">
                            <div id="profile_img">
                                <img src="resources/hong.png" alt="" style="width: 40px; height: 40px; border-radius: 100px;">
                            </div> <!-- 프로필 -->
                            <div id="nickname">김김홍홍석석</div>
                        </div>
                        <div class="flex">
                            <div id="recruit_1">모집 인원</div>
                            <div id="recruit_2">2</div>
                        </div>
                    </div>
                    <div class="flex justify align">
                        <div class="flex">
                            <div class="header_text">2023.05.23. 22:10</div> <!-- 작성일 -->
                            <div class="flex">
                                <div id="views" class="header_text">조회</div>
                                <div class="header_text">24</div>
                            </div>
                        </div>
                        <div class="flex align">
                            <div id="end_date">마감</div>
                            <div class="header_text">2023.06.24</div>
                        </div>
                    </div>
                </div>
                <div id="detail_body">
                    <div id="body_description" class="flex">
                        <div id="body_description_1">
                            <img src="resources/NETFLIX.png" id="body_img" alt="">
                        </div>
                        <div id="body_description_2">
                            <div>
                                <div class="body_text">넷플릭스 구독권</div>
                                <div class="body_text">10,000원</div>
                            </div>
                            <div id="chatting">문의 쪽지</div>
                        </div>
                    </div>
                    <div id="body_text">
                        김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
</body>
</html>