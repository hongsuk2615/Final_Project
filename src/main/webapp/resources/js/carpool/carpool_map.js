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