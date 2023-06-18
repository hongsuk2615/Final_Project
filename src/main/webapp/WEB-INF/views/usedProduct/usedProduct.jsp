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
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <title>Document</title>
<style>
    *{
        /* border: 1px solid blue !important; */
        box-sizing: border-box;
    }
    body{
        margin: 0;
    }
    footer {
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
                            <div><a style="${filter.order eq 0 or filter.order eq null? 'font-weight:bold;text-decoration : underline; text-decoration-thickness: 3px; color: black; text-underline-offset : 5px;':''}" href="/thrifty/usedProduct?scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&keyword=${filter.keyword}&order=0">최신순</a></div>
                            <div><a style="${filter.order eq 1 ? 'font-weight:bold;text-decoration : underline; color: black; text-decoration-thickness: 3px; text-underline-offset : 5px;':''}" href="/thrifty/usedProduct?scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&keyword=${filter.keyword}&order=1">찜순</a></div>
                            <div><a style="${filter.order eq 2 ? 'font-weight:bold;text-decoration : underline; color: black; text-decoration-thickness: 3px; text-underline-offset : 5px;':''}"href="/thrifty/usedProduct?scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&keyword=${filter.keyword}&order=2">조회순</a></div>
                            <div><a style="${filter.order eq 3 ? 'font-weight:bold;text-decoration : underline; color: black; text-decoration-thickness: 3px; text-underline-offset : 5px;':''}" href="/thrifty/usedProduct?scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&keyword=${filter.keyword}&order=3">가격순</a></div>
                        </div>
                        <div id="search">
                            <img src="/thrifty/resources/images/main/icon/search-1.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="25px" height="25px">
                            <input type="search" id="keyword">
                        </div>
                    </div>
                    
                </div>
                <div id="body-right-list">
                <c:choose>
                	<c:when test="${list.size() eq 0 }">
                	<img width="200" height="200" src="/thrifty/resources/images/usedProduct/not-found.png">
                	</c:when>
                	<c:otherwise>
                		<c:forEach var="i"  begin="0" end="7" step="1">
	                    <c:choose>
	                    	<c:when test="${i lt list.size()}" >
			                    <div class="item animate__flipInY animate__animated animate__faster " onclick = "location.href = '${contextPath}/usedProduct/detail?bNo=${list.get(i).boardNo}'">
			                        <div class="item-img">
											<img alt="" onerror="this.src='/thrifty/resources/images/common/noImage.png'"src='${contextPath }/${list.get(i).isSoldOut == 'Y'? 'resources/images/usedProduct/giphy.gif': list.get(i).thumbNail}'>
			                        </div>
			                        <div class="item-info">
			                        	<div class="item-info-title">${list.get(i).title}</div>
										<div class="item-info-price">${list.get(i).price}원</div> 
										<div class="item-info-locationName">${list.get(i).locationName}</div>
										
			                        </div>     
			                    </div>                	
	                    	
	                    	
	                    	</c:when>
							<c:otherwise>
								<div class="item animate__flipInY animate__animated" style="box-shadow : none;">
			                        <div class="item-img" style="background:transparent">
											
			                        </div>
			                        <div class="item-info" style="background:transparent; border:none;">
											
			
			                        </div>     
			                    </div>         
							</c:otherwise>		                    
	                    </c:choose>
                    
                	</c:forEach>
                	
                	
                	</c:otherwise>
                </c:choose>
                
                	

                </div>
                <div id="body-right-footer">
                    <div id="write">
                        <c:if test="${loginUser != null}">
                            <div>글작성</div>
                        </c:if>
                    </div>
                    <div id="paging-btns">
                    <c:if test="${list.size() gt 0 }">
                    	<c:choose>
		                  <c:when test="${ pi.currentPage eq 1 }">
		                     
		                     <lord-icon
								    src="https://cdn.lordicon.com/xdakhdsq.json"
								    trigger="hover"
								    colors="primary:gray"
								    style="width:30px;height:30px;  transform:rotate(-90deg);">
								</lord-icon>
							
		                  </c:when>
		                  <c:otherwise>
		                     <a href="/thrifty/usedProduct?currPage=${filter.currPage-1}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&order=${filter.order}&keyword=${filter.keyword}"><lord-icon
								    src="https://cdn.lordicon.com/xdakhdsq.json"
								    trigger="hover"
								    colors="primary:#3498db"
								    style="width:30px;height:30px; cursor:pointer; transform:rotate(-90deg);">
								</lord-icon></a>
		                  </c:otherwise>               
		               </c:choose>
		               <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
	                  	<div onclick='location.href="/thrifty/usedProduct?currPage=${item}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&order=${filter.order}&keyword=${filter.keyword}"' style="${item eq pi.currentPage? 'background:rgb(0, 60, 120);':''}"><a style="color:white; font-size: 15px; font-weight: bold;" href="/thrifty/usedProduct?currPage=${item}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&order=${filter.order}&keyword=${filter.keyword}">${item}</a></div>
	               		</c:forEach>
	               		<c:choose>
		                  <c:when test="${ pi.currentPage eq pi.maxPage }">
		                     <lord-icon
								    src="https://cdn.lordicon.com/xdakhdsq.json"
								    trigger="hover"
								    colors="primary:gray"
								    style="width:30px;height:30px;  transform:rotate(90deg);">
								</lord-icon>
		                  </c:when>
		                  <c:otherwise>
		                     <a href="/thrifty/usedProduct?currPage=${filter.currPage+1}&scNo=${filter.scNo}&minPrice=${filter.minPrice}&maxPrice=${filter.maxPrice}&location=${filter.location}&tradeMethod=${filter.tradeMethod}&order=${filter.order}&keyword=${filter.keyword}"><lord-icon
								    src="https://cdn.lordicon.com/xdakhdsq.json"
								    trigger="hover"
								    colors="primary:#3498db"
								    style="width:30px;height:30px; cursor:pointer; transform:rotate(90deg);">
								</lord-icon></a>
		                  </c:otherwise>               
		               </c:choose>
		              </c:if>
                    </div>
                    
                </div>

            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
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

    document.getElementById('keyword').addEventListener('keyup',function(){
        console.log(this.value);
            if (window.event.keyCode == 13) {
                location.href="/thrifty/usedProduct?keyword="+this.value;
        }
    })
    </script>
</body>
</html>