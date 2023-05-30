<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/thrifty/resources/css/co_purchase/purchaseDetail.css">
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
            padding: 40px 0;
            display: flex;
            justify-content: center;
        }

        #body-right{
            display: inline-block;
            margin-left: 10px;
            padding-left: 30px;
            width: 50%;
            min-width: 700px;
            min-height: 900px;
        }

        #footer{
            
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
                            <img src="/thrifty/resources/images/main/icon/alarm.png" alt="" style="width: 20px; height: 20px; margin-right: 5px;">
                            <div>신고</div>
                        </div>
                    </div>
                    <div id="profile" class="flex">
                        <div id="profile_1" class="flex">
                            <div id="profile_img">
                                <img src="/thrifty/resources/hong.png" alt="" style="width: 40px; height: 40px; border-radius: 100px;">
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
                            <img src="/thrifty/resources/NETFLIX.png" id="body_img" alt="">
                        </div>
                        <div id="body_description_2">
                            <div id="body_description_content">
                                <div id="body_description_title">
                                    <div class="body_text">넷플릭스 구독권</div>
                                    <div class="body_text">10,000원</div>
                                </div>
                                <div id="body_description_chatting">문의 쪽지</div>
                                <div id="body_description_link" class="flex">
                                    <div id="link">관련 링크 :&nbsp;</div>
                                    <a href="https://www.netflix.com/kr/">https://www.netflix.com/kr/</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="body_text">
                        김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 김김홍홍석석괴바보 
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>