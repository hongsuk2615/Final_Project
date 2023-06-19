<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다른 이미지로 마커 생성하기</title>
    <link rel="stylesheet" href="/thrifty/resources/css/house/house.css">
</head>
<body>
   	<jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrap">
 	

   
    <div id="left">
        <div id="left-top">
            <div id="searchDiv">
                <input type="search" id="hSearch" name="hSearch">
                
            </div>
            <div>
                <button id="searchbtn" onclick="searchHouse();">
                    <img src="/thrifty/resources/images/house/search.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'">
                </button>
            </div>
        </div>
        <div class="scrollbar" id="housewrap">
        </div>
        
    </div>
<div id="map"></div>

<div id="enrolldiv">
		<button><a onclick="${loginUser eq null ? 'login();':"location.href='/thrifty/sharehouse/enrollForm'"}">쉐어하우스 등록하기</a></button>
</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
	<script>
	
	function selectHouseAjax(result){
		house = "";
		
		  result.forEach(function(h){
			   minAmount = h.minAmount.toLocaleString();
		  		house += `
		  			<div class="house" >
	                <div ><img class="houseImg" src="/thrifty/\${h.thumbnail}" boardNo="\${h.boardNo}" onclick="selectHouse(this);" onerror="this.src='/thrifty/resources/images/common/noImage.png'"></div>
	                <h3>\${h.board.title }</h3>
	                <div>
	                 <span>월 \${minAmount}원 ~</span>`;
	                 if(h.wish == 0){
	                	 house += `	<span>
	                	 <img class="scrapImg" src="/thrifty/resources/images/house/heart.png"  onerror="this.src='/thrifty/resources/images/common/noImage.png'" 
	                	 boardNo="\${h.boardNo}" onclick="scrapHouse(this);" scrap="x">
	                	 </span> </div></div>`;
	                 }else{
	                	 house += `	<span>
		                	 <img class="scrapImg" src="/thrifty/resources/images/house/heart2.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" 
		                	 boardNo="\${h.boardNo}" onclick="scrapHouse(this);" scrap="o">
		                	 </span> </div></div>`;
	                 }
		 	})
		 	
		 	$('#housewrap').html(house);
	}
	
	function makeMarker(result){
		var positions = [];
		 result.forEach(function(h){
			 positions.push({
				  	boardNo : h.boardNo, 
					title : h.board.title,
					latlng : new kakao.maps.LatLng(h.houseLatitude, h.houseLongitude)
				}) 
		 })
		
		var imageSrc = "/thrifty/resources/images/house/home.png";
		
		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(60, 60);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				image : markerImage
			// 마커 이미지 
				});
			marker.id = positions[i].boardNo;
			marker.title = positions[i].title;
		 kakao.maps.event.addListener(marker, 'click', function() {
			 console.log('dd');
			 console.log(this);
			 /* var position = this.getPosition();
			    console.log(position); */
			location.href="/thrifty/sharehouse/detail?bNo="+this.id;
		}); 
		 
		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		 var infowindow;
		 // 마커에 마우스오버 이벤트를 등록합니다

		 kakao.maps.event.addListener(marker, 'mouseover', function() {
			 infowindow = new kakao.maps.InfoWindow({
			        content: '<div class="markerInfo"><span>' + this.title + '</span><div>'
			 })
		   // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		     infowindow.open(map, this);
			 var markerInfo = document.querySelectorAll('.markerInfo');
				markerInfo.forEach(function(e) {
				    var w = e.offsetWidth + 10;
				    var ml = w/2;
				    e.parentElement.style.top = "100px";
				    e.parentElement.style.left = "50%";
				    e.parentElement.style.marginLeft = -ml+"px";
				    e.parentElement.style.width = w+"px";
				    e.parentElement.previousSibling.style.display = "none";
				    e.parentElement.parentElement.style.border = "0px";
				    e.parentElement.parentElement.style.background = "unset";
				});
			 
		 });

		 // 마커에 마우스아웃 이벤트를 등록합니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		     // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		     infowindow.close();
		 });
		}
		
		
		
	
	}
	
	function shareHouse(){ //ALL
		$.ajax({
			url : '${contextPath}/sharehouse',
			method : 'POST',
			dataType : 'json',
			success: function(result){ 
				selectHouseAjax(result);
				makeMarker(result);
				
				
			}
		}) 
		
	}
	
	function selectLocation(){
		$.ajax({
			url : '${contextPath}/sharehouse/selectLocation',
			data : {
				swLat, swLng, neLat, neLng
			},
			dataType : 'json',
			success: function(result){ 
				selectHouseAjax(result);
			}
			}) 
		}
	
	function selectHouse(e){
		let boardNo = $(e).attr('boardNo');
		location.href="/thrifty/sharehouse/detail?bNo="+boardNo;
	}
	
	function scrapHouse(e){
		let bNo = $(e).attr('boardNo');
		if($(e).attr('scrap') == 'o'){
			$.ajax({
				url : '${contextPath}/sharehouse/scrapCancel',
				data : {
					bNo
				},
				dataType : 'json',
				error : function(){
					Swal.fire({
	                    position: 'top-center',
	                    icon: 'error',
	                    title: '비로그인 상태입니다.',
	                    showConfirmButton: false,
	                    timer: 1000
	                }).then(()=>{
	                	login();
	                })
				},
				success: function(result){ 
					console.log(result);
					$(e).attr('src', '/thrifty/resources/images/house/heart.png');
					$(e).attr('scrap', 'x');
				}
			}) 
		}else{
			
			$.ajax({
				url : '${contextPath}/sharehouse/scrapHouse',
				data : {
					bNo
				},
				dataType : 'json',
				error : function(){
					Swal.fire({
	                    position: 'top-center',
	                    icon: 'error',
	                    title: '비로그인 상태입니다.',
	                    showConfirmButton: false,
	                    timer: 1000
	                }).then(()=>{
	                	login();
	                })
				},
				success: function(result){ 
					console.log(result);
					$(e).attr('src', '/thrifty/resources/images/house/heart2.png');
					$(e).attr('scrap', 'o');
				}
			}) 
		}
	}
	
	function searchHouse(){
		let keyword = $('#hSearch').val();
		$.ajax({
			url : '${contextPath}/sharehouse/searchHouse',
			data : {
				keyword
			},
			dataType : 'json',
			success: function(result){ 
				selectHouseAjax(result);
			}
		}) 
	}
	
	</script>	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.513294, 126.934086), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
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
			
			shareHouse();
			
	</script>
	
	
</body>
</html>