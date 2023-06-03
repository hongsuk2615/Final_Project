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
        min-height: 380px;
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
        <div id="header">
			<jsp:include page="../common/header.jsp" />
        </div>
        <div id="body">
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
                    <button style="width: 300px; height: 200px;" id="simburum-btn">
                        <img src="/thrifty/resources/images/ptj/house.png" style="width: 64px; height: 64px;"><br>
                        <p style="color: white;">심부름 서비스</p>
                    </button>
				</div>
				<div id="alba">
					<button style="width: 300px; height: 200px;" id="alba-btn">
                        <img src="/thrifty/resources/images/ptj/part-time.png">
                        <p style="color: white;">대타 구하기</p>
                    </button>
				</div>
            </div>
            <h1>알뜰살뜰 자유게시판에 물어보세요!</h1>
            <div id="free-board">
                <div>
                    <h4 style="color: #B2B1B0;">카테고리 > 알바 대타</h4>
                    <h3>알바 어떻게 해야하죠</h3>
                    <p style="max-width:250px;">대타 구해요~ 역삼역 근처인데 혹시 시간 되시는분 계실까요?</p>
                </div>
                <div>
                    <h4 style="color: #B2B1B0;">카테고리 > 심부름</h4>
                    <h3>0명 모집중</h3>
                    <p style="max-width:250px;">왜 이렇게 저를 힘들게 하십니까!!!</p>
                </div>
                <div>
                    <h4 style="color: #B2B1B0;">카테고리 > 알바 대타</h4>
                    <h3>10명 모집중</h3>
                    <p style="max-width:250px;">알바생 구해요~ 역삼역 근처</p>
                </div>
                <div>
                    <h4 style="color: #B2B1B0;">카테고리 > 알바 대타</h4>
                    <h3>3명 모집중</h3>
                    <p style="max-width:250px;">알바생 구해요~ 역삼역 근처</p>
                </div>
            </div>
        </div>
        <div>
            <h2 style="margin-left: 250px;">최신 심부름 / 알바 게시글</h2>
            <div id="alba-board">
                <div>
                    <img src="/thrifty/resources/images/ptj/alba1.png">
                    <p><b>3명 모집중</b></p>
                    <p>알바생 구해요~ 역삼역 근처</p>
                </div>
                <div>
                    <img src="/thrifty/resources/images/ptj/alba1.png">
                    <p><b>3명 모집중</b></p>
                    <p>알바생 구해요~ 역삼역 근처</p>
                </div>
                <div>
                    <img src="/thrifty/resources/images/ptj/alba1.png">
                    <p><b>3명 모집중</b></p>
                    <p>알바생 구해요~ 역삼역 근처</p>
                </div>
                <div>
                    <img src="/thrifty/resources/images/ptj/alba1.png">
                    <p><b>3명 모집중</b></p>
                    <p>알바생 구해요~ 역삼역 근처</p>
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
    <script>
        document.getElementById("simburum-btn").addEventListener("click",function(){
   	        location.href = "<%= request.getContextPath() %>/ptj/ptjList";
   	   	})
   	   	
   	   	document.getElementById("alba-btn").addEventListener("click",function(){
   	        location.href = "<%= request.getContextPath() %>/ptj/ptjList";
   	   	})
    </script>
</body>



</html>