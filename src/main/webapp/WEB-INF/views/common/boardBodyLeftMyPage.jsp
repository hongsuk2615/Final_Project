<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/common/body-left-my.css">
    <title>Document</title>
</head>
<body>

            <div id="body-left">
                <div id="upper-category">
                    <div>
                        <img src="/thrifty/resources/images/myPage/mymain.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'"alt="상위 카테고리 이미지">
                         <div id="upper-category-name">마이페이지</div>
            
                    </div>
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                   
                    
                        <li><a href="/thrifty/mypage/myPageMain" class="upper_a">마이페이지</a></li>
                        <li><a href="/thrifty/mypage/zzimselect" class="upper_a">찜 목록</a></li>
                        <li><a href="/thrifty/mypage/myWrite" class="upper_a">내가 쓴 글</a></li>
                        
        		<div id="sgAdv">
                 </div>
                    </ul>
                </div>
                <div id="ptjAdv">
                    
                </div>

            </div>
          
           
    
</body>

<script>
    var count = 20;

    setInterval(function(){
     count -= 1;
     if(count>=0){
         document.querySelector('#num').innerHTML = count;
         
     }else if(count== -1){
         $('.advall').hide();
     }
     
    },1000);


    var count1 = 20;

    setInterval(function(){
     count1 -= 1;
     if(count1>=0){
         document.querySelector('#num1').innerHTML = count1;
         
     }else if(count1== -1){
         $('.advall').hide();
     }
     
    },1000);

    
 </script>
 <script>
 adAjax();
  	function adAjax(){
 		$.ajax({
 			url : "/thrifty/mypage/adv",
 			dataType : 'json',
 			success : function(result){
 				console.log(result);
 				console.log('ajax');
 				abc = "";
 				abc += `
 					<ul class="scrollbar">
                    <div class="advall">
                        <span id="num">20</span>초 후에 없어짐
                        <p>제목 :\${result.board.title}</p>
                        <img src="/thrifty/resources/upfiles/ptj/\${result.imgPath}" onerror="this.src='/thrifty/resources/images/common/noImage.png'"width="200px" height="120px">
                        <p>시작 시간 :\${result.startTime}</p>
                        <p>종료 시간 :\${result.endTime}</p>
                        <p>지역 :\${result.location.locationName}</p>
                        <p>일당 :\${result.price}</p>
                        

                    </div>
                    

                </ul>`
			$('#ptjAdv').html(abc);
 			}
 		})
  		
 	} 
 </script>
 
 <script>
 adAjax1();
	function adAjax1(){
		$.ajax({
			url : "/thrifty/mypage/advSg",
			dataType : 'json',
			success : function(result){
				console.log(result);
				console.log('ajax1');
				def = "";
				def += `
					 <div class="advall">
                    <span id="num1">20</span>초 후에 없어짐
                    <img src="https:chart.apis.google.com/chart?cht=qr&chs=300x300&chl=\${result.kakaoLink}" onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="120px" height="120px">
                    
                    <p>제목 : \${result.board.title}</p>
                    <p>닉네임 : \${result.member.nickName}</p>
                    <p>모집인원 : \${result.recruitNo}명</p>
                    <p>모집지역 : \${result.smallLocation}</p>
                    

                </div>`
			$('#sgAdv').html(def);
			}
		})
		
	} 
 
 </script>

</html>