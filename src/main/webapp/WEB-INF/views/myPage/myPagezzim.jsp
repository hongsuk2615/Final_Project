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
  <jsp:include page="../common/rightside.jsp"/>
    <div id="wrapper">
        <div id="header">
          <jsp:include page="../common/header.jsp"/>


        </div>
        <div id="body">
            <div id="body-left">
              <jsp:include page="../common/boardBodyLeftMyPage.jsp"/>

            </div>



            <div id="body-right">
              
                <div id="body-right-header">
                    <div class="body-right-pic">
                      <img src="/thrifty/resources/images/myPage/heart.png" width="100%" height="100%">
                    </div>
                    <div class="body-right-title">
                      <div class="bdoy-right-title-content">
                      <h2>찜 목록</h2>
                      </div>
                    </div>
                    <div class="body-right-butt">
                      <div class="body-right-butt-content">
                      
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
                             쉐어하우스 
                            </button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              
                              <div class="card-list">
				
							<c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 2 }">
	                                <div class="card" >
	                                	<img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;" onclick="location.href='/thrifty/usedProduct/detail?bNo=${b.boardNo}'">
	                                    <div class="container">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>
                            
                                  
                                  

                                </div>



                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              중고물품
                            </button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                            
                              <div class="card-list">
								
                                <c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 4 }">
								
	                                <div class="card" >
	                                <img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;"  onclick="location.href='/thrifty/sharehouse/detail?bNo=${b.boardNo}'">
	                                    <div class="container" style="text-overflow: ellipsis; width: 200px; white-space: nowrap; ">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>
 

                                </div>


                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              소모임
                            </button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                             
                              <div class="card-list">

                                 <c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 7 }">
	                                <div class="card" >
	                                <img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;" onclick="location.href='/thrifty/smallGroup/detail?bNo=${b.boardNo}'">
	                                    <div class="container">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>

                                </div>

                            </div>
                          </div>
                        </div>







                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                              카풀
                            </button>
                          </h2>
                          <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                            
                              <div class="card-list">

                                <c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 3 }">
	                                <div class="card" >
	                                <img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;" onclick="location.href='/thrifty/carPool/detail?bNo=${b.boardNo}'">
	                                    <div class="container">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>
                            

                                </div>


                            </div>
                          </div>
                        </div>



                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingFive">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                              공동구매 
                            </button>
                          </h2>
                          <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                            
                              <div class="card-list">

                                 <c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 6 }">
	                                <div class="card" >
	                                	<img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;" onclick="location.href='/thrifty/co_purchase/detail?bNo=${b.boardNo}'">
	                                    <div class="container">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>
                            

                                </div>


                            </div>
                          </div>
                        </div>
                        
                         <div class="accordion-item">
                          <h2 class="accordion-header" id="headingSix">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                              심부름/알바
                            </button>
                          </h2>
                          <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                            
                              <div class="card-list">
								
                                <c:forEach items= "${list}" var="b">
								<c:if test="${b.categoryUNo == 5 }">
	                                <div class="card" >
	                                	<img src="/thrifty/resources/images/myPage/cancel.png" bNo= "${b.boardNo}" onclick="deleteWishList(this)" style="width: 20px; height:20px;">
	                                    <img src="${b.upperCategoryName=='K'? '': '/thrifty/resources/images/myPage/'}${b.content}" alt="Avatar" style="width:200px; height: 200px;" onclick="location.href='/thrifty/ptj/detail?bNo=${b.boardNo}'">
	                                    <div class="container">
	                                      <h4><b>${b.nickName} </b></h4>
	                                      <p>${b.title}</p>
	                                    </div>
	                                  </div> 
                                 </c:if>
                            </c:forEach>
 

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
    <script>
    function deleteWishList(element){
        let bNo=$(element).attr("bno");
        console.log(bNo);
        $.ajax({
            url : "/thrifty/wishList/delete",
            data : {bNo},
            success : function(result){
                console.log(result);
                if(result == 1){
                    Swal.fire({
                        position: 'top-center',
                        icon: 'success',
                        title: '찜삭제완료',
                        showConfirmButton: false,
                        timer: 1000
                    }).then(()=>{location.reload();});
                }
            }
        })
    }
    </script>
</body>
</html>