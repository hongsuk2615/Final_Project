let tab_status = "underline_white";

$(window).scroll(function () {
    let scrollPosition = $(this).scrollTop(); // 스크롤 위치 가져오기
    let target = $("#header");
    let target2 = $("#main_logo");
    let target3 = $(".change_content");
    let target4 = $("#header_search");
    //let target5 = $(".main_underline");

    if (scrollPosition > 10) { // 스크롤 위치가 10 이상이면
        target.addClass('background_white').removeClass('background_basic');
        target2.addClass('header_img_basic').removeClass('header_img_white');
        target3.addClass('content_basic').removeClass('content_white');
        target4.addClass('search_img_basic').removeClass('search_img_white');
        //target5.addClass('underline_basic').removeClass('underline_white');

        tab_status = "underline_basic";

        $('.main_category').next().each(function(index, e) {
            if($(e).hasClass('underline_white')){
                $(e).addClass("underline_basic");
                $(e).removeClass("underline_white");
            }
        });
        
    } else { // 스크롤 위치가 10 미만이면
        target.addClass('background_basic').removeClass('background_white');
        target2.addClass('header_img_white').removeClass('header_img_basic');
        target3.addClass('content_white').removeClass('content_basic');
        target4.addClass('search_img_white').removeClass('search_img_basic');
        // target5.addClass('underline_white').removeClass('underline_basic');

        tab_status = "underline_white";

        $('.main_category').next().each(function(index, e) {
            if($(e).hasClass('underline_basic')){
                $(e).addClass("underline_white");
                $(e).removeClass("underline_basic");
            }
        });
    }
});

$('.main_category').click(function(){
    $('.main_category').next().removeClass("underline_white");
    $('.main_category').next().removeClass("underline_basic");
    // $('.main_category').next().removeClass("main_underline");
    // $(this).next().addClass("main_underline");

    $(this).next().addClass(tab_status);

    console.log($('.main_category').next());
});

