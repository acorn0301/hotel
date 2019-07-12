<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/hsStyle.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(".InRoomText").hide();
	$(".InHotelText").hide();
	$(".FloorPlanText").hide();
	$(".HotelInfoText").hide();
	
	$(".InRoom").click(function(){
		$(".InRoomText").toggle();
		$(".InHotelText").hide();
		$(".FloorPlanText").hide();
		$(".HotelInfoText").hide();
	});
	
 	$(".InHotel").click(function(){
		$(".InHotelText").toggle();
		$(".InRoomText").hide();
		$(".FloorPlanText").hide();
		$(".HotelInfoText").hide();
	});
 	$(".FloorPlan").click(function(){
		$(".FloorPlanText").toggle();
		$(".InRoomText").hide();
		$(".InHotelText").hide();
		$(".HotelInfoText").hide();
	});
 	$(".HotelInfo").click(function(){
		$(".HotelInfoText").toggle();
		$(".InRoomText").hide();
		$(".InHotelText").hide();
		$(".FloorPlanText").hide();
	});
 	
});
</script>
</head>
<body>
<div class="hyebody">
<!-- 상단 메뉴바 -->
<div class="admin_subject_div">
	<div class="admin_subject_text">
		<a href="standard.do" class="subject_a">스탠다드</a>
		<a href="deluxe.do" class="subject_a">디럭스</a>
		<a href="grand.do" class="subject_a">그랜드</a>
		<!-- <div class="subject_bar"></div> -->
	</div>
</div>
<!-- 소제목 -->
<div class="admin_title_div">
	<div class="admin_title_text">
		디럭스
	</div>
</div>
<div class="margin_div">
<!-- 소개 -->
<img class="imgallwidth mySlides w3-animate-left" alt="디럭스룸이미지" src="images/room/deluxe/6.jpg">
<img class="imgallwidth mySlides w3-animate-left" alt="디럭스룸이미지" src="images/room/deluxe/11.jpg">
<img class="imgallwidth mySlides w3-animate-left"  alt="디럭스룸이미지"  src="images/room/deluxe/20.jpg">
<img class="imgallwidth mySlides w3-animate-left" alt="디럭스룸이미지" src="images/room/deluxe/22.jpg">

<div class="room_st">
16~19층에 위치한 디럭스룸은 도심에서의 여유로운 휴식을 누릴 수 있는 최상의 선택입니다.<br>
모던한 아름다움과 1st호텔 수준의 고급 침구 및 침대 그리고 고급 어메니티로 한 단계 업그레이드 된 휴식을 경험하십시오.
<br>
</div>
<div class="room_div">
<span class="room_span">· 위치</span>&nbsp;&nbsp;&nbsp;16~19층 <br>
<span class="room_span">· 전망</span>&nbsp;&nbsp;&nbsp;시티 뷰 <br>
<span class="room_span">· 침대</span>&nbsp;&nbsp;&nbsp;더블, 트윈<br>
<span class="room_span">· 크기</span>&nbsp;&nbsp;&nbsp;22.4㎡ <br>
<span class="room_span_1">· 룸구성</span>&nbsp;&nbsp;침실 1, 욕실 1 <br>
<span class="room_span_2">· 문의전화</span>&nbsp;02-2230-0700
</div>

<br>
<div class="room_center_div">
<button type="button" class="room_btn1" onclick="location.href='qnalist.do'">문의하기</button>
<button type="button" class="room_btn2" onclick="location.href='booking.do'">예약하기</button>
</div>
<br><br>

<!-- InRoom toggle -->
<div class="InRoom room_detail">
	<div>
		In-Room
	</div>
</div>
<div class="InRoomText">
· 40” LED TV (36채널) <br>
· 책상 <br>
· 냉장고 <br>
· 무료커피, 티백 <br> 
· 무료 생수 2병 (1박 기준) <br>
· 무료 유무선 인터넷 <br>
· 유니버셜 어댑터(220V) <br>
· 개인금고 <br>
· 아베다 욕실용품 <br>
· 2개의 목욕가운 <br>
</div>

<!-- InHotel toggle -->
<div class="InHotel room_detail">
	<div>
		In-Hotel
	</div>
</div>
<div class="InHotelText">
· 피트니스 센터 무료 이용<br>(안전상의 이유로 16세 이상 입장 가능합니다.) <br>
· 비즈니스 코너 인터넷 무료 이용 <br>
· 투숙 기간 내 무료 주차 가능 <br>
</div>


<!-- HotelInfo toggle -->
<div class="HotelInfo room_detail">
	<div>
		Hotel Info
	</div>
</div>
<div class="HotelInfoText">
<b class="room_detail_subject">체크인/체크아웃 시간</b> <br>
· 체크인 : 오후 2시 이후 <br>
· 체크아웃 : 정오 <br>
<b class="room_detail_subject">Cafe 이용안내</b> <br>
· [조식] (주중) 06:30~09:30 <br>
· (주말,공휴일) 07:00~10:00 <br>
· [중식] (주중) 브런치뷔페 11:30~14:00 <br>
· (주말,공휴일) 런치뷔페 12:00~14:30 <br>
· [라운지 (Bar)](주중, 주말, 공휴일) 18:00~23:00 <br>
<b class="room_detail_subject">Bar 이용안내</b> <br>
· 07:00 ~ 23:00 <br>
<b class="room_detail_subject">피트니스 센터 이용안내</b> <br>
· 06:00 ~ 23:00 <br>
<b class="room_detail_subject">예약 변경 및 취소</b> <br>
· 숙박예정일 1일전 18시까지는 위약금 없이 취소 가능 <br>
· 위 기간 이후 취소 또는 변경 시(No Show 포함)  <br>
&nbsp;- 성수기(4,5,6,10,11월, 12/24, 12/31) : 최초 1박 요금의 80% 부과 <br>
&nbsp;- 비수기(성수기 외 기간) : 최초 1박 요금의 10% 부과<br>
</div>


<!-- FloorPlan toggle -->
<div class="FloorPlan room_detail">
	<div>
		Floor Plan
	</div>
</div>
<div class="FloorPlanText">
<b>Twin</b>
<div class="border_twin">
<img alt="트윈룸" src="images/room/standard/25.jpg" class="imgallwidth">
</div>
<b>Double</b>
<div class="border_double">
<img alt="더블룸" src="images/room/standard/24.jpg" class="imgallwidth">
</div>
</div>
</div>
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000);    
}

</script>
</body>
</html>

