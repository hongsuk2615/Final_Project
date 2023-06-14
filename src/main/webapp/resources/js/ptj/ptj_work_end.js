document.getElementById('work-end-btn').addEventListener('click',function(){

    Swal.fire({
            title: '구인 완료 하셨습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네, 구인했어요!',
            cancelButtonText: '아니오!',
            }).then((result) => {
                if (result.isConfirmed) {
                    let bNo = $(this).attr("bNo");
                    let url = $(this).attr("url");
                    $.ajax({
                        url : "/thrifty/ptj/workEnd",
                        data : {bNo},
                        success : function(result){
                            console.log(result);
                            if(result == 1){
                                Swal.fire({
                                    position: 'top-center',
                                    icon: 'success',
                                    title: '구인완료',
                                    showConfirmButton: false,
                                    timer: 1000
                                }).then(()=>{
                                    location.href="/thrifty/"+url; 
                                })
                            }else if(result == -1){
                                Swal.fire({
                                    position: 'top-center',
                                    icon: 'warning',
                                    title: '비로그인 상태입니다.',
                                    showConfirmButton: false,
                                    timer: 1000
                                }).then(()=>{
                                        login();
                                })
                            }else if(result == 0){
                                Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: '작동 실패',
                                        text : '관리자/작성자가 아닙니다.',
                                        showConfirmButton: false,
                                        timer: 1000
                                    })
                            }
                        },
                        error : function(){
                            Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: '작동 실패',
                                        showConfirmButton: false,
                                        timer: 1000
                                    })
                        }

                    })
                }
            })
    
})