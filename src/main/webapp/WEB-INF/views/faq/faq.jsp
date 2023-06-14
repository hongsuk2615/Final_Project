<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/common/main.css">
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<div class="wrap">
		<div id="body">
			<div id="main_event">
				<div id="main_menu">
					<div>
						<a href="/thrifty/noticeBoard/"> <img
							src="/thrifty/resources/images/main/icon/promotion.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">공지사항</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/freeBoard/"> <img
							src="/thrifty/resources/images/main/icon/board.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">자유 게시판</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/sharehouse/"> <img
							src="/thrifty/resources/images/main/icon/room-mate.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">쉐어 하우스</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/carPool/"> <img
							src="/thrifty/resources/images/main/icon/car-sharing.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">카풀</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/usedProduct/"> <img
							src="/thrifty/resources/images/main/icon/second-hand.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">중고 거래</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/ptj/"> <img
							src="/thrifty/resources/images/main/icon/exchange.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">심부름 / 알바</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/co_purchase/"> <img
							src="/thrifty/resources/images/main/icon/supply-chain.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">공동 구매</div>
						</a>
					</div>
					<div>
						<a href="/thrifty/smallGroup/"> <img
							src="/thrifty/resources/images/main/icon/pet-love.png"
							class="main_menu_icon" alt="">
							<div class="main_text_icon">소모임</div>
						</a>
					</div>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp" />
			<div>
			
			</div>
		</div>
	</div>
</body>
</html>