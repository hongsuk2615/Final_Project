<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <form action="/thrifty/usedProduct/enroll" method="post" enctype="multipart/form-data">
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
                        <th>지역</th>
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
                            <input type="text" name="price" placeholder="가격을 입력하세요" value="${usedProduct.price }">
                        </td>
                        <td></td>
                    </tr>
                    <tr id="images">
                    <input type="file" name="images" multiple style="opacity : 0;" onchange="imagePreview(this);">
                        <th>이미지<br>(최대4장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
                        <c:forEach var="image" items="${imageList}">
                        	<c:choose>
								<c:when test="${image.fileLevel == 0 }">
									<c:set var="img0" value="/thrifty/resources/upfiles/usedProduct/${image.changeName }"/>
								</c:when>
								<c:when test="${image.fileLevel == 1 }">
									<c:set var="img1" value="/thrifty/resources/upfiles/usedProduct/${image.changeName }"/>
								</c:when>
								<c:when test="${image.fileLevel == 2 }">
									<c:set var="img2" value="/thrifty/resources/upfiles/usedProduct/${image.changeName }"/>
								</c:when>
								<c:when test="${image.fileLevel == 3 }">
									<c:set var="img3" value="/thrifty/resources/upfiles/usedProduct/${image.changeName }"/>
								</c:when>
							</c:choose>
                        </c:forEach>
                        <td id="image0" class="images"><img src="${img0}"></td>
                        <td id="image1" class="images"><img src="${img1}"></td>
                        <td id="image2" class="images"><img src="${img2}"></td>
                        <td id="image3" class="images"><img src="${img3}"></td>
                    </tr>
                    <tr>
                    	<td></td>
                    	<th>${img0 != null ? '삭제' :'' }</th>
                    	<th>${img1 != null ? '삭제' :'' }</th>
                    	<th>${img2 != null ? '삭제' :'' }</th>
                    	<th>${img3 != null ? '삭제' :''}</th>
                    </tr>
                    <tr id="boardContent">
                        <th>내용</th>
                        <td colspan="4">
                            <textarea name="content" id="" cols="30" rows="10">${board.content}</textarea>
                        </td>
                    </tr>
                </table>
                <div id="btns">
                    <div id="cancel-btn">취소</div>
                    <button id="complete-btn">수정완료</button>
                </div>
                </form>
            </div>
        </div>

        <div id="footer">




        </div>
        <script type="text/javascript">
        	const deleteImage = document.getElementsByClassName("delete-image");
        
        
        	function insertImage(){
        		document.getElementsByName('images')[0].click();
        	}
        	
        	function imagePreview(arg){
        		if(arg.files.length >4){
        			alert("4개보다 많은 사진첨부 불가능");
        			console.log(arg.files[i]);
        			return false;
        		}else{
                    console.log(arg.value);
	        		for(let i = 0; i < arg.files.length; i++){
	        			let reader = new FileReader();
	        			
	        			reader.onload = function(e){
	        				let url = e.target.result;
	        				console.log("image"+i+":");
	        				console.log(url);
	        				$("#image"+i).css('backgroundImage','url('+url+')');
	        			}
	        			
	        			reader.readAsDataURL(arg.files[i]);
	        			console.log(reader);
	        			
	        				
	        			// document.getElementById('image'+i).src = e.
	        		}
	        		for(let i = arg.files.length; i < 4 ; i++){
	        			$("#image"+i).css('backgroundImage','none');
	        		}
        		}
        		
        	}
        	
        </script>
    </div>
    
</body>
</html>