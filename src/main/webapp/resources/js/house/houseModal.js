
			function appform(hName, rName, roomNo, gender){
			document.getElementById('modal-applicationForm').style.display = 'flex';
			document.getElementById('hName').innerHTML = hName;
			document.getElementById('rName').innerHTML = rName;
			document.getElementById('gender').innerHTML = gender;
			document.getElementById('roomNo').value = roomNo;
		} // appform 함수 호출 시 모달창 열림
		
		/* applicationForm */
		document.getElementById("apply").addEventListener('click',function(){
			 $.ajax({
				url : "/thrifty/sharehouse/tourApply",
				data : {
					roomNo : roomNo.value, 
					moveIn : moveIn.value,
					enquiry : enquiry.value
					},
				beforeSend: function(){
					if(!$('#injung').is(':checked')){
						Swal.fire({
                    position: 'top-center',
                    icon: 'warning',
                    title: '개인정보수집에 동의하여주세요.',
                    showConfirmButton: false,
                    timer: 1000
                })
						return false;
					}
				},
				success : function(result){
					console.log(result);
					if(result > 0){
					Swal.fire({
                    position: 'top-center',
                    icon: 'success',
                    title: '투어신청이 완료되었습니다.',
                    showConfirmButton: false,
                    timer: 1000
                })
					}else{
					Swal.fire({
                    position: 'top-center',
                    icon: 'error',
                    title: '이미 신청한 방입니다.',
                    showConfirmButton: false,
                    timer: 1000
                })
					}
					document.getElementById("moveIn").value='';
					document.getElementById("enquiry").value='';
					document.getElementById('modal-applicationForm').style.display = 'none';
				}
			}) 
			
		})
		document.getElementById("closebtn").addEventListener('click',function(){
					document.getElementById("moveIn").value='';
					document.getElementById("enquiry").value='';
					document.getElementById("injung").checked = false;
			document.getElementById('modal-applicationForm').style.display = 'none';
		})// x 모달 사라짐
		
		document.getElementById("closebtn2").addEventListener('click',function(){
			document.getElementById('modal-applicationForm2').style.display = 'none';
		})// x 모달 사라짐
		
		/* chat */
		document.getElementById("closeChat").addEventListener('click',function(){
			document.getElementById('modal-chat').style.display = 'none';
		}) // 닫기

		function openChat(){
			document.getElementById('modal-chat').style.display = 'flex';
		} // 함수 호출 시 모달창 열림
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		