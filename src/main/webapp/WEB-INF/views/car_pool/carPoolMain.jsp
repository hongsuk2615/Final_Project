<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/thrifty/resources/css/car_pool/car-pool-main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
    *{
       /*  border: 1px solid blue !important; */
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

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/header.jsp"/>
        <div id="body">
            <div id="car-pool-body">
                <form>
                    <div id="car-pool-title">
                        <div id="bg">
                            <div id="car-pool-service">
                                <p style="color: white; height: auto;">카풀 서비스</p>
                            </div>
                            <div id="car-pool-search">
                                <input type="text" name="carPoolSearch" id="car-pool-search-input" placeholder="지역이나 키워드를 입력 해 주세요.">
                                <img src="/thrifty/resources/images/main/icon/search-3.png">
                            </div>
                        </div>
                    </div>
                    <div id="coment">
                        <p style="text-align: center;"><b>"출근시간과 퇴근시간이 행복했음 좋겠어요."</b></p>
                    </div><br>

                    <hr>

                    <div id="car-pool-location">
                        <div id="car-pool-location-header">
                            <p style="font-size: xx-large;"><b>지역별 카풀 찾기</b></p><button type="button" id="location-search-btn"><img src="/thrifty/resources/images/carpool/down-arrow.png" id="loimg"></button>
                        </div><br>
                        <div id="location-btn" data-aos="fade-down" data-aos-duration="1500" data-aos-easing="linear">
                            <button>서울시</button>
                            <button>김포시</button>
                            <button>고양시</button>
                            <button>파주시</button>
                            <button>양주시</button>
                            <button>동두천시</button>
                            <button>연천군</button>
                            <button>의정부시</button>
                            <button>포천시</button>
                            <button>가평군</button>
                            <button>남양주시</button>
                            <button>구리시</button>
                            <button>하남시</button>
                            <button>양평군</button>
                            <button>광주시</button>
                            <button>이천시</button>
                            <button>여주군</button>
                            <button>용인시</button>
                            <button>성남시</button>
                            <button>의왕시</button>
                            <button>과천시</button>
                            <button>군포시</button>
                            <button>안양시</button>
                            <button>안산시</button>
                            <button>시흥시</button>
                            <button>광명시</button>
                            <button>부천시</button>
                            <button>수원시</button>
                            <button>화성시</button>
                            <button>오산시</button>
                            <button>평택시</button>
                            <button>안성시</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>

<script>
    $("#location-search-btn").click(function(){
        // if($("#location-btn").css("display") == 'none'){
        //         $("#location-btn").css("display" , "flex");
        //         $("#loimg").attr("src","/thrifty/resources/images/carpool/up-arrow.png");
        // } else {
        //         $("#location-btn").css("display" , "none");
        //         $("#loimg").attr("src","/thrifty/resources/images/carpool/down-arrow.png");
        // }
    })
</script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>

</body>
</html>