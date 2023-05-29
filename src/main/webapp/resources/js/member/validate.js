
function validateId(){
    $.ajax({
        url : "/thrifty/member/validateId",
        method : "GET",
        data : {userId : $('#userId').val()},
        success : function(result){
            if(result){
                alert("사용가능합니다.")
            }else{
                alert("중복된 아이디 입니다.")
            }
        }
    })    
}

function validateEmail(){
    $.ajax({
        url : "/thrifty/member/validateEmail",
        method : "GET",
        data : {email : $('#email').val()},
        success : function(result){
            if(result){
                alert("사용가능합니다.")
            }else{
                alert("중복된 이메일 입니다.")
            }
        }
    })    
}

function validateNickName(){
    $.ajax({
        url : "/thrifty/member/validateNickName",
        method : "GET",
        data : {nickName : $('#nickName').val()},
        success : function(result){
            if(result){
                alert("사용가능합니다.")
            }else{
                alert("중복된 닉네임 입니다.")
            }
        }
    })    
}

function regCheckId(e){
    let regExp = /^[a-zA-Z][0-9a-zA-Z]{4,20}$/g;
    if(regExp.test(e.value)){
        document.getElementsByClassName("validate")[0].innerHTML = "사용가능한 아이디 입니다. 중복확인을 해주세요.";
        return true;
    }else{
        document.getElementsByClassName("validate")[0].innerHTML = "사용불가능한 아이디 입니다.";
        return false;
    }
}

function regCheckPwd(e){
    let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    if(regExp.test(e.value)){
        document.getElementsByClassName("validate")[1].innerHTML = "사용가능한 비밀번호 입니다.";
        return true;
    }else{
        document.getElementsByClassName("validate")[1].innerHTML = "사용불가능한 비밀번호 입니다.";
        return false;
    }
}

function checkPwd(e){
    if(e.value == document.getElementById('userPwd').value){
        document.getElementsByClassName("validate")[2].innerHTML = "일치합니다."
        return true;
    }else{
        document.getElementsByClassName("validate")[2].innerHTML = "일치하지 않습니다."
        return false;
    }
}



function regCheckEmail(e){
    let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regExp.test(e.value)){
        document.getElementsByClassName("validate")[3].innerHTML = "사용가능한 이메일 입니다. 중복확인을 해주세요.";
        return true;
    }else{
        document.getElementsByClassName("validate")[3].innerHTML = "사용불가능한 이메일 입니다.";
        return false;
    }
}

function regCheckName(e){
    let regExp = /^[가-힣]{2,5}$/;
    if(regExp.test(e.value)){
        document.getElementsByClassName("validate")[5].innerHTML = "유효한 이름 입니다.";
        return true;
    }else{
        document.getElementsByClassName("validate")[5].innerHTML = "올바른 이름이 아닙니다.";
        return false;
    }
}

function regCheckPhone(e){
    let regExp =/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if(regExp.test(e.value)){
        document.getElementsByClassName("validate")[6].innerHTML = "유효한 번호 입니다.";
        return true;
    }else{
        document.getElementsByClassName("validate")[6].innerHTML = "올바른 휴대폰 번호가 아닙니다.";
        return false;
    }
}