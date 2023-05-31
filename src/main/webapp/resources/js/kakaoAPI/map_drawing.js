// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var coordinate;
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
var markers = [];
// 키워드로 장소를 검색합니다
document.getElementById('start-keyword').addEventListener('keyup',function(){
    ps.keywordSearch(this.value, placesSearchCB);
});

document.getElementById('arrival-keyword').addEventListener('keyup',function(){
    ps.keywordSearch(this.value, placesSearchCB);
});


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds(); 
        let min_y = 36.87226;
        let max_y = 38.300603;
        let min_x = 126.262021;
        let max_x = 127.830532;
        removeMarkers();
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            if(data[i].y>=min_y && data[i].y<=max_y && data[i].x>=min_x && data[i].x<=max_x){
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

function removeMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

function setCenter(La, Ma) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(La, Ma);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

// 지도에 마커를 표시하는 함수입니다
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
    });
}

function setOrigin(){
    document.getElementById("origin").value = coordinate;
}

function setDestination(){
    document.getElementById("destination").value = coordinate;
}










function drowPath(origin, destination){
    $.ajax({
        url : "https://apis-navi.kakaomobility.com/v1/directions?origin="+ origin + "&destination=" + destination + "&waypoints=&priority=RECOMMEND&car_fuel=GASOLINE&car_hipass=false&alternatives=false&road_details=false",
        method : "GET",
        headers: {Authorization : "KakaoAK a0a349702051ef8d9fc1b66062f09c70"},    
        success : function(arg){
            map = new kakao.maps.Map(mapContainer, mapOption);
            displayMarker(origin , destination);
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

let polyline = new kakao.maps.Polyline();


function removeLine() {
    document.getElementById('map').innerHTML='';
    map = new kakao.maps.Map(mapContainer, mapOption); 
}