const urlParams = new URL(location.href).searchParams;
const urlTab = urlParams.get('tab');

$.each($('#member-tabs').children('li>a'), function (index, value) { 
     console.log(value);
});

switch(urlTab){
    case 'all':
        $('#member-tabs').children('.nav-item').children('#memberAll').addClass('active');
        console.log('all');
    break;
    case 'active':
        $('#member-tabs').children('.nav-item').children('#memberActive').addClass('active');
        console.log('active');
    break;
    case 'suspend':
        $('#member-tabs').children('.nav-item').children('#memberSuspend').addClass('active');
        console.log('suspend');
    break;
    case 'banned':
        $('#member-tabs').children('.nav-item').children('#memberBanned').addClass('active');
        console.log('banned');
    break;
}