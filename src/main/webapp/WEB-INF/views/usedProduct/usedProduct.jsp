<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/usedProduct/usedProduct.css">
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
        padding-bottom: 70px;
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
                    <div id="body-right-title">[중고거래 카테고리명]</div>

                    <div id="body-right-filter">
                        <div id="order-list">
                            <div>최신순</div>
                            <div>추천순</div>
                            <div>조회순</div>
                            <div>가격순</div>
                        </div>
                        <div id="search">
                            <img src="/thrifty/resources/images/main/icon/search-1.png" width="25px" height="25px">
                            <input type="search">
                        </div>
                    </div>
                    
                </div>
                <div id="body-right-list">
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>
                    <div class="item">
                        <div class="item-img">

                        </div>
                        <div class="item-info">

                        </div>     
                    </div>

                </div>
                <div id="body-right-footer">
                    <div id="write">
                        <div>글작성</div>
                    </div>
                    <div id="paging-btns">
                        <div>&lt;</div>
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                        <div>4</div>
                        <div>5</div>
                        <div>&gt;</div>
                    </div>
                    
                </div>

            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    <script type="text/javascript">
    document.getElementById('write').addEventListener('click',function(){
    	location.href = "/thrifty/usedProduct/enroll";
    });
    </script>
</body>
</html>