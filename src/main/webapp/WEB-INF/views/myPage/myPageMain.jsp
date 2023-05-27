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
</head>
<style>
         *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }       
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
                <jsp:include page="../common/boardBodyLeft.jsp"/>
		
            </div>



            <div id="body-right">
              
                <div id="body-right-header">
                    <div class="profile-pic">
                        <img src="resources/images/myPage/defaultProfile.png" width="100%" height="100%" style="object-fit: cover;">
                    </div>
                    <div class="profile-title">
                        <h4>임재원</h4> <span>님 환영합니다</span>

                    </div>
                    

                </div>

               <div id="body-right-middle"></div>
               <div id="body-right-body">
                    
                        
                        <div class="classtitle">
                        <h2> 회원정보</h2>
                        </div>
                    <div class="personinfoborder">
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
    
	
    
</body>

</html>