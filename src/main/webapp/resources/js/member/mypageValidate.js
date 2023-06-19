

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
                }else{
                    if(typeof arg != "undefined"){
                        customAlert("중복된 이메일 입니다.");
                    }
                    return_value = false;
                }
            }
        })
        return return_value;
    }else{
        if(typeof arg != "undefined"){
            customAlert("유효하지 않은 이메일입니다.");
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
                        return_value = true;
                    }
                }else{
                    if(typeof arg != "undefined"){
                        customAlert("중복된 닉네임 입니다.");
                    }
                    return_value = false;
                }
            }
        })
        return return_value;
    }else{
        if(typeof arg != "undefined"){
            customAlert("유효하지 않은 닉네임입니다.");
        }
        return false;
    }   
}



function regCheckPwd(){
    checkPassword();
    let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    if(regExp.test(document.getElementById('userPwd').value)){
        return true;
    }else{
        return false;
    }
}

function checkPassword(){
    if(document.getElementById('checkPwd').value == document.getElementById('userPwd').value){
        return true;
    }else{
        return false;
    }
}



function regCheckEmail(){
    let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(regExp.test(document.getElementById('email').value)){
        return true;
    }else{
        return false;
    }
}

function regCheckNickName(){
    let regExp = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
    if(regExp.test(document.getElementById('nickName').value)){
        return true;
    }else{
        return false;
    }
}



function regCheckPhone(){
    let regExp =/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if(regExp.test(document.getElementById('phone').value)){
        return true;
    }else{
        return false;
    }
}

function validateEnroll(){
    result = false;
    if(!regCheckPwd()){
        customAlert("비밀번호를 확인하세요");
        document.getElementById('userPwd').focus();
    }else if(!checkPassword()){
        customAlert("비밀번호가 일치하지 않습니다."); 
        document.getElementById('checkPwd').focus();   
    }else if(!validateEmail()){
        customAlert("이메일을 확인하세요");
        document.getElementById('email').focus();
    }else if(!validateNickName()){
        customAlert("닉네임을 확인하세요");
        document.getElementById('nickName').focus();
    }else if(!regCheckPhone()){
        customAlert("연락처를 확인하세요")
        document.getElementById('phone').focus();
    }else{
        result = true;
    }
    return result;
}
function customAlert(arg){
    swal.fire({
        position : 'top-center',
        icon : 'error',
        title : arg,
        showConfirmButton : false,
        timer : 1000
    })
}

