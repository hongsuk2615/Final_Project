<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="b" value="${house[0] }" />
<c:set var="h" value="${house.get(1) }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쉐어하우스 상세조회</title>
    <link rel="stylesheet" href="/thrifty/resources/css/house/houseModal.css">
    <link rel="stylesheet" href="/thrifty/resources/css/house/houseDetail.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>
<body>
  <jsp:include page="../common/header.jsp"></jsp:include> 
    <div class="wrap">
    <div id="sharetitle"><h1>${b.title }</h1></div>
    <div class="img-bx">
		<c:forEach var="rimg" items="${h.roomList[0].imgList }">
      		<div>
          	  <img src="/thrifty/resources/images/house/${rimg.changeName}">
        	</div>
       	</c:forEach>
    </div>

    <div id="img-select">
       <c:forEach var="r" items="${h.roomList }">
       <div><button roomNo="${r.roomNo }" onclick="selectRoom(this);">${r.division }</button></div>
       </c:forEach>
    </div>

    <div id="nav">
        <div><p>방 정보</p></div>
        <div><p>지점 소개</p></div>
        <div><p>위치</p></div>
        <div><p>입주절차</p></div>
    </div>
    <h3>입주현황</h3>
    <div id="state" class="Htable">
        <table >
            <tr>
                <th>입주신청</th>
                <th>구분</th>
                <th>성별</th>
                <th>타입</th>
                <th>면적</th>
                <th>보증금</th>
                <th>월임대료</th>
                <th>관리비</th>
                <th>계약종료일</th>
            </tr>
            
             <c:forEach var="r" items="${h.roomList }">
		            <tr>
		                <td>
                            <c:choose>
                                <c:when test="${r.recruitsNum ne 0}">
                                    <button roomNo="${r.roomNo }" roomName="${r.division }" onclick="tour(this);">투어신청</button>
                                </c:when>
                                <c:otherwise>
                                    <button disabled>입주완료</button>
                                </c:otherwise>
                            </c:choose>
		                </td>
		                <td>${r.division }</td>
		                <td>${r.gender }</td>
		                <td>${r.type }</td>
		                <td>${r.area }</td>
		                <td>${r.deposit }</td>
		                <td>${r.rent }</td>
		                <td>${r.cost }</td>
		                <td>${r.contrat }</td>
		            </tr>
              </c:forEach>
        </table>
    </div>
    <div id="information">
        <h3>지점 소개</h3>
        <div>${h.information }</div>
    </div>
    <div id="location">
        <h3>위치</h3>
        <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      
    </ul>
</div>
    </div>
    <h3>입주절차</h3>
    <div id="procedure">
        <div id="procedure1">
            <div class="circle" id="circle1">
               <div >
                <img src="/thrifty/resources/images/house/clickImg.png">
                <h3>01</h3>
                <p>입주 신청</p>
               </div>
            </div>
            <img class="arrowimg" id="arrow1" src="/thrifty/resources/images/house/right-arrow.png">
            <div class="circle" id="circle2">
                <div>
                 <img src="/thrifty/resources/images/house/searchHouseImg.png">
                 <h3>02</h3>
                 <p>지점투어</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow2" src="/thrifty/resources/images/house/right-arrow.png">
             <div class="circle" id="circle3">
                <div>
                 <img src="/thrifty/resources/images/house/applyImg.png">
                 <h3>03</h3>
                 <p>계약서 작성</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow3" src="/thrifty/resources/images/house/right-arrow.png">
             <div class="circle" id="circle4">
                <div>
                 <img src="/thrifty/resources/images/house/moveImg.png">
                 <h3>04</h3>
                 <p>입주 완료</p>
                </div>
             </div>
        </div>
        <div id="procedure2">
            <div>
                <span>· 투어신청은 현재 공실이거나 계약종료 한달 전인 방의 신청만 받습니다.</span><br>
                <span>· 계약시 중개수수료는 일체 받지 않습니다.</span><br>
                <span>· 계약금으로 보증금을 수령하며, 계약종료 후 퇴실시 반환됩니다.</span>
            </div>
            <div>
                <span>· 월 임대료 및 추가비용은 입주 2일 전까지 납부하셔야 합니다.</span><br>
                <span>· 보증금 납부 후 입주를 취소하실 경우, 보증금의 50%만 반환됩니다.</span><br>
                <span>· 계약기간 만료 이전에 중도퇴실할 경우, 절차에 따라 위약금이 발생됩니다.</span>
            </div>
        </div>

    </div>
    <div id="back">
    	<c:if test="${loginUser.userNo eq b.userNo }">
    	<div onclick="location.href='/thrifty/sharehouse/updateHouse?boardNo=${b.boardNo}'" style="cursor:pointer;"><p>수정하기</p></div>
    	</c:if>
        <div onclick="location.href='/thrifty/sharehouse/';" style="cursor:pointer;"><p>전체지점보기</p></div>
    </div>
    </div>

    <div>footer</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
    <script>
    $(document).ready(function(){
            $('.img-bx').slick({
                dots: true,
                dotsClass: 'dots_custom',
                prevArrow : "<button type='button' class='slick-prev'><img src='left-arrow.png'></button>",
				nextArrow : "<button type='button' class='slick-next'><img src='right-arrow.png'></button>"
                
            });
        });
    
        
        function selectRoom(e){
    		let roomNo = $(e).attr('roomNo');
	        $.ajax({
				url : "/thrifty/sharehouse/selectRoomImg?roomNo="+roomNo,
				dataType : 'json',
				success : function(result){
					console.log(result);
					let imgList = "";
					result.forEach(function(ri){
						imgList += `
							<div>
				            <img src="/thrifty/resources/images/house/\${ri.changeName}">
				        	</div>
				        `;
					})
					$('.img-bx').slick('slickRemove', null, null, true);
					$('.img-bx').html(imgList);
					$('.img-bx').slick('refresh');
				}
			}) 
        }
        
        function tour(e){
        	let hName =$('#sharetitle').text();
        	let rName = $(e).attr('roomName');
        	let roomNo = $(e).attr('roomNo');
        	appform(hName, rName, roomNo);
        }
      </script>
      <jsp:include page="houseModal.jsp"></jsp:include>
<script src="/thrifty/resources/js/house/houseModal.js"></script>

<script>
//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${h.houseLatitude}, ${h.houseLongitude}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
//지도를 생성합니다   
var map = new kakao.maps.Map(mapContainer, mapOption); 

var imageSrc = '/thrifty/resources/images/house/home.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(${h.houseLatitude}, ${h.houseLongitude}); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
 


// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>
</body>


</html>