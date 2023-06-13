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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
        /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }     */
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

    
    #body-right{
        display: inline-block;
        width: 50%;
        min-width: 700px;
        min-height: 900px;
        background-color: #f5f5f5f5;
        
    }

    #footer{
        
    }

    #body-right-header{
        
        width: 100%;
        height: 20%;
        border: solid 2px ;
    }
    #body-right-bwheaderbody{
      width: 100%;
      height: 5%;
      background-color: white;
    }

    #body-right-body{
        width: 100%;
        height: 60%;
    }

    #body-right-bodyfooterbw{
      width: 100%;
      height: 5%;
      background-color: white;
    }

    #body-right-footer{
        width: 100%;
        height: 10%;
    }
    

    .body-right-pic{
        float: left;
        width: 25%;
        height: 100%;
        
    }
    .body-right-title{
        float: left;
        width: 50%;
        height: 100%;
    }
    .body-right-butt{
        float: left;
        width: 25%;
        height: 100%;   
    }

    

    #body-right-body-table{
        width: 100%;
        height: 100%;
        
    }
    .table_title{
        height: 10%;
        
    }

    .bdoy-right-title-content{
      display: flex;
      padding: 20%;
      justify-content: center;
    }
    .body-right-butt-content{
      
      position: relative;
      top : 40%;
      display: flex;
      justify-content: center;
      
     
    }
    
    .table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 3px solid #787c80;
    border-bottom: 3px solid #787c80;
    }


    .body-right-body-left{
        float: left;
        width: 100%;
        height: 100%;
    }

    

</style>
</head>
<body>
    <div id="wrapper">
        <div id="header">
          <jsp:include page="../common/header.jsp"/>


        </div>
        <div id="body">
            <div id="body-left">
              <jsp:include page="../common/boardBodyLeftMyPage.jsp"/>

            </div>



            <div id="body-right">
              
                <div id="body-right-header">
                    <div class="body-right-pic">
                        
                      <img src="/thrifty/resources/images/myPage/selectwrite2.png" width="100%" height="100%">
                        
                    </div>
                    <div class="body-right-title">
                      <div class="bdoy-right-title-content">
                      <h2>내가 쓴 글</h2>
                      </div>
                    </div>
                    <div class="body-right-butt">
                      <div class="body-right-butt-content">
                        
                      </div>
                    </div>
                </div>
                <div id="body-right-bwheaderbody"></div>
                
                <div id="body-right-body">
                 
                    <table id="body-right-body-table" class="table table-hover">
                      <tr class="table_title">
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성 날짜</th>
                      </tr>
                    <c:forEach items="${list}" var="b">
                      <tr>
                        <td>${b.upperCategoryName}</td>
                        <td>${b.title}</td>
                        <td>${b.nickName}</td>
                        <td>${b.createDate}</td>
                      </tr>
                     </c:forEach>
                   


                    </table>



                </div>
                <div id="body-right-bodyfooterbw"></div>
                <div id="body-right-footer"> 
                    페이징 처리 하는곳 footer

                </div>
                
                
               
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>