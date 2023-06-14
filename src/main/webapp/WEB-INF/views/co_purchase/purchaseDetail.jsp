<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/co_purchase/purchaseDetail.css">
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
            <jsp:include page="../common/boardBodyLeftCo_purchase.jsp"/>
            <div id="body-right">
                <div id="cat_title_box">
                	<div id="cat_title_1">게시글 상세</div>
                	<c:if test="${loginUser.userNo eq board.userNo or loginUser.authority eq 0}">
	                	<div>
	                		<div id="modify-btn" bNo ="${board.boardNo}" type="button">수정</div>
	                		<div id="delete-btn" bNo ="${board.boardNo}" type="button" url="co_purchase">삭제</div>
	                	</div>
                	</c:if>
                </div>
                <div id="detail_header">
                    <div id="detail_header_1">
                        <div id="detail_header_1_title">${ board.title }</div> <!-- 글 제목 -->
                        <div id="report-btn" class="flex" bNo="${board.boardNo}">
                            <img src="${ contextPath }/resources/images/main/icon/alarm.png" alt="" style="width: 20px; height: 20px; margin-right: 5px;">
                            <div style="margin-top: 2.5px;">신고</div>
                        </div>
                    </div>
                    <div id="profile" class="flex align">
                        <div id="profile_1" class="flex">
                            <div id="profile_img">
                                <img src="${ contextPath }/resources/images/myPage/${ co_purchase.changeName2 }" alt="" style="width: 40px; height: 40px; border-radius: 100px;">
                            </div> <!-- 프로필 -->
                            <div id="nickname">${ seller.nickName }</div>
                        </div>
                        <div class="flex">
                            <div id="recruit_1">모집 인원</div>
                            <div id="recruit_2">${ co_purchase.recruitsNum }</div>
                        </div>
                    </div>
                    <div class="flex justify align">
                        <div class="flex">
                            <div class="header_text">${ board.createDate }<!-- 2023.05.23. 22:10 --></div> <!-- 작성일 -->
                            <div class="flex">
                                <div id="views" class="header_text">조회</div>
                                <div class="header_text">${ board.readCount }</div>
                            </div>
                        </div>
                        <div class="flex align">
                            <div id="end_date">마감</div>
                            <div class="header_text">${ co_purchase.deadLine }</div>
                        </div>
                    </div>
                </div>
                <div id="detail_body">
                    <div id="body_description" class="flex">
                        <div id="body_description_1">
                            <img src="${ contextPath }/resources/upfiles/co_purchase/${ imageList.changeName }" id="body_img" alt="">
                        </div>
                        <div id="body_description_2">
                            <div id="body_description_content">
                                <div id="body_description_title">
                                    <div class="body_text">${ co_purchase.productName }</div>
                                    <div class="body_text">${ co_purchase.price }원</div>
                                </div>
                                <div class="flex">
	                                <div id="inquiry-btn" class="body_description_chatting" uNo = "${board.userNo}" seller="${seller.nickName}">문의 쪽지</div>
	                                <div id="wish-btn" class="body_description_wish" bNo="${board.boardNo}">찜하기</div>
                                </div>
                                <!-- id="body_description_chatting" -->
                                <div id="body_description_link" class="flex">
                                    <a href="${ co_purchase.link }">관련 링크 : ${ co_purchase.link }</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="body_text">
                         ${ board.content }
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
        <script src="/thrifty/resources/js/common/commonModal.js"></script>
        <script>
            
            document.getElementById('modify-btn').addEventListener('click',function(){  
                let bNo = $(this).attr("bNo");
                location.href="/thrifty/co_purchase/modify?bNo="+bNo;
            })       
        </script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
</body>
</html>