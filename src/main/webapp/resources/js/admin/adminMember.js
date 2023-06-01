$("#member-tabs .nav-link").on("click", function(e){
    let click_tab = $(this).attr("id");
    memberStatusTabs(click_tab);
});

function memberStatusTabs(tab){
    $.ajax({
        url: "/thrifty/admin/member/tabs",
        data: {tab},
        dataType: "JSON",
        success: function(list){
            //console.log(selectList);
            let html = "";
            $("tbody").html(html);
            for(let i = 0; i<list.length; i++){
                console.log(list);
                html += '<tr>'
                html += '<td>'+(i+1)+'</td>'
                html += '<td>'
                html += '<div class="out-circle">'
                if(list[i].currentLogin === 'Y'){
                    html += '<span class="in-circle"></span>'
                }
                html += '</div>'
                html += '</td>'
                html += '<td>'+list[i].userId+'</td>'
                html += '<td>'+list[i].nickName+'</td>'
                html += '<td>'+list[i].reportCount+'</td>'
                html += '<td>'+list[i].joinDate+'</td>'
                html += '<td>'+list[i].status+'</td>'
                html += '<td>'
				html += '<div class="btn-group">'
				html += '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">'
				html += '활성'
				html += '</button>'
				html += '<div class="dropdown-menu">'
				html += '<a class="dropdown-item" href="#">활성</a>'
				html += '<a class="dropdown-item" href="#">정지</a>'
				html += '<a class="dropdown-item" href="#">탈퇴</a>'
				html += '</div>'
				html += '</div>'
				html += '</td>'
                html += '</tr>'
            };
            $("tbody").html(html);
        },
        error: function(result){
            console.log("실패");
        }
    });
}