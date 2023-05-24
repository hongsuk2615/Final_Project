window.onload = function(){
    $(window).scroll(function () {
        let scrollPosition = $(this).scrollTop(); // 스크롤 위치 가져오기
        let target = $("#header"); // position: fixed를 적용할 대상 요소
        let target2 = $("#main_logo");
        let target3 = $("#header_1_2");
        let target4 = $("#header_search");
        let target5 = $("#header_2_1");
        let target6 = $('#header');
    
        if (scrollPosition > 10) { // 스크롤 위치가 100 이상이면
            target.addClass('background_white');
            target.removeClass('background_basic');
            target2.addClass('header_img_basic');
            target2.removeClass('header_img_white');
            target3.addClass('content_basic');
            target3.removeClass('content_white');
            target4.addClass('search_img_basic');
            target4.removeClass('search_img_white');
            target5.addClass('content_basic');
            target5.removeClass('content_white');
            // target.css({
            //     position: "fixed"
            // });
        } else { // 스크롤 위치가 100 미만이면
            target.addClass('background_basic');
            target.removeClass('background_white');
            target2.addClass('header_img_white');
            target2.removeClass('header_img_basic');                    
            target3.addClass('content_white');
            target3.removeClass('content_basic');
            target4.addClass('search_img_white');
            target4.removeClass('search_img_basic');
            target5.addClass('content_white');
            target5.removeClass('content_basic');
            // target.css({
            //     position: "static"
            // });
        }
    });
    
    $('.main_category').click(function() {
        $('.main_category').next().removeClass('main_underline');
        $(this).next().addClass('main_underline');
    });
}