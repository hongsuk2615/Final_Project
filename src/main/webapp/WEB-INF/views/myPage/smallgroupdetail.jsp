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


	#item-btns{
    display: flex;
    justify-content: right;
}

#item-btns>div{
    margin-top: 5px;
    margin-left: 5px;
    width : 75px;
    height : 30px;
    padding : 3px;
    border-radius: 4px;
    color : white;
    text-align: center;
    font-size: 15px;
    cursor: pointer;
}


#wish-btn{
    background-color: rgb(52, 152, 219);
}
#report-btn{
    background-color: red;
}
	

</style>
</head>

<body>
 
    <div id="wrapper">
        <div id="header">
			<jsp:include page="../common/header.jsp"/>
			


        </div>
        <form action="${pageContext.request.contextPath}/smallGroup/smallgroupupdate/" method="post">
        <div id="body">
            <div id="body-left">
				<jsp:include page="../common/boardBodyLeft.jsp"/>

            </div>


		
            <div id="body-right">
              
                <div id="body-right-header">
                  <div id="body-right-header-left">
                    
                        <h4 class="body-right-title-h2" name="smallLocation">${sg.smallLocation}</h4>
                        <h4 class="body-right-title-h3" name="recruitNo">${sg.recruitNo} 명</h4>
                        <h4 class="body-right-title-h4" name="title">${sg.board.title}</h4>
                    	<input type="hidden" name="boardNo" value="${sg.board.boardNo }">
                   
                      

                    
                  </div>
                    <div id="body-right-header-right">
                       <c:if test="${sg.member.userNo == loginUser.userNo}">
                        <div class="body-right-header-right-updatebutt">
                            <button type="submit" class="btn btn-warning">수정하기</button>
                        </div>
                        <div class="body-right-header-right-deletebutt">
                            <button type="button" class="btn btn-danger" id="delete_button">삭제하기</button>
                        </div>
                   		</c:if>
                   		
                   		<c:if test="${sg.member.userNo 	!= loginUser.userNo}">
                            <div id="item-btns">
                                <div id="wish-btn" bNo ="${board.boardNo}">찜</div>
                                <div id="report-btn" bNo="${board.boardNo}">신고</div>
                            </div>
                    	</c:if> 
                        <div class="body-right-header-right-qr">
                            <div class="square">
                            <img src="https://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=${sg.kakaoLink}" width="100%" height="100%">
                            </div>
                        </div>
                        

                    </div>
                    	
                </div>
                
                <div id="body-right-body">
                    
                 <div class="body-right-body-content">
                    <textarea class="body-right-body-contentarea" name="content" readonly>
						${sg.board.content}
                    </textarea>
                 </div>
                 <div class="body-right-body-list"> 
                    <button type="button" class="btn btn-success" id="listgo">목록으로</button>
                </div>
                </div>
             
                
                
               
            </div>
            
        </div>
 	</form>
        <div id="footer">




        </div>
    </div>
    
    
 <script>
	document.getElementById('delete_button').addEventListener('click', function(){
    Swal.fire({
  title: '정말 삭제하시겠습니까?',
  text: "ㅋ",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: '삭제'
}).then((result) => {
  if (result.isConfirmed) {
	let boardNo =  document.querySelector('input[name=boardNo]').value;
	location.href = '${contextPath}/smallGroup/delete?boardNo='+boardNo; //? 뒤에있는것들은 requestparam으로 받아올수있ㅇㅁ 
    Swal.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  }
})
	})
    
</script>  
 
<script>
document.getElementById('delete_button').addEventListener('click', function(){
	let boardNo =  document.querySelector('input[name=boardNo]').value;
    location.href = '${contextPath}/smallGroup/delete?boardNo='+boardNo; //? 뒤에있는것들은 requestparam으로 받아올수있ㅇㅁ 
});

</script> 



<script>
            document.getElementById('wish-btn').addEventListener('click', function(){
                let bNo = $(this).attr("bNo");
                console.log(bNo);
                $.ajax({
                    url : "/thrifty/wishList/insert",
                    data : {bNo},
                    success : function(result){
                        console.log(result);
                        if(result == 1){
                            Swal.fire({
                                position: 'top-center',
                                icon: 'success',
                                title: '찜완료',
                                showConfirmButton: false,
                                timer: 1000
                             })
                        }else if(result == -1){
                            Swal.fire({
                                position: 'top-center',
                                icon: 'warning',
                                title: '비로그인 상태입니다.',
                                showConfirmButton: false,
                                timer: 1000
                            }).then(()=>{
                                login();
                            })
                            

                        }else if(result == 2){
                            Swal.fire({
                                position: 'top-center',
                                icon: 'error',
                                title: '이미 찜한 게시글입니다.',
                                showConfirmButton: false,
                                timer: 1000
                            })
                        }
                    }
                })
            })

            document.getElementById('report-btn').addEventListener('click', function(){
                let bNo=$(this).attr("bNo");
                const { value: fruit } = Swal.fire({
                    title: '신고항목을 고르세요',
                    input: 'select',
                    inputOptions: {
                        
                    },
                    inputPlaceholder: '신고항목',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '신고하기',
                    cancelButtonText: '취소',
                    inputValidator: (value) => {
                        return new Promise((resolve) => {
                        if (value === 'oranges') {
                            resolve()
                        } else {
                            resolve('You need to select oranges :)')
                        }
                        })
                    }
                })
            })
</script>
</body>
</html>