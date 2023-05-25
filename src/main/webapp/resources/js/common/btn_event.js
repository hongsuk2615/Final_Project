document.getElementById('wish-btn').addEventListener('click', function(){
    Swal.fire({
                position: 'top-center',
                icon: 'success',
                title: '찜완료',
                showConfirmButton: false,
                timer: 1500
            })
})

document.getElementById('inquiry-btn').addEventListener('click', async function(){
    const { value: text } = await Swal.fire({
                                                input: 'textarea',
                                                inputLabel: '000에게 메세지 보내기',
                                                inputPlaceholder: '보낼메세지를 작성하세요',
                                                inputAttributes: {
                                                    'aria-label': 'Type your message here'
                                                },
                                                inputValidator: (value) => {
                                                    if (!value) {
                                                    return '빈메세지는 전송하지 않습니다.';
                                                    }else{
                                                        alert("메세지 전송");
                                                    }
                                                },
                                                showCancelButton: true
                                            });
                                            document.getElementsByClassName('swal2-confirm')[0].addEventListener('click',function(){
    
})
})