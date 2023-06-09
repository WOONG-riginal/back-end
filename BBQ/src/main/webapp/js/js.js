
$(window).on('scroll', function () {
    var scrT = $(this).scrollTop();
    if(scrT > 10){
        $('header').css({height:63});
		
        $('.gnb').css({display:'none'});
        $('.bg-lnb').css({top:63});
        $('.content').css({paddingTop:63});
        $('.quickmenu').css({top:93});
        $('.top_btn').css({opacity:1});
    }else{
        $('header').css({height:126});
        $('.gnb').css({display:'block'});
        $('.bg-lnb').css({top:126});
        $('.content').css({paddingTop:126});
        $('.quickmenu').css({top:182});
        $('.top_btn').css({opacity:0});
    }
});

window.onload = function () {
    const kindWrap = document.querySelector('.kind-wrap');
    const slider = kindWrap.querySelector('.slider');
    const slideLis = slider.querySelectorAll('.slider li')

    /* 클론 */
	var i=0;
	function cloning() {
	    const clone1 = slideLis[i].cloneNode(true);
	    slider.append(clone1);
    }
	function counting() {
        i++;
    }
	function cloneSliding() {
        setInterval(cloning, 3000);
        setInterval(counting, 3000);
    }
    cloneSliding();

    /* 주요 변수 초기화 */
    let currentIdx = 0;
    let translate = 0;
    const speedTime = 500;

    /* CSSOM 셋업 */
    const sliderCloneLis = slider.querySelectorAll('li');
    const liWidth = slideLis[0].clientHeight;
    const sliderWidth = liWidth * sliderCloneLis.length;
    slider.style.width = `${sliderWidth}px`;

    /* 슬라이드 실행 */
    function move(D) {
        currentIdx += (-1 * D);
        translate += liWidth * D;
        slider.style.transform = `translateY(${translate}px)`;
        slider.style.transition = `all ${speedTime}ms ease`
    }
    function sliding() {
        move(-1);
		if (currentIdx === sliderCloneLis.length)
	        setTimeout(() => {
	            slider.style.transition = 'none';
	            currentIdx = 0;
	            translate = -liWidth;
	            slider.style.transform = `translateY(${translate}px)`;
	        }, speedTime);
    }

    function showSliding() {
        setInterval(sliding, 3000);
    }
    showSliding();
}
// gnb 메뉴 마우스 이벤트
$(".navigation .lnb").mouseenter(() => {
    $('.lnb-serve').stop().slideDown();
    $('.bg-lnb').stop().slideDown();
})
$(".navigation .lnb").mouseleave(() => {
    $('.lnb-serve').stop().slideUp();
    $('.bg-lnb').stop().slideUp();
})



// 페이지 준비중 입니다.
$(".familyBrand li, .brand li, .start-up li, .event li, .main-event-container div, footer a,.disable-btn,.quick-menu li").on("click",()=>{
	$('.ready').fadeIn()
    $('#curtain').fadeIn()
    setTimeout(function(){
        $('.ready').stop().fadeOut()
        $('#curtain').stop().fadeOut()
    },1000);
});


