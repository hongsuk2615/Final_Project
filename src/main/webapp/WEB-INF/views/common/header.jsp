<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/thrifty/resources/css/common/header.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <title>Document</title>
    </head>

    <body>
        <div id="header" class="background_basic">
            <div id="header_1">
                <div id="header_1_1">
                    <div id="main_logo" class="header_img_white"></div>
                </div>
                <div id="header_1_2" class="content_white">
                    <div>로그인</div>
                    <div>회원가입</div>
                    <div>내정보</div>
                    <div id="header_search" class="search_img_white"></div>
                </div>
            </div>
            <div id="header_2">
                <div id="header_2_1" class="content_white">
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
                    <div>
                        <div class="main_category">자유게시판</div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(window).scroll(function () {
                let scrollPosition = $(this).scrollTop(); // 스크롤 위치 가져오기
                let target = $("#header"); // position: fixed를 적용할 대상 요소
                let target2 = $("#main_logo");
                let target3 = $("#header_1_2");
                let target4 = $("#header_search");
                let target5 = $("#header_2_1");
                let target6 = $('#header');

                if (scrollPosition > 10) { // 스크롤 위치가 100 이상이면
                    target.addClass('background_white');
                    target.removeClass('background_basic');
                    target2.addClass('header_img_basic');
                    target2.removeClass('header_img_white');
                    target3.addClass('content_basic');
                    target3.removeClass('content_white');
                    target4.addClass('search_img_basic');
                    target4.removeClass('search_img_white');
                    target5.addClass('content_basic');
                    target5.removeClass('content_white');
                    // target.css({
                    //     position: "fixed"
                    // });
                } else { // 스크롤 위치가 100 미만이면
                    target.addClass('background_basic');
                    target.removeClass('background_white');
                    target2.addClass('header_img_white');
                    target2.removeClass('header_img_basic');                    
                    target3.addClass('content_white');
                    target3.removeClass('content_basic');
                    target4.addClass('search_img_white');
                    target4.removeClass('search_img_basic');
                    target5.addClass('content_white');
                    target5.removeClass('content_basic');
                    // target.css({
                    //     position: "static"
                    // });
                }
            });

        </script>
    </body>

    </html>