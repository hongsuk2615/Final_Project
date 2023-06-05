const urlParams = new URL(location.href).searchParams;

$('.table_search_btn').on('click', function(){
    const searchVal = $('input[name=table_search]').val();
    
    if(searchVal != ''){
        urlParams.set('search', searchVal);
        location.href =  "member?"+urlParams.toString();
    }
});

$(".member-status-dropdown").on('click', function(){
    
    const statusVal =  $(this).val();
    const userNo = $(this).parents('tr').children('input[type=hidden]').val();
    const userId = $(this).parents('tr').children('.member-userId').html();

    $.ajax({
        url: "member/status/update",
        data: {
                statusVal,
                userNo
            },
        dataType: "text", 
        success: function(result){
            console.log(result);
            alert(userId+result);
            location.reload();
            
        }
        });
    });

const urlParamTab = urlParams.get('tab');
let memberTab = "";

switch(urlParamTab){
    case 'all':
        memberTab = '#memberAll';
    break;
    case 'active':
        memberTab = '#memberActive';
    break;
    case 'suspend':
        memberTab = '#memberSuspend';
    break;
    case 'banned':
        memberTab = '#memberBanned';
    break;
}

$('#member-tabs').children('.nav-item').children(memberTab).addClass('active');
