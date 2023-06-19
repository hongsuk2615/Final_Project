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
                    <a class="board_btn btn_red" href="${contextPath}/freeBoard?" bno="${b.boardNo}" onclick="reportBoard(this)">신고</a>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    <script src="/thrifty/resources/js/common/commonModal.js"></script>
</body>
</html>