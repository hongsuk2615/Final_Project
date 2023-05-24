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
        height: 20%;
    }

    #body-right-body{
        width: 100%;
        height: 70%;
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
        height: 100%
    }
    .body-right-butt{
        float: left;
        width: 25%;
        height: 100%
    }

    #body-right-body-table{
        width: 100%;
        height: 100%;
        
    }
    .table_title{
        height: 15%;
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
                    <div class="body-right-pic">사진 공간</div>
                    <div class="body-right-title">제목 공간</div>
                    <div class="body-right-butt">모임 모집 글쓰기 버튼 공간 </div>
                </div>
                
                <div id="body-right-body">
                 
                    <table id="body-right-body-table">
                      <tr class="table_title">
                        <th>지역</th>
                        <th>그룹장 닉네임</th>
                        <th>제목</th>
                        <th>모집인원 </th>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>강남구</td>
                        <td>nemo0824</td>
                        <td>아무나구함 오라사람와라 </td>
                        <td>5</td>
                      </tr>


                    </table>



                </div>
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