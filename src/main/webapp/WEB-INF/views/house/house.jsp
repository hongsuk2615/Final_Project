<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다른 이미지로 마커 생성하기</title>
    
    <style>
.wrap {
    display: flex;
}

#map{
    width:70%;
    height:350px;
}

#left{
    margin-left: 20px;
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

#housewrap{
    display: flex;
    width: 95%;
    height: 750px;
    flex-wrap: wrap;
    overflow:scroll;
    overflow-x: hidden
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

#map {
    height: 700px;
    overflow: hidden;
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

    </style>
</head>
<body>
    <div>header</div>
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
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>  
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            <div class="house">
                <div><img src="e.jpg"></div>
                <h3>쉐어하우스 제목</h3>
                <p>쉐어하우스 가격</p>
                <p>쉐어하우스 입주가능날짜</p>
            </div>   
            

        </div>


        
    </div>
<div id="map"></div>
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

</script>
</body>
</html>