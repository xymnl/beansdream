$(function(){
    $('.ec-mainbox > li:first').on('click',function(){ // 에스프레소 클릭 효과
        $(this).toggleClass('boxbg').siblings().removeClass('boxbg')
        $('.ec-bg1box').toggleClass('ecatv1').removeClass('ecatv2').removeClass('ecatv3')
        $('.ec-bg1').toggleClass('ecatv')
        $('.ec-txt:nth-child(2)').toggleClass('ecatv').siblings().removeClass('ecatv')
    });

    $('.ec-mainbox > li:nth-child(2)').on('click',function(){ // 콜드브루 클릭 효과
        $(this).toggleClass('boxbg').siblings().removeClass('boxbg')
        $('.ec-bg1box').toggleClass('ecatv2').removeClass('ecatv1').removeClass('ecatv3')
        $('.ec-bg1').toggleClass('ecatv')
        $('.ec-txt:nth-child(3)').toggleClass('ecatv').siblings().removeClass('ecatv')
     });

    $('.ec-mainbox > li:last-child').on('click',function(){ // 프렌치 프레스 클릭 효과
        $(this).toggleClass('boxbg').siblings().removeClass('boxbg')
        $('.ec-bg1box').toggleClass('ecatv3').removeClass('ecatv2').removeClass('ecatv1')
        $('.ec-bg1').toggleClass('ecatv')
        $('.ec-txt:last-child').toggleClass('ecatv').siblings().removeClass('ecatv')
     });
});
