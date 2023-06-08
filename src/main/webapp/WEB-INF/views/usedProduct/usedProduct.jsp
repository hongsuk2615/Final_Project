<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/usedProduct/usedProduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>Document</title>
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
        padding-bottom: 70px;
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
    

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <div id="body-right-header">
                	<c:choose>
                		<c:when test="${filter.scNo eq null or filter.scNo eq '' }">
		                    <div id="body-right-title">[중고거래]</div>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="subCategory" items="${subCategoryList}">
                				<c:if test="${subCategory.categorySNo eq filter.scNo}">
	                				<div id="body-right-title">[${subCategory.categorySName}]</div>                				
                				</c:if>
                			</c:forEach>
                		</c:otherwise>
                	
                	</c:choose>

                    <div id="body-right-filter">
                        <div id="order-list">
                            <div>최신순</div>
                            <div>추천순</div>
                            <div>조회순</div>
                            <div>가격순</div>
                        </div>
                        <div id="search">
                            <img src="/thrifty/resources/images/main/icon/search-1.png" width="25px" height="25px">
                            <input type="search">
                        </div>
                    </div>
                    
                </div>
                <div id="body-right-list">
                	<c:forEach var="i"  begin="0" end="7" step="1">
	                    <c:choose>
	                    	<c:when test="${i lt list.size()}" >
			                    <div class="item animate__flipInY animate__animated animate__faster " onclick = "location.href = '${contextPath}/usedProduct/detail?bNo=${list.get(i).boardNo}'">
			                        <div class="item-img">
											<img alt="" src='${contextPath}/${list.get(i).thumbNail }'>
			                        </div>
			                        <div class="item-info">
			                        	제목 : ${list.get(i).title} <br>
										가격 : ${list.get(i).price} <br>
										지역 : ${list.get(i).locationName}
			                        </div>     
			                    </div>                	
	                    	
	                    	
	                    	</c:when>
							<c:otherwise>
								<div class="item animate__flipInY animate__animated">
			                        <div class="item-img">
											
			                        </div>
			                        <div class="item-info">
											
			
			                        </div>     
			                    </div>         
							</c:otherwise>		                    
	                    </c:choose>
                    
                	</c:forEach>

                </div>
                <div id="body-right-footer">
                    <div id="write">
                        <c:if test="${loginUser != null}">
                            <div>글작성</div>
                        </c:if>
                    </div>
                    <div id="paging-btns">
                    	<c:choose>
		                  <c:when test="${ pi.currentPage eq 1 }">
		                     <div>&lt;</div>
		                  </c:when>
		                  <c:otherwise>
		                     <div><a href="/thrifty/usedProduct?currPage=${filter.currPage-1}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}">&lt;</a></div>
		                  </c:otherwise>               
		               </c:choose>
		               <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
	                  	<div><a href="/thrifty/usedProduct?currPage=${item}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}">${item}</a></div>
	               		</c:forEach>
	               		<c:choose>
		                  <c:when test="${ pi.currentPage eq pi.maxPage }">
		                     <div>&gt;</div>
		                  </c:when>
		                  <c:otherwise>
		                     <div><a href="/thrifty/usedProduct?currPage=${filter.currPage+1}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}">&gt;</a></div>
		                  </c:otherwise>               
		               </c:choose>
                    </div>
                    
                </div>

            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    <script type="text/javascript">
    

    $('#body-right-list>div').each(function(index,item){
                    $(item).hover(function(){
                        $(this).removeClass('animate__flipInY');
                        $(this).addClass('animate__headShake');
                    },
                    function(){
                        $(this).removeClass('animate__flipInY');
                        $(this).removeClass('animate__headShake');
                    })
                })

    document.getElementById('write').addEventListener('click',function(){
    	location.href = "/thrifty/usedProduct/enroll";
    });
    </script>
</body>
</html>