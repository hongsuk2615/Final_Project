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
                            <img src="/thrifty/resources/images/main/icon/exchange-1.png" width="35" height="35">
                            <h1>중고거래 글쓰기</h1>
                        </th>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td colspan="4">
                            <input type="text" name="title" placeholder="제목을 입력하세요">
                        </td>
                    </tr>
                    <tr id="categoryAndLocation">
                        <th>카테고리</th>
                        <td>
                            <select name="categorySNo" id="">
                            	<c:forEach var="subCategory" items="${subCategoryList}">
	                            	<c:if test="${subCategory.categoryUNo eq 4 }">
		                                <option value="${subCategory.categorySNo}">${subCategory.categorySName}</option>                            	
	                            	</c:if>
                             	</c:forEach>
                            </select>
                        </td>
                        <th>지역</th>
                        <td>
                            <select name="locationNo" id="">
                            	<c:forEach var="location" items="${locationList}">
                                <option value="${location.locationNo}">${location.locationName}</option>
                                </c:forEach>
                            </select>
                    </td>
                        <td></td>
                    </tr>
                    <tr id="trade-method">
                        <th>거래방법</th>
                        <td>
                            <input type="radio" name="tradeMethod" id="direct" value="D">
                            <label for="direct">직거래</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="parcel" value="P">
                            <label for="parcel">택배</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="both" value="B">
                            <label for="both">둘다</label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td colspan="3">
                            <input type="text" name="price" placeholder="가격을 입력하세요">
                        </td>
                        <td></td>
                    </tr>
                    <tr id="images">
                    <input type="file" name="images" multiple style="opacity : 0;" onchange="imagePreview(this);">
                        <th>이미지<br>(최대4장)<br><button type="button" onclick="insertImage();">이미지 첨부</button></th>
                        <td id="image0"></td>
                        <td id="image1"></td>
                        <td id="image2"></td>
                        <td id="image3"></td>
                    </tr>
                    <tr id="boardContent">
                        <th>내용</th>
                        <td colspan="4">
                            <textarea name="content" id="" cols="30" rows="10"></textarea>
                        </td>
                    </tr>
                </table>
                <div id="btns">
                    <div id="cancel-btn">취소</div>
                    <button id="complete-btn">작성완료</button>
                </div>
                </form>
            </div>
        </div>

        <div id="footer">




        </div>
        <script type="text/javascript">
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