<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    }*         */


   input[id="menuicon"] {display: none;}
   input[id="menuicon"] +label{display: block; margin: 30px; width: 20px; height: 20px; position: fixed; z-index: 9999; right: 0; top:50vh; transition:all .35s; cursor: pointer;}
   input[id="menuicon"] +label span{display: blcok; position: absolute; width: 100%; height: 5px; border-radius: 30px; background: #000; transition: all.35s;}
   input[id="menuicon"] +label span:nth-child(1) {top: 0;}
   input[id="menuicon"] +label span:nth-child(2) {top: 50%; transform: translateY(-50%);}
   input[id="menuicon"] +label span:nth-child(3) {bottom: 0;}

   input[id="menuicon"]:checked + label {z-index: 2; right: 100px;} 
   input[id="menuicon"]:checked + label span{background: black;}
   input[id="menuicon"]:checked + label span:nth-child(1){top: 50%; transform: translateY(-50%) rotate(45deg);}
   input[id="menuicon"]:checked + label span:nth-child(2){opacity: 0;}
   input[id="menuicon"]:checked + label span:nth-child(3){bottom: 50%; transform: translateY(50%) rotate(-45deg);}

   div[class="sidebar"] {width: 100px; height: 50%; background-color: rgb(0, 60, 120); border-radius: 2rem; position: fixed;   display: flex; flex-direction: column;  justify-content: center; align-items: center; top: 30vh; right: -200px; z-index: 1; transition: all .35s;}
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
    .messages-wrapper{
        margin: 5px 0px;
        min-height: 40px;
        display: flex;
        padding : 0px 20px;
        align-items: center;
        word-wrap: break-word;
    }
    .receive-message{
        justify-content: start;

    }
    .send-message{
        justify-content: end;

    }
    .receive-message-wrapper{
        max-width: 150px;
        border-radius: 10px;
        padding: 3px 10px;
        background-color: aliceblue;
    }
    .send-message-wrapper{
        max-width: 150px;
        border-radius: 10px;
        padding: 3px 10px;
        background-color: yellow;
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
       
    }

    #message_content_left{
        width: 30%;
        
        background-color: white;
        overflow: auto;
        overflow-x: hidden;
        display: flex;
        flex-direction: column;
    }

    #message_content_right{
        width: 70%;
        
        background-color: rgb(181 198 215);
        overflow: auto;
        overflow-x: hidden;
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
       
        
    }
    #member_profile{
        height: 60px;
        
    }
    .memberProfile{
        
        
        border-bottom: 1px solid gray;
    }
   
    .sidebarimg{
        margin-bottom: 20px;
        cursor: pointer;
    }

</style>
<body>
   
<div class="black-bg">
    <div id="message_modal"> 
        <div class="white-bg">
            <div id="message_header">
            <img src="/thrifty/resources/images/myPage/send-mail.png">
            <h3 style="margin-left: 20px; margin-right: 30px; line-height: 1.6;">쪽지함</h3>
            <img src="/thrifty/resources/images/myPage/cancelz.png" onerror="this.src='/thrifty/resources/images/common/noImage.png'" id="close" style="margin-left: 250px; width:30px; height: 30px; margin-top: 12px;"> 
            </div>
            <div id="message_content">
                <div id="message_content_left"> 
                    <div id="member_profile">
                         
                        <p><p>
                    </div>
                </div>
                <div id="message_content_right"></div>
            </div>
            <div id="message_footer">
                <button id="send-btn" onclick="sendMsg(this);"style="display: flex;
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
             
             <img src="/thrifty/resources/images/myPage/send-mail.png" class="sidebarimg"    id="modalmessage" style="width: 50px; height: 50px;">
            <a onclick='${loginUser==null? 'login();':'location.href='+='"/thrifty/mypage/myPageMain";'}'><img src="/thrifty/resources/images/myPage/avatarz.png" class="sidebarimg" style="width: 50px; height: 50px;"></a>
             <a href="/thrifty/faq"><img src="/thrifty/resources/images/myPage/signpost.png" class="sidebarimg" style="width: 50px; height: 50px;"></a>
            
            
    </div>
</div>
 



<script>
    document.getElementById('modalmessage').addEventListener('click', function(){
        <c:if test="${loginUser == null}">
            login();
        </c:if>
        <c:if test="${loginUser != null}">
        document.querySelector('.black-bg').classList.add('show-modal');
        getMessageUsers();
        </c:if>
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
<script>
    function getMessageUsers(){
        $.ajax({
            url : '/thrifty/message/selectUsers',
            dataType : 'json',
            success : function(result){
                $('#message_content_left').html('');
                for(user of result){
                    console.log(user);
                    if(user.loginMethod == 'K'){
                        $('#message_content_left').append(`
                        <div  class ="memberProfile"id="member_profile" userNo="\${user.userNo}" nickName = "\${user.nickName}" onclick="displayMessage(this);">
                            <img src="\${user.changeName}" id="message-profile-img"  onerror="this.src='/thrifty/resources/images/common/noImage.png'"> 
                            <p style=" width: 85px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">\${user.nickName}<p>
                        </div>
                        
                        `) 
                    }else{
                        $('#message_content_left').append(`
                        <div class ="memberProfile" id="member_profile" userNo="\${user.userNo}"" nickName = "\${user.nickName}" onclick="displayMessage(this)">
                            <img src="/thrifty/resources/upfiles/myPage/\${user.changeName}" id="message-profile-img"  onerror="this.src='/thrifty/resources/images/common/noImage.png'"> 
                            <p style=" width: 85px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">\${user.nickName}<p>
                        </div>
                        
                        `)
                    }
                    
                }
                $('#message_content_left').children('div').eq(0).click();
            }
        })
    }


    function displayMessage(element){
        $('.memberProfile').each(function(index, item){
            $(item).css('background','white');
        })
        $(element).css('background','#e2e2e2');
        let userNo = $(element).attr('userno');
        let receiver = $(element).attr('nickname');
        $('#send-btn').attr('receiver', userNo);
        $('#send-btn').attr('seller', receiver);
        console.log(userNo);
        $.ajax({
            url : '/thrifty/message/selectMessage',
            data : {userNo},
            dataType : 'json',
            success : function(result){
                let container = $('#message_content_right');
                container.html('');
                for(message of result){
                    if(message.receiver != userNo){ // 받은 메세지
                        container.append(`
                           <div class="messages-wrapper receive-message"> 
                            <div class="receive-message-wrapper">\${message.content}</div>
                           </div>
                        `);
                    }else{//보낸메세지
                        container.append(`
                        <div class="messages-wrapper send-message"> 
                            <div class="send-message-wrapper">\${message.content}</div>
                           </div>
                        `);
                    }
                }
                console.log(result);
            }

        })
    }

    async function sendMsg(element){
    let receiver = $(element).attr("receiver");
    let seller = $(element).attr("seller");
    const { content: text } = await Swal.fire({
                                                input: 'textarea',
                                                title: seller+'에게 메세지 보내기',
                                                inputPlaceholder: '보낼메세지를 작성하세요',
                                                inputAttributes: {
                                                    'aria-label': 'Type your message here'
                                                },
                                                inputValidator: (content) => {
                                                    if (!content) {
                                                    return '빈메세지는 전송하지 않습니다.';
                                                    }else{
                                                        console.log(receiver);
                                                        $.ajax({
                                                            url : "/thrifty/message/insert",
                                                            data : {content, receiver},
                                                            success : function(result){
                                                                console.log(result);
                                                                if(result == 1){
                                                                    Swal.fire({
                                                                        position: 'top-center',
                                                                        icon: 'success',
                                                                        title: '전송완료',
                                                                        showConfirmButton: false,
                                                                        timer: 1000
                                                                    }).then(()=>{
                                                                        $('#message_content_left').children('div').each(function(index, item){
                                                                            if($(item).attr('userNo') == receiver){
                                                                                $(item).click();
                                                                            }
                                                                        })
                                                                    })
                                                                }else if(result == -1){
                                                                    Swal.fire({
                                                                        position: 'top-center',
                                                                        icon: 'warning',
                                                                        title: '비로그인 상태입니다.',
                                                                        showConfirmButton: false,
                                                                        timer: 1000
                                                                    }).then(()=>{
                                                                            login();
                                                                    })
                                                                }
                                                            },
                                                            error : function(){
                                                                Swal.fire({
                                                                            position: 'top-center',
                                                                            icon: 'error',
                                                                            title: '전송실패',
                                                                            showConfirmButton: false,
                                                                            timer: 1000
                                                                        })
                                                            }
                                                        })
                                                    }
                                                },
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: '쪽지보내기',
                                                cancelButtonText: '취소'
                                            });

}

</script>



</body>
</html>