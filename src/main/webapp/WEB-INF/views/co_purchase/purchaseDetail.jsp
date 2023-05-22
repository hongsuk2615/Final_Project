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
            padding-left: 30px;
            width: 50%;
            min-width: 700px;
            min-height: 900px;
        }

        #footer{
            
        }

        #cat_title{
            display: flex;
            justify-content: space-between;
            padding-top: 30px;
            padding-bottom: 50px;
        }

        #cat_title_1{
            font-weight: 500;
            font-size: 3em;
        }

        #title{
            width: 100%;
            height: 35px;
        }

        #fileUpload{
            display: flex;
            border: 1px solid #999999;
            border-radius: 5px;
            margin-top: 20px;
        }

        #fileUpload_1{
            border-right: 1px solid #999999;
            line-height: 62px;
            padding-left: 10px;
            padding-right: 10px;
            margin: 5px 10px 5px 0;
        }

        .upload-name {
            display: inline-block;
            width: 770px;
            height: 30px;
            margin: 4px 0 8px 0;
            vertical-align: middle;
            border: 1px solid #dddddd;
            border-radius: 5px;
            color: #6d6d6d;
        }
        .filebox>label {
            display: inline-block;
            color: #fff;
            vertical-align: middle;
            background-color: rgb(20, 120, 220);
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
            height: 20px;
            margin: 8px 0 4px 0;
        }
        .filebox>input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <div id="cat_title">
                    <div id="cat_title_1">글쓰기</div>
                    <input type="submit" value="등록">
                    
                </div>
                <form action="">
                    <div>
                        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
                    </div>
                    <div id="fileUpload">
                        <div id="fileUpload_1">첨부파일</div>
                        <div class="filebox">
                            <label for="file">&nbsp;사진 등록&nbsp;</label> 
                            <input type="file" id="file"><br>
                            <input class="upload-name" value="선택된 파일" placeholder="선택된 파일">
                        </div>
                    </div>
                    <div>
                        <textarea placeholder="내용을 입력해주세요.">
                            
                        </textarea>
                    </div>

                </form>

				
                
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
<script>
    $("#file").on('change',function(){
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });
</script>
</body>
</html>