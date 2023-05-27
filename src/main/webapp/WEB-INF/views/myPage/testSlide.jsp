<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
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