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
    <link href="/thrifty/resources/css/car_pool/car_pool_list.css" rel="stylesheet">
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
        padding: 40px;
        display: flex;
        justify-content: center;
    }

    #body-left{
        display: inline-block;
        width: 20%;
        min-width: 350px;
        min-height: 900px;
        background-color: rgb(0, 60, 120);
        margin-right: 10px;
    }
    #body-right{
        margin-left: 10px;
        width: 50%;
        min-width: 700px;
        min-height: 950px;
    }

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
		<jsp:include page="../common/header.jsp" />
        <div id="body">
			<jsp:include page="../common/boardBodyLeftCarPool.jsp"/>
            <div id="body-right">
                <div id="carpool-header">
                	<h1>[태워드려요! / 태워주세요!]</h1>     
                </div>
                <div style="width:100%; display: flex; align-items: center; justify-content: space-between;">
                	<p><a href="/thrifty">메인</a> > <a href="/thrifty/carPool">카풀</a></p>
                    <div>
                    	<c:if test="${loginUser != null }">
                        	<button id="write-btn">글 작성하기</button>
                        </c:if>
                    </div>
                </div>
                <hr style="width: 100%;">
                <div id="carpool-allBody" style="height: 1000px;">
                	<c:forEach var="cList" items="${list }" >
	                    <div style="width: 200px; height: 170px; border: 1px gray;" onclick="location.href='${contextPath}/carPool/detail?bNo=${cList.boardNo }'">
	                        <img src="${contextPath }/${cList.imgPath}" style="height: 170px; width: 210px; border-radius: 10px;"/>
	                        <p style="text-align: center;">${cList.subCategory.categorySName }</p>
	                        <p style="text-align: center;">제목 : ${cList.board.title }</p>
	                        <p style="text-align: center;">카풀비 : ${cList.price }</p>
	                    </div>
                	</c:forEach>
                </div>
				
				
                <div id="body-right-footer">
                    <div id="paging-btns">
                    	<c:choose>
		                  <c:when test="${ pi.currentPage eq 1 }">
		                     <div>&lt;</div>
		                  </c:when>
		                  <c:otherwise>
		                     <div><a href="/thrifty/carPool/drive?currPage=${filter.currPage-1}&scNo=${filter.scNo}&location=${filter.lNo}">&lt;</a></div>
		                  </c:otherwise>               
		               </c:choose>
		               <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
	                  	<div><a href="/thrifty/carPool/drive?currPage=${item}&scNo=${filter.scNo}&location=${filter.lNo}">${item}</a></div>
	               		</c:forEach>
	               		<c:choose>
		                  <c:when test="${ pi.currentPage eq pi.maxPage }">
		                     <div>&gt;</div>
		                  </c:when>
		                  <c:otherwise>
		                     <div><a href="/thrifty/carPool/drive?currPage=${filter.currPage+1}&scNo=${filter.scNo}&location=${filter.lNo}">&gt;</a></div>
		                  </c:otherwise>               
		               </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">

        </div>
    </div>
    
</body>
<script>
	document.getElementById("write-btn").addEventListener("click",function(){
    	location.href = "${contextPath}/carPool/enroll";
	})
</script>

</html>