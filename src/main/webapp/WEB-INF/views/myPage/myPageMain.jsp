<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<style>
         /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }        */
    body{
        margin: 0;
    }
    #wrapper{
        min-width: 1180px;
        background-color: #ffffff;
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
    display: flex;
    justify-content: center;
    padding: 20px 40px;
   
   }

   #button_modify{
    position: relative;
  width: 200px;
  margin-left: 65px;
  margin-top: 40px;
   }
   
   #button_cancel{
    position: relative;
  width: 200px;
  margin-left: 65px;
  margin-top: 40px;
   }
    
    
   .tablecolor{
    background-color: rgba(0,0,0,.05);
   }
   

   
.toggleSwitch {
  width: 100px;
  margin: 30px;
  height: 50px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
  cursor: pointer;
}

.toggleSwitch .toggleButton {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #f03d3d;
}


.toggleSwitch.active .toggleButton {
  left: calc(100% - 44px);
  background: #fff !important;
}

.toggleSwitch, .toggleButton {
  transition: all 0.2s ease-in;
}

.toggleSwitch.blue.active {
  background: #5151e5;
}

.toggleSwitch.blue .toggleButton {  
  background: #5151e5;
}
/*
   background-color: #fc3441;
                    #ffcb3d;
                    #0c12
*/



    
    

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



            <div id="body-right">
              
                <div id="body-right-header">
                    
                    <div class="profile-pic">
                        <img src="resources/images/myPage/defaultProfile.png" width="100%" height="100%" style="object-fit: cover;">
                    </div>

                    <div class="profile-title">
                        <h4>임재원</h4> <span>님 환영합니다</span>
                     
                          <label for="toggle" class="toggleSwitch blue">
                            <span class="toggleButton"></span>
                          </label>
                    </div>
                    

                </div>

               <div id="body-right-middle"></div>
               <div id="body-right-body">
                    
                        
                        <div class="classtitle">
                        <h2> 회원정보</h2>
                        </div>
                    <div class="personinfoborder" data-aos="fade-up-right">
                        <table border="1" width="600" height="200">
                            <tr>
                                <td width="100" class="tablecolor">회원 이름</td>
                                <td width="300">임재원</td>
                                
                            </tr>

                            <tr>
                                <td width="100" class="tablecolor">회원 아이디 </td>
                                <td>nemo0824</td>
                                
                            </tr>


                            <tr>
                                <td width="100" class="tablecolor">닉네임</td>
                                <td>하이</td>
                                
                            </tr>


                            <tr>
                                <td width="100" class="tablecolor">핸드폰</td>
                                <td>01041465622</td>
                                
                            </tr>

                            <tr>
                                <td width="100" class="tablecolor">이메일</td>
                                <td>nemo0824@naver.com</td>
                                
                            </tr>
                            


                        </table>
                        

                      
                    </div>
                    <button type="button" class="btn btn-primary" id="button_modify">수정하기</button>
                    <button type="button" class="btn btn-secondary" id="button_cancel">취소</button>
                   
                    
                </div>
                    
                   
                      
                      
                      
                   
                  

               </div>
                
                
               
            </div>
            
        
        

        <div id="footer">




        </div>
    </div>
    
    <script>
    const toggleList = document.querySelectorAll(".toggleSwitch");

    toggleList.forEach(($toggle) => {
    $toggle.onclick = () => {
    $toggle.classList.toggle('active');
    if(toggleList[0].classList.contains('active')){
        dark_mode();
    }else{
        light_mode();
    }
  }
  
});

            function dark_mode() {
                document.querySelector("#body").style.backgroundColor="rgb(47, 52, 55)"; 
                document.querySelector("body").style.color="white";
            }
            function light_mode() {
                document.querySelector("#body").style.backgroundColor="white"; 
                document.querySelector("body").style.color="black";
            }

  </script>

<script>
    AOS.init();
  </script>
    
</body>

</html>