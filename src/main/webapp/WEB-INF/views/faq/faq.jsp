<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/thrifty/resources/css/faq/faq.css">
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<div class="wrap">
		<div id="body">
			<div id="main_event">
				<div id="main_menu">
					<div>
						<img src="/thrifty/resources/images/main/icon/room-mate.png" class="main_menu_icon" catUNo="2" alt="">
						<div class="main_text_icon">쉐어 하우스</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/car-sharing.png" class="main_menu_icon" catUNo="3" alt="">
						<div class="main_text_icon">카풀</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/second-hand.png" class="main_menu_icon" catUNo="4" alt="">
						<div class="main_text_icon">중고 거래</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/exchange.png" class="main_menu_icon" catUNo="5" alt="">
						<div class="main_text_icon">심부름 / 알바</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/supply-chain.png" class="main_menu_icon" catUNo="6" alt="">
						<div class="main_text_icon">공동 구매</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/pet-love.png" class="main_menu_icon" catUNo="7" alt="">
						<div class="main_text_icon">소모임</div>
					</div>
				</div>
			</div>
			<div class="faq-accordion">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									Collapsible Group Item #1
								</button>
							</h2>
						</div>
						
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								Some placeholder content for the first accordion panel. This panel is shown by default, thanks to the <code>.show</code> class.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Collapsible Group Item #2
								</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">
								Some placeholder content for the second accordion panel. This panel is hidden by default.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									Collapsible Group Item #3
								</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">
								And lastly, the placeholder content for the third and final accordion panel. This panel is hidden by default.
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
	<script>
		$('.main_menu_icon').on('click', function(){
			let catUNo = $(this).attr('catUNo');

			$.ajax({
				url:
				data: catUNo
			});
		})
	</script>
</body>
</html>