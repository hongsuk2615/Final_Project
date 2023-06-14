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
                        <img src="/thrifty/resources/images/myPage/mymain.png" alt="상위 카테고리 이미지">
                         <div id="upper-category-name">마이페이지</div>
            
                    </div>
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                   
                    
                        <li><a href="/thrifty/mypage/myPageMain" class="upper_a">마이페이지</a></li>
                        <li><a href="/thrifty/mypage/zzimselect" class="upper_a">찜 목록</a></li>
                        <li><a href="/thrifty/mypage/myWrite" class="upper_a">내가 쓴 글</a></li>
                        <li>쉐어하우스 수락/거절</li>
        
                       
                   
                    </ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <div class="alert alert-danger">
                            <span id="num">10</span>초 후에 없어짐
                            <p>광고</p>
                            <p>광고</p>
                            <p>광고</p>
                            <p>광고</p>
                            <p>광고</p>
                            <p>광고</p>
                            <p>광고</p>

                        </div>

                    </ul>
                    
                </div>

            </div>
          
           
    
</body>

<script>
    var count = 10;

    setInterval(function(){
     count -= 1;
     if(count>=0){
         document.querySelector('#num').innerHTML = count;
         
     }else if(count== -1){
         $('.alert').hide();
     }
     
    },1000);


    
    
 </script>

</html>