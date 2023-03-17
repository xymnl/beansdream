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
    var width = $(window).width();
    if(width >= 1050){
        tl
        .add({
               targets: '.m-t1 .letter', 
               translateX: [-400,40],
               // translateY: [-1000,0],
               translateZ: 0,
               opacity:[0,1],
               easing: "easeOutExpo",
               duration: 1000,
               delay: (el, i) => 100*  i //  딜레이 주기
           })
           .add({
               targets: '.m-t3 .letter',
               translateX: [-400,40],
               translateZ: 0,
               opacity:[0,1],
               easing: "easeOutExpo",
               duration: 1000,
               delay: (el, i) => 100*i //  딜레이 주기
           })
           .add({
           targets: '.m-t2 .letter',
           translateX: [400,40],
           translateZ: 0,
           opacity: [0,1],
           easing: "easeOutExpo",
           duration: 2000, // 2초동안
           delay: (el, i) => 300 * i //  딜레이 주기
           });
    }else if(width < 1050){
        tl
        .add({
               targets: '.m-t1 .letter', 
               translateX: [-400,0],
               // translateY: [-1000,0],
               translateZ: 0,
               opacity:[0,1],
               easing: "easeOutExpo",
               duration: 1000,
               delay: (el, i) => 100*  i //  딜레이 주기
        })
        .add({
            targets: '.m-t3 .letter',
            translateX: [400,0],
            translateZ: 0,
            opacity:[0,1],
            easing: "easeOutExpo",
            duration: 1000,
            delay: (el, i) => 100*i //  딜레이 주기
        })
        .add({
        targets: '.m-t2 .letter',
        translateX: [-140,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 2000, // 2초동안
        delay: (el, i) => 300 * i //  딜레이 주기
        });
    }
});