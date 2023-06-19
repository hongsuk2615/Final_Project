<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/usedProduct/usedProductDetail.css">
    <title>Document</title>
<style>
    *{
        /* border: 1px solid blue !important; */
        box-sizing: border-box;
    }
    
    body{
        margin: 0;
    }
    footer {
        margin: 0;
    }

    #wrapper{
        min-width: 1180px;
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
    .swiper-slide-thumb-active{
        border: 2px solid orange;
        border-radius: 5px;
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
                    <div id="body-right-category">[중고거래 ${usedProduct.categoryName}]${usedProduct.isSoldOut == 'Y'? '<img onerror="this.src=/thrifty/resources/images/common/noImage.png"src="/thrifty/resources/images/usedProduct/giphy.gif" style="border-radius:10px;"width="60" height="40">':'' }</div>
                    <div class="flex-spacebetween">
                        <div id="body-right-title">
                            ${board.title}
                        </div>
                        <div id="body-right-date-count">
                            작성일 : ${board.createDate} 
                            조회수 : ${board.readCount }
                        </div>
                    </div>            
                </div>
                <div id="body-right-body">
                    <div id="item-info">
                        <div id="item-imgs">
                            <swiper-container style="--swiper-navigation-color: #3498db; --swiper-pagination-color: #3498db;" class="mySwiper"
                            thumbs-swiper=".mySwiper2" space-between="10" navigation="true">
                            <c:forEach var="image" items="${imageList}">
		                		<swiper-slide>
                              		<img class="main-img" onerror="this.src='/thrifty/resources/images/common/noImage.png'" src="${contextPath}/resources/upfiles/usedProduct/${image.changeName}" />
                            	</swiper-slide>
		                	</c:forEach> 
                          </swiper-container>
                        
                          <swiper-container class="mySwiper2" space-between="15" slides-per-view="4" free-mode="true"
                            watch-slides-progress="true">
	                        <c:forEach var="image" items="${imageList}">    
	                            <swiper-slide>
	                              <img class="sub-img" onerror="this.src='/thrifty/resources/images/common/noImage.png'" src="${contextPath}/resources/upfiles/usedProduct/${image.changeName}" />
	                            </swiper-slide>
	                        </c:forEach>    
                          </swiper-container>
                        </div>
                        <div id="item-details">
                            <div id="item-name"> 상품명 : ${usedProduct.productName} </div>
                            <div>판매가격</div>
                            <div id="item-price">
                                ${usedProduct.price}원
                            </div>
                            <div>거래수단</div>
                            <div id="item-tradeMethod">
	                            <c:choose>
	                            	<c:when test='${usedProduct.tradeMethod.equals("B") }'>
	                            		직거래/택배 둘다 가능
	                            	</c:when>
	                            	<c:when test='${usedProduct.tradeMethod.equals("D") }'>
	                            		직거래
	                            	</c:when>
	                            	<c:when test='${usedProduct.tradeMethod.equals("P") }'>
	                            		택배
	                            	</c:when>
	                            	
	                            </c:choose>
                            </div>
                            <div>지역</div>
                            <div id="item-location">${usedProduct.locationName}</div>
                            <div>판매자</div>
                            <div id="item-seller">
                                <img onerror="this.src='/thrifty/resources/images/common/noImage.png'" src="${seller.loginMethod eq 'N' ? '/thrifty/resources/upfiles/myPage/'+= seller.changeName : seller.changeName }" width="60" height="60" style="border-radius:50px" alt="프로필사진">
                                <div id="seller-info" style="margin-bottom: 0;">
                                    <div>${seller.userId}</div>
                                    <div>${seller.nickName}</div>
                                </div>
                            </div>
                            <div id="item-btns">
                                <div id="inquiry-btn" uNo = "${board.userNo}" seller="${seller.nickName}" onclick="sendMessage(this);">구매문의</div>
                                <div id="wish-btn" bNo ="${board.boardNo}" onclick="wishList(this);">찜</div>
                                <div id="report-btn" bNo="${board.boardNo}" onclick="reportBoard(this);">신고</div>
                            </div>
                       </div>
                    </div>
                    <div id="body-right-content">
                    	${board.content}
                    </div>
                    <c:if test="${loginUser.userNo eq board.userNo or loginUser.authority eq 0}">
	                    <div id="writer-btns">
	                    	<div id="soldOut-btn" bNo ="${board.boardNo}" onclick="soldOut(this)">판매완료</div>
	                        <div id="modify-btn" bNo ="${board.boardNo}" onclick="modifyBoard(this)">수정</div>
	                        <div id="delete-btn" bNo ="${board.boardNo}" url="usedProduct" onclick="deleteBoard(this)">삭제</div>
	                    </div>                    
                    </c:if>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
        <script src="/thrifty/resources/js/common/commonModal.js"></script>
        <script>        
            function modifyBoard(element){  
                let bNo = $(element).attr("bNo");
                location.href="/thrifty/usedProduct/modify?bNo="+bNo;
            } 
            
            function soldOut(element){
            	let bNo = $(element).attr("bNo");
            	Swal.fire({
                    title: '판매완료/대기',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '판매완료',
                    cancelButtonText: '판매대기',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            let bNo = $(element).attr("bNo");
                            $.ajax({
                                url : "/thrifty/usedProduct/soldOut",
                                data : {bNo},
                                success : function(result){
                                    console.log(result);
                                    if(result == 1){
                                        Swal.fire({
                                            position: 'top-center',
                                            icon: 'success',
                                            title: '판매완료',
                                            showConfirmButton: false,
                                            timer: 1000
                                        }).then(()=>{
                                            location.href="/thrifty/usedProduct/detail?bNo="+bNo;
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
                                                title: '실패',
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                }

                            })
                        }else{
                            let bNo = $(element).attr("bNo");
                            $.ajax({
                                url : "/thrifty/usedProduct/soldWaiting",
                                data : {bNo},
                                success : function(result){
                                    console.log(result);
                                    if(result == 1){
                                        Swal.fire({
                                            position: 'top-center',
                                            icon: 'success',
                                            title: '판매대기',
                                            showConfirmButton: false,
                                            timer: 1000
                                        }).then(()=>{
                                            location.href="/thrifty/usedProduct/detail?bNo="+bNo;
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
                                                title: '실패',
                                                showConfirmButton: false,
                                                timer: 1000
                                            })
                                }

                            })

                        }
                    })
            }
        </script>
    </div>

    <!--swiper cdn  -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
    

    
</body>
</html>