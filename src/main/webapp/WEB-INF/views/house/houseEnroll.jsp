<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        .wrap{
            margin: 0px 10vw;
        }

        #ask{
            display: flex;
            justify-content: center;
        }
        #content>div{
            width: 100%;
        }
        #title{
            text-align: center;
        }

        #content{
            border: 1px solid #999;
            border-radius: 5%;
            margin: 0% 25%;
        }

        #apply{
        width:100px;
        margin:auto;
        display:block;
    }
    
    

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
    <div>
        header
    </div>
    <div class="wrap">
        <div id="content">
    <div id="title">
        <h2>임대관리 폼</h2>
    </div>
    <div id="ask">
        <div>
        <form>
            <button type="button" onclick="addRoom()">방 추가하기</button> <br>
            * 첫번째 사진이 대표사진으로 설정됩니다. <br>
            <div id="roomImgsection">
            <input type="text" placeholder="방 이름" name="name" id="name">
            <input type="file" multiple accept="image/gif, image/jpeg, image/png"> <br>
            <button type="button" class="closebtn" >1.X</button>
            </div>
            ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>
            <select id="tableset" onChange="getselect()">
                <option value="division">구분</option>
                <option value="gender">성별</option>
                <option value="type">타입</option>
            </select>
            <br>
            <div id="divisionsection">
                <label for="division">구분</label> 
                <input type="text" name="division" id="division"> <br>
                <button type="button" class="closebtn">2.X</button>
            </div>
            ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>

            <label for="information">지점소개</label> <br>
            <textarea type="text" placeholder="지점소개" name="information" id="information">
                </textarea> <br>
            ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>
            
            <label for="service">제공서비스</label> <br>
            <textarea type="text" placeholder="제공서비스" name="service" id="service">
                </textarea> <br>
            ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>

            <label for="location">위치</label> 
            <input type="text" name="location" id="location"> <br>
            ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>

            <label for="convenience">편의시설</label> <br>
            <textarea type="text" placeholder="편의시설" name="convenience" id="convenience">
                </textarea> <br>
            <button id="apply" type="button">신청하기</button>
        </form>
    </div>
    </div>
    </div>
</div>

    <script>

        // hNo 1
        // hNo -> rNo 2
        // rNo -> img1,2,3,4
        
        function addRoom(){ // 방 추가
            let a = `
            <input type="text" placeholder="방 이름" name="name" id="name">
            <input type="file" multiple accept="image/gif, image/jpeg, image/png"> <br>
            <button type="button" >X</button> <br>
            `
           $('#roomImgsection').append(a);
        }

       function getselect() { // select option 
        let select = document.getElementById('tableset');
        let option = select.options[select.selectedIndex];
        
        if(document.getElementById(option.value)){
            alert('이미 클릭하였습니다.')
        }else{

            
            let a = `
            <div id="${option.value}">
                <label for="${option.value}">${option.text}</label> 
                <input type="text" name="${option.value}">
                <button type="button" >X</button> <br>
            </div>
            `;

            $('#divisionsection').append(a);

            document.querySelector('#' + option.value +  '> button').addEventListener('click', function(){
                document.getElementById(option.value).remove();
            })
        }
        
    }   

    </script>

</body>
</html>