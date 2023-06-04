<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/thrifty/resources/css/part_time_job/part_time_job_enrollform.css" rel="stylesheet">
<style>
    *{
        border: 1px solid blue !important;
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
    	flex-direction: row;
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
            <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            </div>
            <div id="body-right">
                <div id="enroll-category">
                    <h1>카테고리명</h1>
                </div>
                <hr>
                <div id="enroll">
                    <form>
                        <div id="enroll-header">
                            <h2>제목 : &nbsp;<input name="enrollTitle" id="enroll-title" required placeholder="제목을 적어주세요."></h2><br>
                            <h3 id="enroll-content">내용 :  &nbsp;<textarea name="enrollContent" id="enroll-textarea" style="resize: none; width: 520px; height: 100px;" required placeholder="날짜와 내용을 적어주세요."></textarea></h3>
                            <!-- <div id="좌표"></div> -->
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>연락처 : &nbsp;<input type="text" name="enrollContact" id="enroll-contact" required placeholder="연락처나 카카오톡ID 를 적어주세요."></h3><br>
                            <hr>
                            <h3>급여 : </h3><input type="number" id="enroll-price" required>&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            시작 시간 : <input type="time" name="enrollStartDate" class="enroll-date" value="09:00" required>&nbsp;&nbsp;
                            마감 시간 : <input type="time" name="enrollEndDate" class="enroll-date" value="18:00" required>
                            <hr>
                            <div id="enroll-map">
                                <div>지역 : <input type="text" name="" id="keyword" placeholder="지점 또는 관련 키워드를 검색 해 주세요!"></div><br>
                                <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                <div id="map" style="width:100%; height:350px;"></div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="enroll-btn">게시글 등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- <div id="map" style="width:100%;height:350px;"></div> -->
        </div>
        <div id="footer">
        
        </div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/kakaoAPI/map_search.js"></script>

</body>
</html>