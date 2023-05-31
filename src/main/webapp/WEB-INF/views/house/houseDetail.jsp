<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쉐어하우스 상세조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <style>

		.wrap{
		 padding-top: 155px;
		}
        
        #sharetitle{
            text-align: center;
        }

        .img-bx{
            width: 100%;
        }

        .img-bx > div{
            border: 1px solid black;
            border-radius: 5px;
            width: 100%;
            height: 700px;
        }

        .img-bx img{
            width: 100%;
            height: 700px;
        }

        .slick-prev, .slick-next{
            border: none;
            background-color: transparent;
            position: absolute;
            z-index: 1;
            
        }
        .slick-prev img, .slick-next img{
            width: 10px;
            height: 10px;
        }

        .slick-prev{
            top: 50%;
            left: 2%;
        }

        .slick-next{
            bottom: 50%;
            right: 2%;
        }

        /* slick.css */

        .dots_custom {
        position : absolute;
        margin: auto 0;
        padding: 0;
        bottom: 2%;
        left: 50%;
        }

        .dots_custom li {
        list-style: none;
        cursor: pointer;
        display: inline-block;
        margin: 0 6px;
        padding: 0;
        }

        .dots_custom li button {
        border: none;
        background: #d1d1d1;
        color: transparent;
        cursor: pointer;
        display: block;
        height: 8px;
        width: 8px;
        border-radius: 100%;
        padding: 0;
        }

        .dots_custom li.slick-active button {
        background-color: #08c1ce;

        }

        #img-select{
            display: flex;
        }

        #nav {
            display: flex;
            border-bottom: 1px solid #999;
        }

        #nav>div{
            width: 100%;
            cursor: pointer;
        }
        #nav p{
            text-align: center;
            color: #999;
            font-size: 20px;
        }
        #state {
            display: flex;
            justify-content: center;
        }

        #state table, td, th{
            border : 1px solid black;
            border-collapse : collapse;
        }

        #information>div, #service>div, #location>div, #procedure {
            border: 1px solid #999;
            border-radius: 5px;
        }

        #back{
            display: flex;
            justify-content: flex-end
        }

        #back>div{
            width: 130px;
            height: 50px;
            color: white;
            background: #08c1ce;
            margin-right: 5%;
            border-radius: 5%;
            display: flex;
            align-items: center;
        }

        #back p{
            width: 100%;
            text-align: center;
        }
      
        .circle > div{
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .circle h3{
            text-align: center;
        }

        #procedure1{
            border: 1px solid rgb(205, 145, 145);
            border-radius: 5px;
            display: flex;
            justify-content: space-around;
            position: relative;
            align-items: center;

        }

        #procedure2{
            border: 1px solid rgb(106, 75, 246);
            border-radius: 5px;
            margin: 20px;
            display: flex;
            justify-content: space-around;
            padding: 0px 20px;
        }

        #procedure2 > div {
            width: 40%;
        }

        .circle{
           background: rgb(200, 237, 243);
           border-radius: 100%;
            top: 0;
            left: 0;
            width: 13vw;
            height: 13vw;
            display: flex;
            flex-direction: column;
            justify-content: center;
       }

       .circle img{
            width: 5vw;
            height: 5vw;
            
       }
       .circle p, .circle h3{
        font-size: 1vw;
        margin: 0;
       }

        .arrowimg{
            width: 3vw;
            height: 3vw;
        }

        .wrap{
            margin: 0px 10vw;
        }

        .wrap>div{
            margin: 10px 0px;
        }
        body{
			padding: 0;
			margin: 0;
		}
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp"></jsp:include>
    <div class="wrap">
    <div id="sharetitle"><h1>house이름^_^</h1></div>
    <div class="img-bx">
        <div>
            <img src="f1.jpg">
        </div>

    </div>

    <div id="img-select">
        <div>개인방</div>
        <div>공용방</div>
    </div>

    <div id="nav">
        <div><p>방 정보</p></div>
        <div><p>지점 소개</p></div>
        <div><p>제공 서비스</p></div>
        <div><p>입주절차</p></div>
    </div>

    <div id="state">
        <table >
            <tr>
                <th>입주신청</th>
                <th>구분</th>
                <th>성별</th>
                <th>타입</th>
                <th>면적</th>
                <th>보증금</th>
                <th>월임대료</th>
                <th>관리비</th>
                <th>계약종료일</th>
            </tr>
            <tr>
                <td>입주신청</td>
                <td>구분</td>
                <td>성별</td>
                <td>타입</td>
                <td>면적</td>
                <td>보증금</td>
                <td>월임대료</td>
                <td>관리비</td>
                <td>계약종료일</td>
            </tr>
        </table>

    </div>
    <div id="information">지점소개

        <div>dd</div>
    </div>
    <div id="location">위치
        <div>map</div>
    </div>
    <div id="procedure">입주절차
        <div id="procedure1">
            <div class="circle" id="circle1">
               <div >
                <img src="e.jpg">
                <h3>01</h3>
                <p>입주 신청</p>
               </div>
            </div>
            <img class="arrowimg" id="arrow1" src="right-arrow.png">
            <div class="circle" id="circle2">
                <div>
                 <img src="e.jpg">
                 <h3>02</h3>
                 <p>지점투어</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow2" src="right-arrow.png">
             <div class="circle" id="circle3">
                <div>
                 <img src="e.jpg">
                 <h3>03</h3>
                 <p>계약서 작성</p>
                </div>
             </div>
             <img class="arrowimg" id="arrow3" src="right-arrow.png">
             <div class="circle" id="circle4">
                <div>
                 <img src="e.jpg">
                 <h3>04</h3>
                 <p>입주 완료</p>
                </div>
             </div>
        </div>
        <div id="procedure2">
            <div>
                <span>tq</span><br>
                <span>tq</span><br>
                <span>tq</span>
            </div>
            <div>
                <span>tq</span><br>
                <span>tq</span><br>
                <span>tq</span>
            </div>
        </div>

    </div>
    <div id="back">
        <div><p>전체지점보기</p></div>
    </div>
    </div>

    <div>footer</div>

    <script>
        $(document).ready(function(){
            $('.img-bx').slick({
                dots: true,
                dotsClass: 'dots_custom',
                prevArrow : "<button type='button' class='slick-prev'><img src='left-arrow.png'></button>",
				nextArrow : "<button type='button' class='slick-next'><img src='right-arrow.png'></button>"
                
            });
        });
      </script>

</body>


</html>