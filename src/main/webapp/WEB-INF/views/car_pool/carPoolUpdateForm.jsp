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
                            <h3>카풀비 : </h3><input type="number" id="enroll-price" name="price" required value="${carpool.price }">&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            출발 시간 : <input type="time" name="startTime" class="enroll-date" value="${carpool.startTime }" required>&nbsp;&nbsp;
                            도착 시간 : <input type="time" name="endTime" class="enroll-date" value="${carpool.endTime }" required>
                            <hr>
							<table>
                               	<tr id="images">
			                        <th>이미지<br>(최대4장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
			                        <c:forEach var="image" items="${imageList}">
			                        	<c:choose>
											<c:when test="${image.fileLevel == 0 }">
												<c:set var="img0" value="/thrifty/resources/upfiles/carPool/${image.changeName }"/>
											</c:when>
											<c:when test="${image.fileLevel == 1 }">
												<c:set var="img1" value="/thrifty/resources/upfiles/carPool/${image.changeName }"/>
											</c:when>
											<c:when test="${image.fileLevel == 2 }">
												<c:set var="img2" value="/thrifty/resources/upfiles/carPool/${image.changeName }"/>
											</c:when>
											<c:when test="${image.fileLevel == 3 }">
												<c:set var="img3" value="/thrifty/resources/upfiles/carPool/${image.changeName }"/>
											</c:when>
										</c:choose>
			                        </c:forEach>
			                        <td id="image0" class="images"><img src="${img0}"></td>
			                        <td id="image1" class="images"><img src="${img1}"></td>
			                        <td id="image2" class="images"><img src="${img2}"></td>
			                        <td id="image3" class="images"><img src="${img3}"></td>
			                    </tr>
			                    <tr>
			                    	<td></td>
			                    	<th>${img0 != null ? '삭제' :'' }</th>
			                    	<th>${img1 != null ? '삭제' :'' }</th>
			                    	<th>${img2 != null ? '삭제' :'' }</th>
			                    	<th>${img3 != null ? '삭제' :''}</th>
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


</body>
</html>