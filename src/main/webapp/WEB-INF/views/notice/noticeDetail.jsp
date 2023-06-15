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
            <div class="board_detail">
                <div class="notice_info">
                    <span>${detail.createDate}</span>
                    <span>관리자1</span>
                </div>
                <div class="notice_title">
                    <h1>${detail.title}</h1>
                </div>
                <div class="notice_content">
                    ${detail.content}
                </div>


            </div>
        </div>
    </div>
</body>
</html>