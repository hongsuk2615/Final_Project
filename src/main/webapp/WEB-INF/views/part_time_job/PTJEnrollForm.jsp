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
    <link href="/thrifty/resources/css/part_time_job/part_time_job_enrollform.css" rel="stylesheet">
<style>
    *{
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
	<jsp:include page="../common/header.jsp"/>
    <div id="wrapper">
        <div id="body" style="padding-top: 150px;">
        <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
		<form id="ptj-enroll-form" action="${contextPath}/ptj/ptjList/enroll" enctype="multipart/form-data" method="post">
            <div id="body-right">
                <div id="enroll-category">
                    <h1>카테고리를 정해주세요.
                    	<select style="margin-left: 10px;" name="categorySNo" id="category-s-name">
							<c:forEach var="categorySName" items="${subCategoryList }">
								<c:if test="${categorySName.categoryUNo eq 5 }" >
									<option value="${categorySName.categorySNo }">${categorySName.categorySName }</option>
								</c:if>
							</c:forEach>
                    	</select>
                    </h1>
                </div>
                <hr>
                <div id="enroll">
                        <div id="enroll-header">
                            <h3>대표 이미지 <input type="file" name="img"></h3>
                            <h2>제목 : &nbsp;<input name="title" id="enroll-title" required placeholder="제목을 적어주세요."></h2><br>
                            <h3 id="enroll-content">내용 :  &nbsp;<textarea name="content" id="enroll-textarea" style="resize: none; width: 520px; height: 100px;" required placeholder="날짜와 내용을 적어주세요."></textarea></h3>
                        </div>
                        <hr>
                        <div id="enroll-body">
                            <h3>현재 접속한 아이디의 연락처가 표시 됩니다.</h3><br>
                            <hr>
                            <h3>급여 : </h3><input type="number" id="enroll-price"  name="price" >&nbsp;원
                            <hr>
                            <h3>시간 : </h3>
                            시작 시간 : <input type="time" name="startTime" class="enroll-date" value="09:00:00" step="2" required>&nbsp;&nbsp;
                            마감 시간 : <input type="time" name="endTime" class="enroll-date" value="18:00:00" step="2" required>
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
                                <div>지역 : <input type="text" name="keyword" id="keyword" placeholder="지점 또는 관련 키워드를 검색 해 주세요!"></div><br>
                                <input type="hidden" name="locationCoordinate" id="locationCoordinate">
                                <div id="map" style="width:100%; height:350px;"></div>
                                <div style="visibility: hidden;"id="좌표"></div>
                            </div>
                        </div>
                        <div id="enroll-footer">
                            <button id="enroll-btn">게시글 등록하기</button>
                        </div>
                </div>
            </div>
		</form>
        </div>
        <div id="footer">
        
        </div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38255ab43d3ba70f10bb3d7ec82d75af&libraries=services"></script>
<script type="text/javascript" src="/thrifty/resources/js/kakaoAPI/map_search.js"></script>
<script>
	document.getElementById('enroll-btn').addEventListener("click",function(){
    	location.href = "<%= request.getContextPath() %>/ptj/ptjList";
	})
</script>
</body>
<jsp:include page="../common/rightside.jsp"/>
</html>