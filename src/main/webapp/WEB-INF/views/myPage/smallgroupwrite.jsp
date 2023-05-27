<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

    #footer{
        
    }

   

    #body-right-header{
        width: 100%;
        height: 30%;
    }

    #body-right-body{
        width: 100%;
        height: 70%;
    }

 

    

    #body-right-header-left{
        float: left;
        width:70%;
        height: 100%;
        
    }

    #body-right-header-right{
        float: left;
        width:30%;
        height:100%;
    }
    .body-right-header-right-writebutt{
        width: 100%;
        height: 20%;
    }
    .body-right-header-right-qr{
        width: 100%;
        height: 80%;
        border-radius: 4rem;
    }
    .body-right-title{
        height: 33%;
    }
  
    .body-right-body-content{
        width:100%;
        height:85%;
        padding: 0.9rem;
        border-radius: 4rem;
    }
    .body-right-body-list{
        width:50%;
        height:15%;
        
    }
   
    
    

</style>
</head>
<body>
    <div id="wrapper">
        <div id="header">



        </div>
        <div id="body">
            <div id="body-left">


            </div>



            <div id="body-right">
              
                <div id="body-right-header">
                  <div id="body-right-header-left">
                    <div class="body-right-title">소규모 그룹 작성하기(카테고리)</div>
                    <div class="body-right-title">제목 </div>
                    <div class="body-right-title">첨부파일 </div>
                  </div>

                    <div id="body-right-header-right">
                        <div class="body-right-header-right-writebutt">작성하기 버튼</div>
                        <div class="body-right-header-right-qr">qr 공간</div>


                    </div>
                    
                </div>
                
                <div id="body-right-body">
                 <div class="body-right-body-content">

                 </div>
                 <div class="body-right-body-list"> 목록으로 가는거 버튼  </div>
                </div>
             
                
                
               
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>