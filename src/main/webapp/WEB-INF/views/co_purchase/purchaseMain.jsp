<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${ map.pi }"/>
<c:set var="list" value="${ map.list }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/co_purchase/purchaseMain.css">

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
        padding: 40px 0px;
        display: flex;
        justify-content: center;
    }

    #body-right{
        display: inline-block;
        margin-left: 10px;
        padding-left: 30px;
        width: 50%;
        min-width: 700px;
        min-height: 900px;
    }

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeftCo_purchase.jsp"/>
            <div id="body-right">
                <div id="cat_title">
					<c:choose>
                		<c:when test="${map.scNo eq null or map.scNo eq '' }">
		                    <div id="body-right-title">공동구매</div>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="subCategory" items="${subCategoryList}">
                				<c:if test="${subCategory.categorySNo eq map.scNo}">
	                				<div id="body-right-title">${subCategory.categorySName}</div>                				
                				</c:if>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
				</div>
				<table>
                    <tbody>        
                    	<c:if test="${ empty list }">
							<td colspan="6"> 게시글이 없습니다.</td>
						</c:if>
						<c:forEach items="${ list }" var="b">
							<tr>
								<td class="flex">
									<div class="detail_img">
                                    	<img src="${ contextPath }/${ b.thumbNail }" alt="" class="detail_img_1">
                                    </div>
                                    <div class="detail">
                                    <div class="detail_top">
                                        <div class="detail_top_recruiting">
                                            모집중
                                        </div>
                                    </div>
                                    <a href="${ contextPath }/co_purchase/detail?bNo=${ b.boardNo }">
                                        <div class="detail_middle">${ b.title }</div>
                                    </a>
                                    <div class="detail_bottom flex">
                                        <div class="flex align">
                                            <div>가격</div>
                                            <div class="detail_bottom_price">${ b.price }</div>
                                        </div>
                                        <div class="detail_bottom_2 flex align">
                                            <div>
                                                <img src="${ contextPath }/resources/images/myPage/${ b.changeName }" alt="" class="detail_bottom_img">
                                            </div>
                                            <div class="detail_bottom_nickname">${ b.nickName }</div>
                                            <span>|</span>
                                            <div>${ b.readCount }</div>
                                            <span>|</span>
                                            <div>${ b.createDate }</div>
                                        </div>
                                    </div>
                                </div>
							</tr>		
						</c:forEach>	
                        <!-- <tr>
                            <td class="flex">
                                <div class="detail_img">
                                    <img src="${ contextPath }/resources/images/main/oksusu.jpg" alt="" class="detail_img_1">
                                </div>
                                <div class="detail">
                                    <div class="detail_top">
                                        <div class="detail_top_recruiting">
                                            모집중
                                        </div>
                                    </div>
                                    <a href="${ contextPath }/co_purchase/detail">
                                        <div class="detail_middle">[단독] 옥수수 공동구매 합니다</div>
                                    </a>
                                    <div class="detail_bottom flex">
                                        <div class="flex align">
                                            <div>가격</div>
                                            <div class="detail_bottom_price">20,000</div>
                                        </div>
                                        <div class="detail_bottom_2 flex align">
                                            <div>
                                                <img src="${ contextPath }/resources/hong.png" alt="" class="detail_bottom_img">
                                            </div>
                                            <div class="detail_bottom_nickname">김김훙훙숙숙</div>
                                            <span>|</span>
                                            <div>24</div>
                                            <span>|</span>
                                            <div>06:24</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="flex">
                                <div class="detail_img">
                                    <img src="${ contextPath }/resources/images/main/oksusu.jpg" alt="" class="detail_img_1">
                                </div>
                                <div class="detail">
                                    <div class="detail_top">
                                        <div class="detail_top_close">
                                            마감
                                        </div>
                                    </div>
                                    <div class="detail_middle">[단독] 옥수수 공동구매 합니다</div>
                                    <div class="detail_bottom flex">
                                        <div class="flex align">
                                            <div>가격</div>
                                            <div class="detail_bottom_price">20,000</div>
                                        </div>
                                        <div class="detail_bottom_2 flex align">
                                            <div>
                                                <img src="${ contextPath }/resources/hong.png" alt="" class="detail_bottom_img">
                                            </div>
                                            <div class="detail_bottom_nickname">김김훙훙숙숙</div>
                                            <span>|</span>
                                            <div>24</div>
                                            <span>|</span>
                                            <div>06:24</div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
                <div id="pagingbar">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <img src="${ contextPath }/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;">
                        </c:when>
                        <c:otherwise>
                            <div class="page-item"><a class="page-link" href="/thrifty/co_purchase?currPage=${map.currPage-1}&scNo=${map.scNo}"><img src="${ contextPath }/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                        </c:otherwise>					
                    </c:choose>
                    
                    <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
                        <div class="page-item"><a class="page-link" href="/thrifty/co_purchase?currPage=${item}&scNo=${map.scNo}">${item }</a></div>
                    </c:forEach>
                    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <img src="${ contextPath }/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;">
                        </c:when>
                        <c:otherwise>
                            <div class="page-item"><a class="page-link" href="/thrifty/co_purchase?currPage=${map.currPage+1}&scNo=${map.scNo}"><img src="${ contextPath }/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                        </c:otherwise>					
                    </c:choose>
				</div>
                <div id="searchWrite">
                <form action="co_purchase">
                    <div></div>
                    <div id="search_content">
                        <div class="selectBox2 ">
                            <input type="text" class="label" value="제목" name="condition">  <!-- ajax로 label value값 넘겨서 뜨게해야됨 -->
                            <ul class="optionList">
                              <li class="optionItem">제목</li>
                              <li class="optionItem">작성자</li>
                              <li class="optionItem">내용</li>
                            </ul>
                        </div>
                        <input type="text" id="search_box" name="keyword">
                        <input type="submit" value="검색" id="search_submit">
                    </div>
	                <div>
	                    <c:if test="${loginUser != null}">
	                        <a href="${ contextPath }/co_purchase/enroll" id="write_content">글쓰기</a>
	                        <!-- <input type="submit" value="글쓰기" id="write_content"> -->
	                    </c:if>
	                </div>
	                </form>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
    <script src="${ contextPath }/resources/js/co_purchase/main.js"></script>
</body>
</html>