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
			console.log(roomNo.value);
			console.log("durl");
			 $.ajax({
				url : "/thrifty/sharehouse/tourApply",
				data : {
					roomNo : roomNo.value, 
					moveIn : moveIn.value,
					enquiry : enquiry.value
					},
				success : function(result){
					console.log(result);
					alert('투어신청이 완료되었습니다.');
				}
			}) 
			document.getElementById('modal-applicationForm').style.display = 'none';
		}) // 신청하기 누르면 모달 사라짐

		document.getElementById("closebtn").addEventListener('click',function(){
			document.getElementById('modal-applicationForm').style.display = 'none';
		})// x 모달 사라짐
		
		function appform(hName, rName, roomNo){
			document.getElementById('modal-applicationForm').style.display = 'flex';
			document.getElementById('hName').innerHTML = hName;
			document.getElementById('rName').innerHTML = rName;
			document.getElementById('roomNo').value = roomNo;
		} // appform 함수 호출 시 모달창 열림

		
		/* chat */
		document.getElementById("closeChat").addEventListener('click',function(){
			document.getElementById('modal-chat').style.display = 'none';
		}) // 닫기

		function openChat(){
			document.getElementById('modal-chat').style.display = 'flex';
		} // 함수 호출 시 모달창 열림