<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다른 이미지로 마커 생성하기</title>
    
    <style>
.wrap {
    display: flex;
    padding-top: 17vh;
}

#map{
    width: 127vh;
    height: 82vh;
     padding-top : 9px;
}

#left{
    margin-left: 20px;
    padding-top : 30px;
    width: 50%;
}

.scrollbar::-webkit-scrollbar {
    width: 10px;  
}

.scrollbar::-webkit-scrollbar-thumb {
    background: rgb(149, 156, 159); /* 스크롤바 색상 */
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
}

.scrollbar::-webkit-scrollbar-track {
    background: rgb(224, 224, 224);  /*스크롤바 뒷 배경 색상*/
    border-radius: 10px;
}

body{
	padding: 0;
	margin: 0;
	overflow: hidden;
}

#housewrap{
    display: flex;
    width: 98%;
    height: 70vh;
    flex-wrap: wrap;
    overflow:scroll;
    overflow-x: hidden;
}

.house {
    width: 32%;
    /* border: 1px solid red; */
    cursor: pointer;
    margin-right: 7px;
}

.house img {
    width: 100%;
}

.house:hover img{
    transform:scale(1.1);
    transition: 0.5s ease-out;
}

.house:not(:hover) img{
    transition: 0.5s ease-out;
}


.house p {
    margin: 8px 0px;
    overflow: hidden;
}
.house> * {
    overflow-y: hidden;
}

#hSearch {
    width: 100%;
    font-size: 40px;
    border: 0px;
}

#hSearch:focus {
    outline: none;
}

#searchDiv{
    border: 1px solid #ddd;
    border-radius: 5px;
    overflow: hidden;
    width: 90%;
    display: flex;
    justify-content: space-between;
}

#searchbtn{
    border: 0px;
    background: none;
    background-image: "h1.jpg";
    width: 10%;
}

#searchbtn img{
   width: 100%;
}

#filterbtn{
    width: 70%;
}

#left-top{
    width: 100%;
    display:flex;
    margin-bottom: 10px;
}

#left-top div:nth-child(2){
   width: 10%;
}

.house div:nth-child(1){
    width: 100%;
    height: 10vw;
    border-radius: 4px;
    overflow: hidden;
}

input::-webkit-search-decoration,
input::-webkit-search-cancel-button,
input::-webkit-search-results-button,
input::-webkit-search-results-decoration{
    display:none;
}

#enrolldiv{
	position: fixed;
	right: 30px;
	bottom : 30px;
	z-index: 10;
}

#enrolldiv button{
	cursor: pointer;
	border-radius: 2.25em;
	font-size: 18px;
	background: white;
	border: 2px solid blue;
	height: 50px;
	width: 230px;
	color: blue;
	font-weight: bold;
	box-shadow: 0px 1px 5px 0px gray;
}

#enrolldiv button:hover{
	background: blue;
	color: white;
}

#enrolldiv a{
	color: inherit;
  text-decoration: none;
}

    </style>
</head>
<body>
   	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrap">
 	

   
    <div id="left">
        <div id="left-top">
            <div id="searchDiv">
                <input type="search" id="hSearch" name="hSearch">
                <button id="searchbtn">
                    <img src="g1.jpg">
                </button>
            </div>
            <div>
                <img id="filterbtn" src="f1.jpg">
            </div>
        </div>
        <div class="scrollbar" id="housewrap">

            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>${board.title }</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>  
           

        </div>


        
    </div>
<div id="map"></div>

<div id="enrolldiv">
		<button><a href="/thrifty/sharehouse/enrollForm">쉐어하우스 등록하기</a></button>
</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5381ed5b2d19ab0d65e938e3cce6e687"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.413294, 126.734086), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ {
			title : '카카오',
			latlng : new kakao.maps.LatLng(33.450705, 126.570677)
		}, {
			title : '생태연못',
			latlng : new kakao.maps.LatLng(33.450936, 126.569477)
		}, {
			title : '텃밭',
			latlng : new kakao.maps.LatLng(33.450879, 126.569940)
		}, {
			title : '근린공원',
			latlng : new kakao.maps.LatLng(33.451393, 126.570738)
		} ];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				image : markerImage
			// 마커 이미지 
			});
		}
			// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			 kakao.maps.event.addListener(map, 'dragend', function() {        
				 
				// 지도의 현재 영역을 얻어옵니다 
				    var bounds = map.getBounds();
				    
				   // 영역의 남서쪽 좌표를 얻어옵니다 
				    var swLatLng = bounds.getSouthWest(); 
				    
				    // 영역의 북동쪽 좌표를 얻어옵니다 
				    var neLatLng = bounds.getNorthEast(); 
				    
				   //남서위도
				   swLat = swLatLng.getLat();
				   
				   //남서경도
				   swLng = swLatLng.getLng();
				   
				   //북동위도
				   neLat = neLatLng.getLat();
				   
				   //북동경도
				   neLng = neLatLng.getLng();
					
   				   selectLocation();
			 });
			

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

			// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'zoom_changed', function() {        
			    
				// 지도의 현재 영역을 얻어옵니다 
			    var bounds = map.getBounds();
			    
			   // 영역의 남서쪽 좌표를 얻어옵니다 
			    var swLatLng = bounds.getSouthWest(); 
			    
			    // 영역의 북동쪽 좌표를 얻어옵니다 
			    var neLatLng = bounds.getNorthEast(); 
			    
			   //남서위도
			   swLat = swLatLng.getLat();
			   
			   //남서경도
			   swLng = swLatLng.getLng();
			   
			   //북동위도
			   neLat = neLatLng.getLat();
			   
			   //북동경도
			   neLng = neLatLng.getLng();
				
				   selectLocation();						    
			});
		
	</script>
	
	<script>
	function selectLocation(){
		$.ajax({
			url : '${contextPath}/sharehouse/selectLocation',
			data : {
				swLat, swLng, neLat, neLng
			},
			dataType : 'json',
			success: function(result){ 
				let house = "";
				
			  result.forEach(function(shareHouse){
			  		house += `
			  		<div class="house" boardNo="\${shareHouse.boardNo}" onclick="selectHouse(this);">
	                <div><img src="/thrifty/\${shareHouse.thumbnail}"></div>
	                <h3>\${shareHouse.board.title}</h3>
	                <p>쉐어하우스 가격</p>
	                <p>쉐어하우스 입주가능날짜</p>
	            	</div>`	
			 	}) 
             	
			  		$('#housewrap').html(house);
			}
			}) 
		}
	
	function selectHouse(e){
		let boardNo = $(e).attr('boardNo');
		location.href="/thrifty/sharehouse/detail?boardNo="+boardNo;
	}
	</script>
</body>
</html>