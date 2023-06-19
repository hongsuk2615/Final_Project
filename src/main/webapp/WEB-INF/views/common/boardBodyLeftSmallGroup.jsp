<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/common/body-left-small.css">
     <link rel="stylesheet" href="/thrifty/resources/css/common/body-left-my.css">
    <title>Document</title>
</head>
<body>

            <div id="body-left">
                <div id="upper-category">
                    <div>
                        <img src="/thrifty/resources/images/small/hobbies.png" alt="상위 카테고리 이미지">
                         <div id="upper-category-name">소모임</div>
            
                    </div>
                </div>
                <div id="sub-category" >
                  <div id="shAdv">
                 </div>
                
                 
                </div>
                 <div id="upAdv">
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
         $('.alert').hide();
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

	function adAjax(){
		$.ajax({
			url : "/thrifty/smallGroup/advUp",
			dataType : 'json',
			success : function(result){
				console.log(result);
				console.log('ajax');
				abc = "";
				abc += `
				<div>
					<ul style="padding: 0;">
                 <div class="alert alert-warning advall" style="height: 365px; margin-left: 29px; width: 240px;">
                     <span id="num">20</span>초 후에 없어짐
                     <p>제목 :\${result.title}</p>
                     <img src="/thrifty/\${result.thumbNail}"onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="200px" height="120px">
                     <p></p>
                     <p>상품 가격 :\${result.price}</p>
                     <p>거래 지역 :\${result.locationName}</p>
                     <p>거래 방법 :\${result.tradeMethod== 'D' ? '직거래': '택배'}</p>
                     <p>가격 :\${result.price}</p>
                     

                 </div>
                 

             </ul>  </div>`
			$('#upAdv').html(abc);
			}
		})
		
	}adAjax();
	
	function shAd(){
 		$.ajax({
 			url : "/thrifty/sharehouse/ad",
 			dataType : 'json',
 			success : function(result){
 				console.log(result);
 				abc = "";
 				rent = result.roomList[0].rent.toLocaleString();
 				cost = result.roomList[0].cost.toLocaleString();
 				abc += `
 					<ul style="padding: 0; overflow-y: unset;">
                    <div class="alert alert-warning advall" style="height: 365px; margin-left: 18px; width: 240px;">
                        <span id="num1">20</span>초 후에 없어짐
                        <img src="/thrifty/\${result.thumbnail}" onerror="this.src='/thrifty/resources/images/common/noImage.png'"width="180px" height="120px">
                        <p></p>
                        <p>\${result.board.title}</p>
                        <p>\${result.roomList[0].division}</p>
                        <p>\${result.roomList[0].type}</p>
                        <p>월 \${rent}원 ~</p>
                        <p>관리비 : \${cost}원</p>
                    </div>
                </ul>`
			$('#shAdv').html(abc);
 			}
 		})
  		
 	}shAd();
 
 </script>

</html>