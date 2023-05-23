<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쉐어하우스</title>
    
    <style>
.wrap {
    display: flex;
    
}

#map{
    width:70%;
    height:350px;
}

#left{
    width: 50%;
}

#housewrap{
    display: flex;
    width: 95%;
    border: 1px solid black;
    flex-wrap: wrap;
}

.house {
    width: 30%;
    border: 1px solid red;
}

.house p {
    margin: 8px 0px;
}

    </style>
</head>
<body>
    <div>header</div>
    <div class="wrap">


   
    <div id="left">
        <div><input type="search" name="hSearch"><button>검색</button></div>
        <div id="housewrap">
            <div class="house">
                <p>쉐어하우스 대표사진</p>
                <p>쉐어하우스 제목</p>
                <p>쉐어하우스 종류</p>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>
            <div class="house">
                <p>쉐어하우스 대표사진</p>
                <p>쉐어하우스 제목</p>
                <p>쉐어하우스 종류</p>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>
            <div class="house">
                <p>쉐어하우스 대표사진</p>
                <p>쉐어하우스 제목</p>
                <p>쉐어하우스 종류</p>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>
            <div class="house">
                <p>쉐어하우스 대표사진</p>
                <p>쉐어하우스 제목</p>
                <p>쉐어하우스 종류</p>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>
            

        </div>


        
    </div>
<div id="map"></div>
</div>

<div>
    footer
</div>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7affe0955f76b728f0cbe6173319ad3"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map); 

kakao.maps.event.addListener(map, 'dragend', function() {        
    
    // 지도 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    
    var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('result');  
    resultDiv.innerHTML = message;
    
});
</script>
</body>
</html>