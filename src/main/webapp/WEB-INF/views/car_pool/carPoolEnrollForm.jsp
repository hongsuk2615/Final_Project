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

</style>
</head>
<body>
    <div id="wrapper">
		<jsp:include page="../common/header.jsp"/>
        <div id="body">
			<jsp:include page="../common/boardBodyLeftCarPool.jsp"/>
            <div id="body-right">
                <div id="enroll-category">
                    <h1>게시글 작성하기</h1>
                </div>
                <hr>
                <div id="enroll">
                    <form action="/thrifty/carPool/enroll"  method="post" enctype="multipart/form-data">
                        <div id="enroll-header">
                            <h2>제목 : &nbsp;<input name="title" id="enroll-title" required placeholder="제목을 적어주세요."></h2><br>
                            <h3 id="enroll-content">내용 :  &nbsp;<textarea name="content" id="enroll-textarea" style="resize: none; width: 520px; height: 100px;" required placeholder="날짜와 내용을 적어주세요."></textarea></h3>
                        </div>
                        <hr>
                        <div id="enroll-body">
                        	<h2>회원 정보 : </h2>
                        	<h4>회원의 아이디가 표시됩니다.</h4>
                            <h4>연락처 : 회원의 연락처가 표시됩니다.</h4>
                            <h4>성별 : 회원의 성별이 표시됩니다.</h4>
                            <h4>모집인원 : <input type="number" id="carpool-member" name="recruitsNum" required> 명</h4>
                            <h4>현재 인원(자신포함) : <input type="number" id="carpool-member" name="recruitsCurr"required> 명</h4>
                            <hr>
                            <h3>카테고리 : 
                            	<c:forEach var="categorySName" items="${subCategoryList }">
                            		<c:if test="${categorySName.categoryUNo eq 3 }">
                            			<input type="radio" class="category" name="categorySNo" id="get-in-car" value="${categorySName.categorySNo }">${categorySName.categorySName }
                            		</c:if>
                            	</c:forEach>
                                <!-- <input type="radio" class="category" name="categorySNo" id="get-in-car" value="31">태워드려요!
                                <input type="radio" class="category" name="categorySNo" id="i-want-car" value="32">태워주세요! -->
                                <table>
                                	<tr id="images" style='display:none;'>
				                        <th>이미지<br>(최대4장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
				                        <td id="image0"></td>
				                        <td id="image1"></td>
				                        <td id="image2"></td>
				                        <td id="image3"></td>
				                    </tr>
				                    <tr>
				                        <td colspan="5" style="height: 1px; padding: 0; margin: 0;">
				                            <input type="file" name="images" multiple style="opacity : 0;" onchange="imagePreview(this);">
				                        </td>
				                    </tr>
                                </table>
								<p style="display:none; margin-left: 190px;" id="thumbnail">(첫번째 사진이 게시글 대표 이미지가 됩니다.)</p>
                            </h3>
                            <hr>
                            <h3>카풀비 : </h3><input type="number" id="enroll-price" name="price" required>&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            출발 시간 : <input type="time" name="startTime" class="enroll-date" value="09:00:00" required>&nbsp;&nbsp;
                            도착 시간 : <input type="time" name="endTime" class="enroll-date" value="18:00:00" required>
                            <hr>

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
                                    <input type="hidden" name="locationCoordinate" id="locationCoordinate" value="1">
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
                                    <input type="hidden" name="destination" id="destination" >
                                    <button type="button" onclick="removeLine();" class="draw-btn" id="redraw">다시 그리기</button>
                                </div>
                                <!-- <div id="좌표"></div> -->
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="carpool-enroll-btn">게시글 등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- <div id="map" style="width:100%;height:350px;"></div> -->
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
        $("#get-in-car").click(function(){
            alert("차 번호판이 보이는 사진을 올려주세요.");
            $("#images").css("display" , "");
        })
        $("#get-in-car").click(function(){
        	$("#thumbnail").css("display" , "");
        })
        $("#i-want-car").click(function(){
            $("#images").css("display" , "none");
        })
        $("#i-want-car").click(function(){
        	$("#thumbnail").css("display" , "none");
        })
    })



</script>
<script type="text/javascript">
        	function insertImage(){
        		document.getElementsByName('images')[0].click();
        	}
        	
        	function imagePreview(arg){
        		if(arg.files.length >4){
        			alert("4개보다 많은 사진첨부 불가능");
        			console.log(arg.files[i]);
        			return false;
        		}else{
                    console.log(arg.value);
	        		for(let i = 0; i < arg.files.length; i++){
	        			let reader = new FileReader();
	        			
	        			reader.onload = function(e){
	        				let url = e.target.result;
	        				console.log("image"+i+":");
	        				console.log(url);
	        				$("#image"+i).css('backgroundImage','url('+url+')');
	        			}
	        			
	        			reader.readAsDataURL(arg.files[i]);
	        			console.log(reader);
	        			
	        				
	        			// document.getElementById('image'+i).src = e.
	        		}
	        		for(let i = arg.files.length; i < 4 ; i++){
	        			$("#image"+i).css('backgroundImage','none');
	        		}
        		}
        		
        	}
</script>
</body>
</html>