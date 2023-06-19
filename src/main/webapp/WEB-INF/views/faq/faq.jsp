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
			<div class="page_title">FAQ</div>
			<div id="main_event">
				<div id="main_menu">
					<div>
						<img src="/thrifty/resources/images/main/icon/room-mate.png" class="main_menu_icon" catUNo="24" alt="">
						<div class="main_text_icon">쉐어 하우스</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/car-sharing.png" class="main_menu_icon" catUNo="25" alt="">
						<div class="main_text_icon">카풀</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/second-hand.png" class="main_menu_icon" catUNo="26" alt="">
						<div class="main_text_icon">중고 거래</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/exchange.png" class="main_menu_icon" catUNo="27" alt="">
						<div class="main_text_icon">심부름 / 알바</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/supply-chain.png" class="main_menu_icon" catUNo="28" alt="">
						<div class="main_text_icon">공동 구매</div>
					</div>
					<div>
						<img src="/thrifty/resources/images/main/icon/pet-love.png" class="main_menu_icon" catUNo="29" alt="">
						<div class="main_text_icon">소모임</div>
					</div>
				</div>
			</div>
			<div class="accordion" id="faq-accordion">
				<p style="text-align: center;">선택해 주세요.</p>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<jsp:include page="../common/rightside.jsp"/>
	<script>
		$('.main_menu_icon').on('click', function(){
			let catUNo = $(this).attr('catUNo');

			$.ajax({
				url: 'faq/selectList',
				data: { catUNo },
				dataType: 'json',
				success: function(result){
					$('#faq-accordion').empty();
					console.log(result);
					let faqList = "";
					result.forEach((faq, index) => {
						faqList +=  `<div class="card">
										<div class="card-header" id="faqTitle-`+(index+1)+`">
											<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#faqContent-`+(index+1)+`" aria-expanded="false" aria-controls="faqContent-`+(index+1)+`">
												`+faq.title+`
											</button>
											</h2>
										</div>
								
										<div id="faqContent-`+(index+1)+`" class="collapse" aria-labelledby="faqTitle-`+(index+1)+`" data-parent="#faq-accordion">
											<div class="card-body">
												`+faq.content+`
											</div>
										</div>
									</div>`
					});

					$('#faq-accordion').html(faqList);
				}
			});
		})
	</script>
</body>
</html>