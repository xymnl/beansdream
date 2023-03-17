$(function() {
    $('#trigger').on('click',function(e){
    e.preventDefault();

    $(this).toggleClass('active');
    $('.dim').toggleClass('active');
    $('nav').toggleClass('active');

    $('#mmenu').toggleClass('active');
    $('#mmenu > li').toggleClass('active');

    var txtW = document.querySelector('.ml');
    var txtW2 = document.querySelector('.ml2');
    var txtW3 = document.querySelector('.ml3');
    var txtW4 = document.querySelector('.ml4');
    txtW.innerHTML = txtW.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    txtW2.innerHTML = txtW2.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    txtW3.innerHTML = txtW3.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    txtW4.innerHTML = txtW4.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    
    anime.timeline({loop:false})
    .add({
        targets: '.ml .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1,
        delay: (el, i) => 300 + 30 * i
    });
    anime.timeline({loop:false})
    .add({
        targets: '.ml2 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1,
        delay: (el, i) => 400 + 30 * i
    });
    anime.timeline({loop:false})
    .add({
        targets: '.ml3 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1,
        delay: (el, i) => 500 + 30 * i
    });
    anime.timeline({loop:false})
    .add({
        targets: '.ml4 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1,
        delay: (el, i) => 600 + 30 * i
    });
});
$('#mmenu > li > a').on('click',function(e){
    $('#trigger').stop().toggleClass('active');
    $('nav').stop().toggleClass('active');
    $('#mmenu').stop().toggleClass('active');
    $('header').removeClass('active');
});

$('#fhd-1st').on('click',function(){
    $('#trigger').removeClass('active');
    $('.dim').removeClass('active');
    $('nav').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});
$('#tbl-1st').on('click',function(){
    $('#trigger').removeClass('active');
    $('.dim').removeClass('active');
    $('nav').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});
$('#2page').on('click',function(){
    $('.dim').removeClass('active');
    $('#trigger').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});
$('#3page').on('click',function(){
    $('.dim').removeClass('active');
    $('#trigger').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});
$('#4page').on('click',function(){
    $('.dim').removeClass('active');
    $('#trigger').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});
$('#5page').on('click',function(){
    $('.dim').removeClass('active');
    $('#trigger').removeClass('active');
    $('#mmenu').removeClass('active');
    $('#mmenu > li').removeClass('active');
});    

});