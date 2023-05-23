<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/thrifty/resources/css/part_time_job/part_time_job_detail.css" rel="stylesheet">
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
            <jsp:include page="../common/header.jsp"/>
        </div>
        <div id="body">
	        <div id="body-left">
	                <jsp:include page="../common/boardBodyLeft.jsp"/>
	        </div>
	        <div id="body-right"></div>
        </div>
        <div id="footer">




        </div>
    </div>
    
</body>
</html>