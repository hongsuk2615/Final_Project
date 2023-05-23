<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/usedProduct/usedProductDetail.css">
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
                <table>
                    <tr>
                        <th colspan="5">
                            <img src="resources/images/main/icon/exchange-1.png" width="35" height="35">
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
                            <select name="" id="">
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                            </select>
                        </td>
                        <th>지역</th>
                        <td>
                            <select name="" id="">
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                                <option value="">예시</option>
                            </select>
                    </td>
                        <td></td>
                    </tr>
                    <tr id="trade-method">
                        <th>거래방법</th>
                        <td>
                            <input type="radio" name="tradeMethod" id="direct">
                            <label for="direct">직거래</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="parcel">
                            <label for="parcel">택배</label>
                        </td>
                        <td>
                            <input type="radio" name="tradeMethod" id="both">
                            <label for="both">둘다</label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td colspan="3">
                            <input type="text" placeholder="가격을 입력하세요">
                        </td>
                        <td></td>
                    </tr>
                    <tr id="images">
                        <th>이미지<br>(최대4장)</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr id="content">
                        <th>내용</th>
                        <td colspan="4">
                            <textarea name="" id="" cols="30" rows="10"></textarea>
                        </td>
                    </tr>
                </table>
                <div id="btns">
                    <div id="cancel-btn">취소</div>
                    <div id="complete-btn">작성완료</div>
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>