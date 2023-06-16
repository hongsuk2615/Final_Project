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
    <link href="/thrifty/resources/css/car_pool/car_pool_detail.css" rel="stylesheet">
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
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeftCarPool.jsp"/>
            <div id="body-right">
                <div id="enroll-category">
                    <div style="width: 50%;">
                        <h1>${carpool.subCategory.categorySName }</h1>
                    </div>
                     <c:if test="${loginUser.userNo eq carpool.board.userNo or loginUser.authority eq 0}">
	                    <div id="enroll-update">	
	                        <button style="border: 0;" id="update-btn" url="carPool/update">수정하기</button>
	                        <button style="border: 0;" id="delete-btn" bNo="${carpool.board.boardNo }" url="carPool/drive">삭제하기</button>
	                        <c:choose>
	                        	<c:when test="${carpool.isEnd eq 'N' }">
			                        <button style="border: 0;" id="dead-line-btn" bNo="${carpool.boardNo }" url="carPool/drive">구인완료</button>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<button style="border: 0; display:none;" id="dead-line-btn" bNo="${carpool.boardNo }" url="carPool/drive"></button>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
	                </c:if>
                </div>
                <hr>
                <div id="enroll">
                        <div id="enroll-header">
                            <div style="display: flex;">
                                <div>
                                <c:forEach var="image" items="${imageList }" begin="0" end="3" step="1">
                                <c:choose>
                                	<c:when test="${image.changeName != null }">
                                		<img src="${contextPath }/resources/upfiles/carPool/${image.changeName}" style="height: 200px; width: 300px; border-radius: 10px;" onclick = "location.href = '${contextPath}/carPool/detail?bNo=${list.get(i).boardNo}'"/>                                	
                                	</c:when>
                                	<c:otherwise>
                                		<img src="${contextPath }/resources/images/carpool/no-image.png" style="height: 200px; width: 300px; border-radius: 10px;" onclick = "location.href = '${contextPath}/carPool/detail?bNo=${list.get(i).boardNo}'"/>
                                	</c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <h2>제목 : &nbsp;${carpool.board.title }</h2>
                                </div>
                                <c:if test="${p.isEnd eq 'Y' }">
                                    <p style="color: red;"><b>모집인원이 마감 되었습니다.</b></p>
                                </c:if>
                            </div>
                            <br>
                            <div>
                                <h3 id="enroll-content">내용 :  </h3><p>${carpool.board.content }</p>
                            </div>
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>작성자 아이디 : ${carpool.member.userId }</h3>
                            <h3>작성자 성별 : ${carpool.member.gender }</h3>
                            <hr>
                            <div id="item-btns">
                                <div id="inquiry-btn" uNo="${carpool.board.userNo }" seller="${carpool.member.userId }" onclick ="">쪽지 보내기</div>
                                <div id="report-btn" bNo="${carpool.board.boardNo }">신고하기</div>
                                <div id="wish-btn" bNo="${carpool.board.boardNo }">찜</div>
                            </div>
                            아직 못구했어요 ㅠㅠ<input type="radio" name="isEnd"checked disabled> 구했어요!<input type="radio" name="isEnd" disabled>
                            <hr>
                            <h3>모집 인원 : ${carpool.recruitsNum }</h3>
                            <h3>현재 인원 : ${carpool.recruitsCurr }</h3>
                            <hr>
                            <h3>카풀비 : </h3><p><b style="color: red; font-size: 30px;">${carpool.price }</b> 원</p>
                            <hr>
                            <h3>시간 : </h3>
                            출발 시간 : ${carpool.startTime }<br>
                            도착 시간 : ${carpool.endTime }
                            <hr>
                            <h3>시 / 군 / 구 : ${carpool.location.locationName }</h3>
                            <hr>
                            <div id="enroll-map">
                                <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                <div id="map" style="width:100%; height:350px; border-radius: 5px;"></div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button type="button" id="back-btn" style="border: 0;">뒤로가기</button>
                        </div>
                </div>
            </div>
        </div>
        <div id="footer">
        
        </div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/common/commonModal.js"></script>
<script type="text/javascript" src="/thrifty/resources/js/carpool/car_pool_dead_line.js"></script>
<script>
	let origin = "${carpool.origin}";
	let destination = "${carpool.destination}";
	$(function(){
		drowPath(origin,destination);		
	})
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.74600180458021 , 127.095508519265), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	function drowPath(origin, destination){
	    $.ajax({
	        url : "https://apis-navi.kakaomobility.com/v1/directions?origin="+ origin + "&destination=" + destination + "&waypoints=&priority=RECOMMEND&car_fuel=GASOLINE&car_hipass=false&alternatives=false&road_details=false",
	        method : "GET",
	        headers: {Authorization : "KakaoAK a0a349702051ef8d9fc1b66062f09c70"},    
	        success : function(arg){
	            map = new kakao.maps.Map(mapContainer, mapOption);
	                let bound = arg.routes[0].sections[0].bound;
	                console.log(bound.min_x);
	                let roads = arg.routes[0].sections[0].roads;
	                console.log(roads);
	                if(arg.routes[0].sections[0]){

	                    let detailRoads = [];

	                    for(let i=0;i < roads.length;i++){
	                        let arg = roads[i];
	                        let mini = arg.vertexes;
	                        let cursor = 0;
	                        while(cursor < mini.length){
	                            let obj = new kakao.maps.LatLng(mini[cursor+1], mini[cursor]);
	                            detailRoads.push(obj);
	                            cursor = cursor + 2;
	                            if(cursor >= 1000000) break;
	                        }                             
	                    }

	                    let polyline = new kakao.maps.Polyline({
	                        //path: arrays.map( arg=> arg.position), // 선을 구성하는 좌표배열 입니다
	                        path : detailRoads,
	                        strokeWeight: 4, // 선의 두께 입니다
	                        strokeColor: 'red', // 선의 색깔입니다
	                        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                        strokeStyle: 'solid' // 선의 스타일입니다
	                    });
	                    var bounds = new kakao.maps.LatLngBounds(); 
	                    bounds.extend(new kakao.maps.LatLng(bound.min_y, bound.min_x));
	                    // bounds.extend(new kakao.maps.LatLng(bound.min_y, bound.max_x));
	                    bounds.extend(new kakao.maps.LatLng(bound.max_y, bound.max_x));
	                    // bounds.extend(new kakao.maps.LatLng(bound.max_y, bound.min_x));

	                    // 지도에 선을 표시합니다 
	                    map.setBounds(bounds);
	                    map.setLevel(map.getLevel()+1);
	                    polyline.setMap(map);
	            }

	        }
	    })
	}
	
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	    markers.push(marker);
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	        console.log(marker.getPosition());
	        map.setLevel(1);
	        setCenter(marker.getPosition().Ma , marker.getPosition().La);
	        coordinate = marker.getPosition().La + "," + marker.getPosition().Ma;
	        document.getElementById('좌표').innerHTML="작은거 : "  + document.getElementById("origin").value + " 큰거 : " + document.getElementById("destination").value;
	    });
	}
	
   
</script>
<script>
	document.getElementById('back-btn').addEventListener("click",function(){
		location.href = "${contextPath}/carPool/drive";
	})
	
	document.getElementById('update-btn').addEventListener("click",function(){
		
		location.href = "${contextPath}/carPool/update?bNo=${carpool.board.boardNo}";
	})
	
</script>
</body>
</html>