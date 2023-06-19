<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<c:set var="categorySNo" value="${map.categorySNo}"/>
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
					<a class="board_enroll_btn" href="${contextPath}/freeBoard/enroll">글 작성</a>
				</div>
				<div class="freeBoard_bottom">
					<div class="freeBoard_category">
						<a class="freeBoardCategory" cat="0" href="${contextPath}/freeBoard?categorySNo=0&currentPage=1">전체</a>
						<c:forEach var="sCat" items="${subCategoryList}">
							<c:if test="${sCat.categoryUNo eq 8}">
								<a class="freeBoardCategory" cat="${sCat.categorySNo}" href="${contextPath}/freeBoard?categorySNo=${sCat.categorySNo}&currentPage=1">${sCat.categorySName}</a>
							</c:if>
						</c:forEach>
					</div>
					<ul class="freBoard_list_warpper">
						<c:forEach var="list" items="${list}">
							<li class="board_li">
								<div class="board_mapper">
									<div class="board_mapper_left">
										<div class="board_img">
											<img src="${contextPath}/resources/images/admin/adminProfile.jpg">
										</div>
										<div class="board_attr">
												<span class="board_title">
														<a href="${contextPath}/freeBoard/detail?bNo=${list.boardNo}">[${list.subCategoryName}] ${list.title}</a>
												</span>
												<div class="read">
													<svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 24 24" width="16px" fill="#ccc"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
													<span class="readCount">${list.readCount}</span>
												</div>
												
										</div>
									</div>
									<div class="board_mapper_right">
											<span class="nickName">${list.nickName}</span>
											<span>&nbsp;|&nbsp;</span>
											<span class="createDate">${list.createDate}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
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
							<div class="page-item pagingbar_count ${pi.currentPage eq item ? 'tab tab1':'' }"><a class="page-link" href="/thrifty/freeBoard?categorySNo=${categorySNo}&currentPage=${item}">${item}</a></div>
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
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
		const urlParams = new URL(location.href).searchParams;
		const categorySNo = urlParams.get('categorySNo');

		$.each($('.freeBoardCategory'), function(index, item){
			if(categorySNo == $(item).attr('cat')){
				$(item).addClass('active');
				return false;
			}else if(categorySNo == null){
				$($(item)[0]).addClass('active');
				return false;
			}
		});
	</script>
	<script>
		 <c:if test="${not empty alert}">
			alert("${alert}");
			<c:remove var="alert" />
		</c:if>
	</script>
</body>
</html>