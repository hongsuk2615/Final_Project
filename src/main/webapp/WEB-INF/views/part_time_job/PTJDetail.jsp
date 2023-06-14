<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detailForm</title>
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
        width: 100%;
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
        <div id="body" style="padding-top: 150px;">
		    <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            <div id="body-right">
                <div id="enroll-category">
                    <div style="width: 500px;">
                        <h1>${p.subCategory.categorySName } 게시글</h1>
                    </div>
                    <c:if test="${loginUser.userNo eq p.board.userNo or loginUser.authority eq 0}">
	                    <div id="enroll-update">	
	                        <button style="border: 0;" id="update-btn" >수정하기</button>
	                        <button style="border: 0;" id="delete-btn" bNo="${p.board.boardNo }" url="ptj/ptjList">삭제하기</button>
	                        <c:choose>
	                        	<c:when test="${p.isEnd eq 'N' }">
			                        <button style="border: 0;" id="work-end-btn" bNo="${p.boardNo }" url="ptj/ptjList">구인완료</button>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<button style="border: 0; display:none;" id="work-end-btn" bNo="${p.boardNo }" url="ptj/ptjList">구인완료</button>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
	                </c:if>
                </div>
                <hr>
                <div id="enroll">
                        <div id="enroll-header">
                            <div style="display: flex; flex-direction: column;">
                                <div>
                                    <img src="${contextPath }${webPath }${p.imgPath }" style="height: 200px; width: 240px; border-radius: 10px;"/>
                                </div>
                                <div>
                                    <h2>제목 : &nbsp;${p.board.title }</h2>
                                    <c:if test="${p.isEnd eq 'Y' }">
                                    	<p style="color: red;"><b>모집인원이 마감 되었습니다.</b></p>
                                    </c:if>
                                </div>
                            </div>
                            <br>
                            <div>
                                <h3 id="enroll-content">내용 :  </h3><p>${p.board.content }</p>
                            </div>
                        </div>
                        <hr>
                        <div id="enroll-body">
                        	<h3>작성자 아이디 : ${p.member.userId }</h3>
                            <hr>
                            <h3>알바 카테고리 : ${p.subCategory.categorySName }</h3>
                            <hr>
                            <div id="item-btns">
                                <div id="inquiry-btn" uNo="${p.board.userNo }" seller="${p.member.userId }">쪽지 보내기</div>
                                <div id="report-btn" bNo="${p.board.boardNo }">신고하기</div>
                                <div id="wish-btn" bNo="${p.board.boardNo }" >찜하기</div>
                            </div>
                            아직 못구했어요 ㅠㅠ<input type="radio" name="isEnd"checked disabled> 구했어요!<input type="radio" name="isEnd" disabled>
                            <hr>
                            <h3>급여 : </h3><p><b style="color: red; font-size: 30px;">${p.price }</b> 원</p>
                            <hr>
                            <h3>시간 : </h3>
                            시작 시간 : ${p.startTime } &nbsp;&nbsp;
                            마감 시간 : ${p.endTime }
                            <hr>
                            <h3>시 / 군 / 구 : ${p.location.locationName }</h3>
                            <hr>
                            <div id="enroll-map">
                                <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                <div id="map" style="width:100%; height:350px; border-radius: 5px;"></div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="back-btn" style="border: 0;">뒤로가기</button>
                        </div>
                </div>
            </div>
        </div>
        <div id="footer">
        
        </div>
        
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/common/commonModal.js"></script>
<script type="text/javascript" src="/thrifty/resources/js/ptj/ptj_work_end.js"></script>
<script>
	let a = "${p.locationCoordinate}".split(',');
	console.log(a[0]);
    let y = a[0];
    let x = a[1];

    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    mapDetail(y, x);

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

        kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        // let place = "교회";
        coordinate = marker.getPosition().La + "," + marker.getPosition().Ma;
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        console.log(marker.place_name);
        infowindow.open(map, marker);
        console.log(marker.getPosition());
        map.setLevel(1);
    });

        // setCenter(marker.getPosition().Ma , marker.getPosition().La);
        // document.getElementById('좌표').innerHTML="작은거 : "  + marker.getPosition().Ma+ " 큰거 : " + marker.getPosition().La;
        // document.getElementById('locationCoordinate').value = marker.getPosition().Ma + "," + marker.getPosition().La;

    }
</script>
<script>
	document.getElementById('back-btn').addEventListener("click",function(){
    	location.href = "${contextPath}/ptj/ptjList";
	})
	
	/* document.getElementById('delete-btn').addEventListener("click",function(){
    	location.href = "${contextPath}/ptj/ptjDelete";
	}) */
	
	document.getElementById('update-btn').addEventListener("click",function(){
    	location.href = "${contextPath}/ptj/ptjUpdate?bNo=${p.board.boardNo}";
	})
	
	/* document.getElementById('work-end-btn').addEventListener("click",function(){
    	location.href = "${contextPath}/ptj/workEnd?bNo=${p.board.boardNo}";
	})
	 */
</script>

</body>
</html>