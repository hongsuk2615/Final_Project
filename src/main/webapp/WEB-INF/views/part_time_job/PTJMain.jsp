<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        flex-direction: column;
        align-items: center;
    }

    #body-search{
    	display: flex;
        width: 20%;
        min-width: 900px;
        min-height: 200px;
        background-color: rgb(0, 60, 120);
    }
    #body1{
        display: flex;
        width: 50%;
        min-width: 900px;
        min-height: 900px;
    }

    #footer{
        
    }

</style>
</head>
<body>
    <div id="wrapper">
        <div id="header">
			<jsp:include page="../common/header.jsp" />
        </div>
        <div id="body">
            <div id="body-search">
                <img src="../resources/images/ptj.jpg" style="width: 900px; height: 300px;">
            </div>
            <div id="body1">
				<div>
					
				</div>
				<div>
					
				</div>
            </div>
        </div>

        <div id="footer">




        </div>
    </div>
    
</body>
</html>