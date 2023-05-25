<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/co_purchase/purchaseEnrollForm.css">
    <script type="text/javascript" src="resources/js/co_purchase/enrollForm.js"></script>
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
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <form action="">
                    <div id="cat_title">
                        <div id="cat_title_1">글쓰기</div>
                        <input type="submit" id="submit_button" value="등록">
                        
                    </div>
                    <div class="write_case">
                        <div class="write_case_head">제목</div>
                        <input type="text" id="title" class="" name="title">
                    </div>
                    <div id="fileUpload">
                        <div id="fileUpload_0" class="write_case">
                            <div id="fileUpload_1" class="write_case_head">첨부파일</div>
                            <div class="filebox">
                                <label for="file">&nbsp;사진 등록&nbsp;</label> 
                                <input type="file" id="file"><br>
                                <input class="upload-name" value="선택된 파일" placeholder="선택된 파일" name="uploadFile">
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

        <div id="footer">




        </div>
    </div>
</body>
</html>