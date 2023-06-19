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
        border-radius: 2rem;
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
    height: 10%;
    display: flex;
    justify-content: center;
    padding: 20px 20px;
    
   }
   
   

   #personinfoborder{
    
    height: 70%;
    padding: 20px 40px;
   
   }

    
    
   .tablecolor{
    background-color: rgba(0,0,0,.05);
   }
   
   
   .info-element{
    display: flex;
    flex-wrap: wrap;
    padding: 20px 0px 10px 0px;
   }

   .info-element>label{
    
   flex: 11 40%;
    border-bottom: solid black;
   }

   #btnsss{
    
    display: flex;
    justify-content: space-evenly;
   }
   
   #btnself{
    display: flex;
    justify-content: right;
   }

   #button_modify{
    width: 200px;
    height: 40px;
   }

   #button_cancel{
    width: 200px;
    height: 40px;
   }
 
   #member_retire{
    margin-right: 41px;
   }
  
 
/*
   background-color: #fc3441;
                    #ffcb3d;
                    #0c12
*/



    
    

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
                    <c:if test="${loginUser.loginMethod != 'K'}">    
                       <img src="${contextPath}/resources/upfiles/myPage/${loginUser.changeName}" onerror="this.src='/thrifty/resources/images/common/noImage.png'" width="100%" height="100%" style="object-fit: cover;">
                    </c:if>
                    
                    <c:if test="${loginUser.loginMethod == 'K'}">
                    	<img src="${loginUser.changeName}" width="100%" height="100%">
                    </c:if>
                    </div>

                    <div class="profile-title">
                        <h4>${loginUser.nickName}</h4> <span>님 환영합니다</span>
                     
                          
                    </div>
                    

                </div>

               <div id="body-right-middle"></div>
               <div id="body-right-body">
                    
                        
                        <div class="classtitle">
                            <img src="/thrifty/resources/images/myPage/team.png" id="message-profile-img" height="40px">  <h2> 회원정보</h2>
                        </div>
                    <div class="personinfoborder" data-aos="fade-up-right" id="personinfoborder">
                        
                        <div class="info-element">
                            <label>회원 이름 </label>
                            <label>${loginUser.userName}</label>
                        </div>

                        <div class="info-element">
                            <label>회원 아이디 </label>
                            <label>${loginUser.userId}</label>
                        </div>     
                        
                        <div class="info-element">
                            <label>닉네임</label>
                            <label>${loginUser.nickName}</label>
                        </div>    

                        <div class="info-element">
                            <label>핸드폰</label>
                            <label>${loginUser.loginMethod == 'K' ? '카카오 로그인 유저는 정보수정이 불가능합니다.' : loginUser.phone}</label>
                        </div>

                        <div class="info-element">
                            
                            <label>로그인 방법</label>
                            <label>${loginUser.loginMethod =='K'? 'Kakao' : '알뜰살뜰'}</label>
                        
                        </div>

                        <div class="info-element">
                            <label>이메일</label>
                            <label>${loginUser.email}</label>
                        </div>
                        
                        <div class="info-element">
                            <label>성별</label>
                            <label>${loginUser.gender}</label>
                        </div>

                        
                        

                      
                    </div>
                    <div id="btnsss">
                      <c:if test="${loginUser.loginMethod != 'K' }">
                    <a  class="btn btn-primary" id="button_modify" href="${pageContext.request.contextPath}/mypage/myUpdateForm">수정하기</a>
                    </c:if>
                    
                    </div>
                    
                    <div id="btncover">
                        <div id="btnself">
                        <a href="/thrifty/mypage/selfban" class="btn btn-danger" id="member_retire">회원 탈퇴</a>
                        </div>
                    </div>
                </div>
                    
                   
                      
                      
                    

                  

               </div>
                
                
               
            </div>
            
           
        

        <div id="footer">




        </div>
    </div>
    <c:if test="${loginUser.loginMethod == 'K' }">
    	<script>
    	Swal.fire({
            position: 'top-center',
            icon: 'error',
            title: '카카오 로그인 유저는 정보수정이 불가능합니다.',
            showConfirmButton: false,
            timer: 1000
        })
    	
    	</script>
    </c:if>
   

<script>
    AOS.init();
  </script>
    
</body>

</html>