<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<c:set var="categorySNo" value="${map.categorySNo}"/>
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
                                <a class="notice_title" href="${contextPath}/notice/detail?categorySNo=${categorySNo}&currentPage=${pi.currentPage}&bNo=${notice.boardNo}">[${notice.subCategoryName}] ${notice.title}</a>
                            </div>
                            <div class="notice_attr_flex">
                                <span>${notice.createDate}</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="pagingbar">
                <c:choose>
                    <c:when test="${pi.currentPage eq 1}">
                        <img src="/thrifty/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;">
                    </c:when>
                    <c:otherwise>
                        <img src="/thrifty/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;">
                    </c:otherwise>
                </c:choose>
                <c:forEach var="item" begin="${pi.startPage}" end="${pi.endPage}">
                    <c:choose>
                        <c:when test="${pi.currentPage == item}">
                            <div class="page-item"><a class="page-link" href="/thrifty/notice?categorySNo=${categorySNo}&currentPage=${item}">${item}</a></div>
                        </c:when>
                        <c:otherwise>
                            <li class="paginate_button page-item">
                                <div class="page-item"><a class="page-link" href="/thrifty/notice?categorySNo=${categorySNo}&currentPage=${item}">${item}</a></div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage}">
                        <div class="page-item"><a class="page-link" href="/thrifty/notice?categorySNo=${categorySNo}&currentPage=${item+1}"><img src="/thrifty/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                    </c:when>
                    <c:otherwise>
                        <li class="paginate_button page-item next">
                            <div class="page-item"><a class="page-link" href="/thrifty/notice?categorySNo=${categorySNo}&currentPage=${item+1}"><img src="/thrifty/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                        </li>
                    </c:otherwise>
                </c:choose>  
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
	<jsp:include page="../common/rightside.jsp"/>
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
</body>
</html>
