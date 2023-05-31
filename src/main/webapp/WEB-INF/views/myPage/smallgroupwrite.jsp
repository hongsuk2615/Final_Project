<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
         /* *{
        border: 1px solid blue !important;
        box-sizing: border-box;
    }       */
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
        border: solid 2px ;
    }

    #footer{
        
    }

   

    #body-right-header{
        width: 100%;
        height: 20%;
    }

    #body-right-body{
        margin: 50px 0px 0px 0px;
        width: 100%;
        height: 80%;
        padding: 2%;
        
    }

 

    

    #body-right-header-left{
        float: left;
        width:70%;
        height: 100%;
        padding: 30px;
        
    }

    #body-right-header-right{
        float: left;
        width:30%;
        height:100%;
    }

    .body-right-header-right-updatebutt{
        float: left;
        width: 50%;
        height: 20%;
       padding: 10px 0px 10px 20px;
    }
    .body-right-header-right-deletebutt{
        float:left;
        width: 50%;
        height:20%;
        padding: 10px 0px 10px 20px;
    }
    .body-right-header-right-qr{
        width: 100%;
        height: 80%;
        clear: both;
        border-radius: 4rem;
    }

    .square{
        padding: 20px 0px 0px 0px;
        width: 200px;
        height: 200px;
        
        
    }
   

    .body-right-title-h4{
        margin: 10px 0px 30px 0px;
        border-radius: 4rem;
        background-color: #ffffff;
        border: solid 2px;
        text-align: center;
    }
    
    .body-right-title-h2{
    	margin: 10px 20px 20px 0px;
        border-radius: 4rem;
        background-color: #ffffff;
        border: solid 2px;
        text-align: center;
    }
    
    .body-right-title-h3{
    	margin: 10px 10px 20px 20px;
        border-radius: 4rem;
        background-color: #ffffff;
        border: solid 2px;
        text-align: center;
    }
    
  
    .body-right-body-content{
        width:100%;
        height:85%;
        border-radius: 4rem;
        background-color: #ffffff;
    }
    .body-right-body-list{
        width:100%;
        height:15%;
        border-radius: 4rem;

        

    }
    #listgo{
        margin: 30px 0px 0px 0px;
        width: 100%;
        border-radius: 4rem;
        
    }

    .body-right-body-contentarea{
        width:100%;
        height:100%;
        padding: 10%;
        border-radius: 4rem;
        background-color: #ffffff;
    }

   
    .input-group{
        padding: 10px;
        border-radius: 4rem;
        background-color: #ffffff;
        border: solid 2px ;
    }
    
    
    #writetitle{
        width: 430px;
        height: 30px;
    }

</style>
</head>
<body>
	<form>
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
                  <div id="body-right-header-left">
                    
                        
                    	<input type="text" placeholder="지역" class="body-right-title-h2" name="smallLocation">
                    	<input type="text" placeholder="모집인원" class="body-right-title-h3" name="recruitNo">
                    
                        <input type="text" placeholder="제목	"class="body-right-title-h4" id="writetitle" name="title">
                    
                   
                        <div class="input-group">
                            <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                            <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Upload</button>
                        </div>

                    
                  </div>

                    <div id="body-right-header-right">
                        <div class="body-right-header-right-updatebutt">
                            
                        </div>
                        <div class="body-right-header-right-deletebutt">
                            <button type="submit" class="btn btn-primary" id="delete_button">작성하기</button>
                   
                        </div>
                        <div class="body-right-header-right-qr">
                            <div class="square">
                            <img src="resources/images/myPage/opentalkroom.png" width="100%" height="100%">
                            </div>
                        </div>
                        

                    </div>
                    
                </div>
                
                <div id="body-right-body">
                    
                 <div class="body-right-body-content">
                    <textarea class="body-right-body-contentarea" name="content">
런닝 동호회

어쩌꾸 저쩌구 FC  모집중 

모집인원 5명 

오픈카카오톡 들어오셔서 양식 작성 및 제출 요망

이름 :
나이 :
거주지 :
참여율 :
포부 : 

                    </textarea>
                 </div>
                 <div class="body-right-body-list"> 
                    <button type="button" class="btn btn-success" id="listgo">목록으로</button>
                </div>
                </div>
             
                
                
              
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    </form>
    
   
</body>
</html>