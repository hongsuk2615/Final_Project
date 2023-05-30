<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/thrifty/resources/css/car_pool/car_pool_main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
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

                    <div id="car-pool-type">
                        <div id="drive">
                            <button style="width: 300px; height: 200px;">
                                <img src="/thrifty/resources/images/carpool/handle.png"><br>
                                <p style="color: white; font-size: large;">타세요~</p>
                            </button>
                        </div>
                        <div id="occupant">
                            <button style="width: 300px; height: 200px;">
                                <img src="/thrifty/resources/images/carpool/chair.png">
                                <p style="color: white; font-size: large;">태워주세요!</p>
                            </button>
                        </div>
                    </div>

                    <h1 style="text-align: center;">"카풀서비스로 유류비 걱정을 덜어보세요."</h1>
                        <!-- <div id="car-pool-location-header">
                            <p style="font-size: xx-large;"><b>지역별 카풀 찾기</b></p><button type="button" id="location-search-btn"><img src="/thrifty/resources/images/carpool/down-arrow.png" id="loimg"></button>
                        </div><br> -->


                        <!-- <div id="location-btn" data-aos="fade-down" data-aos-duration="1500" data-aos-easing="linear">
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
                        </div> -->
                    </div>
                </form>
            </div>
            <div id="car-pool-footer">
                <div id="car-pool-footer1" data-aos="fade-left">
                    <div style="margin-right: 50px;">
                        <h1>불안한 카풀은 이제 그만!</h1>
                        <h3 style="color: gray; text-align: end;">드라이버의 상세정보를 조회하고 골라서 타기!</h3>
                        <h3 style="color: gray; text-align: end;">프로필 사진과 성별 등, 확인하고 골라서 타보세요.</h3>
                    </div>
                    <img src="/thrifty/resources/images/carpool/images.jpg" style="width: 300px; height: 450px; border-radius: 20px;">
                </div>

                <div id="car-pool-footer2" data-aos="fade-right">
                    <img src="/thrifty/resources/images/carpool/road.png" style="width: 300px; height: 450px; border-radius: 20px;">
                    <div style="margin-left: 50px;">
                        <h1>내가 가는길은 내가 정한다!</h1>
                        <h3 style="color: gray;">운전자라면 경로를 그리고 , 탑승자라면 경로를 확인한다!</h3>
                        <h3 style="color: gray;">지도에 그려진 경로를 보고 이용해 보세요.</h3>
                    </div>
                </div>

                <div id="car-pool-footer3" data-aos="fade-left">
                    <div style="margin-right: 50px;">
                        <h1>쉐어하우스를 이용한다면 더욱 더 편리한 카풀!</h1>
                        <h3 style="color: gray; text-align: end;">출근길과 퇴근길의 소소한 대화!</h3>
                        <h3 style="color: gray; text-align: end;">"같이... 카풀 하실래요...?"</h3>
                    </div>
                    <img src="/thrifty/resources/images/carpool/car.png" style="width: 300px; height: 450px; border-radius: 20px;">
                </div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>

<script>
    $("#location-search-btn").click(function(){
        if($("#location-btn").css("display") == 'none'){
                $("#location-btn").fadeIn(500);
                $("#loimg").attr("src","/thrifty/resources/images/carpool/up-arrow.png");
        } else {
                $("#location-btn").fadeOut(500);
                $("#loimg").attr("src","/thrifty/resources/images/carpool/down-arrow.png");
        }
    })
</script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>