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

<script>
	function check(){
		let name = $("#ncname").val();
		let phone = $("#ncphone").val();
		location.href="insertNotMember.do?name=" + name + "&phone=" + phone;
	}

	

</script>

<!-- 
예약 폼이 와야합니다.

실제 호텔예약 사이트를 참고해서 어떤 항목을 받으면 좋을지 구성해보세요.

만약 넘겨받은 member_num이 있는 상태라면 입력할 정보가 더 줄어들겠죠? 
(컨트롤러단에서 해결해서 넘어오면 됨)
 -->

	
	
<div id="hjBody">


	<!-- 상단 예약 단계 표시 -->
	<!-- 페이지가 달라짐에 따라(step 값에 따라) bold 클래스로 강조 -->
	<c:if test="${step==0 or step==1 or step==2 or step==3 or step==4}">
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
					<c:if test="${room_num=='0' }">
						<li class="gray">
							STEP 2<br>
							객실 선택
						</li>
					</c:if>
					
					<c:if test="${room_num!='0' }">
							<li class="gray">
								STEP 2<br>
								객실 선택
							</li>
					</c:if>
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
						<select class="formHotelLocal" name="hotel_num">
							<c:forEach var="hdto" items="${localList }">
								<option value="${hdto.hotel_num}" >${hdto.hotel_local}</option>
							</c:forEach>
						</select>
					
						
						
					<!-- 체크인 날짜 선택 -->
					<span class="smalltext">체크인</span>
					<input type="date" name="check_in" required="required" class="rightFloat" id=checkInSelect>
					
					
					
					<hr>
						
					<!-- 체크아웃 날짜 선택 -->
					<span class="smalltext">체크아웃</span>
					<input type="date" name="check_out" required="required" class="rightFloat" id="checkOutSelect">
						
					<hr>
						
						
					<!-- 인원 입력 -->
					<span class="smalltext">인원</span>
					<input type="text" id="formHeadCountValue" class="countBorderNone" name="head_count" value="1" size="5" class="rightFloat">
					
					<button type="button" onclick="headCountFunction(-1)" class="headCountBtn rightFloat">-</button>
					<button type="button" onclick="headCountFunction(1)" class="headCountBtn rightFloat">+</button>
					
					
					<br><br>
					
					<!-- 검색버튼 -->
					<!-- 지점 num 값 보내기 -->
					<%-- <input type="hidden" name="hotel_num" value="${myhdto.hotel_num}"> --%>
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
						${hdto.hotel_local}
					</span>
					&nbsp;
					
					<!-- 객실 타입 -->
					<%-- <span class="roomTypeText">
					${sessionScope.roomType }
					</span> --%>
					
					&nbsp;
					
					<!-- 인원 -->
					<span class="headCountText">
					${mybdto.head_count }명
					</span>
					
					<hr>
					
					<!-- 체크인 날짜 -->
					<div class="checkInDiv">
					 <span class="smalltext">체크인</span><br>
					 ${mybdto.check_in }
					</div>
					
					
					<!-- 체크아웃 날짜 -->
					<div class="checkOutDiv">
					 <span class="smalltext">체크아웃</span><br>
					 ${mybdto.check_out }
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
									<span class="roomListNum" name="room_num">${rmdto.room_num }</span>
									&nbsp;&nbsp;
									
									<!-- 객실 이름 -->
									<span class="roomListName" name="room_name">${rmdto.room_name }</span>
									
									<!-- 객실 가격 -->
									<span class="roomListPrice rightFloat smalltext" name="price"> ${rmdto.price }</span>
								
								</div>
								
								
								<img src="images/room/${rmdto.room_img }" alt="객실이미지">
								
								<!-- 자세히보기 버튼을 누르면 해당 객실의 데이타 전달 -->
								<div class="width50">
									<button type="button" class="aboutRoomMD" onclick="modalData('${rmdto.room_name }','${rmdto.room_img }','${rmdto.type }','${rmdto.max }','${rmdto.room_config }','${rmdto.price }')">자세히 보기</button>
								</div>
								
								<!-- 다음 페이지로 이동 -->
								<input type="hidden" name="step" value="2">	
								
 							<input type="hidden" name="room_num" value="${rmdto.room_num }">
	<%--							<input type="hidden" name="room_config" value="${rmdto.room_config }">
								<input type="hidden" name="price" value="${rmdto.price }">
								<input type="hidden" name="room_name" value="${rmdto.room_name }">
								<input type="hidden" name="type" value="${rmdto.type }">
								<input type="hidden" name="hotel_num" value="${hdto.hotel_num}"> --%>
								
								
								<div class="width50">
									<input type="submit" value="예약하기" id="reservationBtn2">
								</div>
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
								<span class="modalRoomType" name="type"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">인원</span>
								<span class="modalRoommax"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">룸구성</span>
								<span class="modalRoomConfig" name="room_config"></span>
								
								<br>
								
								<span class="smalltext aboutRoomSub">가격</span>
								<span class="modalRoomPrice" name="price"></span>
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
				<h4>침대 추가&nbsp;&nbsp;<span class="smalltext">40,000원</span></h4>
			</div>
			
			<!-- 폼 -->
			<form action="booking.do" method="post" name="optionForm">
				<!-- <div>
					<label><input type="radio" name="type" value="트윈" checked="checked">트윈</label>
					<br>
					<label><input type="radio" name="type" value="더블">더블</label>
					<br>
					<label><input type="radio" name="type" value="패밀리트윈">패밀리 트윈</label>
				</div> -->
				
				
				<div class="bedAddDiv">
					<!-- <span class="smalltext">침대 추가</span><br> -->
					<div class="bedPriceDiv">
						<!-- <input type="text" id="formBedCountValue" class="countBorderNone" name="" value="0" size="2">개 -->
						<span id="add_bed_val">0</span>
						<input type="hidden"  name="add_bed" id="add_bed_name">
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="countFunction(-1,0)" class="bedCountBtn">-</button>
						<button type="button" onclick="countFunction(1,0)" class="bedCountBtn">+</button>
						
						<%--  <button type="button" onclick="upTest(-1), bedCountFunction(-1, ${mybdto.head_count}), bedAddPriceFunction()" class="bedCountBtn">-</button>
						<button type="button" onclick="upTest(1), bedCountFunction(1, ${mybdto.head_count}), bedAddPriceFunction()" class="bedCountBtn">+</button> 
						 --%>
						<b class="rightFloat">
						<input type="text" id="bedAddPrice" name="bedCountPrice" value="0" size="4" class="bedCountBorderNone" readonly="readonly">원</b>
					</div>
				</div>
				
				
				<div class="subTitle">
					<h4>조식 인원&nbsp;&nbsp;<span class="smalltext">25,000원</span></h4>
				</div>
				
				<div class="breakfastAddDiv">
					<!-- <input type="text" id="formBreakfastCountValue" class="countBorderNone" name="breakfast_count" value="0" size="2">명 -->
					
					<span id="add_bf_val">0</span>
					<input type="hidden"  name="add_bf" id="add_bf_name">
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="countFunction(0,-1), breakfastAddPriceFunction()" class="breakfastCountBtn">-</button>
					<button type="button" onclick="countFunction(0,1), breakfastAddPriceFunction()" class="breakfastCountBtn">+</button>
					<b class="rightFloat">
					<input type="text" id="breakfastAddPrice" name="breakfastCountPrice" value="0" size="4" class="breakfastCountBorderNone" readonly="readonly">원</b>
				</div>
				
				
				<div class="subTitle">
					<h4>추가 요청사항</h4>
				</div>
				
				<div class="textareaDiv">
					<textarea rows="4" placeholder="호텔 이용시 요청 또는 문의하실 사항이 있으면 입력해 주십시오." name="book_memo" value="requestContents"></textarea>
				</div>
				
				<div class="reservationBtns">
					<div class="reservationBtn3_1">
						<input type="button" class="reservationBtn3" onclick="location.href='booking.do?step=3&add_bed=0&breakfast_count=0'" value="비회원 예약">
					</div>
					<div class="reservationBtn3_2">
						<input type="button" class="reservationBtn3" onclick="location.href='booking.do?step=4&add_bed=0&breakfast_count=0'" value="회원 예약">
					</div>
				</div>
				
				<div class="floatClear">
				</div>
				
			</form>
			
			
		</div>
	</c:if>
	
	
	<!-- --------------------------------------------------------- -->
	<!-- STEP 4 예약확인 페이지 -->
	
	<!------------------- 비회원 예약확인 페이지(member_num이 없음) ----------------->
	<c:if test="${step==3 }">
		<div id="step4Page">
		
			<h1>비회원 예약</h1>
			
			<div>예약확인 시 필요한 정보를 입력해주세요.</div>
			
			<!-- insertNotMember.do = 비회원 예약 컨트롤러 -->
			<form action="insertNC.do" method="post">
				
				<div class="subTitle">
					<h4>비회원 정보</h4>
				</div>
				
				<!-- 비회원 정보 입력 -->
				<div class="reservationBorder">
					<div class="reservationContents">
						<span class="smalltext noaccountSub">이름</span>
						<input type="text" placeholder="이름을 입력해주세요" required="required" name="name" id="ncname">
						
						<br>
						
						<span class="smalltext noaccountSub">전화번호</span>
						<input type="text" placeholder="전화번호를 입력해주세요" required="required" name="phone" id="ncphone">
					</div>
				</div>	
				
				
				<!-- 입력했던 예약 정보 출력 -->
				
				<div class="subTitle">
					<h4>예약 정보</h4>
				</div>
				
								
				<div class="reservationBorder">
					<div class="reservationContents">
						<div>
							<span class="smalltext noaccountSub">호텔</span>
							<span class="contents">${myhdto.hotel_local}</span>
						</div>
 
 
 						<div>
							<span class="smalltext noaccountSub">객실</span>
							<span class="contents">${myrmdto.room_name}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">인원</span>
							<span class="contents">${mybdto.head_count}명</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">체크인</span>
							<span class="contents">${mybdto.check_in}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">체크아웃</span>
							<span class="contents">${mybdto.check_out}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">룸구성</span>
							<span class="contents">${rmdto.room_config}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">침대</span>
							<span class="contents">${rmdto.type}</span>
						</div>
				
						
						
						
						<h5>옵션</h5>
						
						
						<!-- 침대를 추가했다면 갯수표시 / 미추가시 "없음" 표시 -->
						<div>
							<span class="smalltext noaccountSub">침대 추가</span>
							<c:if test="${sessionScope.mybdto.add_bed== 0}">
								<span class="contents">없음</span>
							</c:if>
							<c:if test="${sessionScope.mybdto.add_bed!= 0}">
								<span class="contents">${mybdto.add_bed}개</span>
							</c:if>
						</div>
						
						<!-- 조식인원이 있을시 인원 표시 / 없을시 "없음" 표시 -->
						<div>
							<span class="smalltext noaccountSub">조식</span>
							<c:if test="${sessionScope.mybdto.breakfast_count== 0}">
								<span class="contents">없음</span>
							</c:if>
							<c:if test="${sessionScope.mybdto.breakfast_count!= 0}">
								<span class="contents">${mybdto.breakfast_count}명</span>
							</c:if>
						</div>
						
						
						
						<!-- 금액 -->
						
						<!-- 침대추가나 조식인원이 있을 시 표시 (없으면 객실가격이 곧 total가격이므로 표시할 필요없음) -->
						<c:if test="${mybdto.add_bed!=0 or mybdto.breakfast_count!=0}">
						<hr>
							<!-- 기본 객실금액 표시 -->
							<div>
								<span class="smalltext noaccountSub">객실 금액</span>
								<span class="contents">${rmdto.price}원</span>
							</div>
						</c:if>
						
						<!-- 침대추가가 있을 때 침대추가 금액 표시 -->
						<c:if test="${mybdto.add_bed!=0}">
							<div>
								<span class="smalltext noaccountSub">침대 추가 금액</span>
								<span class="contents">${mybdto.add_bed*40000}원</span>
							</div>
						</c:if>
						
						<!-- 조식인원이 있을 때 조식 금액 표시 -->
						<c:if test="${mybdto.breakfast_count!=0}">
							<div>
								<span class="smalltext noaccountSub">조식 금액</span>
								<span class="contents">${mybdto.breakfast_count*25000}원</span>
							</div>
						</c:if>
						
						<!-- 총 요금 합계 -->
						<div class="totalPriceDiv">
							<span class="smalltext noaccountSub">요금 합계</span>
							<span id="totalPrice" class="contents">${sessionScope.myrmdto.price+mybdto.add_bed*40000+mybdto.breakfast_count*25000} 원</span>
						</div>
					</div>
				</div>
				
				

				<!-- 요청사항 -->
				<div>
					<span class="smalltext noaccountSub requestSub">요청사항</span>
					<div class="textareaDiv">
						<textarea rows="4" placeholder="${mybdto.book_memo }" name="book_memo" value="requestContents" readonly="readonly"></textarea>
					</div>
				</div>


				
				<!-- 객실상태(book_status)를 "예약대기" 상태로 -->
<!-- 				<input type="hidden" name="book_status" value="예약대기">	
 -->					
				
				<input type="submit" id="reservationBtn1" value="예약신청">
				
			</form>
		
		</div>
	</c:if>
	
	
	<!--------- 회원 예약 --------------->
	<c:if test="${step==4 }">
	
		<!------------------- 로그인시 예약확인 페이지(member_num이 있음) ----------------->
		<c:if test="${member_num==null }">
			<div id="step5Page">
		
			<h1>회원 예약</h1>
			
			<div>예약 정보를 확인해주세요..</div>
			
			<form action="insert.do" method="post">
						
						
				<!-- 입력했던 예약 정보 출력 -->
				
				<div class="subTitle">
					<h4>예약 정보</h4>
				</div>
				
				
				<div class="reservationBorder">
					<div class="reservationContents">
						<div>
							<span class="smalltext noaccountSub">호텔</span>
							<span id="reserveHotel" class="contents">
								${hdto.hotel_local}
							</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">객실</span>
							<span class="contents">${myrmdto.room_name}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">인원</span>
							<span class="contents">${mybdto.head_count}명</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">체크인</span>
							<span class="contents">${mybdto.check_in}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">체크아웃</span>
							<span class="contents">${mybdto.check_out}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">룸구성</span>
							<span class="contents">${rmdto.room_config}</span>
						</div>
						
						
						<div>
							<span class="smalltext noaccountSub">침대</span>
							<span class="contents">${rmdto.type}</span>
						</div>
				
						
						
						
						<h5>옵션</h5>
						
						
						<!-- 침대를 추가했다면 갯수표시 / 미추가시 "없음" 표시 -->
						<div>
							<span class="smalltext noaccountSub">침대 추가</span>
							<c:if test="${sessionScope.add_Bed==0}">
								<span class="contents">없음</span>
							</c:if>
							<c:if test="${sessionScope.add_Bed!=0}">
								<span class="contents">${mybdto.add_bed}개</span>
							</c:if>
						</div>
						
						<!-- 조식인원이 있을시 인원 표시 / 없을시 "없음" 표시 -->
						<div>
							<span class="smalltext noaccountSub">조식</span>
							<c:if test="${sessionScope.breakfast_count==0}">
								<span class="contents">없음</span>
							</c:if>
							<c:if test="${sessionScope.breakfast_count!=0}">
								<span class="contents">${mybdto.breakfast_count}명</span>
							</c:if>
						</div>
						
						
						
						<!-- 금액 -->
						
						<!-- 침대추가나 조식인원이 있을 시 표시 (없으면 객실가격이 곧 total가격이므로 표시할 필요없음) -->
						<c:if test="${sessionScope.add_bed!=0 or sessionScope.breakfast_count!=0}">
						<hr>
							<!-- 기본 객실금액 표시 -->
							<div>
								<span class="smalltext noaccountSub">객실 금액</span>
								<span class="contents">${myrmdto.price}원</span>
							</div>
						</c:if>
						
						<!-- 침대추가가 있을 때 침대추가 금액 표시 -->
						<c:if test="${sessionScope.add_bed!=0}">
							<div>
								<span class="smalltext noaccountSub">침대 추가 금액</span>
								<span class="contents">${sessionScope.bedCountPrice}원</span>
							</div>
						</c:if>
						
						<!-- 조식인원이 있을 때 조식 금액 표시 -->
						<c:if test="${sessionScope.breakfast_count!=0}">
							<div>
								<span class="smalltext noaccountSub">조식 금액</span>
								<span class="contents">${sessionScope.breakfastCountPrice}원</span>
							</div>
						</c:if>
						
						<!-- 총 요금 합계 -->
						<div class="totalPriceDiv">
							<span class="smalltext noaccountSub">요금 합계</span>
							<span id="totalPrice" class="contents">${sessionScope.price+sessionScope.bedCountPrice+sessionScope.breakfastCountPrice} 원</span>
						</div>
					</div>
				</div>
				
				

				<!-- 요청사항 -->
				<div>
					<span class="smalltext noaccountSub requestSub">요청사항</span>
					<div class="textareaDiv">
						<textarea rows="4" placeholder="${sessionScope.book_memo }" name="book_memo" value="requestContents" readonly="readonly"></textarea>
						<!-- 요청사항(book_memo) 값 넘기기 -->
						<input type="hidden" name="book_memo" value="${sessionScope.book_memo}">
					</div>
				</div>

				

				<!-- 현재 로그인 기능이 구현되지 않아 임의로 멤버번호 1을 부여함 -->
				<input type="hidden" name="member_num" value="1">
				
				<!-- 객실상태(book_status)를 "예약대기" 상태로 -->
				<input type="hidden" name="book_status" value="예약대기">
				
				
				<input type="submit" id="reservationBtn1" value="예약신청">
			</form>
		</div>
		</c:if>
		
		<!-- 비로그인시 로그인 페이지 -->
		<c:if test="${member_num!=null }">
			(현재 로그아웃)로그인페이지 띄우기
		</c:if>
	</c:if>

 	
	<c:if test="${step==5}">
		<div id="step6Page">
			<div id="step6PageContents">
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

