<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="b" value="${house[0] }" />
<c:set var="h" value="${house.get(1) }" />
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
        <form method="post" action="/thrifty/sharehouse/update" enctype="multipart/form-data">
        
        	<input type="hidden" name="boardNo" value="${b.boardNo }"> 
        	<input type="hidden" name="deleteRoomList"> 
			<input type="hidden" name="deleteImgList">
            <input type="text" placeholder=" *이름" name="userName" id="userName" required value="${loginUser.userName }" disabled> <br>
            <input  type="tel" placeholder=" *연락처" name="phone" id="phone" required value="${loginUser.phone }" disabled> <br>
             <input type="text" placeholder=" *집 이름" name="title" value="${b.title }" required  maxlength='15'> <br>
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
            <input type="text"  placeholder="위치" name="houseAddress" id="houseAddress" onchange="getLocation()" value="${h.houseAddress }" required readonly>
            <input type="hidden" name="houseLongitude" id="houseLongitude" value="${h.houseLongitude }">
            <input type="hidden" name="houseLatitude" id="houseLatitude" value="${h.houseLatitude }">
            <div style="position:absolute; right: 40px; top: 17px;">
            <button type="button" id="Addressbtn" onclick="insertDaumPostcodeBtn();" >주소검색</button>
            </div>
            </div>
           

            <textarea class="scrollbar" wrap="hard" type="text" placeholder="지점소개" name="information" id="information" required>${h.information }</textarea> <br>
  
                <input type="checkbox" name="injung" id="injung" >
            <label for="injung">개인정보수집에 동의합니다.</label> <br><br>

                <button id="apply">신청하기</button><br>
        </form>
    </div>
    </div>
    </div>
</div>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
    <script>
		let deleteRoomList =[];
		let deleteImgList = [];
		let originImgListLength = {};
        let count = -1;
        const dataTransfer = new DataTransfer();
        let fileArr = new Array();
        
        
        function selectRoom(){
        	
        	    <c:forEach items="${h.roomList}" var="r">   
        	    count++;
        	    
                a = `
                <div id="roomImgsection\${count}" > 
                <input type="hidden" name="roomNo" value="${r.roomNo}"> 
                <input type="text" maxlength='8' placeholder="방 이름" value="${r.division}"name="division" id="division\${count}" onchange="roomName(this.id)" required> 
                <button type="button" onclick="insertImage(\${count});">파일 첨부(8개까지 가능)</button>
                <input type="file" onchange="makeSlick(\${count})" name="roomImg\${count}" multiple accept="image/gif, image/jpeg, image/png">
                <button type="button" id="closebtn\${count}"count='\${count}'  roomNo='${r.roomNo}' onclick="deleteRoom(this)" >X</button>
                </div>
                <div class="rImg\${count} slickRoomImgDiv" id="rImg\${count}" roomNo='${r.roomNo}'></div>`
                
               $('#roomAdd').append(a);
                originImgListLength[${r.roomNo}+''] =  ${r.imgList.size()}; 
                selectSlick(count);
                imgCount = -1;
            	<c:forEach items="${r.imgList}" var="i">
            		imgCount++;
	        		 $('.rImg'+count).slick('slickAdd',
	        		 `<div class="slickDiv" onclick='deleteOriginImg(this);' roomNo = ${i.roomNo} imgNo = ${i.roomImgNo} cnt=\${count} style='border-radius: 10px; background-image: url(/thrifty/resources/upfiles/house/${i.changeName}); background-size:cover; width:140px; height:140px;';>
	        		 <img class='deleteImg' id='oldImg\${count}' src='/thrifty/resources/images/house/deleteImg.png'></div>`);	        				 
	        		 $('.rImg'+count).slick('refresh');
	        	
	        	 </c:forEach>

               b =`
               <tr id="tb\${count}">
                    <td>
                        <input type="number" name="recruitsNum" value="${r.recruitsNum}" required>
                    </td>
                    <td onclick="nameAlert(this)">
                        <input type="text" name="division\${count}" value="${r.division}"  required>
                    </td>
                    <td>
                        <input type="text" name="gender" value="${r.gender}" required>
                    </td>
                    <td>
                        <input type="text" name="type" value="${r.type}" required>
                    </td>
                    <td>
                        <input type="number" name="area" value="${r.area}" required> 
                    </td>
                    <td>
                        <input type="number" name="deposit" value="${r.deposit}" required>
                    </td>
                    <td>
                        <input type="number" name="rent" value="${r.rent}" required>
                    </td>
                    <td>
                        <input type="number" name="cost" value="${r.cost}" required>
                    </td>
                    <td>
                        <input type="date" name="contrat" value="${r.contrat}"required>
                    </td>
                </tr>
               `

               $('#tableA').append(b);

               document.getElementById("closebtn"+count).addEventListener('click', function(){
                    let c = $(this).attr('count')
                  
                    if($('input[name=contrat]').length == 1){
                    	alert("하나의 방은 존재해야합니다.")
                    }else{
                    	 if($('#rImg'+c).find('img').length != 0) {
     		        		$('.rImg'+c).slick('slickRemove', null, null, true);
     		        		$('.rImg'+c).slick('unslick');
     		        		$('#rImg'+c).remove();
     		        	}
                    $('#roomImgsection'+c).remove();
                    $('#rImg'+c).remove();
                    $("#tb"+c).remove();
                    }
                });
                //inputCheck();
        	   </c:forEach>
          
        }selectRoom();
        
        
        function addRoom(){ // 방 추가
          	//$('#apply').attr("disabled", true);
            count++;
            
            let e = `
            <div id="roomImgsection\${count}" > 
            <input type="hidden" name="roomNo" value="0"> 
            <input type="text" maxlength='8' placeholder="방 이름" name="division" id="division\${count}" onchange="roomName(this.id)" required> 
            <button type="button" onclick="insertImage(\${count});">파일 첨부(8개까지 가능)</button>
            <input type="file" onchange="makeSlick(\${count})" name="roomImg\${count}" multiple accept="image/gif, image/jpeg, image/png">
            <button type="button" id="closebtn\${count}" count='\${count}'>X</button>
            </div>
            
            <div class="rImg\${count} slickRoomImgDiv" id="rImg\${count}">
            
        	</div>
            `
           $('#roomAdd').append(e);

           let d =`
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

           $('#tableA').append(d);

           document.getElementById("closebtn"+count).addEventListener('click', function(){
                let f = $(this).attr('count')
               
                if($('input[name=contrat]').length == 1){
                	alert("하나의 방은 존재해야합니다.")
                }else{
                	if($('#rImg'+f).find('img').length != 0) {
		        		$('.rImg'+f).slick('slickRemove', null, null, true);
		        		$('.rImg'+f).slick('unslick');
		        		$('#rImg'+f).remove();
		        	}
                $('#roomImgsection'+f).remove();
                $('#rImg'+f).remove();
                $("#tb"+f).remove();
                }
            });
            //inputCheck();
        }
        
        function clearSlick(container){
            let arr = $(container+' .slick-track').children('div').filter(function(i, item){
                return !$(item).hasClass('slick-cloned');
            })
            let roomNo = ''+$(container).attr('roomNo');
            let totalLength = arr.length;
            for(let i= originImgListLength[roomNo]; i < totalLength; i++){
                $(container).slick('slickRemove',originImgListLength[roomNo]);
            }
        }
        
        function deleteOriginImg(element){
    		let index = -1;
    		let imgNo = $(element).attr('imgNo');
    		cnt = $(element).attr('cnt');
    		let roomNo = $(element).attr('roomNo')+'';
    		let container = $('.rImg'+cnt);
    		deleteImgList.push(imgNo);
    		originImgListLength[roomNo] = originImgListLength[roomNo] - 1;	
    		 let arr = $('.rImg'+cnt+' .slick-track').children('div').filter(function(i, item){
                 return !$(item).hasClass('slick-cloned');
             });
             arr.each(function(i, item){
                 if($(item).attr('imgNo')==$(element).attr('imgNo')){
                     index = i;
                 }
             }) 
             $(container).slick('slickRemove', index);
             
             $('input[name="deleteImgList"]').val(deleteImgList);
        }
        function deleteImg(e){
        	cnt = $(e).attr('cnt');
        		const files = Array.from(document.getElementsByName('roomImg'+cnt)[0].files);
                const dataTransfer = new DataTransfer();
                files.filter(file=>file.lastModified!=$(e).attr('lastModified')).forEach(file=>{
                    dataTransfer.items.add(file);
                })
                document.getElementsByName('roomImg'+cnt)[0].files = dataTransfer.files;
            let arr = $('.rImg'+cnt+' .slick-track').children('div').filter(function(i, item){
                return !$(item).hasClass('slick-cloned');
            });
            let index = -1;
            arr.each(function(i, item){
                if($(item).attr('index')==$(e).attr('index')){
                    index = i;
                }
            })
            $('.rImg'+cnt).slick('slickRemove',index);
    	}
        
        function makeSlick(item){
        	let container = '.rImg'+item;
        	let fileTagName = 'roomImg'+item;
        	 if($('#rImg'+item).find('img').length != 0) {
        		clearSlick(container);
        	} 
        	let el = $('input[name=roomImg'+item+']').get(0);
        	filelength = el.files.length;
        	if(filelength + $('#rImg'+item).find('img').length > 8){
        		alert("사진첨부는 8개까지 가능합니다.");
        		el.value = "";
        		return 0;
        	}
        	let files = el.files;
        	clearSlick(container);
	        	for(let j = 0; j < filelength; j++){
		        	let file = el.files[j];
		       		 //formData.append("upfile"+ item + j , file);
		        	 let reader = new FileReader();
			        	reader.readAsDataURL(file);
			        	reader.onload = function(e){
			        		let url = e.target.result;
			        		let lastModified = file.lastModified;
			        		$('.rImg'+item).slick('slickAdd',`<div class="slickDiv" onclick='deleteImg(this);' index=\${j} cnt=\${item} lastModified=\${lastModified} style='border-radius: 10px; background-image: url(\${url}); background-size:cover; width:140px; height:140px;';><img class='deleteImg' src='/thrifty/resources/images/house/deleteImg.png'></div>`);
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
        
        function selectSlick(item){
        	 $('.rImg'+item).slick({
	                dots: false,
	                slidesToShow: 5,
	                infinite : true,
	                autoplay : false,
	                prevArrow : "<button type='button' class='slick-prev slickBtn'><img src='/thrifty/resources/images/house/left-arrow.png'></button>",
					nextArrow : "<button type='button' class='slick-next slickBtn'><img src='/thrifty/resources/images/house/right-arrow.png'></button>"
	                
	            });
        }
        
        
        function deleteRoom(elem){
        	deleteRoomList.push($(elem).attr('roomNo'));
       		$('input[name="deleteRoomList"]').val(deleteRoomList);
        }
        
        function insertImage(len){
    		$('input[name=roomImg'+len+']')[0].click();
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
        
       /*  function inputCheck(){
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
        inputCheck(); */
        
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