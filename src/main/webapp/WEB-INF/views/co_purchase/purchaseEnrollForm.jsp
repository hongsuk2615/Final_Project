<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/thrifty/resources/css/co_purchase/purchaseEnrollForm.css">
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
            padding: 40px 0px;
            display: flex;
            justify-content: center;
        }
        #body-right{
            display: inline-block;
            margin-left: 10px;
            padding-left: 30px;
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
            <jsp:include page="../common/boardBodyLeftCo_purchase.jsp"/>
            <div id="body-right">
                <form action="insert" method="post" enctype="multipart/form-data">
                    <div id="cat_title">
                        <div id="cat_title_1">글쓰기</div>
                        <input type="submit" id="submit_button" value="등록">
                    </div>
                    <div id="title_main">
                        <div id="write_title" class="write_case">
                            <div class="write_case_head" style="width: 93px;">제목</div>
                            <input type="text" id="enroll_title" class="" name="title">
                        </div>
                    </div>
                    <div id="invite_info">
                        <div class="write_case invite_info_1">
                            <div class="write_case_head">모집 인원</div>
                            <input type="text" id="" class="info_content" name="recruitsNum" placeholder="숫자만 입력">
                        </div>
                        <div class="write_case invite_info_1">
                            <div class="write_case_head">마감 기한</div>
                            <input type="date" id="" class="info_content" name="deadLine">
                        </div>
                        <div class="write_case invite_info_1" style="width: 315px; display: flex; align-items: center;">
                            <div class="write_case_head">
                                카테고리
                            </div>
<!--                             <input type="hidden" name="categorySNo" value="123"> -->
                            <div class="selectBox2 ">
                                <input type="text" id="categorySNo" class="label" value="카테고리 선택">
                                <input type="hidden" name="categorySNo" class="label2">
                                <ul class="optionList" style="display: none;">
                                    <c:forEach var="subCategory" items="${subCategoryList}">
                                        <c:if test="${subCategory.categoryUNo eq 6}">
                                            <li class="optionItem" value="${subCategory.categorySNo}">${subCategory.categorySName}</li>
                                        </c:if>
                                    </c:forEach> 
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="fileUpload">
                        <div id="fileUpload_0" class="write_case">
                            <div id="fileUpload_1" class="write_case_head">첨부파일</div>
                            <div class="filebox">
                                <label for="file">&nbsp;사진 등록&nbsp;</label> 
                                <input type="file" name="image" id="file"><br>
                                <input class="upload-name" value="선택된 파일" placeholder="선택된 파일" name="uploadFile" readonly>
                            </div>
                        </div>
                        <div class="write_case">
                            <div id="fileUpload_2">
                                <input type="text" name="product_title" class="write_content" placeholder="제품 명을 입력해주세요.">
                                <input type="text" name="price" id="price" class="write_content" placeholder="가격을 입력해주세요.">
                            </div>
                        </div>
                    </div>
                    <div>
                        <textarea name="content" placeholder="내용을 입력해주세요."></textarea>
                    </div>
                </form>
                
				
                
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
    <script type="text/javascript" src="/thrifty/resources/js/co_purchase/enrollForm.js"></script>
</body>
</html>