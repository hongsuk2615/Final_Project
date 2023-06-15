<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="/thrifty/resources/css/house/houseEnroll.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    
</head>
<body>
     <jsp:include page="../common/header.jsp"></jsp:include> 
    <div class="wrap">
        <div id="homecontent">
    <div id="sharetitle">
        <h1>임대관리 폼</h1>
    </div>
    <div id="ask">
        <div>
        <form method="post" action="/thrifty/sharehouse/enroll" enctype="multipart/form-data">

            <input type="text" placeholder=" *이름" name="userName" id="userName" required value="${loginUser.userName }" disabled> <br>
            <input  type="tel" placeholder=" *연락처" name="phone" id="phone" required value="${loginUser.phone }" disabled> <br>
             <input type="text" placeholder=" *집 이름" name="title" required  maxlength='15'> <br>
            <button type="button" onclick="addRoom()">방 추가하기</button>
            <span style="font-size: 12px;">* 첫번째 사진이 대표사진으로 설정됩니다.</span> <br>
            <div id="roomAdd">
            </div>
            <br>
            <div>
                <table id="tableA">
					<tr>                    
                        <th>모집인원</th>
                        <th>구분</th>
                        <th>성별</th>
                        <th>타입</th>
                        <th>면적</th>
                        <th>보증금</th>
                        <th>월임대료</th>
                        <th>관리비</th>
                        <th>계약종료일</th>
                    </tr>
                </table>
            </div>
            <br>
            <div style="position:relative;">
            <input type="text"  placeholder="위치" name="houseAddress" id="houseAddress" onchange="getLocation()" required readonly>
            <input type="hidden" name="houseLongitude" id="houseLongitude">
            <input type="hidden" name="houseLatitude" id="houseLatitude">
            <div style="position:absolute; right: 40px; top: 8px;">
            <button type="button" id="Addressbtn" onclick="insertDaumPostcodeBtn();" >주소검색</button>
            </div>
            </div>
           

            <textarea type="text" placeholder="지점소개" name="information" id="information" required></textarea> <br>
  
                <input type="checkbox" name="injung" id="injung" >
            <label for="injung">개인정보수집에 동의합니다.</label> <br><br>

                <button id="apply" disabled >신청하기</button><br>
        </form>
    </div>
    </div>
    </div>
</div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
    <script>

        let count = -1;
        const dataTransfer = new DataTransfer();
        let fileArr = new Array();
        function addRoom(){ // 방 추가
          	$('#apply').attr("disabled", true);
            count++;
            
            let a = `
            <div id="roomImgsection\${count}" > 
            <input type="text" maxlength='8' placeholder="방 이름" name="division" id="division\${count}" onchange="roomName(this.id)" required> 
            <input type="file" style="border: none;" onchange="makeSlick(\${count})" name="roomImg\${count}" multiple accept="image/gif, image/jpeg, image/png" required>
            <button type="button" id="closebtn\${count}"count='\${count}'>X</button>
            </div>
            
            <div class="rImg\${count} slickRoomImgDiv" id="rImg\${count}">
            
        	</div>
            `
           $('#roomAdd').append(a);

           let b =`
           <tr id="tb\${count}">
                <td>
                    <input type="number" name="recruitsNum" required>
                </td>
                <td onclick="nameAlert(this)">
                    <input type="text" name="division\${count}" required>
                </td>
                <td>
                    <input type="text" name="gender" required>
                </td>
                <td>
                    <input type="text" name="type" required>
                </td>
                <td>
                    <input type="number" name="area" required> 
                </td>
                <td>
                    <input type="number" name="deposit" required>
                </td>
                <td>
                    <input type="number" name="rent" required>
                </td>
                <td>
                    <input type="number" name="cost" required>
                </td>
                <td>
                    <input type="date" name="contrat" required>
                </td>
            </tr>
           `

           $('#tableA').append(b);

           document.getElementById("closebtn"+count).addEventListener('click', function(){
                let c = $(this).attr('count')
               if($('#rImg'+c).find('img').length != 0) {
		        		$('.rImg'+c).slick('slickRemove', null, null, true);
		        		$('.rImg'+c).slick('unslick');
		        		$('#rImg'+c).remove();
		        	}
                if($('input[name=contrat]').length == 1){
                	alert("하나의 방은 존재해야합니다.")
                }else{
                $('#roomImgsection'+c).remove();
                $('#rImg'+c).remove();
                $("#tb"+c).remove();
                }
            });
            inputCheck();
        }addRoom();
        
        
        function makeSlick(item){
        	if($('#rImg'+item).find('img').length != 0) {
        		$('.rImg'+item).slick('slickRemove', null, null, true);
        	}
        	let el = $('input[name=roomImg'+item+']').get(0);
        	filelength = el.files.length;
        	if(filelength > 9){
        		alert("사진첨부는 8개까지 가능합니다.");
        		el.value = "";
        		return 0;
        	}
        	let files = el.files;
        	$('.rImg'+item).html('');
	        	for(let j = 0; j < filelength; j++){
		        	let file = el.files[j];
		       		 //formData.append("upfile"+ item + j , file);
		        	 let reader = new FileReader();
			        	reader.readAsDataURL(file);
			        	reader.onload = function(e){
			        		let url = e.target.result;
			        		$('.rImg'+item).slick('slickAdd',`<div ><img onclick='alert(this.id);' id='newImg\${item}' src='\${url}'></div>`);
			        		$('.rImg'+item).slick('refresh');
			        		}
	        	}
	        	
	          	$('.rImg'+item).slick({
	                dots: false,
	                slidesToShow: 5,
	                infinite : true,
	                autoplay : false,
	                prevArrow : "<button type='button' class='slick-prev slickBtn'><img src='/thrifty/resources/images/house/left-arrow.png'></button>",
					nextArrow : "<button type='button' class='slick-next slickBtn'><img src='/thrifty/resources/images/house/right-arrow.png'></button>"
	                
	            });
	          	
        }
        
        function roomName(id){
        	$('input[name='+id+']').val($('#'+id).val());
        }
        
        function nameAlert(e){
        	if($(e).children(0).val() == ''){
        		alert("상단의 방 이름을 입력해주세요 ~")
        	}else{
        		alert("상단의 방 이름을 수정해주세요 ~")
        	}
        }
        
        function inputCheck(){
        	
        	document.getElementById('information').addEventListener('change',function(){
        		 let flag = 1;
	            	$("input").each(function(index1,item1){
	            		flag *= (item1.value ==''? 0 :1);
	            		flag *= ($('#information').val() == ''? 0 :1);
	            	});
	            	
	            	if(flag==1 && $('#injung').is(':checked') && $('#information').val() != ''){
	            		$('#apply').removeAttr("disabled");
	            	}else{
	            		$('#apply').attr("disabled",true);		
	            	}
        	})
        	
	        $("input").each(function(index,item){
	            item.addEventListener("change", function(){
	            	 let flag = 1;
	            	$("input").each(function(index1,item1){
	            		flag *= (item1.value ==''? 0 :1);
	            		flag *= ($('#information').val() == ''? 0 :1);
	            	});
	            	
	            	if(flag==1 && $('#injung').is(':checked') && $('#information').val() != ''){
	            		$('#apply').removeAttr("disabled");
	            	}else{
	            		$('#apply').attr("disabled",true);		
	            	}
	            	
	            });
	        })
        }
        inputCheck();
        
    	document.getElementById('houseAddress').addEventListener('click', function(){
    		alert('주소검색버튼을 통해 입력바랍니다.');
    	})
        
        function insertDaumPostcodeBtn(){
            new daum.Postcode({
                oncomplete: function(data){

                    var roadAddr = data.roadAddress;
                    var extraRoadAddr = '';

                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }

                    if(data.buildingName !== ''){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '+data.buildingName : data.buildingName);
                    }

                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' ('+extraRoadAddr+')';
                    }
                
                    // document.getElementById("postcodeInsert").value = data.zonecode;
                    document.getElementById("houseAddress").value = roadAddr + extraRoadAddr;
                    getLocation();
                }
            }).open();
    	}
            
   </script>
        <script>
        function getLocation(){
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(document.getElementById("houseAddress").value, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        		$("#houseLatitude").val(result[0].y);
        		$("#houseLongitude").val(result[0].x);
            } 
        });    
        }
        
    </script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>