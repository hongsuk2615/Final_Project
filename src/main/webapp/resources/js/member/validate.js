function validateId(arg){
    if(regCheckId()){
        let return_value;
        $.ajax({
            url : "/thrifty/member/validateId",
            method : "GET",
            data : {userId : $('#userId').val()},
            async: false,
            success : function(result){
                if(result){
                    if(typeof arg != "undefined"){
                        if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
                            document.getElementById('userId').setAttribute('disabled','true');
                            return_value = true;
                        }else{
                            return_value = false;
                        }

                    }else{
                        return_value = true;
                    }
                    document.getElementsByClassName("validate")[0].innerHTML = "중복확인 완료";
                    makeGreen(document.getElementsByClassName("validate")[0]);
                }else{
                    if(typeof arg != "undefined"){
                        alert("중복된 아이디 입니다.");
                    }
                    return_value = false;
                    document.getElementsByClassName("validate")[0].innerHTML = "중복된 아이디";
                    makeRed(document.getElementsByClassName("validate")[0]);
                }
            }
        }); 
        return return_value;   
    }else{
        if(typeof arg != "undefined"){
            alert("유효하지 않은 아이디입니다.");
        }
        return false;
    }
}

function validateEmail(arg){
    if(regCheckEmail()){
        let return_value;
        $.ajax({
            url : "/thrifty/member/validateEmail",
            method : "GET",
            data : {email : $('#email').val()},
            async: false,
            success : function(result){
                if(result){
                    if(typeof arg != "undefined"){
                        if(confirm("사용가능한 이메일 입니다. 사용하시겠습니까?")){
                            document.getElementById('email').setAttribute('disabled','true');
                            return_value = true;
                        }else{
                            return_value = false;
                        }        
                    }else{
                        return_value = true;
                    }
                    document.getElementsByClassName("validate")[3].innerHTML = "중복확인 완료";
                    makeGreen(document.getElementsByClassName("validate")[3]);
                }else{
                    if(typeof arg != "undefined"){
                        alert("중복된 이메일 입니다.");
                    }
                    document.getElementsByClassName("validate")[3].innerHTML = "중복된 이메일";
                    makeRed(document.getElementsByClassName("validate")[3]);
                    return_value = false;
                }
            }
        })
        return return_value;
    }else{
        if(typeof arg != "undefined"){
            alert("유효하지 않은 이메일입니다.");
        }
        return false;
    }   
}

function validateNickName(arg){
    if(regCheckNickName()){
        let return_value;
        $.ajax({
            url : "/thrifty/member/validateNickName",
            method : "GET",
            data : {nickName : $('#nickName').val()},
            async: false,
            success : function(result){
                if(result){
                    if(typeof arg != "undefined"){
                        if(confirm("사용가능한 닉네임 입니다. 사용하시겠습니까?")){
                            document.getElementById('nickName').setAttribute('disabled','true');
                            return_value = true;
                        }else{
                            return_value = false;
                        }        
                    }else{
                        document.getElementsByClassName("validate")[4].innerHTML = "중복확인 완료.";
                        makeGreen(document.getElementsByClassName("validate")[4]);
                        return_value = true;
                    }
                }else{
                    if(typeof arg != "undefined"){
                        alert("중복된 닉네임 입니다.");
                    }
                    document.getElementsByClassName("validate")[4].innerHTML = "중복된 닉네임.";
                    makeRed(document.getElementsByClassName("validate")[4]);
                    return_value = false;
                }
            }
        })
        return return_value;
    }else{
        if(typeof arg != "undefined"){
            alert("유효하지 않은 닉네임입니다.");
        }
        return false;
    }   
}

function regCheckId(){
    let regExp = /^[a-zA-Z][0-9a-zA-Z]{4,20}$/g;
    if(regExp.test(document.getElementById('userId').value)){
        document.getElementsByClassName("validate")[0].innerHTML = "사용가능한 아이디 입니다. 중복확인을 해주세요.";
        makeGreen(document.getElementsByClassName("validate")[0]);
        return true;
    }else{
        document.getElementsByClassName("validate")[0].innerHTML = "사용불가능한 아이디 입니다.";
        makeRed(document.getElementsByClassName("validate")[0]);
        return false;
    }
}

function regCheckPwd(){
    checkPassword();
    let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    if(regExp.test(document.getElementById('userPwd').value)){
        document.getElementsByClassName("validate")[1].innerHTML = "사용가능한 비밀번호 입니다.";
        makeGreen(document.getElementsByClassName("validate")[1]);
        return true;
    }else{
        document.getElementsByClassName("validate")[1].innerHTML = "사용불가능한 비밀번호 입니다.";
        makeRed(document.getElementsByClassName("validate")[1]);
        return false;
    }
}

function checkPassword(){
    if(document.getElementById('checkPwd').value == document.getElementById('userPwd').value){
        document.getElementsByClassName("validate")[2].innerHTML = "일치합니다.";
        makeGreen(document.getElementsByClassName("validate")[2]);
        return true;
    }else{
        document.getElementsByClassName("validate")[2].innerHTML = "일치하지 않습니다.";
        makeRed(document.getElementsByClassName("validate")[2]);
        return false;
    }
}



function regCheckEmail(){
    let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regExp.test(document.getElementById('email').value)){
        document.getElementsByClassName("validate")[3].innerHTML = "사용가능한 이메일 입니다. 중복확인을 해주세요.";
        makeGreen(document.getElementsByClassName("validate")[3]);
        return true;
    }else{
        document.getElementsByClassName("validate")[3].innerHTML = "사용불가능한 이메일 입니다.";
        makeRed(document.getElementsByClassName("validate")[3]);
        return false;
    }
}

function regCheckNickName(){
    let regExp = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
    if(regExp.test(document.getElementById('nickName').value)){
        document.getElementsByClassName("validate")[4].innerHTML = "유효한 닉네임 입니다.";
        makeGreen(document.getElementsByClassName("validate")[4]);
        return true;
    }else{
        document.getElementsByClassName("validate")[4].innerHTML = "올바른 닉네임이 아닙니다.(2자 이상 16자 이하, 영어 또는 숫자 또는 한글)";
        makeRed(document.getElementsByClassName("validate")[4]);
        return false;
    }
}

function regCheckName(){
    let regExp = /^[가-힣]{2,5}$/;
    if(regExp.test(document.getElementById('userName').value)){
        document.getElementsByClassName("validate")[5].innerHTML = "유효한 이름 입니다.";
        makeGreen(document.getElementsByClassName("validate")[5]);
        return true;
    }else{
        document.getElementsByClassName("validate")[5].innerHTML = "올바른 이름이 아닙니다.";
        makeRed(document.getElementsByClassName("validate")[5]);
        return false;
    }
}

function regCheckPhone(){
    let regExp =/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if(regExp.test(document.getElementById('phone').value)){
        document.getElementsByClassName("validate")[6].innerHTML = "유효한 번호 입니다.";
        makeGreen(document.getElementsByClassName("validate")[6]);
        return true;
    }else{
        document.getElementsByClassName("validate")[6].innerHTML = "올바른 휴대폰 번호가 아닙니다.";
        makeRed(document.getElementsByClassName("validate")[6]);
        return false;
    }
}

function validateEnroll(){
    if(!validateId()){
        alert("아이디를 확인하세요");
        document.getElementById("userId").focus();
    }else if(!regCheckPwd()){
        alert("비밀번호를 확인하세요");
        document.getElementById('userPwd').focus();
    }else if(!checkPassword()){
        alert("비밀번호가 일치하지 않습니다."); 
        document.getElementById('checkPwd').focus();   
    }else if(!validateEmail()){
        alert("이메일을 확인하세요");
        document.getElementById('email').focus();
    }else if(!validateNickName()){
        alert("닉네임을 확인하세요");
        document.getElementById('nickName').focus();
    }else if(!regCheckName()){
        alert("이름을 확인하세요");
        document.getElementById('userName').focus();
    }else if(!regCheckPhone()){
        alert("연락처를 확인하세요")
        document.getElementById('phone').focus();
    }else if(!document.getElementById('term-checkbox').checked){
        alert("약관에 동의하세요")
        document.getElementById('term-checkbox').focus();
    }else{
        insertMember();
    }
}

function makeGreen(e){
    e.classList.add('validate-green');
    e.classList.remove('validate-red');
}

function makeRed(e){
    e.classList.add('validate-red');
    e.classList.remove('validate-green');
}