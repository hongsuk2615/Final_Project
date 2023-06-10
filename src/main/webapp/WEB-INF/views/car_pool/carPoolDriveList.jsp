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
        <div id="header">
            <jsp:include page="../common/header.jsp" />
        </div>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftCarPool.jsp"/>
            </div>
            
            <div id="body-right">
                <div id="ptj-header">
                    <h1><%-- ${ } --%></h1>
                </div>
                <div style="width:100%; display: flex; align-items: center; justify-content: space-between;">
                	<p>메인 > 카풀 > 태워주세요</p>
                    <div>
                        <button id="write-btn">글 작성하기</button>
                    </div>
                </div>
                <hr style="width: 100%;">
                <form action="/thrifty/carPool/detail?bno="method="get">
	                <div id="ptj-allBody" style="height: 1000px;">
	                	<div id="ptj-body1">
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;"/>
	                        <p style="text-align: center;">사당 ~ 역삼 8시 구해요 ㅠ</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">역삼 ~ 강남 카풀 해주실 천사~</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                </div>
	                <div id="ptj-body2">
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                </div>
	                <div id="ptj-body3">
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px; border: 1px gray;" >
	                        <img src="/thrifty/resources/images/carpool/carpoollist.png" style="height: 170px; width: 210px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <input type="hidden" name="boardNo" value="">
	                </div>
	                </div>
				</form>
                <div id="paging">
                    <p style="text-align: center;">< 1 2 3 4 ></p>
                </div>
            </div>
        </div>

        <div id="footer">

        </div>
    </div>
    
</body>
<script>
	document.getElementById("write-btn").addEventListener("click",function(){
    	location.href = "/thrifty/carPool/enroll";
	})
</script>

</html>