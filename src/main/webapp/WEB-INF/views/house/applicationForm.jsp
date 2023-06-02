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

        /* 모달 */
.modal-mainBox{
	position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index:2;
}

#modal-alert{
	display: none;
}

.modal-background{
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	display: flex;
    justify-content: center;
    padding-top: 10px;
}

.modal-container{
	 position: relative;
	background: white;
	min-width: 400px;
	height: 110px;
	border-radius: 6px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	display: flex;
	justify-content: center;
	align-items: center;
}

#modal-contents, #modal-confirm-content{
	margin: 0px 16px 16px 16px;
}

#modal-button{
	background: skyblue;
	border-radius: 2px;
    border: 1px solid skyblue;
    position: absolute;
    right: 10px;
    bottom: 10px;
    width: 50px;
    height: 25px;
    outline : transparent;
}

#modal-button span{
	color: white;
}

#modal-confirm{
	display: none;
}
#modal-yes-button{
	background: skyblue;
	border-radius: 2px;
    border: 1px solid skyblue;
    position: absolute;
    right: 65px;
    bottom: 10px;
    width: 50px;
    height: 25px;
}

#modal-no-button{
	background: skyblue;
	border-radius: 2px;
    border: 1px solid skyblue;
    position: absolute;
    right: 10px;
    bottom: 10px;
    width: 50px;
    height: 25px;
}

#modal-applicationForm .modal-container{
	 position: relative;
     top: 100px;
	background: white;
	min-width: 400px;
	height: 610px;
	border-radius: 6px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	display: flex;
    flex-direction: column;
	/* justify-content: center; */
	/* align-items: center; */
}

#modal-applicationForm input{
    width: 90%;
}

#modal-applicationForm input[type='radio']{
    width: 5%;
}

.ex {
    width: 45% !important;
    padding: 0px;
    margin: 0px;
}

#modal-applicationForm #injung{
	width: 5%
}

#modal-applicationForm textarea {
    width: 90%;
    height: 6.25em;
    resize: none;
}

#modal-applicationForm button{
        width:100px;
        margin:auto;
        display:block;
    }

	.closeModal{
		width: 80%;
		display: flex;
		justify-content: end;
		
	}

	#closebtn{
		cursor: pointer;
	}

	#modal-applicationForm{
	display: none;
}




	#modal-chat .modal-container{
     top: 8%;
	background: white;
	width: 500px;
	height: 800px;
	border-radius: 6px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	flex-direction: column;
    align-items: center;
}

	#chattingView{
	background: url(quokka.jfif) no-repeat;
	background-repeat : no-repeat;
	background-size : cover;
	border-radius: 5px;
	width: 90%;
	height: 90%;
	position: relative;
	}


	#chatheader{
		display: flex;
		align-items: baseline;
	}

	#chatheader *{
		margin: 10px 40px;
	}

	.input-area textarea{
		width: 75%;
		height: 2.25em;
		resize: none;
		margin-right: 10px;
	}

	.input-area{
		position: absolute;
		width: 100%;
		bottom: 3%;
		margin-left: 5%;
		display: flex;
		align-items: center
	}

	#modal-chat ul, #modal-chat li{
		margin: 10px 5px;
		padding: 0;
		list-style: none;
	}

	.myChat{
		text-align: right;
		
	}

	.chat{
		display : inline-block;
		border-radius : 5px;
		padding : 5px;
		background-color : #eee;
		word-break: break-all;
		position: relative;
	}

	.myChat p {
		background-color : rgb(116, 226, 132);
	}

	.chatDate{
		position: absolute;
		font-size : 10px;
		bottom: 0px;
	}

	.myChat .chatDate{
		left: 2px;
	}

	.chat-contents .chatDate{
		bottom: -13px;
		right: 6px;
	}

	.chat-profileImg{
		margin-right: 7px;
	}

	.chat-profileImg>img{
		width: 40px;
		height: 40px;
	}

	#modal-chat button{
		cursor: pointer;
		background: #eee;
		border: none;
		border-radius: 5px;
		width: 60px;
		height: 30px;

	}

	.chat-div{
		display: flex;
	}

	.chat-div p{
		margin: 3px;
	}


	.chat-contents{
		max-width: 90%;
	}
	.chat-box, .chat-contents{
		display: inline-block;
		position: relative;
	}

    </style>
</head>
<body>

    <div onclick="khalert('tq')">tq</div>
	<div onclick="appform()">ㅇㅇ</div>

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
                <p>투어 신청문의</p>
                <form>
                <label for="name" >* 이름</label><br>
                <input type="text" placeholder="이름" name="name" id="name" disabled> <br>
                <label for="age" >* 성별</label><br>
                <input type="radio" name="gender" id="gender" disabled> 남자
				<input type="radio" name="gender" id="gender" disabled> 여자<br>
                <label for="phone" >* 연락처</label><br>
                <input  type="tel" placeholder="연락처" name="phone" id="phone" disabled> <br>
                <label for="email" >* 이메일</label><br>
                <input type="email" placeholder="핸드폰번호" name="email" id="email" disabled> <br>
                <input type="text" class="ex" placeholder="" name="Hname" id="Hname" disabled>
                <input type="text" class="ex" placeholder="" name="Hnumber" id="Hnumber" disabled> <br>
                <label for="moveIn" >* 희망입주일</label><br>
                <input type="date" placeholder="희망입주일" name="moveIn" id="moveIn"> <br>
                <label for="enquiry" >문의사항</label><br>
                <textarea placeholder="문의사항을 입력해주세요." id="enquiry"></textarea> <br>
                <input type="checkbox" name="injung" id="injung">
                <label  for="injung">개인정보수집에 동의합니다.</label> <br><br>
                <button id="apply" type="button">신청하기</button>

                </form>
			</div>
		</div>
	</div>



    <script>
        /**
         * 
         */

		/* alert */
		document.getElementById("modal-button").addEventListener('click',function(){
			document.getElementById('modal-alert').style.display = 'none';
		})
		
		document.getElementById('modal-alert').addEventListener("click", e => {
	    const evTarget = e.target
	    if(!evTarget.classList.contains("modal-container")) {
	    	document.getElementById('modal-alert').style.display = 'none';
		    }
		})
		
		function khalert(text){
			document.getElementById('modal-contents').innerHTML = text;
			document.getElementById('modal-alert').style.display = 'flex';
			// $('#modal-button').focus();
		}
		
		// $('#modal-button').keyup(function () {
        //         if (window.event.keyCode == 13) {
        //             document.getElementById('modal-alert').style.display = 'none';
        //         }
        //     });
		
		/* confirm */
		document.getElementById("modal-yes-button").addEventListener('click',function(){
			document.getElementById('modal-confirm').style.display = 'none';
			return true;
		})
		
		document.getElementById('modal-confirm').addEventListener("click", e => {
	    const evTarget = e.target
	    if(!evTarget.classList.contains("modal-container")) {
	    	document.getElementById('modal-confirm').style.display = 'none';
		    }
		})
		
		function khconfirm(text, yesbtn, nobtn){
		  
		
			document.getElementById('modal-confirm-content').innerHTML = text;
			document.getElementById('modal-confirm').style.display = 'flex';
			
			function eventHandler(){
				document.getElementById('modal-confirm').style.display = 'none';
				yesbtn();
			}
			function eventCancelHandler(){
				document.getElementById('modal-confirm').style.display = 'none';
				nobtn();
			}		
			document.getElementById("modal-yes-button").addEventListener('click',eventHandler);
			document.getElementById("modal-no-button").addEventListener('click',eventCancelHandler);
			
			document.getElementById('modal-confirm').addEventListener("click", e => {
	   			const evTarget = e.target
	    		if(!evTarget.classList.contains("modal-container")) {
	    			document.getElementById('modal-confirm').style.display = 'none';
	    			document.getElementById("modal-yes-button").removeEventListener('click',eventHandler);
		    	}
		})
		
			document.getElementById("modal-no-button").removeEventListener('click',eventHandler);
		}

		
		/* applicationForm */
		document.getElementById("apply").addEventListener('click',function(){
			document.getElementById('modal-applicationForm').style.display = 'none';
		}) // 신청하기 누르면 모달 사라짐

		document.getElementById("closebtn").addEventListener('click',function(){
			document.getElementById('modal-applicationForm').style.display = 'none';
		})// x 모달 사라짐
		
		function appform(){
			document.getElementById('modal-applicationForm').style.display = 'flex';
		} // appform 함수 호출 시 모달창 열림

		
		/* chat */
		document.getElementById("closeChat").addEventListener('click',function(){
			document.getElementById('modal-chat').style.display = 'none';
		}) // 닫기

		function openChat(){
			document.getElementById('modal-chat').style.display = 'flex';
		} // 함수 호출 시 모달창 열림
	
    </script>
</body>
</html>