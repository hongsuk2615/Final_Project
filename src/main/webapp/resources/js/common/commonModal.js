function wishList(element){
    let bNo=$(element).attr("bno");
    console.log(bNo);
    $.ajax({
        url : "/thrifty/wishList/insert",
        data : {bNo},
        success : function(result){
            console.log(result);
            if(result == 1){
                Swal.fire({
                    position: 'top-center',
                    icon: 'success',
                    title: '찜완료',
                    showConfirmButton: false,
                    timer: 1000
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


            }else if(result == 2){
                Swal.fire({
                    position: 'top-center',
                    icon: 'error',
                    title: '이미 찜한 게시글입니다.',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
        }
    })
}

function deleteWishList(element){
    let bNo=$(element).attr("bno");
    console.log(bNo);
    $.ajax({
        url : "/thrifty/wishList/delete",
        data : {bNo},
        success : function(result){
            console.log(result);
            if(result == 1){
                Swal.fire({
                    position: 'top-center',
                    icon: 'success',
                    title: '찜삭제완료',
                    showConfirmButton: false,
                    timer: 1000
                }).then(()=>{location.reload();});
            }
        }
    })
}

var catList = {};
$.ajax({
    url: "/thrifty/report/list",
    dataType : 'json',
    contentType: 'application/json; charset=utf-8',
    success(data){
        for(cat of data){
            catList[cat.reportCategoryNo] = cat.reportCategoyName;
        }
    }
});

function reportAjax(param){
        $.ajax({
        url : "/thrifty/report/insert",
        data : param,
        contentType: 'application/json; charset=utf-8',
        success(result){
            console.log(result);
            if(result == 1){
                Swal.fire({
                    position: 'top-center',
                    icon: 'success',
                    title: '신고완료',
                    showConfirmButton: false,
                    timer: 1000
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


            }else if(result == 2){
                Swal.fire({
                    position: 'top-center',
                    icon: 'error',
                    title: '이미 신고한 게시글입니다.',
                    showConfirmButton: false,
                    timer: 1000
                })
            }else if(result ==3){
                Swal.fire({
                    position: 'top-center',
                    icon: 'warning',
                    title: '신고항목을 선택하세요.',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
        }
    });
}


function reportBoard(element){
    let bNo = $(element).attr("bno");
    let rNo = $(element).attr("rno");
    
    const { value: fruit } = Swal.fire({
        title: '신고항목을 고르세요',
        input: 'select',
        inputOptions: catList,
        inputPlaceholder: '신고항목',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '신고하기',
        cancelButtonText: '취소',
        inputValidator: (value) => {
            let param = {};
            param["reportCategoryNo"] = value;

            if(typeof(bNo) == "undefined"){
                param["rNo"] = rNo;
            }else{
                param["bNo"] = bNo;
            }
            console.log(param);
            reportAjax(param);
        }
    })
}

async function sendMessage(element){
    let receiver = $(element).attr("uNo");
    let seller = $(element).attr("seller");
    const { content: text } = await Swal.fire({
                                                input: 'textarea',
                                                title: seller+'에게 메세지 보내기',
                                                inputPlaceholder: '보낼메세지를 작성하세요',
                                                inputAttributes: {
                                                    'aria-label': 'Type your message here'
                                                },
                                                inputValidator: (content) => {
                                                    if (!content) {
                                                    return '빈메세지는 전송하지 않습니다.';
                                                    }else{

                                                        $.ajax({
                                                            url : "/thrifty/message/insert",
                                                            data : {content, receiver},
                                                            success : function(result){
                                                                console.log(result);
                                                                if(result == 1){
                                                                    Swal.fire({
                                                                        position: 'top-center',
                                                                        icon: 'success',
                                                                        title: '전송완료',
                                                                        showConfirmButton: false,
                                                                        timer: 1000
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
                                                                }
                                                            },
                                                            error : function(){
                                                                Swal.fire({
                                                                            position: 'top-center',
                                                                            icon: 'error',
                                                                            title: '전송실패',
                                                                            showConfirmButton: false,
                                                                            timer: 1000
                                                                        })
                                                            }
                                                        })
                                                    }
                                                },
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: '쪽지보내기',
                                                cancelButtonText: '취소'
                                            });

}

function deleteBoard(element){
    Swal.fire({
            title: '정말삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네, 삭제할게요!',
            cancelButtonText: '아니오!',
            }).then((result) => {
                if (result.isConfirmed) {
                    let bNo = $(element).attr("bNo");
                    let url = $(element).attr("url");
                    $.ajax({
                        url : "/thrifty/board/delete",
                        data : {bNo},
                        success : function(result){
                            console.log(result);
                            if(result == 1){
                                Swal.fire({
                                    position: 'top-center',
                                    icon: 'success',
                                    title: '삭제완료',
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
                                        title: '삭제실패',
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
                                        title: '삭제실패',
                                        showConfirmButton: false,
                                        timer: 1000
                                    })
                        }

                    })
                }
            })

}
