$(function() {
    var textWrapper1 = document.querySelector('.m-t1');
    var textWrapper2 = document.querySelector('.m-t2');
    var textWrapper3 = document.querySelector('.m-t3');
    textWrapper1.innerHTML = textWrapper1.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    textWrapper2.innerHTML = textWrapper2.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    textWrapper3.innerHTML = textWrapper3.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    var tl = anime.timeline({
        opacity : 1,
        easing: 'easeOutExpo',
        duration: 750
    });
    tl
     .add({
            targets: '.m-t1 .letter',
            translateX: [40,0],
            translateZ: 0,
            opacity:[0,1],
            easing: "easeOutExpo",
            delay: (el, i) => 100 + 100 * i //  딜레이 주기
        })
        .add({
            targets: '.m-t3 .letter',
            translateX: [150,0],
            translateZ: 0,
            opacity:[0,1],
            easing: "easeOutExpo",
            delay: (el, i) => 200 + 100 * i //  딜레이 주기
        })
        .add({
        targets: '.m-t2 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 2000, // 2초동안
        delay: (el, i) => 100 + 100 * i //  딜레이 주기
        });

    $('#trigger').on('click',function(e){
        e.preventDefault();

        $(this).toggleClass('active');
        $('header').toggleClass('active');
        
        $('#main-menu').toggleClass('active');
        $('#main-menu > li').toggleClass('active');
    });
    $('#main-menu > li > a').on('click',function(e){
        $('#trigger').stop().toggleClass('active');
        $('#main-menu').stop().toggleClass('active');
        $('header').removeClass('active');
    });
    
    $('#fhd-1st').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });
    $('#tbl-1st').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });
    $('#2page').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });
    $('#3page').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });
    $('#4page').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });
    $('#5page').on('click',function(){
        $('#trigger').removeClass('active');
        $('#main-menu').removeClass('active');
        $('#main-menu > li').removeClass('active');
        $('header').removeClass('active');
    });    

});