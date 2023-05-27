<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.2/js/bootstrap.min.js"></script> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<style>

    .card-list{
    display: flex;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    border: 1px solid black;
}
 .card{
     min-width: 350px;
    scroll-snap-align: center;
    border: 1px solid black;
    background-color: rgb(75, 70, 70);
    transition-duration: 0.3s;
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



</style>
<body>
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Accordion Item #1
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          



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
          <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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
          <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
        </div>
      </div>
    </div>
  </div>





  

  
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
              <h4><b>임재원</b></h4>
              <p>중고물품 삽니다 </p>
            </div>
          </div> 
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
              <h4><b>임재원</b></h4>
              <p>중고물품 삽니다 </p>
            </div>
          </div> 
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
              <h4><b>임재원</b></h4>
              <p>중고물품 삽니다 </p>
            </div>
          </div> 
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
              <h4><b>임재원</b></h4>
              <p>중고물품 삽니다 </p>
            </div>
          </div> 

          <div class="card">
            <img src="resources/images/myPage/defaultProfile.png" alt="Avatar" style="width:100%">
            <div class="container">
              <h4><b>임재원</b></h4>
              <p>중고물품 삽니다 </p>
            </div>
          </div> 

    </div>
    
</body>
</html>