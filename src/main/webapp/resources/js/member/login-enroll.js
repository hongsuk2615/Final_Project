function insertMember(){
    $.ajax({
        url : "/thrifty/member/enroll",
        method : "POST",
        data : {userId : $("input[name='userId']")[0].value,
                userPwd : $("input[name='userPwd']")[0].value,
                email : $("input[name='email']")[0].value,
                nickName : $("input[name='nickName']")[0].value,
                userName : $("input[name='userName']")[0].value,
                phone : $("input[name='phone']")[0].value,
                gender : $("input[name='gender']:checked")[0].value
                },
        success : function(result){
            if(result){
                alert("성공");
                location.href = "/thrifty/";
            }
        }
    })
}

function logout(){
    location.href="/thrifty/member/logout";
}

function myPage(){
	location.href="/thrifty/mypage/myPageMain";
}