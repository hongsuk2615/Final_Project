<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서 모달</title>
    <style>
    </style>
</head>
<body>

 <!--    <div onclick="khalert('tq')">tq</div>
	<div onclick="appform()">ㅇㅇ</div> -->

    <div id="modal-alert" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<p id="modal-contents"></p>
				<button id="modal-button"><span>확인</span></button>
			</div>
		</div>
	</div>

    <div id="modal-confirm" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<p id="modal-confirm-content"></p>
				<button class="confirmbtn" id="modal-yes-button" value=""><span>확인</span></button>
				<button class="confirmbtn" id="modal-no-button"><span>취소</span></button>
			</div>
		</div>
	</div>

	<div id="modal-chat" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<div id="chatheader">
					<button>목록</button>
					<p>쿼카님과 대화창</p>
					<button id="closeChat">닫기</button>
				</div>
				<div id="chattingView">
					<ul class="display-chatting">
						<!-- <c:forEach items="${list}" var="msg">
							<fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
							<c:if test="${msg.userNo == loginUser.userNo }"> -->
								<li class="myChat">
									<div class="chat-box">
									<p class="chat">${msg.message }
									</p>
									<span class="chatDate">${chatDate}</span>
								</div>
								</li>
							<!-- </c:if>
							
							<c:if test="${msg.userNo != loginUser.userNo }"> -->
								<li>
									<div class="chat-div">
										<div class="chat-profileImg"><img src="h1.jpg"></div>
										<div class="chat-contents">
											<b>${msg.nickName }</b>	<br>
											<p class="chat">${msg.message }
											</p>
											<span class="chatDate">${chatDate}</span>
										</div>
									</div>
								</li>
								
							<!-- </c:if>
						
						</c:forEach> -->
						
					</ul>
					
					<div class="input-area">
						<textarea id="inputChatting" row="3"></textarea>
						<button id="send">전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>

    <div id="modal-applicationForm" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
				<div class="closeModal"><div id="closebtn">X</div></div>
                <h3>투어 신청문의</h3>
                <form>
                <label for="name" >· 이름 : ${loginUser.userName }</label><br><br>
                <label for="age" >· 성별 : <span id="gender"> </span></label><br><br>
                <label for="phone" >· 연락처 : ${loginUser.phone }</label><br><br>
                <label for="email" >· 이메일 : ${loginUser.email }</label><br><br>
                · <span id="hName"> </span> / <span id="rName"></span><br><br>
                <input type="hidden" name="roomNo" id="roomNo">
                <label for="moveIn" >· 희망입주일</label><br>
                <input type="date" placeholder="희망입주일" name="moveIn" id="moveIn" required>  <br><br>
                <label for="enquiry" >문의사항</label><br>
                <textarea wrap="hard" placeholder="문의사항을 입력해주세요." name="enquiry" id="enquiry" required></textarea> <br>
                <input type="checkbox" name="injung" id="injung">
                <label for="injung">개인정보수집에 동의합니다.</label> <br><br>
                <button id="apply" type="button">신청하기</button>
                </form>
			</div>
		</div>
	</div>
	
	 <div id="modal-applicationForm2" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
			 <div class="closeModal"><div id="closebtn2">X</div></div>
			<div class="formWrap">
               
                <h3 style="text-align: center;">투어 신청문의</h3>
                <div id="checkApply"></div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>