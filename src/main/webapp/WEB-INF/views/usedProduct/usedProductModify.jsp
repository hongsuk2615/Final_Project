<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link rel="stylesheet" href="/thrifty/resources/css/usedProduct/usedProductEnroll.css">
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
    #body-right{
        display: inline-block;
        margin-left: 10px;
        width: 50%;
        min-width: 700px;
        min-height: 900px;
    }

    #footer{
        
    }
    .deleteImg{
        cursor: pointer;
    	opacity : 0;
    }
    .deleteImg:hover{
        opacity: 1;
    }

</style>
</head>
<body>
 <jsp:include page="../common/rightside.jsp"/>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <form action="/thrifty/usedProduct/modify" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th colspan="5">
                            <img src="/thrifty/resources/images/main/icon/second-hand.png" width="35" height="35">
                            <h1>중고거래 글수정</h1>
                        </th>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td colspan="4">
                            <input type="text" name="title" placeholder="제목을 입력하세요" value="${board.title}">
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td colspan="4">
                            <input type="text" name="productName" placeholder="상품명을 입력하세요" value="${usedProduct.productName }"required>
                        </td>
                    </tr>
                    <tr id="categoryAndLocation">
                        <th>카테고리</th>
                        <td>
                            <select name="categorySNo" id="">
                            	<c:forEach var="subCategory" items="${subCategoryList}">
	                            	<c:if test="${subCategory.categoryUNo eq 4 }">
	                            				<option value="${subCategory.categorySNo}" ${board.categorySNo eq subCategory.categorySNo ? "selected" : ""}>${subCategory.categorySName}</option>                       			
	                            	</c:if>
                             	</c:forEach>
                            </select>
                        </td>
                        <td style="text-align:center; font-weight : bold;">지역</td>
                        <td>
                            <select name="locationNo" id="">
                            	<c:forEach var="location" items="${locationList}">
                            				<option value="${location.locationNo}" ${usedProduct.locationNo eq location.locationNo ? "selected" : ""}>${location.locationName}</option>   
                                </c:forEach>
                            </select>
                    </td>
                        <td></td>
                    </tr>
                    <tr id="trade-method">
                        <th>거래방법</th>
                        <td>
                            <input type="radio" name="tradeMethod" id="direct" value="D" ${usedProduct.tradeMethod eq 'D' ? "checked": ""}>
                            <label for="direct">직거래</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="parcel" value="P" ${usedProduct.tradeMethod eq 'P' ? "checked": ""}>
                            <label for="parcel">택배</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="both" value="B" ${usedProduct.tradeMethod eq 'B' ? "checked": ""}>
                            <label for="both">둘다</label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td colspan="3">
                            <input type="number" name="price" placeholder="가격을 입력하세요" value="${usedProduct.price }">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>이미지<br>(최대10장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
                        <td colspan="4" style="padding : 10px 50px;">
                            <div id="image-slick" style="width: 620px; height:200px">
                                <c:forEach var="image" items="${imageList}">
                                    <div onclick='deleteOriginImg(this);' imgNo="${image.imgNo}" style='background-image: url("/thrifty/resources/upfiles/usedProduct/${image.changeName}"); background-size:cover; width:140px; height:200px;'><img class='deleteImg' src='/thrifty/resources/images/common/trash.gif' style='width:100%; height:100%;'></div>
                                </c:forEach>
                            </div>
                         </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 1px; padding: 0; margin: 0;">
                            <input type="file" name="images" multiple style="opacity : 0;" onchange="imagePreview(this);" required>
                            <input type="hidden" name="removeImgList" value="">
                            <input type="hidden" name="boardNo" value="${board.boardNo}">
                        </td>
                    </tr>
                    <tr id="boardContent">
                        <th>내용</th>
                        <td colspan="4">
                            <textarea name="content" id="" cols="30" rows="10">${board.content}</textarea>
                        </td>
                    </tr>
                </table>
                <div id="buttons">
                    <button type="button" id="cancel-btn" onclick="location.href='/thrifty/usedProduct/detail?bNo=${board.boardNo}'">취소</button>
                    <button id="complete-btn">수정완료</button>
                </div>
                </form>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
        <script type="text/javascript">
        	function insertImage(){
        		document.getElementsByName('images')[0].click();
        	}
            makeSlick();
            let originFileLength = $('.slick-track').children('div').filter(function(i, item){
                    return !$(item).hasClass('slick-cloned');
                }).length;
        	function imagePreview(arg){
                clearSlick();
        		if(arg.files.length + originFileLength >10){
        			alert("10개보다 많은 사진첨부 불가능");
        			console.log(arg.files);
        			arg.value='';
        		}else{
                    console.log(Array.from(arg.files));
	        		for(let i = 0; i < arg.files.length; i++){
	        			let reader = new FileReader();
	        			
	        			reader.onload = function(e){
	        				let url = e.target.result;
	        				// console.log("image"+i+":");
                            let lastModified = document.getElementsByName('images')[0].files[i].lastModified;
	        				 console.log(e);
	        			$("#image-slick").slick('slickAdd',"<div onclick='deleteImg(this);' lastModified='"+lastModified+"'index="+i+" style='background-image: url("+url+"); background-size:cover; width:140px; height:200px;'><img class='deleteImg' src='/thrifty/resources/images/common/trash.gif' style='width:100%; height:100%;'></div>");//
                           // $("#image-slick").children('div').eq(i).css({'backgroundImage':'url('+url+')', 'backgroundSize':'cover', 'width':'140px', 'height' : '200px'});
	        			}
	        			reader.readAsDataURL(arg.files[i]);
	        			console.log(reader);
	        			
	        				
	        			// document.getElementById('image'+i).src = e.
	        		}
	        		for(let i = arg.files.length; i < 10 ; i++){
	        			$("#image"+i).css('backgroundImage','none');
	        		}
	        		
        		}
        		
        	}
            let removeImgList = [];
            function deleteOriginImg(e){
                let index = -1;
                let arr = $('.slick-track').children('div').filter(function(i, item){
                    return !$(item).hasClass('slick-cloned');
                });
                arr.each(function(i, item){
                    console.log($(item).attr('index'));
                    if($(item).attr('imgNo')==$(e).attr('imgNo')){
                        index = i;
                    }
                })
                $("#image-slick").slick('slickRemove',index);
                removeImgList.push($(e).attr('imgNo'));
                $('[name="removeImgList"]').val(removeImgList);
                originFileLength--;
            }
        	
            function deleteImg(e){
                const files = Array.from(document.getElementsByName('images')[0].files);
                console.log(files);
                const dataTransfer = new DataTransfer();
                files.filter(file=>file.lastModified!=$(e).attr('lastModified')).forEach(file=>{
                    dataTransfer.items.add(file);
                })
                document.getElementsByName('images')[0].files = dataTransfer.files;

                let arr = $('.slick-track').children('div').filter(function(i, item){
                    return !$(item).hasClass('slick-cloned');
                });
                let index = -1;
                arr.each(function(i, item){
                    console.log($(item).attr('index'));
                    if($(item).attr('index')==$(e).attr('index')){
                        index = i;
                    }
                })
                $("#image-slick").slick('slickRemove',index);

            }
            

            function clearSlick(){
                let arr = $('.slick-track').children('div').filter(function(i, item){
                    return !$(item).hasClass('slick-cloned');
                })
                let totalLength = arr.length;
                console.log(totalLength);
                for(let i= originFileLength; i < totalLength; i++){
                    $("#image-slick").slick('slickRemove',originFileLength);
                }
            }

            function makeSlick(){
                $('#image-slick').slick({
                	slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
    				infinite : false, 	//무한 반복 옵션	 
    				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
    				slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
    				speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
    				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
    				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
    				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
    				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
    				
    				responsive: [ // 반응형 웹 구현 옵션
    					{  
    						breakpoint: 960, //화면 사이즈 960px
    						settings: {
    							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
    							slidesToShow:3 
    						} 
    					},
    					{ 
    						breakpoint: 768, //화면 사이즈 768px
    						settings: {	
    							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
    							slidesToShow:2 
    						} 
    					}
    				]

    			});
            }
        	
        </script>
    </div>
    
</body>
</html>