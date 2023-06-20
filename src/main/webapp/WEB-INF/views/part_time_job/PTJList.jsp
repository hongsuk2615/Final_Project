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
            <jsp:include page="../common/boardBodyLeftPTJ.jsp"/>
            <div id="body-right">
                <div id="ptj-header">
					<c:choose>
                		<c:when test="${filter.scNo eq null or filter.scNo eq '' }">
		                    <div id="body-right-title"><h1>[대타 / 심부름]</h1></div>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="location" items="${locationList}">
                				<c:if test="${location.locationNo eq filter.lNo}">
	                				<div id="body-right-title">[${subCategory.categorySName}]</div>                				
                				</c:if>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </div>
                <div style="width:100%; height:50px;" id="write-board">
                	<p>메인 > 심부름/대타 </p>
                	<div id="search">
	                	<img src="/thrifty/resources/images/main/icon/search-1.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="25px" height="25px">
	                	<input type="search" id="keyword">
                	</div>
                	<c:if test="${loginUser != null }">
	                	<button id="write-btn">게시글 작성하기</button>
                	</c:if>
                </div>
                <hr style="width: 100%;  margin-top: 15px;">
                <div id="ptj-allBody" style="height: 1000px;">
                	<c:choose>
                	<c:when test="${list.size() eq 0 }">
                	<img width="170" height="200" src="/thrifty/resources/images/usedProduct/not-found.png">
                	</c:when>
                	<c:otherwise>
                		<c:forEach var="i"  begin="0" end="8" step="1">
	                    <c:choose>
	                    	<c:when test="${i lt list.size()}" >
			                    <div class="items" onclick = "location.href = '${contextPath}/ptj/detail?bNo=${list.get(i).boardNo}'" >
			                        <div class="item-img" style="width: 185px; height: 170px;">
										<img style="width: 100%; height: 100%;" alt="" onerror="this.src='/thrifty/resources/images/common/noImage.png'" src='${contextPath }${webPath }/${list.get(i).isEnd == 'Y'? 'resources/images/ptj/end.jpg': list.get(i).imgPath}'>
			                        </div>
			                        <div class="item-info">
			                        	<p style="text-align: center;"><b>${list.get(i).subCategory.categorySName }</b></p>
				                        <p>제목 : ${list.get(i).board.title }</p>
				                        <p>카풀비 : ${list.get(i).price }</p>
			                        </div>     
			                    </div>                		
	                    	</c:when>
							<c:otherwise>
								<div class="items"  style="opacity:0; height: 200px; cursor:initial;">
			                        <div class="item-img" style="width: 170px;  opacity:0;">
										<img style="width: 100%; height: 100%;" alt="" onerror="this.src='/thrifty/resources/images/common/noImage.png'" src=''>
			                        </div>
			                        <div class="item-info">
			                        	<p></p>
				                        <p></p>
				                        <p></p>
			                        </div>     
			                    </div>              
							</c:otherwise>		                    
	                    </c:choose>   
                	</c:forEach>
                	</c:otherwise>
                </c:choose>
                </div>
                   <div id="paging-btns">
                   	<c:choose>
	                  <c:when test="${ pi.currentPage eq 1 }">
	                     <div>&lt;</div>
	                  </c:when>
	                  <c:otherwise>
	                     <div><a href="/thrifty/ptj/ptjList?currPage=${filter.currPage-1}&scNo=${filter.scNo}&location=${filter.location}&keyword=${filter.keyword}">&lt;</a></div>
	                  </c:otherwise>               
	               </c:choose>
	               <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
                  	<div><a href="/thrifty/ptj/ptjList?currPage=${item}&scNo=${filter.scNo}&location=${filter.location}&keyword=${filter.keyword}">${item}</a></div>
               		</c:forEach>
               		<c:choose>
	                  <c:when test="${ pi.currentPage eq pi.maxPage }">
	                     <div>&gt;</div>
	                  </c:when>
	                  <c:otherwise>
	                     <div><a href="/thrifty/ptj/ptjList?currPage=${filter.currPage+1}&scNo=${filter.scNo}&location=${filter.location}&keyword=${filter.keyword}">&gt;</a></div>
	                  </c:otherwise>
	                </c:choose>	               
                   </div>
            </div>
        </div>

        <div id="footer">

        </div>
    </div>
<script type="text/javascript">

   	document.getElementById('write-btn').addEventListener("click",function(){
        location.href = "<%= request.getContextPath() %>/ptj/ptjEnrollForm";
   	})
</script>
<script>
document.getElementById('keyword').addEventListener('keyup',function(){
    console.log(this.value);
        if (window.event.keyCode == 13) {
            location.href="/thrifty/ptj/ptjList?keyword="+this.value;
    }
})
</script>
</body>
<jsp:include page="../common/rightside.jsp"/>
</html>