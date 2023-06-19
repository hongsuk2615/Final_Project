<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/thrifty/resources/css/part_time_job/part_time_job_main.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
        flex-direction: column;
        align-items: center;
    }

    #body-search{
    	display: flex;
        width: 20%;
        min-width: 900px;
        height: 300px;
    }
    #body1{
        display: flex;
        width: 50%;
        min-width: 900px;
        min-height: 200px;
        margin-top: 50px;
    }

    #footer{
        
    }

    .swiper {
        width: 600px;
        height: 300px;
    }


</style>
</head>
<body>
    <div id="wrapper">
			<jsp:include page="../common/header.jsp" />
        <div id="body" style="padding-top: 100px;">
            <div id="body-search">
                <swiper-container class="mySwiper" navigation="true" style="border-radius: 30px; --swiper-navigation-color: white;">
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj.jpg"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/prj/ptj2.png"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj2.png"></swiper-slide>
                    <swiper-slide><img src="/thrifty/resources/images/ptj/ptj2.png"></swiper-slide>
                </swiper-container>
            </div>
            <div id="body1">
				<div id="simburum">
                    <button style="width: 900px; height: 150px; border: 0;" id="simburum-btn">
                    	<div style="width: 500px;" id="simburum-img">
    	                   	<img src="/thrifty/resources/images/ptj/house.png" style="width: 64px; height: 64px;">
	                        <img src="/thrifty/resources/images/ptj/part-time.png"><br>
                    	</div>
                        <p style="color: white;">심부름 서비스 / 대타 구하기</p>
                    </button>
				</div>
            </div>
            <h1>알뜰살뜰 자유게시판에 물어보세요!</h1>
            <div id="free-board">
            <c:forEach var="pList" items="${p}" begin="0" end="3" step="1">
           		<c:if test="${pList.board.categoryUNo eq 8 }">
           			<div id="free-board-div">
	                    <h4 style="color: #B2B1B0;">카테고리 > 자유 게시판</h4>
	                    <h3>${pList.board.title }</h3>
	                    <p id="free-board-content" style="max-width:250px;">${pList.board.content }</p>
	                </div>
           		</c:if>
            </c:forEach>
            </div>
        </div>
        <div style="height: 450px">
            <h2 style="margin-left: 10%;">최신 심부름 / 알바 게시글</h2>
            <div id="alba-board" style="padding: 30px;">
            	<c:forEach var="pList" items="${p }" begin="0" end="3" step="1">
	                <div id="ptj-new-board" onclick="location.href = '${contextPath}/ptj/detail?bNo=${pList.boardNo }'">
	                	<c:choose>
	                		<c:when test="${pList.board.categoryUNo eq 5 }">
			                    <img src="${contextPath }${webPath }${pList.imageList.get(0).changeName }" style="width: 200px; height: 160px;">	                		
			                    <p>${pList.isEnd == "N" ? "모집중" : "모집 완료" }</p>
	                   			<p>${pList.board.title }</p>
	                		</c:when>
	                		<c:otherwise>
	                			<img src="${contextPath }/resources/images/ptj/end.jpg" style="width: 200px; height: 160px;">
	                			<p>게시글이 삭제되거나</p>
	                			<p>구인이 완료되었습니다.</p>
	                		</c:otherwise>
	                	</c:choose>
	                    
	                </div>
            	</c:forEach>
            </div> 
        </div>

        <div id="footer">




        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
    <script>
        document.getElementById("simburum-btn").addEventListener("click",function(){
   	        location.href = "${contextPath}/ptj/ptjList";
   	   	})
    </script>
</body>



</html>