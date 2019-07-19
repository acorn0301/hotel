//모달 튀어나오는것 관련된 함수
function openModal(num){
	console.log("num : " + num);
}

$(document).ready(function () {
	//메인 슬라이드
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 300,  // 애니메이션 속도
        pause: 3000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: false, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: false, // 이미지 위에 텍스트를 넣을 수 있음
    });
	
	//하단 슬라이드
    $('.ex_slide').slick({
        autoplay:false, //자동으로 넘겨주는것
        autoplaySpeed:3000, //속도
        arrows:false, //화살표 넘김
        dots:false, //밑 도트로 페이지 표시
        slidesToShow:2, //보여줄 숫자
        slidesToScroll:7, //총 개수
        infinite:true, //반복출력
        speed:300, //속도
        swipeToSlide:true, //스크롤 가능하게 해주는것
        pauseOnHover:true //마우스 올리면 멈춤
      });
});
