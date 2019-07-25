<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/jhStyle.css">
<link rel="stylesheet" href="css/hsStyle.css"> 
<link rel="stylesheet" href="css/hjStyle.css">
<script src="js/hsScript.js"></script>
<script src="js/hjScript.js"></script>

<!-- 메인 슬라이드 css / js -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 예약 css / js -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 메인 슬라이드 js / 에러나서 수정함 -->
<script src="js/jquery.bxslider.js"></script>

<!-- 하단 슬라이드 js --> 
<script src="js/slick.min.js"></script>

<style type="text/css">
/* 영은 메인-리뷰 css */
.reviewComm { margin-left: 15px;}
.reviewComm a { font-size : 14px; color:#99948b; }
.reviewid { font-size : 12px; margin-left: 17px; color:#70695b; }
.main_review { margin: 12px 18px; font-family: 'Noto Serif KR', serif; }

</style>
</head>
<body>
<div class="hyebody"> <!-- 혜수 메인페이지 시작 -->

<!-- main 슬라이드 -->
<ul class="bxslider">
	<li class="bxslider_li">
	      <a href="#">
		      <img src="images/etc/101.jpg" alt="" title="이미지1">
		  </a>
		  <div class="bx-caption">
		  <span class="main_slide_sub_title">퍼스트호텔 서울｜Member Only<br></span>
		  <span class="main_slide_sub_text">REWARDS AFTER 6PM</span>
		  </div>
	</li>
	<li class="bxslider_li">
		  <a href="#">
		      <img src="images/etc/121.jpg" alt="" title="이미지2">
		  </a>
		  <div class="bx-caption">
		  <span class="main_slide_sub_title">퍼스트호텔 제주｜Member Only<br></span>
		  <span class="main_slide_sub_text">REWARDS SUMMER I LOVE</span>
		  </div>
	</li>
	<li class="bxslider_li">
		  <a href="#">
		      <img src="images/etc/92.jpg" alt="" title="이미지3">
	      </a>
		  <div class="bx-caption">
		  <span class="main_slide_sub_title">퍼스트호텔 서울｜Member Only<br></span>
		  <span class="main_slide_sub_text">REWARDS SUMMER FAMILY</span>
		  </div>
	</li>
</ul>
  
<!-- 예약 시스템 -->
<div id="hjBody2">
		
	<form action="booking.do" method="post">
		<div id="main_search">
			<div id="main_search2">
			
				<!-- 호텔 지점 선택 ----------------------->
				<select class="formHotelLocal" name="hotel_num">
					<c:forEach var="hdto" items="${localList}">
						<option value="${hdto.hotel_num}" >${hdto.hotel_local}</option>
					</c:forEach>
				</select>
				
				
				<!-- 체크인 부트스트랩 -->
				<div class="check_in_select">
					<div class="form-group">
						<!-- Date input -->
						<input class="form-control" id="datepicker1" name="check_in" placeholder="checkIn" type="text" onchange = "checkDate('datepicker1','In')">
					</div>
				</div>
				
				<!-- 체크아웃 부트스트랩 -->
				<div class="check_out_select">
					<div class="form-group">
						<!-- Date input -->
						<input class="form-control" id="datepicker2" name="check_out" placeholder="checkout" type="text" onchange = "checkDate('datepicker2','Out')">
					</div>
				</div>
				
				<div class="setting">
					<div class="setting_date">
						<!--  체크인 -->
						<div class="checkIn">
							<div class="search_sub">체크인</div>
							<div class="checkIn_date" id="checkIn_date">
								<div class="checkIn_date_inner">
								
									</div>
									<div class="checkIn_y_m">
										<div class="checkIn_year" id="checkIn_year">2019</div>
										<div class="checkIn_month" id="checkIn_month">07</div>
									</div>
									<div class="checkIn_day" id="checkIn_day">17</div>
								</div>
							</div>
						
						
						<!--  체크인 -->
						<div class="checkOut">
							<div class="search_sub">체크아웃</div>
							<div class="checkOut_date" id="checkOut_date">
								<div class="checkIn_date_inner">
									<div class="checkOut_y_m">
										<div class="checkOut_year" id="checkOut_year">2019</div>
										<div class="checkOut_month" id="checkOut_month">07</div>
									</div>
									<div class="checkOut_day" id="checkOut_day">18</div>
								</div>
							</div>
						</div>
					</div>
					
					
						<!-- 인원 -->
						<div class="checkCount">
							<div class="search_sub">인원</div>
							<div class="countDiv">
								<div class="count_su">
									<input type="text" class="check_count2" name="head_count" value="1" id="check_count2" required="required" size="1">
								</div>
							</div>
						</div>
				</div>
			</div>
						
						
				<!-- 검색버튼 -->
				<div>
					<input type="hidden" name="step" value="1">	
					<input type="submit" id="reservationBtn1" value="객실검색">
				</div>
			
			</div>
		</form>
	</div>
		
	
		
		<!-- 체크인 클릭시 모달 -->
		<div id="checkIn_modal_back" class="aboutRoomModalBack">
			<div class="checkIn_modal">
				<div class="checkIn_contents">
					<div class="qna_body_title_div">
						<div class="qna_title_text">
							체크인 날짜 선택
						</div>
						
				
					<div>
						<button type="button" id="modal_checkokBtn">확인</button>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<!-- 인원 클릭시 모달 -->
		<div id="count_modal_back" class="aboutRoomModalBack">
			<div class="count_modal">
				<div class="count_contents">
				
					<div class="qna_body_title_div">
						<div class="qna_title_text">
							인원 설정
						</div>
					</div>
					
					<div class="count_select">
						<span class="smalltext">인원</span>
						
						<button type="button" onclick="headCountFunction(1)" class="headCountBtn rightFloat">+</button>
						<button type="button" onclick="headCountFunction(-1)" class="headCountBtn rightFloat">-</button>
						
						<input type="text" id="formHeadCountValue" class="countBorderNone rightFloat" value="1" size="1" class="rightFloat">
					</div>
					
					<div class="modal_text">
						※ 6명을 초과할 수 없습니다.
					</div>
					
					<div>
						<button type="button" id="modal_okBtn" onclick="value_insert()">확인</button>
					</div>
				</div>
			</div>
		</div>

  
<c:if test="${sessionScope.member_num == null}"> <!-- 로그인 안했을때 상태 -->

<!-- 메인에서 로그인 가능하게 링크 걸기 -->
<div class="main_slide_div">
	<div class="center_div">
		<span class="main_login_text">1st 호텔에 가입하고 다양한 서비스를 누리세요.</span> <br>
		<button type="button" class="main_login_btn1"
		onclick="location.href='login.do'">로그인</button>
		<button type="button" class="main_login_btn2"
		onclick="location.href='joinagree.do'">가입하기</button>
	</div>
</div>

<!-- 로그인 안했을때는 룸서비스가 아닌 호텔소개나 객실소개로 연결 -->
<div class="sub_div_room">
	<div class="center_div">
		<!-- Ｉｎｔｒｏｄｕｃｅ -->
		<span class="sub_div_room_text">Intruduce</span>
		<a href="hotelroom.do">｜바로가기&nbsp;〉</a>
	</div>
</div>
</c:if>

<c:if test="${sessionScope.member_num != null }"> <!-- 로그인 했을때 상태 -->
<!-- 로그인한 회원이 현재 호텔에 머물고 있는 경우 나타날 메인 화면
룸서비스 주문, 리뷰 남기기, 문의사항 등등 메뉴를 나타내기 -->

<!-- 로그인 했을 경우 페이지 -->
<div class="main_slide_div">
	<div class="center_div">
		<span class="main_login_text">
					<c:if test="${sessionScope.book_num == 0 and sessionScope.ishere == 0 }">
						${sessionScope.name }님 환영합니다.
					</c:if>
					<c:if test="${sessionScope.book_num != 0 and sessionScope.ishere == 1}">
						${sessionScope.name }님 편안한 숙박되세요.
					</c:if>
					<c:if test="${sessionScope.book_num != 0 and sessionScope.ishere == 0}">
						${sessionScope.name }님 편안한 숙박 되셨나요? 후기를 남겨주세요.
					</c:if>
						</span> <br>
		
		<c:if test="${sessionScope.book_num == 0  }">
			<button type="button" class="main_login_btn1"
			onclick="location.href='logout.do'">로그아웃</button>
		</c:if>
		
		<c:if test="${sessionScope.ishere == 1 }">
			<button type="button" class="main_login_btn1"
			onclick="location.href='logout.do'">로그아웃</button>
		</c:if>
		
		<c:if test="${sessionScope.book_num != 0 }">
			<button type="button" class="main_login_btn2"
			onclick="location.href='reviewwriteform.do'">리뷰작성</button>
		</c:if>
	
	</div>
</div>	

<!-- 오늘 예약한 회원만 주문할수 있는 룸서비스 바로가기 / 오늘 예약한 사람만 가능해야함 -->
<c:if test="${sessionScope.ishere ==1}">
<div class="sub_div_room">
	<div class="center_div">
		<!-- ＲｏｏｍＳｅｒｖｉｃｅ -->
		<span class="sub_div_room_text">RoomService</span>
		<a href="roomaservice.do">｜바로가기&nbsp;〉</a>
	</div>
</div>
</c:if>

<!-- 로그인 했지만 오늘예약 안한 회원 -->
<c:if test="${sessionScope.ishere != 1}">
<div class="sub_div_room">
	<div class="center_div">
		<!-- ｒｅｓｅｒｖａｔｉｏｎ -->
		<span class="sub_div_room_text">Reservation</span>
		<a href="booking.do">｜바로가기&nbsp;〉</a>
	</div>
</div>
</c:if>

</c:if>

<!-- 고객후기 타이틀 -->
<div class="center_div">
	<b class="main_review_title">고객 후기</b>
	<div class="main_review_bar"></div> <!-- 밑줄 -->
	<span class="main_review_title_eng">
	<!-- ｒｅｖｉｅｗ -->
	review
	</span>
</div>

<br>

<!-- 리뷰 슬라이드 (영은 수정) -->
<div class="ex_slide">
	<c:forEach items="${list }" var="dto">
	    <div class="main_review_div">
	    	<a href="reviewlist.do">
	    	<img src="http://192.168.0.38:9000/HotelProject/save/review/${dto.review_img }" alt="" title="이미지1">
	 	    </a>
	  	    <div class="main_review">
	  	    <i class="fas fa-quote-left" style="color:lightgray; font-size: 1.3em"></i>&nbsp;<br>
			<div class="reviewComm"><a href="reviewlist.do">${dto.review_comment}</a></div>
			<span class="reviewid"><strong>${dto.id}</strong></span> 님
		    </div>
    	</div>
   </c:forEach>
</div>

    
</div> <!-- hyebody 끝 -->

</body>
</html>

