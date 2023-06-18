<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<style>
       /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }*        */


   input[id="menuicon"] {display: none;}
   input[id="menuicon"] +label{display: block; margin: 30px; width: 20px; height: 20px; position: fixed; z-index: 9999; right: 0; top:50vh; transition:all .35s; cursor: pointer;}
   input[id="menuicon"] +label span{display: blcok; position: absolute; width: 100%; height: 5px; border-radius: 30px; background: #000; transition: all.35s;}
   input[id="menuicon"] +label span:nth-child(1) {top: 0;}
   input[id="menuicon"] +label span:nth-child(2) {top: 50%; transform: translateY(-50%);}
   input[id="menuicon"] +label span:nth-child(3) {bottom: 0;}

   input[id="menuicon"]:checked + label {z-index: 2; right: 200px;} 
   input[id="menuicon"]:checked + label span{background: black;}
   input[id="menuicon"]:checked + label span:nth-child(1){top: 50%; transform: translateY(-50%) rotate(45deg);}
   input[id="menuicon"]:checked + label span:nth-child(2){opacity: 0;}
   input[id="menuicon"]:checked + label span:nth-child(3){bottom: 50%; transform: translateY(50%) rotate(-45deg);}

   div[class="sidebar"] {width: 200px; height: 50%; background-color: rgb(0, 60, 120); border-radius: 2rem; position: fixed;   display: flex; align-items: center;  justify-content: center; top: 30vh; right: -200px; z-index: 1; transition: all .35s;}
   input[id="menuicon"]:checked + label + div {right: 0px;} 


   
   .black-bg{
        width: 0;
        height: 0;
        position: fixed;
        /* background: rgb(0,0,0,0.5); */
        z-index: 999;
        padding: 10px;
        visibility: hidden;
        opacity: 0;
        transition: all 1s;
    }

    .show-modal{
        visibility: visible;
        opacity: 1;
    }

    .white-bg{
         background-color: white;
        position: relative;
        top: 200px;
        left: 500px; 
        height: 500px;
        width: 500px;
        border-radius: 2rem;
        border: solid black;
        background-color: rgb(0, 60, 120);
    }

    #message_header{
        display: flex;
        justify-content: center;
        text-align: center;
        height: 10%;
        color: white;
        cursor: move;
        
    }

    #message_content{
        height: 80%;
        display: flex;
        border: solid black;
    }

    #message_content_left{
        width: 30%;
        border: solid black;
        background-color: white;
    }

    #message_content_right{
        width: 70%;
        border: solid black;
        background-color: white;
    }
    #message_footer{
        height: 10%;
        display: flex;
       justify-content: center;
       align-items: center;
       
    }

    #message-profile-img{
        float: left;
        width: 50px;
        height: 50px;
        border-radius: 3rem;
        border: solid black;
        
    }
    #member_profile{
        height: 60px;
        border: solid black;
    }
   

</style>
<body>
   
<div class="black-bg">
    <div id="message_modal"> 
        <div class="white-bg">
            <div id="message_header">
            <img src="/thrifty/resources/images/myPage/send-mail.png">
            <h3 style="margin-left: 20px; margin-right: 30px; line-height: 1.6;">쪽지함</h3>
            <img src="/thrifty/resources/images/myPage/cancelz.png" id="close" style="margin-left: 250px"> 
            </div>
            <div id="message_content">
                <div id="message_content_left"> 
                    <div id="member_profile">
                        <img src="/thrifty/resources/images/myPage/2023060814540217132.jpeg" id="message-profile-img" > 
                        <p>nemo0824<p>
                    </div>
                </div>
                <div id="message_content_right"> right</div>
            </div>
            <div id="message_footer">
                <button style="display: flex;
                justify-content: center;
                align-items: center; color: white; width: 250px; height: 40px; background-color: rgb(0, 60, 120); border: none;">보내기 <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
                    <lord-icon
                        src="https://cdn.lordicon.com/xsdtfyne.json"
                        trigger="hover"
                        colors="primary:white"
                        style="width:25px;height:25px">
                    </lord-icon></button>
            </div>
            
        </div>
    </div>
</div>



<div style="position: fixed; top: 50vh; right: -200px; z-index: 100;">
    <input type="checkbox" id="menuicon">
    <label for="menuicon">
         <span></span>
         <span></span>
         <span></span>
    </label>
    <div class="sidebar">
             <img src="/thrifty/resources/images/myPage/send-mail.png" id="modalmessage" style="width: 50px; height: 50px;">
            
            
    </div>
</div>
 



<script>
    document.getElementById('modalmessage').addEventListener('click', function(){
        document.querySelector('.black-bg').classList.add('show-modal')
    })

    document.getElementById('close').addEventListener('click', function(){
        document.querySelector('.black-bg').classList.remove('show-modal')
    })

    
</script>

<script>
    
//     $('#message_header').draggable({
//   handle: "#message_header"
// });

</script>

<script>
     $('#message_modal').draggable();
</script>



</body>
</html>