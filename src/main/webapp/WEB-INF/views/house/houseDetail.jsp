<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <div id="sharetitle">
    <div id="sharetitle1"><h1>${b.title }</h1>
   	  <div id="inquiry-btn" uNo = "${b.userNo}" seller="${b.nickName}" onclick="sendMessage(this);">쪽지</div>
      <div id="report-btn" bno="${b.boardNo}" onclick="reportBoard(this);">신고</div></div>
    </div>
    <div class="img-bx">
		<c:forEach var="rimg" items="${h.roomList[0].imgList }">
      		<div>
          	  <img src="/thrifty/resources/upfiles/house/${rimg.changeName}" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
        	</div>
       	</c:forEach>
    </div>

    <div id="img-select">
       <c:forEach var="r" items="${h.roomList }">
       <div><button class="roomImgbtn" roomNo="${r.roomNo }" onclick="selectRoom(this);">${r.division }</button></div>
       </c:forEach>
    </div>

    <div id="nav">
        <div><a class='navbtn' href='#state'><p>방 정보</p></a></div>
        <div><a class='navbtn' href='#information'><p>지점 소개</p></a></div>
        <div><a class='navbtn' href='#location'><p>위치</p></a></div>
        <div><a class='navbtn' href='#procedure'><p>입주절차</p></a></div>
    </div>
    <div style="display:flex; align-items: baseline;">
    <h2 style="display:inline-block; margin:0;">입주현황</h2>
    <c:if test="${loginUser.userNo eq b.userNo and h.applyCount ne 0}">
    	<img style="width:30px; height:30px; margin-left: 10px; cursor:pointer;" src='/thrifty/resources/images/house/notice.png' onclick="checkApply()">
    </c:if>
    </div>
    <div id="state" class="Htable">
        <table >
            <tr>
             <c:choose>
                 <c:when test="${loginUser.userNo eq b.userNo}">
                      <th>모집인원</th>
                 </c:when>
                 <c:otherwise>
                      <th>입주신청</th>
                 </c:otherwise>
             </c:choose>
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
		                
		                <c:choose>
			                 <c:when test="${loginUser.userNo eq b.userNo}">
			                      <td id="" style="color:black; display:flex; justify-content: space-evenly; padding: 13px;">
			                      <div onclick='change(this)' roomNo='${r.roomNo}' symbol='minus' style="cursor:pointer;">-</div>
			                      <div id="recruitsNum${r.roomNo}">${r.recruitsNum}</div>
			                      <div onclick='change(this)' roomNo='${r.roomNo}' symbol='plus' style="cursor:pointer;">+</div>
			                      </td>
			                 </c:when>
			                 <c:otherwise>
			                       <c:choose>
		                                <c:when test="${r.recruitsNum ne 0}">
		                                    <td><button roomNo="${r.roomNo }" roomName="${r.division }" onclick="tour(this);">투어신청</button></td>
		                                </c:when>
		                                <c:otherwise>
		                                    <td><button class="compl" disabled>입주완료</button></td>
		                                </c:otherwise>
		                            </c:choose>
			                 </c:otherwise>
			             </c:choose>
		                
		                <td>${r.division }</td>
		                <td>${r.gender }</td>
		                <td>${r.type }</td>
		                <td>${r.area }㎡</td>
		                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${r.deposit }" />원</td>
		                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${r.rent }" />원</td>
		                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${r.cost }" />원</td>
		                <td>${r.contrat }</td>
		            </tr>
              </c:forEach>
        </table>
    </div>
    <div id="information">
        <h2>지점 소개</h2>
        <div><pre>${h.information }</pre></div>
    </div>
    <div id="location">
        <h2>위치</h2>
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
    <h2>입주절차</h2>
    <div id="procedure">
        <div id="procedure1">
            <div class="circle" id="circle1">
               <div >
                <img src="/thrifty/resources/images/house/clickImg.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
                <h3>01</h3>
                <p>입주 신청</p>
               </div>
            </div>
            <img class="arrowimg" id="arrow1" src="/thrifty/resources/images/house/right-arrow.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
            <div class="circle" id="circle2">
                <div>
                 <img src="/thrifty/resources/images/house/searchHouseImg.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
                 <h3>02</h3>
                 <p>지점투어</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow2" src="/thrifty/resources/images/house/right-arrow.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" > 
             <div class="circle" id="circle3">
                <div>
                 <img src="/thrifty/resources/images/house/applyImg.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
                 <h3>03</h3>
                 <p>계약서 작성</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow3" src="/thrifty/resources/images/house/right-arrow.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
             <div class="circle" id="circle4">
                <div>
                 <img src="/thrifty/resources/images/house/moveImg.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
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
    	<c:if test="${loginUser.userNo eq b.userNo or loginUser.authority eq 0}">
    	<div onclick="deleteBoard(this);" bNo="${b.boardNo}" url="sharehouse" style="cursor:pointer;"><p>삭제하기</p></div>
    	<div onclick="location.href='/thrifty/sharehouse/updateHouse?bNo=${b.boardNo}'" style="cursor:pointer;"><p>수정하기</p></div>
    	</c:if>
        <div onclick="location.href='/thrifty/sharehouse/'" style="cursor:pointer;"><p>전체지점보기</p></div>
    </div>
    </div>

     <jsp:include page="../common/footer.jsp"></jsp:include> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
    <script>
    $(document).ready(function(){
    		let rooms = '${h.roomList}'
            $('.img-bx').slick({
                dots: true,
                dotsClass: 'dots_custom',
                prevArrow : "<button type='button' class='slick-prev'><img src='left-arrow.png'></button>",
				nextArrow : "<button type='button' class='slick-next'><img src='right-arrow.png'></button>"
                
            });
            $('.roomImgbtn').eq(0).addClass('btnClick');
        });
    
        
        function selectRoom(e){
    		let roomNo = $(e).attr('roomNo');
    		$('.roomImgbtn').removeClass('btnClick');
    		$(e).addClass('btnClick');
	        $.ajax({
				url : "/thrifty/sharehouse/selectRoomImg?roomNo="+roomNo,
				dataType : 'json',
				success : function(result){
					console.log(result);
					let imgList = "";
					result.forEach(function(ri){
						imgList += `
							<div>
				            <img src="/thrifty/resources/upfiles/house/\${ri.changeName}" onerror="this.src='/thrifty/resources/images/common/noImage.png'" >
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
        	let hName =$('#sharetitle h1').text();
        	let rName = $(e).attr('roomName');
        	let roomNo = $(e).attr('roomNo');
        	let gender = '${loginUser.gender}' == 'F' ? "여자" : "남자";
        	appform(hName, rName, roomNo, gender);
        }
        
        $(".navbtn").click(function(event){
        	x = $(this).attr("href");
        	var offset = $(x).offset(); 
        	$("html, body").animate({ scrollTop: offset.top -200 }, 400);
        });
        
        
        function change(e){
        	symbol = $(e).attr('symbol');
        	roomNo =  $(e).attr('roomNo');
        	recruitsNum = $('#recruitsNum'+roomNo);
        	$.ajax({
        		url: '/thrifty/sharehouse/changeRecruitment',
        		data : {roomNo, symbol },
        	 	beforeSend : function(){
        			if(recruitsNum.text() == 0 && symbol == 'minus'){
        				alert('모집인원은 음수가 될 수 없습니다.');
        				return false;
        			}
        		},
        		success : function(result){
        			if(symbol == 'plus'){
        				recruitsNum.html(recruitsNum.html()*1+1);	
        			}else{
        				recruitsNum.html(recruitsNum.html()*1-1);	
        			}
        		}
        	})
        }
        
        function deleteBoard(element){
            
            Swal.fire({
                    title: '정말삭제하시겠습니까?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '네, 삭제할게요!',
                    cancelButtonText: '아니오!',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            let bNo = $(element).attr("bNo");
                            let url = $(element).attr("url");
                            $.ajax({
                                url : "/thrifty/board/delete",
                                data : {bNo},
                                success : function(result){
                                    console.log(result);
                                    if(result == 1){
                                        Swal.fire({
                                            position: 'top-center',
                                            icon: 'success',
                                            title: '삭제완료',
                                            showConfirmButton: false,
                                            timer: 1000
                                        }).then(()=>{
                                            location.href="/thrifty/"+url; 
                                        })
                                    }else if(result == -1){
                                        Swal.fire({
                                            position: 'top-center',
                                            icon: 'warning',
                                            title: '비로그인 상태입니다.',
                                            showConfirmButton: false,
                                            timer: 1000
                                        }).then(()=>{
                                                login();
                                        })
                                    }else if(result == 0){
                                        Swal.fire({
                                                position: 'top-center',
                                                icon: 'error',
                                                title: '삭제실패',
                                                text : '관리자/작성자가 아닙니다.',
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                    }
                                },
                                error : function(){
                                    Swal.fire({
                                                position: 'top-center',
                                                icon: 'error',
                                                title: '삭제실패',
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                }

                            })
                        }
                    })
                 }
        
         function checkApply(){ // 모달창 여는거 따로 수락/거절했을 때 db접근 status n으로 변경
        	
        	document.getElementById('modal-applicationForm2').style.display = 'flex';
        	$.ajax({
        		url : '/thrifty/sharehouse/checkApply',
        		data : { bNo : '${b.boardNo}' },
        		dataType : 'json',
        		success : function(result){
        			let re = "";
        			for(let i = 0; i < result[0].length; i++){
        				tou = result[0][i];
        				mem = result[1][i];
        			
        				re += "<div class='applyDiv'  uNo='"+tou.userNo+"' rNo='"+tou.roomNo+"' onclick='openApplyForm(this);'><div class='titleDiv'>"+tou.title +" / "+ tou.roomName +" / "+ mem.userName+"</div></div>"; 
        			}
        			$("#checkApply").html(re);
        		}
        		
        	}) 
        } 
         
         function openApplyForm(el){ // 모달창 여는거 따로 수락/거절했을 때 db접근 status n으로 변경
        	 let uNo = $(el).attr('uNo');
        	 let rNo = $(el).attr('rNo');
         	$.ajax({
         		url : '/thrifty/sharehouse/selectApply',
         		data :  { rNo, uNo },
         		dataType : 'json',
         		success : function(result){
         			let re = "";
         				tou = result[0];
         				mem = result[1];
         				mem.gender = mem.gender == 'F' ? "여자" : "남자";
         				re += " <div id='applyCheckDiv'><label for='name'>· 이름 : "+ mem.userName +"</label><br><br>"+
                        "<label for='age' >· 성별 : "+ mem.gender +"</label><br><br>"+
                        "<label for='phone' >· 연락처 : "+ mem.phone +"</label><br><br>"+
                        "<label for='email' >· 이메일 : "+ mem.email +"</label><br><br>"+
                        "· <span id='hName'>"+ tou.title +" </span> / <span id='rName'>"+ tou.roomName +"</span><br><br>"+
                        "<label for='moveIn'>· 희망입주일 : "+ tou.moveIn +"</label><br><br>"+
                        "<label for='enquiry'>· 문의사항</label><br>"+
                        "<pre>"+tou.enquiry+"</pre><br><br><br><br>"+
                        "<button id='accept' uNo='"+tou.userNo+"' rNo='"+tou.roomNo+"' onclick='checkStatus(this)'>수락</button> "+ 
                        "<button id='decline' uNo='"+tou.userNo+"' rNo='"+tou.roomNo+"' onclick='checkStatus(this)'>거절</button></div>"; 
         			
         			$("#checkApply").html(re);
         		}
         		
         	}) 
         } 
         
         function checkStatus(el){
        	 let uNo = $(el).attr('uNo');
        	 let rNo = $(el).attr('rNo');
        	 $.ajax({
          		url : '/thrifty/sharehouse/checkStatus',
          		data : { rNo, uNo },
          		success : function(result){
          			checkApply();
          		}
          		
          	}) 
         }
      </script>
      <jsp:include page="houseModal.jsp"></jsp:include>
<script src="/thrifty/resources/js/house/houseModal.js"></script>
<script src="/thrifty/resources/js/common/commonModal.js"></script>
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