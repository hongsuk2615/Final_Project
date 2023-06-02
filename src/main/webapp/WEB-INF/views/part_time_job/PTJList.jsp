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
        <div id="header">
            <jsp:include page="../common/header.jsp"/>
        </div>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            </div>
            <div id="body-right">
                <div id="ptj-header">
                	<c:forEach var="subCategory" items="${subCategoryList }">
						<c:if test="${subCategory.categorySNo == 9}">
                        	<h1>최신 ${subCategory.categorySName } 게시글</h1>	
						</c:if>
					</c:forEach>
                </div>
                <div style="width:100%; height:50px;" id="write-board">
                	<p>메인 > 심부름/대타 > 대타</p><button id="write-btn">게시글 작성하기</button>
                </div>
                <hr style="width: 100%;  margin-top: 15px;">
                <div id="ptj-allBody" style="height: 1000px;">
                	<c:forEach var="ptjList" items="${bList }" begin="0" end="8" step="1" >
               			<div style="width: 200px; height: 170px;">
               				<img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;"/>
               				<p style="text-align: center;">${ptjList.title }</p>
               				<p style="text-align: center;">${ptjList.content }</p>
               			</div>
                	</c:forEach>
                	
	               <!-- <div id="ptj-body1">
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;"/>
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                </div>
	                <div id="ptj-body2">
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                </div>
					<div id="ptj-body3">
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                    </div>
	                    <div style="width: 200px; height: 170px;">
	                        <img src="/thrifty/resources/images/ptj/alba.jpg" style="height: 170px; width: 200px;">
	                        <p style="text-align: center;">메롱</p>
	                	</div>
	                </div> -->
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
    </script>
</body>
</html>