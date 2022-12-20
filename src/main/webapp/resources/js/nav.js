/* 네비 수정 */
let isClose=$('.navbar1').hasClass('navOn');
function menuAction(){
    if(!isClose){
        $('.navbar-collapse1').slideUp();
        $('.navbar1').css("color", "white");
        $('.navbar1').css("background", "transparent");
        $('.navbar1').removeClass('navOn');
        $('.main-wrapper1 a').removeClass('mini_menu_a_toggle');
        $('.main-wrapper1 a').css("color", "white");
    }else{
        $('.navbar-collapse1').slideDown();
    }
}

$(document).ready(function(){
    $('.navbar-toggler1').click(function(){
        $('.navbar-collapse1').slideToggle(300);
        $('.navbar1').toggleClass('navOn');
         /* 네비 수정 */
        $('.main-wrapper1 a').toggleClass('mini_menu_a_toggle');
    });
    
    smallScreenMenu();
    let temp;
    function resizeEnd(){
        smallScreenMenu();
    }

    $(window).resize(function(){
        clearTimeout(temp);
        temp = setTimeout(resizeEnd, 100);
        resetMenu();
        menuAction(); /* 수정*/
    });
});

const subMenus = $('.sub-menu1');
const menuLinks = $('.menu-link1');

function smallScreenMenu(){
    if($(window).innerWidth() <= 1150){
        menuLinks.each(function(item){
            $(this).click(function(){
                $(this).next().slideToggle();
            });
        });
    } else {
        menuLinks.each(function(item){
            $(this).off('click');
        });
    }
}

function resetMenu(){
    if($(window).innerWidth() > 1150){
        subMenus.each(function(item){
            $(this).css('display', 'none');
        });
    }
}

$('.navbar1').mouseover(function(){
    $(this).css("background", "white");
    $('.navbar-brand1').css("color", "black");
})

$('.navbar1').mouseleave(function(){
    if($(this).hasClass('navOn') === false) {
        $(this).css("background", "transparent");
        $('.navbar-brand1').css("color", "white");
    }
})


