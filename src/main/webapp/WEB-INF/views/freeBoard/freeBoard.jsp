<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/freeBoard/freeBoard.css">
<style>
	* {
		/* border: 1px solid blue !important; */
		box-sizing: border-box;
	}
	
	body {
		margin: 0;
	}
	
	#wrapper {
		min-width: 1180px;
	}
	
	#header {
		height: 140px;
	}
	
	#body {
		max-width: 1000px;
		padding: 40px 0px;
		margin: auto;
	}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="wrap">
		<div id="body">
			<div class="freeBoard_mapper">
				<div class="freeBoard_top">
					<h2>자유 게시판</h2>
					<a href="${contextPath}/freeBoard/enroll">글 작성</a>
				</div>
				<div>
					<ul>
						<li>
							<div class="board_mapper">
								<div class="board_mapper_left">
									<div class="board_img">
										<img src="${contextPath}/resources/images/admin/adminProfile.jpg">
									</div>
									<div class="board_attr">
										<div>
											<span class="board_title">제목제목제목 제목</span>
										</div>
										<div>
											<span>꿀꾸루</span>
										</div>
									</div>
								</div>
								<div class="board_mapper_right">
									<div class="board_creatDate">
										<span>2010.10.01</span>
									</div>
									<div class="board_reacCount">
										<span>10</span> <!--눈 아이콘 넣을 예정-->
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div id="pagingbar">
                <c:choose>
                    <c:when test="${pi.currentPage eq 1}">
                        <img src="/thrifty/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;">
                    </c:when>
                    <c:otherwise>
                        <img src="/thrifty/resources/images/main/icon/back-1.png" alt="" style="width: 25px; height: 25px;">
                    </c:otherwise>
                </c:choose>
                <c:forEach var="item" begin="${pi.startPage}" end="${pi.endPage}">
                    <c:choose>
                        <c:when test="${pi.currentPage == item}">
                            <div class="page-item"><a class="page-link" href="/thrifty/freeBoard?categorySNo=${categorySNo}&currentPage=${item}">${item}</a></div>
                        </c:when>
                        <c:otherwise>
                            <li class="paginate_button page-item">
                                <div class="page-item"><a class="page-link" href="/thrifty/freeBoard?categorySNo=${categorySNo}&currentPage=${item}">${item}</a></div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage}">
                        <div class="page-item"><a class="page-link" href="/thrifty/freeBoard?categorySNo=${categorySNo}&currentPage=${item+1}"><img src="/thrifty/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                    </c:when>
                    <c:otherwise>
                        <li class="paginate_button page-item next">
                            <div class="page-item"><a class="page-link" href="/thrifty/freeBoard?categorySNo=${categorySNo}&currentPage=${item+1}"><img src="/thrifty/resources/images/main/icon/next-1.png" alt="" style="width: 25px; height: 25px;"></a></div>
                        </li>
                    </c:otherwise>
                </c:choose>  
            </div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
		 <c:if test="${not empty alert}">
			alert("${alert}");
			<c:remove var="alert" />
		</c:if>
	</script>
</body>
</html>