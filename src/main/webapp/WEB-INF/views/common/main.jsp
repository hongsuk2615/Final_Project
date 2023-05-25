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
        max-width: 1000px;
        padding: 40px 0px;
        margin: auto;
    }

    #footer{
        
    }

    #main_event{
        display: flex;
        justify-content: center;
    }

    #main_event_img{
        width: 95%;
    }
    
    #main_menu{
        padding-top: 50px;
        display: grid;
        margin: auto;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-column-gap: 50px;
        grid-row-gap: 50px;
        place-items: center;
        text-align: center;
    }

    .main_menu_icon{
        width: 120px;
        height: 120px;
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <div id="main_event">
                <img src="resources/images/main/mainspot_2305.png" id="main_event_img" alt="">
            </div>
            <div id="main_menu">
                <div>
                    <img src="resources/images/main/icon/promotion.png" class="main_menu_icon" alt="">
                    <div>공지사항</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/board.png" class="main_menu_icon" alt="">
                    <div>자유 게시판</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/room-mate.png" class="main_menu_icon" alt="">
                    <div>쉐어 하우스</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/car-sharing.png" class="main_menu_icon" alt="">
                    <div>카풀</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/second-hand.png" class="main_menu_icon" alt="">
                    <div>중고 거래</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/exchange.png" class="main_menu_icon" alt="">
                    <div>심부름 / 알바</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/supply-chain.png" class="main_menu_icon" alt="">
                    <div>공동 구매</div>
                </div>
                <div>
                    <img src="resources/images/main/icon/pet-love.png" class="main_menu_icon" alt="">
                    <div>소모임</div>
                </div>
            </div>
        </div>
        <div id="footer">
        </div>
    </div>
    
</body>
</html>