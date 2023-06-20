<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/freeBoard/freeBoardEnrollForm.css">
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

	#container {
	    width: 100%;
	    margin: 20px auto;
	    height: 480px;
	}
	.ck-editor__editable[role="textbox"] {
	    /* editing area */
	    min-height: 500px;
	    max-height: 400px;
	}
	.ck-content .image {
	    /* block images */
	    max-width: 80%;
	    margin: 20px auto;
	}
    .ck.ck-toolbar{
        background-color: #f9f9f9 !important;
        border-left: 0px !important;
        border-right: 0px !important;

    }
    .ck-restricted-editing_mode_standard.ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred{
        border-left: 0px !important;
        border-right: 0px !important;
    }

    /* 밑에 세 개의 선택자는 에디터 스티키버그 오류때문에 추가함. z-index 최고로 주면 되지만 모달이 있을까봐 고민*/
    .ck .ck-sticky-panel .ck-sticky-panel__content_sticky {
        position: static !important;
    }

    .ck-editor__top {
        height: 1px;
        overflow: hidden;
    }

    .ck-editor__top {
        display: block;
        height: 38.67px;
        .ck-sticky-panel__placeholder {
            display: none !important;
        }
    }


</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="wrap">
		<div id="body">
            <h1>자유 게시판</h1>
            <div>
                <c:if test="${b eq null}">
                    <form action="insert" method="post">
                </c:if>
                <c:if test="${b ne null}">
                    <form action="update" method="post">
                        <input type="hidden" name="boardNo" value="${b.boardNo}">
                </c:if>
                    <div class="title_warp">
                        <div>
                            <select name="categorySNo" id="catNoList">
                                <c:forEach var="list" items="${subCategoryList}">
                                    <c:if test="${list.categoryUNo eq 8}">
                                        <option value="${list.categorySNo}">${list.categorySName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="text" name="title" id="freeBoard_title" placeholder="제목을 입력하세요" value="${b.title}">
                    </div>
                    <textarea id="editor" name="content" >${b.content}</textarea>
                    <div class="submit_wapper">
                        <c:if test="${b eq null}">
                            <button type="submit" class="submit_btn">글 등록</button>
                        </c:if>
                        <c:if test="${b ne null}">
                            <button type="submit" class="submit_btn submit_btn_yellow">글 수정</button>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
	<jsp:include page="../common/rightside.jsp"/>
<!-- ckeditor CDN -->
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>

<!-- ckeditor 설정 스크립트 -->
<script src="${contextPath}/resources/js/admin/addCkeditor.js"></script>
</body>
</html>