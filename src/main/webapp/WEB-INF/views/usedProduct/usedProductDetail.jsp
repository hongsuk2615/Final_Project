<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/usedProduct/usedProductDetail.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Document</title>
<style>
    *{
        /* border: 1px solid blue !important; */
        box-sizing: border-box;
    }
    body{
        margin: 0;
    }
    #wrapper{
        min-width: 1180px;
        padding-bottom: 70px;
    }

    #header{
        height: 140px;
    }
    #body{
        padding: 40px;
        display: flex;
        justify-content: center;
    }

    #body-left{
        display: inline-block;
        width: 20%;
        min-width: 350px;
        min-height: 900px;
        background-color: rgb(0, 60, 120);
        margin-right: 10px;
    }
    

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <div id="body-right-header">
                    <div id="body-right-category">[중고거래 카테고리명]</div>
                    <div class="flex-spacebetween">
                        <div id="body-right-title">
                            글제목입니다
                        </div>
                        <div id="body-right-date-count">
                            작성일 : 2023-05-18 
                            조회수 : 99
                        </div>
                    </div>            
                </div>
                <div id="body-right-body">
                    <div id="item-info">
                        <div id="item-imgs">
                            <swiper-container style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="mySwiper"
                            thumbs-swiper=".mySwiper2" space-between="10" navigation="true">
                            <swiper-slide>
                              <img class="main-img" src="https://swiperjs.com/demos/images/nature-1.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="main-img" src="https://swiperjs.com/demos/images/nature-2.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="main-img" src="https://swiperjs.com/demos/images/nature-3.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="main-img" src="https://swiperjs.com/demos/images/nature-4.jpg" />
                            </swiper-slide>
                          </swiper-container>
                        
                          <swiper-container class="mySwiper2" space-between="15" slides-per-view="4" free-mode="true"
                            watch-slides-progress="true">
                            <swiper-slide>
                              <img class="sub-img" src="https://swiperjs.com/demos/images/nature-1.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="sub-img" src="https://swiperjs.com/demos/images/nature-2.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="sub-img" src="https://swiperjs.com/demos/images/nature-3.jpg" />
                            </swiper-slide>
                            <swiper-slide>
                              <img class="sub-img" src="https://swiperjs.com/demos/images/nature-4.jpg" />
                            </swiper-slide>
                          </swiper-container>
                        </div>
                        <div id="item-details">
                            <div id="item-name"> 상품명 : </div>
                            <div>판매가격</div>
                            <div id="item-price">
                                10000원
                            </div>
                            <div>거래수단</div>
                            <div id="item-tradeMethod">택배/직거래</div>
                            <div>지역</div>
                            <div id="item-location">서울시</div>
                            <div>판매자</div>
                            <div id="item-seller">
                                <img src="" width="60" height="60" alt="프로필사진">
                                <div>닉네임</div>
                            </div>
                            <div id="item-btns">
                                <div id="inquiry-btn">구매문의</div>
                                <div id="wish-btn">찜</div>
                            </div>
                        </div>
                    </div>
                    <div id="body-right-content">
                        내용부분  
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
        <script>
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

            
        </script>
    </div>

    <!--swiper cdn  -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
    

    
</body>
</html>