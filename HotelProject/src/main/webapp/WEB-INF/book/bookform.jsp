<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hjStyle.css">
<script type="text/javascript" src="js/hjScript.js"></script>
</head>
<body>

<!-- 
예약 폼이 와야합니다.

실제 호텔예약 사이트를 참고해서 어떤 항목을 받으면 좋을지 구성해보세요.

만약 넘겨받은 member_num이 있는 상태라면 입력할 정보가 더 줄어들겠죠? 
(컨트롤러단에서 해결해서 넘어오면 됨)
 -->

	
	
<div id="hjBody">


	<!-- 상단 예약 단계 표시 -->
	<!-- 페이지가 달라짐에 따라(step 값에 따라) bold 클래스로 강조 -->
	<c:if test="${step==1 or step==2 or step==3 or step==4}">
		<div id="step">
			<ul>
				<c:if test="${step==0}">
					<li class="bold">
						STEP 1<br>
						호텔 검색
					</li>
				</c:if>
				<c:if test="${step!=0}">
					<li class="gray">
						STEP 1<br>
						호텔 검색
					</li>
				</c:if>
					
				<c:if test="${step==1}">
					<li class="bold">
						STEP 2<br>
						객실 선택
					</li>
				</c:if>
				<c:if test="${step!=1}">
					<li class="gray">
						STEP 2<br>
						객실 선택
					</li>
				</c:if>
					
				<c:if test="${step==2}">
					<li class="bold">
						STEP 3<br>
						옵션 선택
					</li>
				</c:if>
				<c:if test="${step!=2}">
					<li class="gray">
						STEP 3<br>
						옵션 선택
					</li>
				</c:if>
				
				<c:if test="${step==3 or step==4}">
					<li class="bold">
						STEP 4<br>
						예약 확인
					</li>
				</c:if>
				<c:if test="${step!='3' and step!='4'}">
					<li class="gray">
						STEP 4<br>
						예약 확인
					</li>
				</c:if>
			</ul>
		</div>
	</c:if>
	
	
	
	<!-- "STEP 1 호텔/날짜 선택" 페이지 (step이 0일 때 나타남) -->
	<c:if test="${step==0}">
		<div id="step1Page">
			<h1>예약하기</h1>
			
			<div>예약을 원하시는 <b>호텔, 날짜, 인원</b>을 선택후<br>
			<b>객실검색 버튼</b>을 눌러주세요.</div>
			
			<br>
			
			<div class="reservationBorder">
				<div class="reservationContents">
				<form action="booking.do" method="post">
				
					<!-- 호텔 지점 선택 -->
					<select class="formHotelLocal" name="hotelLocal">
						<c:forEach var="hdto" items="${localList }">
							<option>${hdto.hotel_local}</option>
						</c:forEach>
					</select>
				
				
					<!-- 객실 타입 선택 -->
					<div class="formRoomSelect">
						<label><input type="radio" name="roomType" value="스탠다드" checked="checked">스탠다드</label>
						<label><input type="radio" name="roomType" value="디럭스">디럭스</label>
						<label><input type="radio" name="roomType" value="그랜드">그랜드</label>
					</div>
						
						
					<!-- 체크인 날짜 선택 -->
					<span class="smalltext">체크인</span>
					<input type="date" name="checkIn" required="required" class="rightFloat">
					
					<hr>
						
					<!-- 체크아웃 날짜 선택 -->
					<span class="smalltext">체크아웃</span>
					<input type="date" name="checkOut" required="required" class="rightFloat">
						
					<hr>
						
						
					<!-- 인원 입력 -->
					<span class="smalltext">인원</span>
					<input type="text" id="formHeadCountValue" class="countBorderNone" name="headCount" value="1" size="5" class="rightFloat">
					<button type="button" onclick="headCountFunction(-1)" class="headCountBtn rightFloat">-</button>
					<button type="button" onclick="headCountFunction(1)" class="headCountBtn rightFloat">+</button>
					
					
					<br><br>
					
					<!-- 검색버튼 -->
					<input type="hidden" name="step" value="1">	
					<input type="submit" id="reservationBtn1" value="객실검색">
					
				</form>
			</div>
			</div>
		</div>	
	</c:if>




	<!-- "STEP 2 객실 선택" 페이지 (step이 1일 때 나타남) -->
	<c:if test="${step==1 }">
		<div id="step2Page">
		
			<!-- 다시 설정하기 버튼 (값 유지한채 뒤로가기) -->
			<div class="reSetting">
				<a href="javascript:history.back()">
					<img src="images/etc/reSetting.png" class="icon" alt="다시 설정하기">
					다시 설정하기
				</a>
			</div>
			
			<!-- 전 페이지에서 받아온 값 출력 -->
			<div class="searchSetting">
				<div class="searchSettingContents">
				
					<!-- 지점 -->
					<span class="hotelLocalText">
					${sessionScope.hotelLocal }
					</span>
					&nbsp;
					
					<!-- 객실 타입 -->
					<span class="roomTypeText">
					${sessionScope.roomType }
					</span>
					
					&nbsp;
					
					<!-- 인원 -->
					<span class="headCountText">
					${sessionScope.headCount }명
					</span>
					
					<hr>
					
					<!-- 체크인 날짜 -->
					<div class="checkInDiv">
					 <span class="smalltext">체크인</span><br>
					 ${sessionScope.checkIn }
					</div>
					
					
					<!-- 체크아웃 날짜 -->
					<div class="checkOutDiv">
					 <span class="smalltext">체크아웃</span><br>
					 ${sessionScope.checkOut }
					</div>
					
				</div>
			</div>
			
			
			<!-- 세팅에 맞는 객실 리스트 출력 (7.1 현재 DB에 저장된 객실이 적어 세팅조건 미적용) -->
			<div class="subTitle">
				<h4>예약가능한 객실</h4>
			</div>
			
			<%-- <c:if test="">--%>
			
				<c:forEach var="rmdto" items="${roomList }">
					<div class="roomListBorder">
						<div class="roomListContents">
						
							<!-- 폼 -->
							<form action="booking.do" method="post">
								<div class="roomInfoSpan">
									
									<!-- 객실 넘버 -->
									<span class="roomListNum">${rmdto.room_num }</span>
									&nbsp;&nbsp;
									<!-- 객실 이름 -->
									<span class="roomListName">${rmdto.room_name }</span>
									
									<!-- 객실 가격 -->
									<span class="roomListPrice rightFloat smalltext"> ${rmdto.price }</span>
								
								</div>
								
								
								<img src="images/room/standard/${rmdto.room_img }" alt="객실이미지">
								
								<!-- 자세히보기 버튼을 누르면 해당 객실의 데이타 전달 -->
								<button type="button" id="aboutRoom" onclick="modalData('${rmdto.room_name }','${rmdto.room_img }','${rmdto.type }','${rmdto.max }','${rmdto.room_config }','${rmdto.price }')">자세히 보기</button>
								
								<!-- 다음 페이지로 이동 -->
								<input type="hidden" name="step" value="2">	
								<input type="hidden" name="room_num" value="${rmdto.room_num }">
								<input type="hidden" name="room_config" value="${rmdto.room_config }">
								<input type="hidden" name="room_price" value="${rmdto.price }">
								<input type="submit" value="예약하기" id="reservationBtn2">
							</form>
						</div>
					</div>
				 </c:forEach>
				 
			<%--</c:if> --%>
			
			
			<!-- 자세히 보기 팝업 -->
			<div id="aboutRoomModalBack" class="aboutRoomModalBack">
					<div id="aboutRoomModalborder">
						<div id="aboutRoomModal">
						
							<div id="aboutRoomModalTop">
								<h3 class="modalRoomName">dd</h3>
								<img src="images/etc/close.png" alt="닫기" class="icon">
							</div>
							
							<img src="" alt="객실이미지" class="aboutRoomImage modalRoomImg">
							
							
							
							<div class="aboutRoomEx">
							 <p>제주호텔의 고품격 서비스를 만나볼 수 있는 가장 기본 객실로 1~5층에
							  위치하고 있습니다. 스튜디오 타입의 파스텔 톤 객실에 휴식을 취할 수 있는
							   테이블과 체어, 그리고 라탄 타입의 아늑한 체어를 완비한 기본적인 가장 룸입니다.
							  </p>
							</div>
							
							<div class="aboutRoomOption">
								<span class="smalltext aboutRoomSub">옵션</span>
								<span class="modalRoomType"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">최대인원</span>
								<span class="modalRoommax"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">룸구성</span>
								<span class="modalRoomConfig" name="room_config"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">가격</span>
								<span class="modalRoomPrice" name="room_price"></span>
							</div>
							
						</div>
					</div>
			</div>
			
			
		</div>
	</c:if>
		
		
	<!-- "STEP 3 옵션 선택" 페이지 -->
	<c:if test="${step==2 }">
		<div id="step3Page">
			<h1>옵션</h1>
			<div>객실 이용에 필요한 <b>옵션 사항</b>을 선택하세요.</div>
			
			<div class="subTitle">
				<h4>침대</h4>
			</div>
			
			<!-- 폼 -->
			<form action="booking.do" method="post" name="optionForm">
				<div>
					<label><input type="radio" name="bedType" value="트윈" checked="checked">트윈</label>
					<br>
					<label><input type="radio" name="bedType" value="더블">더블</label>
					<br>
					<label><input type="radio" name="bedType" value="패밀리트윈">패밀리 트윈</label>
				</div>
				
				<div class="bedAddDiv">
					<span class="smalltext">침대 추가</span><br>
					<input type="text" id="formBedCountValue" class="countBorderNone" name="bedCount" value="0" size="2">개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="bedCountFunction(-1), bedAddPriceFunction()" class="bedCountBtn">-</button>
					<button type="button" onclick="bedCountFunction(1), bedAddPriceFunction()" class="bedCountBtn">+</button>
					<b class="rightFloat"><input type="text" id="bedAddPrice" name="bedCountPrice" value="0" size="4" class="bedCountBorderNone" readonly="readonly">원</b>
				</div>
				
				
				<div class="subTitle">
					<h4>조식 인원</h4>
				</div>
				
				<div class="breakfastAddDiv">
					<input type="text" id="formBreakfastCountValue" class="countBorderNone" name="breakfastCount" value="0" size="2">명
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="breakfastCountFunction(-1), breakfastAddPriceFunction()" class="breakfastCountBtn">-</button>
					<button type="button" onclick="breakfastCountFunction(1), breakfastAddPriceFunction()" class="breakfastCountBtn">+</button>
					<b class="rightFloat"><input type="text" id="breakfastAddPrice" name="breakfastCountPrice" value="0" size="4" class="breakfastCountBorderNone" readonly="readonly">원</b>
				</div>
				
				
				<div class="subTitle">
					<h4>추가 요청사항</h4>
				</div>
				
				<textarea rows="5" placeholder="호텔 이용시 요청 또는 문의하실 사항이 있으면 입력해 주십시오." name="requestContents" value="requestContents"></textarea>
				
				<input type="button" class="reservationBtn3" onclick="reservationSubmit(3)" value="비회원 예약">
				<input type="button" class="reservationBtn3" onclick="reservationSubmit(4)" value="회원 예약">
				

			</form>
			
			
		</div>
	</c:if>
	
	
	<!-- ------------------------------------------------- -->
	<!-- STEP 4 예약확인 페이지 -->
	
	<!-- 비회원 예약 -->
	<c:if test="${step==3 }">
		<div id="step3Page">
		
			<h1>비회원 예약</h1>
			
			<div>예약확인 시 필요한 정보를 입력해주세요.</div>
			
			<form action="booking.do" method="post">
				
				<div class="subTitle">
					<h4>비회원 정보</h4>
				</div>
				
				<div class="reservationBorder">
					<div class="reservationContents">
					
						<span class="smalltext noaccountSub">이름</span>
						<input type="text" placeholder="이름을 입력해주세요" required="required">
						<br>
						<span class="smalltext noaccountSub">이메일</span>
						<input type="email" placeholder="이메일을 입력해주세요" required="required">
						<br>
						<span class="smalltext noaccountSub">전화번호</span>
						<input type="number" placeholder="전화번호를 입력해주세요" required="required">
				
					</div>
				</div>	
				
				
				<div class="subTitle">
					<h4>예약 정보</h4>
				</div>
				
				<div class="reservationBorder">
					<div class="reservationContents">
						${sessionScope.hotelLocal }
						<br>
						${sessionScope.roomType}
						<br>
						${sessionScope.headCount}
						<br>
						${sessionScope.checkIn}
						<br>
						${sessionScope.checkOut}
						<br>
						${sessionScope.room_config}
						<br>
						${sessionScope.room_price}
						<br>
						${sessionScope.bedType}
						<br>
						${sessionScope.bedCount}
						<br>
						${sessionScope.breakfastCount}
						<br>
						
						<c:if test="${sessionScope.requestContents==0}">
							<div>요청사항 없음</div>
						</c:if>
						<c:if test="${sessionScope.requestContents!=null}">
							<div>${sessionScope.requestContents}</div>
						</c:if>
					</div>
				</div>
				
				<input type="hidden" name="step" value="5">	
				<input type="submit" id="reservationBtn1" value="예약신청">
			</form>
		</div>
	</c:if>
	
	
	<!-- 회원 예약 -->
	<c:if test="${step==4 }">
	
		<!-- 로그인시 예약확인 페이지 -->
		<c:if test="${member_num!=null }">
			(현재 로그인)예약확인
		</c:if>
		
		<!-- 비로그인시 로그인 페이지 -->
		<c:if test="${member_num==null }">
			(현재 로그아웃)로그인페이지 띄우기
		</c:if>
	</c:if>

 	
	<c:if test="${step==5}">
		<div id="step5Page">
			<div id="step5PageContents">
				<img src="images/etc/check.png" alt="check" class="icon2">
				<br>
				<h2>예약되었습니다</h2>
				<div>이용해주셔서 감사합니다.<br>
				해당 날짜에 늦지 않게 체크인 부탁드립니다.</div>
				<br>
				<input type="button" value="예약확인" class="reservationBtn4">
				<input type="button" value="룸서비스" class="reservationBtn4">
			</div>
		</div>
	</c:if>

</div>
</body>
</html>

