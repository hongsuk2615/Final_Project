<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trifty - 공지사항</title>
    <link rel="stylesheet" href="/thrifty/resources/css/notice/notice.css">
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
            <div class="page_title">
                <p>공지사항</p>
            </div>
            <div class="notice_category">
                <a class="noticeCategory" cat="0">전체</a>
            	<c:forEach var="noticeCat" items="${noticeCatList}">
            		<a class="noticeCategory" cat="${noticeCat.categorySNo}">${noticeCat.categorySName}</a>
            	</c:forEach>
            </div>
            <div>
                <ul class="noticeList">
                    <c:forEach var="notice" items="${list}">
                        <li class="noticeBoard">
                            <div>
                                <a class="notice_title" href="${contextPath}/notice/detail?bNo=${notice.boardNo}">[${notice.subCategoryName}] ${notice.title}</a>
                            </div>
                            <div class="notice_attr_flex">
                                <span>${notice.createDate}</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
<script>
    $('.noticeCategory').on('click', function(){
        let categorySNo = $(this).attr('cat');
        location.href = '${contextPath}/notice?categorySNo='+categorySNo+'&currentPage=1';
    });

    const urlParams = new URL(location.href).searchParams;
    const categorySNo = urlParams.get('categorySNo');

    $.each($('.noticeCategory'), function(index, item){
        if(categorySNo == $(item).attr('cat')){
            $(item).addClass('active');
            return false;
        }else if(categorySNo == null){
            $($(item)[0]).addClass('active');
            return false;
        }
    });
</script>
</html>
