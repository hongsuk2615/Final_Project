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
    <link href="/thrifty/resources/css/part_time_job/part_time_job_list.css" rel="stylesheet">
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
        <div id="body"  style="padding-top: 150px;">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            </div>
            <div id="body-right">
                <div id="ptj-header">
					<h1>최신 대타 / 알바 게시글</h1>	
                </div>
                <div style="width:100%; height:50px;" id="write-board">
                	<p>메인 > 심부름/대타 </p><button id="write-btn">게시글 작성하기</button>
                </div>
                <hr style="width: 100%;  margin-top: 15px;">
                <div id="ptj-allBody" style="height: 1000px;">
                <!-- <input type="hidden" name="boardNo"> -->
                	<c:forEach var="ptjList" items="${pList }" begin="0" end="8" step="1" >
                		<c:choose>
                			<c:when test="${ptjList.board.status == 'Y' }">
		               			<div style="width: 200px; height: 300px;" class="list-detail" onclick="a(${ptjList.boardNo})">
			               				<img src="${contextPath }${webPath }${ptjList.imgPath }" style="height: 170px; width: 200px; border-radius: 10px;"/>
	               						<p style="display: none;">${ptjList.boardNo }</p>
	               						<p style="text-align: center;">${ptjList.board.title }</p>
	               						<p style="text-align: center;">${ptjList.board.content }</p>
	               				</div>                				
                			</c:when>
                			<c:when test="${ptjList.board.status == 'N' }">
                				<div style="display: none;" class="list-detail">
	               				</div>
                			</c:when>
                		</c:choose>
       				</c:forEach>
                </div>
                <div id="paging">
                    <p style="text-align: center;">< 1 2 3 4 ></p>
                </div>
            </div>
        </div>

        <div id="footer">

        </div>
    </div>
<script>
   	document.getElementById('write-btn').addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/ptj/ptjEnrollForm";
   	})
   	
   	function a(boardNo) {
	   		location.href = "${contextPath}/ptj/ptjDetail/"+boardNo;
   	}
   	
   	
</script>
</body>
</html>