<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Document</title>
</head>
<style>
   *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }        

.scrollbar::-webkit-scrollbar {
    width: 10px;  
}

.scrollbar::-webkit-scrollbar-thumb {
    background: rgb(25, 163, 212); /* 스크롤바 색상 */
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
}

.scrollbar::-webkit-scrollbar-track {
    background: rgb(224, 224, 224);  /*스크롤바 뒷 배경 색상*/
    border-radius: 10px;
}


#upper-category{
    height: 150px;
    border-bottom: 3px solid gray;
    font-size: 40px;
    color: black;
    display: flex;
    width: 330px;
    margin: 0px 10px;
    justify-content: center;
    align-items: center;
    
}

#body-left{
    display: inline-block;
    width: 20%;
    min-width: 350px;
    min-height: 900px;
    background-color: #f5f5f5f5;
    /* #ffffff  */
    margin-right: 10px;
    
}

#upper-category>div{
    display: flex;
}

#upper-category img{
    width: 60px;
    height: 60px;
    margin-right: 10px;
}
#upper-category-name{
    font-size: 35px;
}

#sub-category{
    height: 700px;
    width: 330px;
    margin: 0px 10px;
    color: black;
    display: inline-block;
    border-bottom: 3px solid gray;
}

#sub-category ul{
    height: 670px;
    overflow-y: scroll;
}

#sub-category li{
    list-style-type: none;
    margin: 20px 0;
}

#filter{
    height: 400px;
    width: 330px;
    margin: 0px 10px;
    color: black;
}


#filter ul{
    height: 380px;
    overflow-y: scroll;
}

#filter li{
    list-style-type: none;
    margin: 20px 0;
}

#filter input[type='number']{
    width: 110px;
}
#filter select{
    width: 110px;
    text-align: center;
}

.adbottom{
    border: solid  1px blue;
}

</style>

<body>
    

            <div id="body-left">
                <div id="upper-category">
                    
                    <div>
                        
                        <img src="resources/images/myPage/mymain.png" alt="상위 카테고리 이미지">
                        <div id="upper-category-name">마이페이지</div>
                       
                    </div>
                    
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
                        <li>하위 카테고리</li>
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

           
</body>
</html>