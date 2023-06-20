<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link href="/thrifty/resources/css/car_pool/car_pool_enrollform.css" rel="stylesheet">
<style>
    *{
        /* border: 1px solid blue !important; */
        box-sizing: border-box;
    }
    body{
        margin: 0;
    }
    #wrapper{
        min-width: 1180px;
    }

    #header{
        height: 140px;
    }

    #body{
    	padding: 40px;
    	display: flex;
    	justify-content: center;
    	flex-direction: row;
    }
    
    #body-left{
        display: inline-block;
        width: 20%;
        min-width: 350px;
        min-height: 900px;
        background-color: rgb(0, 60, 120);
        margin-right: 10px;
    }
    
    #body-right{
        margin-left: 10px;
        width: 50%;
        min-width: 700px;
        min-height: 950px;
    }

    #footer{
        
    }
    
    .deleteImg{
        cursor: pointer;
    	opacity : 0;
    }
    .deleteImg:hover{
        opacity: 1;
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            <div id="body-right">
                <div id="enroll-category">
                    <h1 style="display: flex; align-items: center;">카테고리를 정해주세요.
                    	<select style="margin-left: 10px;" name="categorySNo" id="category-s-name">
							<c:forEach var="categorySName" items="${subCategoryList }">
								<c:if test="${categorySName.categoryUNo eq 3 }" >
									<option value="${categorySName.categorySNo }">${categorySName.categorySName }</option>
								</c:if>
							</c:forEach>
                    	</select>
                    </h1>
                </div>
                <hr>
                <div id="enroll">
                    <form action="${contextPath }/carPool/update" method="post" enctype="multipart/form-data">
                        <div id="enroll-header">
                            <h2>제목 : &nbsp;<input name="title" id="enroll-title" required value="${carpool.board.title }"></h2><br>
                            <h3 id="enroll-content">내용 :  &nbsp;<textarea name="content" id="enroll-textarea" style="resize: none; width: 520px; height: 100px;" required value="${carpool.board.content }"></textarea></h3>
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>${carpool.member.userId }</h3>
                            <h3>연락처 : ${carpool.member.phone }</h3>
                            <hr>
                            <h3>모집 인원 : <input type="number" id="carpool-member" name="recruitsNum" required value="${carpool.recruitsNum }"> 명</h3>
                            <h3>현재 인원(자신포함) : <input type="number" id="carpool-member" name="recruitsCurr"required value="${carpool.recruitsCurr }"> 명</h3>
                            <hr>
                            <h3>카풀비 : </h3><input type="number" id="enroll-price" name="price" required value="${carpool.price }">&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            출발 시간 : <input type="time" name="startTime" class="enroll-date" value="${carpool.startTime }" required>&nbsp;&nbsp;
                            도착 시간 : <input type="time" name="endTime" class="enroll-date" value="${carpool.endTime }" required>
                            <hr>
							<table>
                               	<tr id="images">
			                        <th>이미지<br>(최대4장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
			                        <td colspan="4">
			                            <div id="image-slick" style="width: 560px; height:200px;">
			                                <c:forEach var="image" items="${imageList}">
			                                    <div onclick='deleteOriginImg(this);' imgNo="${image.imgNo}" style='background-image: url("/thrifty/resources/upfiles/carPool/${image.changeName}"); background-size:cover; width:140px; height:200px; border-radius:5px;'><img class='deleteImg' src='/thrifty/resources/images/common/trash.gif' style='width:100%; height:100%;'></div>
			                                </c:forEach>
			                            </div>
			                         </td>
			                    </tr>
			                    <tr>
			                        <td colspan="5" style="height: 1px; padding: 0; margin: 0;">
			                            <input type="file" name="images" multiple style="opacity : 0;" onchange="imagePreview(this);" required>
			                            <input type="hidden" name="removeImgList" value="">
			                            <input type="hidden" name="boardNo" value="${board.boardNo}">
			                        </td>
                   	 			</tr>
                            </table>
                            <div style="display: flex; align-items: center; " id="location-list">
                                <h3>시 / 군 / 구 : </h3>
                                <select style="height:40px; margin-left: 20px;" name="locationNo">
                                    <c:forEach var="location" items="${locationList}">
                                		<option value="${location.locationNo}">${location.locationName}</option>
                                	</c:forEach>
                                </select>
                            </div>
                            <hr>
                            <div id="enroll-map">
                                <div>
                                    <h3>경로길 그리기</h3>
                                </div>
                                <div id="map" style="width:100%;height:350px;"></div>
                                <div id="map-search">
                                    <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                    <div style="display: flex; flex-direction: column;">
                                        <input type="text" name="" id="start-keyword" placeholder="출발지를 검색 해 주세요!"><br>
                                        <button type="button" id="start-btn" onclick="setOrigin();">해당 마커 출발지로 설정하기</button>
                                    </div>
                                    <div style="margin-top: 5px; ">
                                        <img src="/thrifty/resources/images/carpool/exchange.png" id="change-val">
                                    </div>
                                    <div style="display: flex; flex-direction: column;">
                                        <input type="text" name="" id="arrival-keyword" placeholder="도착지를 검색 해 주세요!"><br>
                                        <button type="button" id="arrival-btn" onclick="setDestination();">해당 마커 도착지로 설정하기</button>
                                    </div>
                                </div>
                                <div style="display: flex; flex-direction: column;" id="carpool-enroll-footer">
                                    <button type="button" id="drawpath" class="draw-btn" onclick="drowPath(document.getElementById('origin').value, document.getElementById('destination').value)">경로길그리기</button>
                                    <input type="hidden" name="origin" id="origin">
                                    <input type="hidden" name="destination" id="destination">
                                    <button onclick="removeLine();" class="draw-btn" id="redraw">다시 그리기</button>
                                </div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="carpool-enroll-btn">게시글 수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="footer">
        
        </div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/kakaoAPI/map_drawing.js"></script>
<script>
    $(function(){

        $("#arrival-btn").click(function(){
            $("#arrival-keyword").prop("disabled" , true);
            $("#arrival-keyword").css("background" , "lightgray");
        })

        $("#start-btn").click(function(){
            $("#start-keyword").prop("disabled" , true);
            $("#start-keyword").css("background" , "lightgray");
        })

        $("#change-val").click(function(){
            let temp = $("#start-keyword").val();
            $("#start-keyword").val($("#arrival-keyword").val());
            $("#arrival-keyword").val(temp);
        })

        $("#redraw").click(function(){
            $("#arrival-keyword").prop("disabled" , false);
            $("#start-keyword").prop("disabled" , false);
            $("#arrival-keyword").css("background" , "white");
            $("#start-keyword").css("background" , "white");
        })
    })
</script>
<script>
function insertImage(){
	document.getElementsByName('images')[0].click();
}
makeSlick();
let originFileLength = $('.slick-track').children('div').filter(function(i, item){
    return !$(item).hasClass('slick-cloned');
}).length;
function imagePreview(arg){
    clearSlick();
	if(arg.files.length + originFileLength >4){
		alert("4개보다 많은 사진첨부 불가능");
		console.log(arg.files);
		arg.value='';
	}else{
        console.log(Array.from(arg.files));
		for(let i = 0; i < arg.files.length; i++){
			let reader = new FileReader();
			
			reader.onload = function(e){
				let url = e.target.result;
				// console.log("image"+i+":");
                let lastModified = document.getElementsByName('images')[0].files[i].lastModified;
				 console.log(e);
				$("#image-slick").slick('slickAdd',"<div onclick='deleteImg(this);' lastModified='"+lastModified+"'index="+i+" style='background-image: url("+url+"); background-size:cover; width:140px; height:200px;'><img class='deleteImg' src='/thrifty/resources/images/common/trash.gif' style='width:100%; height:100%;'></div>");//
			}
			reader.readAsDataURL(arg.files[i]);
			console.log(reader);
		}
		for(let i = arg.files.length; i < 10 ; i++){
			$("#image"+i).css('backgroundImage','none');
		}
		
	}
	
}

let removeImgList = [];
function deleteOriginImg(e){
    let index = -1;
    let arr = $('.slick-track').children('div').filter(function(i, item){
        return !$(item).hasClass('slick-cloned');
    });
    arr.each(function(i, item){
        console.log($(item).attr('index'));
        if($(item).attr('imgNo')==$(e).attr('imgNo')){
            index = i;
        }
    })
    $("#image-slick").slick('slickRemove',index);
    removeImgList.push($(e).attr('imgNo'));
    $('[name="removeImgList"]').val(removeImgList);
    originFileLength--;
}

function deleteImg(e){
    const files = Array.from(document.getElementsByName('images')[0].files);
    console.log(files);
    const dataTransfer = new DataTransfer();
    files.filter(file=>file.lastModified!=$(e).attr('lastModified')).forEach(file=>{
        dataTransfer.items.add(file);
    })
    document.getElementsByName('images')[0].files = dataTransfer.files;

    let arr = $('.slick-track').children('div').filter(function(i, item){
        return !$(item).hasClass('slick-cloned');
    });
    let index = -1;
    arr.each(function(i, item){
        console.log($(item).attr('index'));
        if($(item).attr('index')==$(e).attr('index')){
            index = i;
        }
    })
    $("#image-slick").slick('slickRemove',index);
}

function clearSlick(){
    let arr = $('.slick-track').children('div').filter(function(i, item){
        return !$(item).hasClass('slick-cloned');
    })
    let totalLength = arr.length;
    console.log(totalLength);
    for(let i= originFileLength; i < totalLength; i++){
        $("#image-slick").slick('slickRemove',originFileLength);
    }
}

function makeSlick(){
    $('#image-slick').slick({
    	slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : false, 	//무한 반복 옵션	 
		slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
		dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
		dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		draggable : true, 	//드래그 가능 여부 
		
		responsive: [ // 반응형 웹 구현 옵션
			{  
				breakpoint: 960, //화면 사이즈 960px
				settings: {
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:3 
				} 
			},
			{ 
				breakpoint: 768, //화면 사이즈 768px
				settings: {	
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:2 
				} 
			}
		]

	});
}
</script>
</body>
<jsp:include page="../common/rightside.jsp"/>
</html>