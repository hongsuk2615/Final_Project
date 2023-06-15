<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/thrifty/resources/css/car_pool/car_pool_enrollform.css" rel="stylesheet">
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
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            <div id="body-right">
                <div id="enroll-category">
                    <h1>카테고리명</h1>
                </div>
                <hr>
                <div id="enroll">
                    <!-- <form> -->
                        <div id="enroll-header">
                            <h2>제목 : &nbsp;<input name="enrollTitle" id="enroll-title" required placeholder="제목을 적어주세요."></h2><br>
                            <h3 id="enroll-content">내용 :  &nbsp;<textarea name="enrollContent" id="enroll-textarea" style="resize: none; width: 520px; height: 100px;" required placeholder="날짜와 내용을 적어주세요."></textarea></h3>
                            <!-- <div id="좌표"></div> -->
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>연락처 : &nbsp;<input type="text" name="enrollContact" id="enroll-contact" required placeholder="연락처나 카카오톡ID 를 적어주세요."></h3><br>
                            <hr>
                            <h3>카테고리 : 
                                <input type="radio" name="driving">타세요
                                <input type="radio" name="driving">태워주세요
                            </h3>
                            <hr>
                            <h3>카풀비 : </h3><input type="number" id="enroll-price" required>&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            출발 시간 : <input type="time" name="enrollStartDate" class="enroll-date" value="09:00" required>&nbsp;&nbsp;
                            도착 시간 : <input type="time" name="enrollEndDate" class="enroll-date" value="18:00" required>
                            <hr>

                            <div style="display: flex; align-items: center; " id="location-list">
                                <h3>시 / 군 / 구 : </h3>
                                <select style="height:40px; margin-left: 20px;">
                                    <option>서울시</option>
                                    <option>김포시</option>
                                    <option>고양시</option>
                                    <option>파주시</option>
                                    <option>양주시</option>
                                    <option>동두천시</option>
                                    <option>연천군</option>
                                    <option>의정부시</option>
                                    <option>포천시</option>
                                    <option>가평군</option>
                                    <option>남양주시</option>
                                    <option>구리시</option>
                                    <option>하남시</option>
                                    <option>양평군</option>
                                    <option>광주시</option>
                                    <option>이천시</option>
                                    <option>여주군</option>
                                    <option>용인시</option>
                                    <option>성남시</option>
                                    <option>의왕시</option>
                                    <option>과천시</option>
                                    <option>군포시</option>
                                    <option>안양시</option>
                                    <option>안산시</option>
                                    <option>시흥시</option>
                                    <option>광명시</option>
                                    <option>부천시</option>
                                    <option>수원시</option>
                                    <option>화성시</option>
                                    <option>오산시</option>
                                    <option>평택시</option>
                                    <option>안성시</option>
                                </select>
                            </div>

                            <hr>

                            <div id="enroll-map">
                                <div>
                                    <h3>경로길 그리기</h3>
                                </div>
                                <div id="map" style="width:100%;height:350px;"></div>
                                <div id="map-search">
                                    <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                    <div style="display: flex; flex-direction: column;">
                                        <input type="text" name="" id="start-keyword" placeholder="출발지를 검색 해 주세요!"><br>
                                        <button id="start-btn" onclick="setOrigin();">해당 마커 출발지로 설정하기</button>
                                    </div>
                                    <div style="margin-top: 5px; ">
                                        <img src="/thrifty/resources/images/carpool/exchange.png" id="change-val">
                                    </div>
                                    <div style="display: flex; flex-direction: column;">
                                        <input type="text" name="" id="arrival-keyword" placeholder="도착지를 검색 해 주세요!"><br>
                                        <button id="arrival-btn" onclick="setDestination();">해당 마커 도착지로 설정하기</button>
                                    </div>
                                </div>
                                <div style="display: flex; flex-direction: column;" id="carpool-enroll-footer">
                                    <button id="drawpath" class="draw-btn" onclick="drowPath(document.getElementById('origin').value, document.getElementById('destination').value)">경로길그리기</button>
                                    <input type="hidden" name="origin" id="origin">
                                    <input type="hidden" name="destination" id="destination">
                                    <button onclick="removeLine();" class="draw-btn" id="redraw">다시 그리기</button>
                                </div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="carpool-enroll-btn">게시글 등록하기</button>
                        </div>
                    <!-- </form> -->
                </div>
            </div>
            <!-- <div id="map" style="width:100%;height:350px;"></div> -->
        </div>
        <div id="footer">
        
        </div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/kakaoAPI/map_drawing.js"></script>
<script>
    $(function(){

        $("#arrival-btn").click(function(){
            $("#arrival-keyword").prop("disabled" , true);
            $("#arrival-keyword").css("background" , "lightgray");
        })

        $("#start-btn").click(function(){
            $("#start-keyword").prop("disabled" , true);
            $("#start-keyword").css("background" , "lightgray");
        })

        $("#change-val").click(function(){
            let temp = $("#start-keyword").val();
            $("#start-keyword").val($("#arrival-keyword").val());
            $("#arrival-keyword").val(temp);
        })

        $("#redraw").click(function(){
            $("#arrival-keyword").prop("disabled" , false);
            $("#start-keyword").prop("disabled" , false);
            $("#arrival-keyword").css("background" , "white");
            $("#start-keyword").css("background" , "white");
        })
    })



</script>


</body>
</html>