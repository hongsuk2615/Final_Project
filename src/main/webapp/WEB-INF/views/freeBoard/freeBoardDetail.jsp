<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/freeBoard/freeBoardDetail.css">
<style>
	* {
		/* border: 1px solid blue !important; */
		box-sizing: border-box;
	}
	
	body {
		margin: 0;
	}
	
	#wrapper {
		min-width: 1180px;
	}
	
	#header {
		height: 140px;
	}
	
	#body {
		max-width: 1000px;
		padding: 40px 0px;
		margin: auto;
	}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="wrap">
		<div id="body">
            <h1>자유게시판</h1>
            <div class="contents_wrap">
                <div class="contents_top">
                    <div class="contents_title">
                        <c:forEach var="list" items="${subCategoryList}">
                            <c:if test="${list.categorySNo eq b.categorySNo}">
                                <span>[${list.categorySName}]</span>
                            </c:if>
                        </c:forEach>
                        <span>${b.title}</span>
                    </div>
                </div>
                <div class="contents_info">
                    <span>${b.nickName}</span>
                    <div class="board_info">
                        <span>${b.readCount}</span>
                        <span>${b.createDate}</span>
                    </div>
                </div>
                <div class="contents_bottom">
                    ${b.content}
                </div>
                <div class="board_btns">
                    <a class="board_btn" href="${contextPath}/freeBoard?categorySNo=${map.categorySNo}&currentPage=${map.currentPage}">목록</a>
                    <c:if test="${loginUser.userNo eq b.userNo}">
                        <a class="board_btn btn_yellow" href="${contextPath}/freeBoard/enroll?bNo=${b.boardNo}">수정</a>
                    </c:if>
                    <a class="board_btn btn_red" bno="${b.boardNo}" onclick="reportBoard(this)">신고</a>
                </div>
            </div>
            <div class="reply_container">
                <div class="reply_enroll_container">
                    <c:if test="${loginUser ne null}">
                        <div class="reply_enroll_member">
                            <img class="reply_enroll_memberProfile" src="${contextPath}/resources/images/admin/adminProfile.jpg" alt="">
                            <span uNo="${loginUser.userNo}">${loginUser.nickName}</span>
                        </div>
                        <div class="reply_enroll_content">
                            <textarea name="" id="reply_enroll_text" cols="120" rows="5"></textarea>
                        </div>
                        <div class="reply_enroll_btn_wrapper">
                            <button class="reply_enroll_btn" bNo="${b.boardNo}" onclick="replyEnroll(this)">등록</button>
                        </div>
                    </c:if>
                    <c:if test="${loginUser eq null}">
                        <div class="reply_enroll_content">
                            <textarea name="" id="reply_enroll_text_disabled" cols="120" rows="5" placeholder="로그인이 필요합니다." readonly></textarea>
                        </div>
                        <div class="reply_enroll_btn_wrapper">
                            <button class="reply_enroll_btn" disabled >등록</button>
                        </div>
                    </c:if>
                </div>
                <div class="replyList_container">
                    <ul>
                        <c:forEach var="list" items="${rList}">
                            <li class="replyList_wrapper">
                                <div class="replyList_top">
                                    <span class="replyList_nickName">${list.nickName}</span>
                                    <span class="replyList_createDate">${list.createDate}</span>
                                    <c:if test="${loginUser.userNo eq list.userNo}">
                                        <span class="replyList_del" rNo="${list.replyNo}" onclick="replyDel(this)">X</span>
                                    </c:if>
                                    <div class="replyList_report" rNo="${list.replyNo}" onclick="reportBoard(this)">
                                        <img src="/thrifty/resources/images/main/icon/alarm.png" alt="" style="width: 15px; height: 15px; margin-right: 5px;" onerror="this.src='/thrifty/resources/images/common/noImage.png'">
                                    </div>
                                </div>
                                <div class="replyList_bottom">
                                    <span class="replyList_content">${list.content}</span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    <jsp:include page="../common/rightside.jsp"/>
    <script src="/thrifty/resources/js/common/commonModal.js"></script>
    <script>
        function replyEnroll(element){
            let bNo = $(element).attr("bNo");
            let replyContent = $('#reply_enroll_text').val();

            $.ajax({
                url: "${contextPath}/reply/insert",
                data: {
                    bNo: bNo,
                    replyContent : replyContent
                },
                success(result){
                    if(result == 1){
                        Swal.fire({
                            position: 'top-center',
                            icon: 'success',
                            title: '댓글 등록',
                            showConfirmButton: false,
                            timer: 1000
                        }).then(()=>{location.reload();});
                    }
                }
            });
        }

        function replyDel(element){
            let rNo = $(element).attr("rNo");

            $.ajax({
                url: "${contextPath}/reply/delete",
                data: {
                    rNo: rNo
                },
                success(result){
                    if(result == 1){
                        Swal.fire({
                            position: 'top-center',
                            icon: 'success',
                            title: '댓글 삭제',
                            showConfirmButton: false,
                            timer: 1000
                        }).then(()=>{location.reload();});
                    }
                }
            });
        }


    </script>
</body>
</html>