<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        padding-left: 30px;
        width: 50%;
        min-width: 700px;
        min-height: 900px;
    }

    #footer{
        
    }

    table {
        width: 100%;
        border-top: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid black;
        padding: 10px;
    }
    
    tr>td{
        text-align: center;
    }

    #list_head{
        height: 40px;
    }

    #cat_title{
        padding-top: 30px;
        padding-bottom: 50px;
        font-weight: 500;
        font-size: 3em;
    }

    #pagingbar{
        text-align: center;
        padding-top: 30px;
        font-size: 0.5cm;   
    }

    #searchWrite{
        padding-top: 20px;
        display: flex;
        justify-content: space-between;
    }
</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <jsp:include page="../common/boardBodyLeft.jsp"/>
            <div id="body-right">
                <div id="cat_title">공동구매</div>
				<table>
                    <thead>
                        <tr id="list_head">
                            <th style="width: 8%;">조회</th>
                            <th style="width: 10%;">작성일</th>
                            <th style="width: 10%;">작성자</th>
                            <th style="width: 42%;">모집 내용</th>
                            <th style="width: 10%;">가격</th>
                            <th style="width: 10%;">인원</th>
                            <th style="width: 10%;">기간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="list_body">
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                        <tr>
                            <td>24</td>
                            <td>05-22</td>
                            <td>김홋숙</td>
                            <td>옥수수공구</td>
                            <td>20,000</td>
                            <td>2</td>
                            <td>06-01</td>
                        </tr>
                    </tbody>
                </table>
                <div id="pagingbar"><< < 1 2 3 4 5 6 7 8 9 10 > >></div>
                <div id="searchWrite">
                    <div></div>
                    <div>
                        <select name="search" id="">
                            <option value="title">제목</option>
                            <option value="title">작성자</option>
                            <option value="title">내용</option>
                        </select>
                        <input type="text" style="width: 300px;">
                        <input type="submit" value="검색">
                    </div>
                    <div>
                        <input type="submit" value="글쓰기">
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>