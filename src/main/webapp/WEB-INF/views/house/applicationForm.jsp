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
.ex {
    width: 45% !important;
    padding: 0px;
    margin: 0px;
}

#modal-applicationForm #injung{
	width: 5%
}

    </style>
</head>
<body>

    <div onclick="khalert('tq')">tq</div>

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

    <div id="modal-applicationForm" class="modal-mainBox"> 
		<div class="modal-background">
			<div class="modal-container">
                <p>투어 신청문의</p>
                <form>
                <label for="name" >* 이름</label><br>
                <input type="text" placeholder="이름" name="name" id="name"> <br>
                <label for="age" >* 나이</label><br>
                <input type="number" placeholder="나이" name="age" id="age"> <br>
                <label for="phone" >* 핸드폰번호</label><br>
                <input  type="tel" placeholder="핸드폰번호" name="phone" id="phone"> <br>
                <label for="email" >* 이메일</label><br>
                <input type="email" placeholder="핸드폰번호" name="email" id="email"> <br>
                <input type="text" class="ex" placeholder="" name="Hname" id="Hname">
                <input type="text" class="ex" placeholder="" name="Hnumber" id="Hnumber"> <br>
                <label for="moveIn" >* 희망입주일</label><br>
                <input type="date" placeholder="희망입주일" name="moveIn" id="moveIn"> <br>
                <label for="enquiry" >문의사항</label><br>
                <textarea placeholder="문의사항을 입력해주세요." id="enquiry"></textarea> <br>
                <input type="checkbox" name="injung" id="injung">
                <label  for="injung">개인정보수집에 동의합니다.</label> <br>
                <button>신청하기</button>

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
			$('#modal-button').focus();
		}
		
		$('#modal-button').keyup(function () {
                if (window.event.keyCode == 13) {
                    document.getElementById('modal-alert').style.display = 'none';
                }
            });
		
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
		
		
		
		
	
    </script>
</body>
</html>