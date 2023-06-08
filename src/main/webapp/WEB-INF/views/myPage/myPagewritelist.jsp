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



    #body-right-header{
        width: 100%;
        height: 20%;

    }

    #body-right-middle{
        width: 100%;
        height: 5%;
    }


    #body-right-body{
        width: 100%;
        height: 75%;
        border-radius: 4rem;
    }

    .profile-pic{
        float: left;
        width: 30%;
        height:100%;
        border-radius: 4rem;
    }

    .profile-title{
        float: left;
        width:30%;
        height: 100%;
    }
   

    table{
        width: 100%;
        height: 100%;
        border-top: 1px solid;
        border-collapse: collapse;
    }

   

  

    #footer{
        
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
                    <div class="profile-pic">프로필 사진</div>
                    <div class="profile-title">프로필 변경</div>
               

                </div>

               <div id="body-right-middle">공백</div>
               <div id="body-right-body">
                <div id="body-right-body-table">
                <h2>내가 쓴 글 조회</h2>
                <table>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>닉네임</th>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td>카테</td>
                        <td>제목</td>
                        <td>닉네임</td>
                    </tr>
                    

                </table>
                </div>
                  
                <div id="body-right-body-footer">
                    
                </div>

               </div>
                
                
               
            </div>
            
        </div>
        

        <div id="footer">




        </div>
    </div>
    
</body>
</html>