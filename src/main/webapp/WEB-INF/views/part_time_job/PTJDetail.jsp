<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/thrifty/resources/css/part_time_job/part_time_job_detail.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <div id="header">
            <jsp:include page="../common/header.jsp"/>
        </div>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            </div>
            <div id="body-right">
                <div id="enroll-category">
                    <div style="width: 50%;">
                        <h1>카테고리명</h1>
                    </div>
                    <div style="width: 55%;" id="enroll-update">
                        <button>수정하기</button>
                        <button>삭제하기</button>
                        <button>구인완료</button>
                    </div>
                </div>
                <hr>
                <div id="enroll">
                    <form>
                        <div id="enroll-header">
                            <div style="display: flex;">
                                <div>
                                    <h2>제목 : &nbsp;응애애애애애</h2>
                                </div>
                            </div>
                            <br>
                            <div>
                                <h3 id="enroll-content">내용 :  </h3><p>응애애애애애애애애응애애애애애애애애응애애애애애애애애응애애애애애애애애응애애애애애애애애응애애애애애애애애응애애애애애애애애응애애애애애애애애</p>
                            </div>
                            <!-- <div id="좌표"></div> -->
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>연락처 : &nbsp;010 - 1234 - 5678</h3><br>
                            <div id="item-btns">
                                <div id="inquiry-btn">구매문의</div>
                                <div id="wish-btn">찜</div>
                            </div>
                            아직 못구했어요 ㅠㅠ<input type="radio" name="isEnd"checked disabled> 구했어요!<input type="radio" name="isEnd" disabled>
                            <hr>
                            <h3>급여 : </h3><p><b style="color: red; font-size: 30px;">100,000</b> 원</p>
                            <hr>
                            <h3>시간 : </h3>
                            시작 시간 : 09:00 &nbsp;&nbsp;
                            마감 시간 : 18:00
                            <hr>
                            <div id="enroll-map">
                                <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                <div id="map" style="width:100%; height:350px; border-radius: 5px;"></div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="enroll-btn">뒤로가기</button>
                        </div>
                    </form>
                </div>
                <!-- <div id="map" style="width:100%;height:350px;"></div> -->
            </div>
        </div>
        <div id="footer">
        
        </div>
    </div>
<script type="text/javascript" src="/thrifty/resources/js/common/btn_event.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script>
    function mapDetail(y, x) {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var coordinate;

    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(y, x); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    }
</script>

</body>
</html>