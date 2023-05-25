<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
       /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }     */
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
        background-color: #f5f5f5f5;
        
    }

    #footer{
        
    }

    #body-right-header{
        
        width: 100%;
        height: 20%;
        border: solid 2px ;
    }
    #body-right-bwheaderbody{
      width: 100%;
      height: 5%;
      background-color: white;
    }

    #body-right-body{
        width: 100%;
        height: 60%;
        display: flex;
        justify-content: space-evenly;
    }
   


    #body-right-bodyfooterbw{
      width: 100%;
      height: 5%;
      background-color: white;
    }

    #body-right-footer{
        width: 100%;
        height: 10%;
    }
    

    .body-right-pic{
        float: left;
        width: 25%;
        height: 100%;
        
    }
    .body-right-title{
        float: left;
        width: 50%;
        height: 100%;
    }
    .body-right-butt{
        float: left;
        width: 25%;
        height: 100%;
        
        
       
    }

    
   

    .bdoy-right-title-content{
      display: flex;
      padding: 20%;
      justify-content: center;
    }
    .body-right-butt-content{
      
      position: relative;
      top : 40%;
      display: flex;
      justify-content: center;
      
     
    }
    


    
    #sub-category11{
		    width: 100%;
        height: 100%;
        display: flex;
    justify-content: center;
    align-items: center;
        
    }
    .scrollbarcontent{
        list-style-type: none;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }

    .card-list{
    display: flex;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    border: 1px solid black;
    padding: 50px;
    width: 100%;
}
 .card{
     min-width: 200px;
     height: 280px;
    scroll-snap-align: center;
    border: 1px solid black;
    background-color: #f5f5f5f5;
    transition-duration: 0.3s;
    margin: 0 20px 0 20px;
}

.card-list::-webkit-scrollbar {
  height: .5rem;
  background-color: gray
}
.card-list::-webkit-scrollbar-thumb{
  background-color: blue;
  border-radius: 10px;
  border-width: 20px;
}

.card:hover{
  transform: translateY(-.5rem);
  

}
.card:hover ~ .card{
  transform: translateX(1rem);
}    


#accordionExample{
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
              <jsp:include page="../common/boardBodyLeft.jsp"/>

            </div>



            <div id="body-right">
              
                <div id="body-right-header">
                    <div class="body-right-pic">
                      <img src="resources/images/myPage/heart.png" width="100%" height="100%">
                    </div>
                    <div class="body-right-title">
                      <div class="bdoy-right-title-content">
                      <h2>찜 목록</h2>
                      </div>
                    </div>
                    <div class="body-right-butt">
                      <div class="body-right-butt-content">
                      <button type="button" class="btn btn-primary">글쓰기</button>
                      </div>
                    </div>
                </div>
                <div id="body-right-bwheaderbody"></div>
                
                <div id="body-right-body">
                  
                    
                  
                    <div id="sub-category11" >

                      <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Accordion Item #1
                            </button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              
                              <div class="card-list">

                                <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>임재원</b></h4>
                                      <p>중고물품 삽니다 </p>
                                    </div>
                                  </div> 
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>장서영</b></h4>
                                      <p>아 담배피고싶다  😎 </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  

                                </div>



                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Accordion Item #2
                            </button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                            
                              <div class="card-list">

                                <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>임재원</b></h4>
                                      <p>중고물품 삽니다 </p>
                                    </div>
                                  </div> 
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>

                                </div>


                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Accordion Item #3
                            </button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                             
                              <div class="card-list">

                                <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>임재원</b></h4>
                                      <p>중고물품 삽니다 </p>
                                    </div>
                                  </div> 
                                  <div class="card">
                                    <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
                                    <div class="container">
                                      <h4><b>김홍석</b></h4>
                                      <p>전역합니다  </p>
                                    </div>
                                  </div>

                                </div>

                            </div>
                          </div>
                        </div>
                      </div>
                              
                              
                                
                    
                    
                            </div>
                          </div>
                        </div>
                      </div>








                        
                    </div>
                 
                  

                  
                
                      



                </div>
                <div id="body-right-bodyfooterbw"></div>
                <div id="body-right-footer"> 
                    페이징 처리 하는곳 footer

                </div>
                
                
               
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>