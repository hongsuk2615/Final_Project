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
    }      */
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

    #body-left{
        display: inline-block;
        width: 20%;
        min-width: 350px;
        min-height: 900px;
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
        border-radius: 100%;
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
  margin-top: 40px;
   }
   
   #button_cancel{
    position: relative;
  width: 500px;
  margin-left: 65px;
  margin-top: 40px;
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

input::placeholder { color: #aaaaaa; }
input:focus { outline: none; }

.spana {
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
  color: #aaa;
  left: 10px;
  font-size: 15px;
  bottom: 8px;
  transition: all .2s;
}

.inputa:focus ~ .labela, .inputa:valid ~ .labela {
  font-size: 16px;
  bottom: 40px;
  color: #666;
  font-weight: bold;
}

.inputa:focus ~ .spana, .inputa:valid ~ .spana {
  width: 100%;
}


    
    

</style>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <jsp:include page="../common/header.jsp"/>


        </div>
        <div id="body">
            <div id="body-left">
                <jsp:include page="../myPage/boardBodyLeftremix.jsp"/>
		
            </div>



            <div id="body-right" data-aos="flip-left">
              
                <div id="body-right-header">
                    <div class="profile-pic">
                        <img src="resources/images/myPage/defaultProfile.png" width="100%" height="100%" style="object-fit: cover;">
                    </div>
                    <div class="profile-title">
                        <h2>프로필 변경</h2>
                        <button>변경</button>
                    </div>
                    

                </div>

               <div id="body-right-middle"></div>
               <div id="body-right-body">
                    
                        
                        <div class="classtitle">
                        <h2>회원정보 수정</h2>
                        </div>
                    <div class="personinfoborder">

                        <div class="classa">
                            <input type="text" required class="inputa">
                            <label class="labela">아이디</label>
                            <span class="spana"></span>
                        </div>

                        <div class="classa">
                            <input type="password" required class="inputa">
                            <label class="labela">비밀번호 변경</label>
                            <span class="spana"></span>
                        </div>

                        <div class="classa">
                            <input type="password" required class="inputa">
                            <label class="labela">비밀번호 변경 확인</label>
                            <span class="spana"></span>
                        </div>


                        


                        <div class="classa">
                            <input type="text" required class="inputa">
                            <label class="labela">이름</label>
                            <span class="spana"></span>
                        </div>


                        <div class="classa">
                            <input type="text" required class="inputa">
                            <label class="labela">닉네임</label>
                            <span class="spana"></span>
                        </div>


                        <div class="classa">
                            <input type="text" required class="inputa">
                            <label class="labela">핸드폰</label>
                            <span class="spana"></span>
                        </div>
                        
                        <div class="classa">
                            <input type="text" required class="inputa">
                            <label class="labela">이메일</label>
                            <span class="spana"></span>
                        </div>

                        <button type="button" class="btn btn-primary" id="button_modify">수정하기</button>
                        <button type="button" class="btn btn-secondary" id="button_cancel">취소</button>
                    </div>
                    
                   
                    
                </div>
                    
                   
                      
                      
                      
                   
                  

               </div>
                
                
               
            </div>
            
        
        

        <div id="footer">




        </div>
    </div>
    
	<script>
	document.getElementById('button_modify').addEventListener('click', function(){
    Swal.fire({
  title: '정말 수정하시겠습니까?',
  text: "ㅋ",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: '수정'
}).then((result) => {
  if (result.isConfirmed) {
    Swal.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  }
})
	})
    
    </script>


<script>
    AOS.init();
  </script>
</body>

</html>