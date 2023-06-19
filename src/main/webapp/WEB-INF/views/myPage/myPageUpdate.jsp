<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<style>
         /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }      */  */
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

  
    #body-right{
        display: inline-block;
        width: 50%;
        min-width: 700px;
        min-height: 900px;
        
       
    }



    #body-right-header{
        width: 100%;
        height: 15%;
        border-radius: 2rem;
        padding: 25px;
        border: solid 2px #222222;
      

    }

    #body-right-middle{
        width: 100%;
        height: 5%;
    }


    #body-right-body{
        width: 100%;
        height: 80%;
        border-radius: 4rem;
      
        border: solid 2px #222222;
    }
   

    .profile-pic{
        float: left;
        width: 30%;
        height: 100%;
        border-radius: 10%;
        overflow: hidden;
        
    }

    .profile-title{
        float: left;
        width:70%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
       
        
    }
    .profile-title>h2{
        margin: 0 20px;
    }

    


    .body-right-body-left{
        float: left;
        width: 100%;
        height: 100%;
    }

  
  

    #footer{
        
    }

 
    /* border-bottom: .3rem solid black; */
    
   .classtitle{
    display: flex;
    justify-content: center;
    padding: 20px 20px;
    
   }
   
   .personinfoborder{
    
    padding: 0px 40px;
   
   }

   #button_modify{
  position: relative;
  width: 500px;
  margin-left: 65px;
  margin-top: 10px;
   }
   
   #button_cancel{
    position: relative;
  width: 500px;
  margin-left: 65px;
  margin-top: 10px;
   }
    
    
   
/*
   background-color: #fc3441;
                    #ffcb3d;
                    #0c12
*/






.classa {
  position: relative;
  width: 500px;
  margin-left: 65px;
  margin-top: 40px;
}

.inputa {
  font-size: 15px;
  color: #222222;
  width: 500px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

.inputb{
font-size: 15px;
  color: #222222;
  width: 420px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

input::placeholder { color: #aaaaaa; }
input:focus { outline: none; }

.spana, .readOnlyspana{
  display: block;
  position: absolute;
  bottom: 0;
  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
  background-color: #666;
  width: 0;
  height: 2px;
  border-radius: 2px;
  transition: 0.5s;
  
}

.labela {
  position: absolute;
  left: 10px;
  transition: all .2s;
  font-size: 16px;
  bottom: 37px;
  color: #666;
  font-weight: bold;
}
.readOnly{
  position: absolute;
  left: 10px;
  transition: all .2s;
  font-size: 16px;
  bottom: 37px;
  color: #666;
  font-weight: bold;
}




.inputa:focus ~ .labela, .inputa:valid ~ .labela {
  font-size: 16px;
  bottom: 37px;
  color: #666;
  font-weight: bold;
  
}

.inputa:focus ~ .spana, .inputa:valid ~ .spana, .readOnlyspana{
  width: 100%;
}

.duplicate{
    background-color: rgb(0, 60, 120);
    color: white;
    border-radius: 2rem;
}

    

</style>
</head>
<body>
    <jsp:include page="../common/rightside.jsp"/>
    <div id="wrapper">
        <div id="header">
            <jsp:include page="../common/header.jsp"/>


        </div>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../common/boardBodyLeftMyPage.jsp"/>
		
            </div>



            <div id="body-right" data-aos="flip-left">
              
                <div id="body-right-header">
                    <div class="profile-pic">
                        <img src="${contextPath}/resources/upfiles/myPage/${loginUser.changeName}" onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="100%" height="100%" style="object-fit: cover;">
                    </div>
                    <div class="profile-title">
                        <h4>프로필 변경</h4>
                        <form action ="${pageContext.request.contextPath}/mypage/insertProfile.do" enctype="multipart/form-data" method="post">
                        <input type="file" name="images">
                        <button type="submit">제출</button>
                        </form>
                    </div>
                    

                </div>

               <div id="body-right-middle"></div>
               <div id="body-right-body">
                    
                        
                        <div class="classtitle">
                        <h2>회원정보 수정</h2>
                        </div>
                    <div class="personinfoborder">
						<form  action ="${pageContext.request.contextPath}/mypage/myUpdate" method="post" onsubmit="return validateEnroll()">
                        <div class="classa">
                            <input type="text" required class="inputa" name="userId" readonly value="${loginUser.userId }">
                            
                            <label class="readOnly">아이디</label>
                            <span class="readOnlyspana"></span>
                        </div>
                        
                        <div class="classa">
                            <input readOnly type="text" required class="inputa" name="userName" value="${loginUser.userName}">
                            <label class="readOnly">이름</label>
                            <span class="readOnlyspana"></span>
                        </div>
                        

                        <div class="classa">
                            <input type="password" required class="inputa" id="userPwd" name="userPwd" value="">
                            <label class="labela">비밀번호 변경</label>
                            <span class="spana"></span>
                        </div>

                        <div class="classa">
                            <input type="password" required class="inputa" id="checkPwd" name="userPwdcheck">
                            <label class="labela">비밀번호 변경 확인</label>
                            <span class="spana"></span>
                        </div>


                        


                        

                            
               			 
                        <div class="classa">
                            <input type="text" required class="inputa" id="phone" name="phone" value="${loginUser.phone}">
                            <label class="labela">핸드폰</label>
                            <span class="spana"></span>
                        </div>

                            
                        <div class="classa">
                            <div style="display: flex;">
                                <div style="width: 422px;" >
                                    <input type="text" required class="inputb" id="email" name="email" value="${loginUser.email}">
                                    <label class="labela">이메일</label>
                                    <span class="spana"></span>
                                </div>
                                <button type="button"  style="width: 105px;" class="duplicate" onclick="validateEmail('on')" id="validatebt1">중복확인</button>
                            </div>
                        </div>

                       
                        
                        
                        
                        <div class="classa">
                         <div style="display: flex;">
                            <div style="width: 422px;">
                             <input type="text" required class="inputb" id="nickName" name="nickName" value="${loginUser.nickName}">
                             <label class="labela">닉네임</label>
                             <span class="spana"></span>
                            </div>
                            <button type="button" style="width: 105px;" class="duplicate" onclick="validateNickName('on')" id="validatebt2">중복확인</button>
                         </div>

                       	 </div>
                        

                        <button type="submit" class="btn btn-primary" id="button_modify"  onsubmit="return validateEnroll()">수정하기</button>
                        <button type="button" class="btn btn-secondary" id="button_cancel">취소</button>
                        </form>
                    </div>
                    
                   
                    
                </div>
                    
                   
                      
                      
                      
                   
                  

               </div>
                
                
               
            </div>
            
        
        

        <div id="footer">




        </div>
    </div>
   

<script>
    AOS.init();
</script>

<script src="/thrifty/resources/js/member/mypageValidate.js"></script>




</body>

</html>