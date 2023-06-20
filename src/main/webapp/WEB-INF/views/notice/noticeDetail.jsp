<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/notice/noticeDetail.css">
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
            <div>
                <h1>공지사항</h1>
            </div>
            <div class="board_detail">
                <div class="notice_title">
                    <h2>[${detail.subCategoryName}] ${detail.title}</h2>
                </div>
                <div class="notice_info">
                    <span>작성일: ${detail.createDate}</span>
                </div>
                <div class="notice_content">
                    ${detail.content}
                </div>
            </div>
            <div class="noticeList_btn_area">
                <a class="noticeList_btn" href="${contextPath}/notice?categorySNo=${paramMap.categorySNo}&currentPage=${paramMap.currentPage}">목록</a>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
    <jsp:include page="../common/rightside.jsp"/>
</body>
</html>