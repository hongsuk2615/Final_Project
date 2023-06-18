<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <span>[쉐어하우스]</span>
                        <span>제목제목제목</span>
                    </div>
                    <!-- 여기에 신고 버튼 -->
                </div>
                <div class="contents_info">
                    <span>닉네임</span>
                    <div class="board_info">
                        <span>조회수</span>
                        <span>2010.20.10</span>
                    </div>
                </div>
                <div class="contents_bottom">
                    <figure class="image image_resized" style="width:34.24%;"><img src="/thrifty/resources/images/freeBoard/2023061618310738864.jpg"></figure><p>ㅎㅅㅎ</p>
                </div>
                <div class="board_btns">
                    <a class="board_btn">목록</a>
                    <a class="board_btn btn_red" onclick="reportBoard(this)">신고</a>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    <script src="/thrifty/resources/js/common/commonModal.js"></script>
</body>
</html>