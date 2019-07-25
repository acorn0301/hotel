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
<!-- 예약 css / js -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
   <c:if test="${step==0 or step==1 or step==2 or step==3 or step==4}">
   
      <div class="qna_body_title_div">
         <div class="qna_title_text">예약하기</div>
      </div>
      <div id="step">
         <ul>
         
            <!------------------- STEP 1 -------------------------->
            <!-- 현재 페이지가 step1이면 글자강조 -->
            <c:if test="${step==0}">
               <li class="bold">
                  STEP 1<br>
                  호텔 검색
               </li>
            </c:if>
            
            <!-- 현재 페이지가 step1가 아닌 곳이면 강조해제 -->
            <c:if test="${step!=0}">
            <!-- step1 가 아닌 곳에서 값이 있을 때 클릭 가능 -->
               <c:if test="${fbdto.hotel_num != null }">
                  <a href="booking.do?step=0">
                     <li class="gray">
                        STEP 1<br>
                        호텔 검색
                     </li>
                  </a>
               </c:if>
               <!-- step1 가 아닌 곳에서 값이 없을 때 클릭 불가 -->
               <c:if test="${fbdto.hotel_num == null }">
                  <li class="gray">
                     STEP 1<br>
                     호텔 검색
                  </li>
               </c:if>
            </c:if>
         
         
            <!------------------- STEP 2 -------------------------->
            <!-- 현재 페이지가 step2면 글자강조 -->
            <c:if test="${step==1}">
               <li class="bold">
                  STEP 2<br>
                  객실 선택
               </li>
            </c:if>
            
            <!-- 현재 페이지가 step2가 아닌 곳이면 강조해제 -->
            <c:if test="${step!=1}">
            <!-- step2 가 아닌 곳에서 값이 있을 때 클릭 가능 -->
               <c:if test="${fbdto.room_num != '0' }">
                  <a href="booking.do?step=1&hotel_num=${fbdto.hotel_num}&check_in=${fbdto.check_in}&check_out=${fbdto.check_out}&head_count=${fbdto.head_count}">
                     <li class="gray">
                        STEP 2<br>
                        객실 선택
                     </li>
                  </a>
               </c:if>
               <!-- step2 가 아닌 곳에서 값이 없을 때 클릭 불가 -->
               <c:if test="${fbdto.room_num == '0' }">
                  <li class="gray">
                     STEP 2<br>
                     객실 선택
                  </li>
               </c:if>
            </c:if>
            
            
            <!------------------- STEP 3 -------------------------->
            <!-- 현재 페이지가 step3면 글자강조 -->
            <c:if test="${step==2}">
               <li class="bold">
                  STEP 3<br>
                  옵션 선택
               </li>
            </c:if>
            
            <!-- 현재 페이지가 step3가 아닌 곳이면 강조해제 -->
            <c:if test="${step!=2}">
            <!-- step3 가 아닌 곳에서 값이 있을 때 클릭 가능 -->
               <c:if test="${fbdto.book_memo != null }">
                  <a href="booking.do?step=2&add_bed=${fbdto.add_bed}&breakfast_count=${fbdto.breakfast_count}&book_memo=${fbdto.book_memo}">
                     <li class="gray">
                        STEP 3<br>
                        옵션 선택
                     </li>
                  </a>
               </c:if>
               <!-- step3 가 아닌 곳에서 값이 없을 때 클릭 불가 -->
               <c:if test="${fbdto.book_memo == null }">
                  <li class="gray">
                     STEP 3<br>
                     옵션 선택
                  </li>
               </c:if>
            </c:if>
            
            
            <!------------------- STEP 4 -------------------------->
            <!-- 현재 페이지가 step4면 글자강조 -->
            <c:if test="${step==3 or step==4}">
               <li class="bold">
                  STEP 4<br>
                  예약 확인
               </li>
            </c:if>
            
            <!-- 현재 페이지가 step4가 아닌 곳 -->
            <c:if test="${step!=3 and step!=4}">
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
         
         <div class="caption">예약을 원하시는 <b>호텔, 날짜, 인원</b>을 선택후<br>
         <b>객실검색 버튼</b>을 눌러주세요.</div>
         
         <div class="admin_title_div">
            <div class="admin_title_text">
               객실 검색 조건
            </div>
         </div>
         
         <div class="reservationBorder">
            <div class="reservationContents">
            <form action="booking.do" method="post">
            
               <!-- 호텔 지점 선택 ----------------------->
                  <select class="formHotelLocal" name="hotel_num">
                     <c:forEach var="hdto" items="${localList }">
                        <option value="${hdto.hotel_num}" >${hdto.hotel_local}</option>
                     </c:forEach>
                  </select>
               
                  
               <!-- 체크인 날짜 선택 ----------------------------------->
               <span class="smalltext">체크인</span>
               <label>
                     <!-- 1. 다른페이지에서 넘어왔을 때 값 유지 -->
                     <c:if test="${fbdto.hotel_num != null }">
                        <input type="text" name="check_in" required="required"id="datepicker1" value="${fbdto.check_in}" onchange="sameCheck()" readonly="readonly">
                     </c:if>
                     <!-- 2. 첫 접속 시 -->
                     <c:if test="${fbdto.hotel_num == null }">
                        <input type="text" class="noBold" name="check_in" required="required"id="datepicker1" placeholder="체크인 날짜 선택" onchange="sameCheck()" readonly="readonly">
                     </c:if>
                  <i class="far fa-calendar-alt color2"></i>
               </label>
               
               <hr>
               
               <!-- 체크아웃 날짜 선택 -------------------------------->
               <span class="smalltext">체크아웃</span>
               <label>
                     <!-- 1. 다른페이지에서 넘어왔을 때 값 유지 -->
                     <c:if test="${fbdto.hotel_num != null }">
                           <input type="text" name="check_out" required="required" id="datepicker2" value="${fbdto.check_out}" onchange="sameCheck()" readonly="readonly">
                     </c:if>
                     <!-- 2. 첫 접속 시 -->
                     <c:if test="${fbdto.hotel_num == null }">
                        <input type="text" class="noBold" name="check_out" required="required" id="datepicker2" placeholder="체크아웃 날짜 선택" onchange="sameCheck()" readonly="readonly">
                     </c:if>
                  <i class="far fa-calendar-alt color2"></i>
               </label>   
            
               
               <!-- hr 쓰지말고 div bottom에 보더 주기 -->
               <hr>
               
               <!-- 인원 입력 -->
               <span class="smalltext">인원</span>
               
               <button type="button" onclick="headCountFunction(1)" class="headCountBtn rightFloat">+</button>
               <button type="button" onclick="headCountFunction(-1)" class="headCountBtn rightFloat">-</button>
               
               
                  <!-- 1. 다른페이지에서 넘어왔을 때 값 유지 -->
                  <c:if test="${fbdto.hotel_num != null }">
                     <input type="text" id="formHeadCountValue" class="countBorderNone rightFloat" name="head_count" value="${fbdto.head_count }" size="1" class="rightFloat">
                  </c:if>
                  <!-- 2. 첫 접속 시 -->
                  <c:if test="${fbdto.hotel_num == null }">
                     <input type="text" id="formHeadCountValue" class="countBorderNone rightFloat" name="head_count" value="1" size="1" class="rightFloat">
                  </c:if>
               
               <br><br>
               
               <!-- 검색버튼 -->
               <input type="hidden" name="step" value="1">   
               <input type="submit" id="reservationBtn1" value="객실검색" onclick="sameCheck()">
               
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
         
         <!-- 세팅 출력 -->
         <div class="admin_title_div">
            <div class="admin_title_text">
               객실 검색 조건
            </div>
         </div>
         
         <!-- 전 페이지에서 받아온 값 출력 -->
         <div class="searchSetting">
            <div class="searchSettingContents">
            
               <div class="settingSub">
                  <!-- 지점 -->
                  <span class="hotelLocalText">
                     ${sessionScope.fbdto.hotel_local}
                  </span>
                  &nbsp;
                  
                  <!-- 인원 -->
                  <span class="headCountText">
                     ${fbdto.head_count }명
                  </span>
               </div>
               
               <div class="settingCheck">
                  <!-- 체크인 날짜 -->
                  <div class="checkInDiv">
                   <span class="smalltext">체크인</span>
                    <i class="fas fa-sign-in-alt color2"></i>
                    <br>
                      ${fbdto.check_in }
                  </div>
                  
                  
                  <!-- 체크아웃 날짜 -->
                  <div class="checkOutDiv">
                   <span class="smalltext">체크아웃</span>
                   <i class="fas fa-sign-out-alt color2"></i>
                   <br>
                      ${fbdto.check_out }
                  </div>
               </div>
               
            </div>
         </div>
         
         
         <!-- 세팅에 맞는 객실 리스트 출력 -->
         <div class="admin_title_div">
            <div class="admin_title_text">
               예약가능한 객실
            </div>
         </div>
         
         <%-- <c:if test="">--%>
         <!-- 목록을 출력할 dto를 fbdto로 -->
            <c:forEach var="fbdto" items="${roomList }">
               <div class="roomListBorder">
                  <div class="roomListContents">
                  
                     <!-- 폼 -->
                     <form action="booking.do" method="post">
                        <div class="roomInfoSpan">
                           
                           
                           <!-- 객실 넘버 -->
                           <div id="roomListNum">${fbdto.room_num }</div>
                           

                           &nbsp;
                           
                           <!-- 객실 이름 -->
                           <span class="roomListName">${fbdto.room_name }</span>
                           
                           <!-- 객실 가격 -->
                           <span class="roomListPrice rightFloat smalltext"> ${fbdto.price }</span>
                        
                        </div>
                        
                        
                        <img src="images/room/${fbdto.room_img }" alt="객실이미지">
                        
                        <!-- 자세히보기 버튼을 누르면 해당 객실의 데이타 전달 -->
                        <div class="width50">
                           <button type="button" class="aboutRoomMD" onclick="modalData('${fbdto.room_name }','${fbdto.room_img }','${fbdto.type }','${fbdto.max }','${fbdto.room_config }','${fbdto.price }')">자세히 보기</button>
                        </div>
                        
                        <!-- 다음 페이지로 이동 -->
                        <input type="hidden" name="step" value="2">   
                        
                        <!-- ** span 태그의 name을 읽을 수 없음 -->
                        <!-- 넘겨야하는 값은 input type="hidden"에 줄 것 -->
                         <input type="hidden" name="room_num" value="${fbdto.room_num }">
                        <div class="width50">
                        <input type="submit" value="예약하기" id="reservationBtn2">
                        
                        </div>
                     </form>
                  </div>
               </div>
             </c:forEach>
         
         
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
                      <p>1st HOTEL의 고품격 서비스를 만나볼 수 있는 객실로,
                      상품과 서비스 가치 위에 새로운 감성을 더한 공간입니다.
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
         <div class="caption">객실 이용에 필요한 옵션사항을 선택하세요.</div>
         
         
         <!-- 폼 -->
         <form action="booking.do" method="post" name="optionForm">
         
         <!-- 인원수가 3명 이상일때 침대추가 가능 ----------------------------------->
         <c:if test="${fbdto.head_count >2 }">
            <div class="admin_title_div">
               <div class="admin_title_text">침대 추가&nbsp;&nbsp;
               <span class="smalltext">40,000원</span></div>
            </div>
            
            <div class="optionDiv">
               <!-- <span class="smalltext">침대 추가</span><br> -->
               <div class="bedPriceDiv">
                  
                  <!-- step1,2에서 들어왔을 때 값 0 -->
                  <c:if test="${sessionScope.fbdto.add_bed == 0 }">
                     <span id="add_bed_val" class="optionSpan">0</span>
                  </c:if>
                  
                  <!-- step4에서 들어왔을 때 값 표시 -->
                  <c:if test="${sessionScope.fbdto.add_bed != 0 }">
                     <span id="add_bed_val" class="optionSpan">${sessionScope.fbdto.add_bed}</span>
                  </c:if>
                  
                  <!-- <input type="hidden"  name="add_bed" id="add_bed_val"> -->
                  
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                  <!-- 침대 감소 - 버튼 -->
                  <button type="button" onclick="countFunction(-1,0,${fbdto.head_count})" class="bedCountBtn">-</button>
                  <!-- 침대 추가 + 버튼 -->
                  <button type="button" onclick="countFunction(1,0,${fbdto.head_count})" class="bedCountBtn">+</button>

                   
                  <!-- step1,2에서 들어왔을 때 값 0 -->
                  <c:if test="${sessionScope.fbdto.add_bed == 0 }">
                     <b class="rightFloat">
                     <input type="text" id="bedAddPrice" value="0" size="10" class="bedCountBorderNone" readonly="readonly">
                     원</b>
                  </c:if>
                  
                  <!-- step4에서 들어왔을 때 값 표시 -->
                  <c:if test="${sessionScope.fbdto.add_bed != 0 }">
                     <b class="rightFloat">
                     <input type="text" id="bedAddPrice" value="${sessionScope.fbdto.add_bed *40000}" size="10" class="bedCountBorderNone" readonly="readonly">
                     원</b>
                  </c:if>
                  
                  
                  <!-- 값이 있을 때 값 보내기 -->
                  <c:if test="${sessionScope.fbdto.add_bed != 0 }">
                     <input type="hidden" value="${fbdto.add_bed }" id="hiddenAB">
                  </c:if>
                  
                  <!-- 값이 없을 때 값 보내기 -->
                  <c:if test="${sessionScope.fbdto.add_bed == 0 }">
                     <input type="hidden" value="0" id="hiddenAB">
                  </c:if>
               </div>
            </div>
            
            <div class="addBedText">※ 침대 추가는 2개까지 가능합니다.</div>
         </c:if>
            
            
            <!-- 조식인원 ------------------------------->
            <div class="admin_title_div">
               <div class="admin_title_text">조식 인원&nbsp;&nbsp;<span class="smalltext">25,000원</span></div>
            </div>

            <div class="optionDiv">
               <div class="breakfastAddDiv">
            
               <!-- 세션에 저장된 조식인원 값이 0일때 0 표시 -->
               <c:if test="${sessionScope.fbdto.breakfast_count == 0 }">
                  <span id="add_bf_val" class="optionSpan">0</span>
               </c:if>
               
               <!-- 세션에 저장된 조식인원 값이 있을 때 값 표시 -->
               <c:if test="${sessionScope.fbdto.breakfast_count != 0 }">
                  <span id="add_bf_val" class="optionSpan" value="${sessionScope.fbdto.breakfast_count}">${sessionScope.fbdto.breakfast_count}</span>
               </c:if>
               
               <!-- <input type="hidden"  name="add_bf_val" id="add_bf_name"> -->
               
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               <!-- 인원 감소 - 버튼 -->
               <button type="button" onclick="countFunction(0,-1,${fbdto.head_count})" class="breakfastCountBtn">-</button>
               <!-- 인원 증가 + 버튼 -->
               <button type="button" onclick="countFunction(0,1,${fbdto.head_count})" class="breakfastCountBtn">+</button>
               
               <!-- step1,2에서 들어왔을 때 값 0 -->
               <c:if test="${sessionScope.fbdto.breakfast_count == 0 }">
                  <b class="rightFloat">
                  <input type="text" id="breakfastAddPrice" value="0" size="10" class="breakfastCountBorderNone" readonly="readonly">&nbsp;원</b>
               </c:if>
               
               <!-- step4에서 들어왔을 때 값 표시 -->
               <c:if test="${sessionScope.fbdto.breakfast_count != 0 }">
                  <b class="rightFloat">
                  <input type="text" id="breakfastAddPrice" value="${sessionScope.fbdto.breakfast_count*25000}" size="10" class="breakfastCountBorderNone" readonly="readonly">&nbsp;원</b>
               </c:if>
               
               <!-- 값이 있을 때 값 보내기 -->
               <c:if test="${sessionScope.fbdto.add_bed != 0 }">
                  <input type="hidden" value="${fbdto.breakfast_count }" id="hiddenBC">
               </c:if>
                  
               <!-- 값이 없을 때 값 보내기 -->
               <c:if test="${sessionScope.fbdto.add_bed == 0 }">
                  <input type="hidden" value="0" id="hiddenBC">
               </c:if>
               
            </div>
         </div>
            
            
            <div class="admin_title_div">
               <div class="admin_title_text">추가 요청사항</div>
            </div>
            
            <div class="textareaDiv">
               <textarea rows="4" placeholder="호텔 이용시 요청 또는 문의하실 사항이 있으면 입력해 주십시오." name="book_memo" id="book_memo">${sessionScope.fbdto.book_memo }</textarea>
            </div>
            
            <!-- 현재 로그아웃 상태일 때 비회원/회원 버튼 두가지 -->
            <c:if test="${member_num==null }">
               <div class="reservationBtns">
                  <div class="reservationBtn3_1">
                     <input type="button" id="reservationBtn3_1" class="reservationBtn3" onclick="goNext(3,${fbdto.head_count})" value="비회원 예약">
                  </div>
                  <div class="reservationBtn3_2">
                     <input type="button" id="reservationBtn3_2" class="reservationBtn3" onclick="goNext(4,${fbdto.head_count})" value="회원 예약">
                  </div>
               </div>
            </c:if>
            
            <!-- 현재 로그인 상태일 때 버튼 한가지-->
            <c:if test="${member_num!=null }">
               <div class="reservationBtns">
                  <input type="button" onClick="goNext(4,${fbdto.head_count})" class="reservationBtn3" value="예약하기">
               </div>
            </c:if>
            
         </form>
         
         
      </div>
   </c:if>
   
   
   <!-- --------------------------------------------------------- -->
   <!-- STEP 4 예약확인 페이지 -->
   
   <!------------------- 비회원 예약확인 페이지 ----------------->
   <c:if test="${step==3 }">
      <div id="step4Page">
      
         <h1>비회원 예약</h1>
         
         <div class="caption">예약확인 시 필요한 정보를 입력해주세요.</div>
         
         <!-- insertNc.do = 비회원 예약 컨트롤러 -->
         <form action="insertNC.do" method="post">
            
            <div class="admin_title_div">
               <div class="admin_title_text">
                  비회원 정보
               </div>
            </div>
            
            <!-- 비회원 정보 입력 -->
            <div class="reservationBorder">
               <div class="reservationContents">
                  <span class="smalltext noaccountSub2">이름</span>
                  <input type="text" placeholder="이름 입력" required="required" name="name" id="ncname" class="infoInput">
                  
                  <br>
                  
                  <span class="smalltext noaccountSub2">전화번호</span>
                  <input type="text" placeholder="전화번호 입력" required="required" name="phone" id="ncphone" class="infoInput">
               </div>
            </div>   
            
            
            <!-- 입력했던 예약 정보 출력 ----------------------->
            
            <div class="admin_title_div">
               <div class="admin_title_text">
                  예약 정보
               </div>
            </div>
            
            <div class="reservationBorder">
               <div class="reservationContents">
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-hotel"></i>&nbsp;&nbsp;호텔</span>
                     <span class="reserveHotel rightFloat">${fbdto.hotel_local}</span>
                  </div>
 
 
                   <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-home"></i>&nbsp;&nbsp;객실</span>
                     <span class="contents">${fbdto.room_name}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-users"></i>&nbsp;&nbsp;인원</span>
                     <span class="contents">${fbdto.head_count}명</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;체크인</span>
                     <span class="contents">${fbdto.check_in}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;체크아웃</span>
                     <span class="contents">${fbdto.check_out}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-couch"></i>&nbsp;&nbsp;룸구성</span>
                     <span class="contents">${fbdto.room_config}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-bed"></i>&nbsp;&nbsp;침대</span>
                     <span class="contents">${fbdto.type}</span>
                  </div>
            
                  
                  <hr>
                  
                  
                  <!-- 3명 이상 시 표시 ------------------------------------>
                  <c:if test="${fbdto.head_count > 3 }">
                     <!-- 침대를 추가했다면 갯수표시 / 미추가시 "없음" 표시 ---------->
                     <div>
                        <span class="smalltext noaccountSub">
                        <i class="fas fa-bed"></i>&nbsp;&nbsp;침대 추가</span>
                        <c:if test="${sessionScope.fbdto.add_bed== 0}">
                           <span class="contents">없음</span>
                        </c:if>
                        <c:if test="${sessionScope.fbdto.add_bed!= 0}">
                           <span class="contents">${fbdto.add_bed}개</span>
                        </c:if>
                     </div>
                  </c:if>
                  
                  <!-- 조식인원이 있을시 인원 표시 / 없을시 "없음" 표시 -------->
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-utensils"></i>&nbsp;&nbsp;조식</span>
                     <c:if test="${sessionScope.fbdto.breakfast_count== 0}">
                        <span class="contents">없음</span>
                     </c:if>
                     <c:if test="${sessionScope.fbdto.breakfast_count!= 0}">
                        <span class="contents">${fbdto.breakfast_count}명</span>
                     </c:if>
                  </div>
                  
                  
                  
                  <!-- 금액 -->
                  
                  <!-- 침대추가나 조식인원이 있을 시 표시 (없으면 객실가격이 곧 total가격이므로 표시할 필요없음) -->
                  <c:if test="${fbdto.add_bed!=0 or fbdto.breakfast_count!=0}">
                  <hr>
                     <!-- 기본 객실금액 표시 -->
                     <div>
                        <span class="smalltext noaccountSub">객실 금액</span>
                        <span class="contents">${fbdto.price}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 침대추가가 있을 때 침대추가 금액 표시 -->
                  <c:if test="${fbdto.add_bed!=0}">
                     <div>
                        <span class="smalltext noaccountSub">침대 추가 금액</span>
                        <span class="contents">${fbdto.add_bed*40000}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 조식인원이 있을 때 조식 금액 표시 -->
                  <c:if test="${fbdto.breakfast_count!=0}">
                     <div>
                        <span class="smalltext noaccountSub">조식 금액</span>
                        <span class="contents">${fbdto.breakfast_count*25000}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 총 요금 합계 -->
                  <div class="totalPriceDiv">
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-won-sign"></i>&nbsp;&nbsp;요금 합계</span>
                     <span id="totalPrice" class="contents">${sessionScope.fbdto.price+fbdto.add_bed*40000+fbdto.breakfast_count*25000} 원</span>
                  </div>
               </div>
            </div>
            

            <div class="admin_title_div">
               <div class="admin_title_text">
                  요청 사항
               </div>
            </div>
            
               <!-- 요청사항 -->
               <div>
                  <div class="textareaDiv">
                     <textarea rows="4" readonly="readonly">${sessionScope.fbdto.book_memo }</textarea>
                  </div>
               </div>


            
            <!-- 객실상태(book_status)를 "예약대기" 상태로 -->
<!--             <input type="hidden" name="book_status" value="예약대기">   
 -->               
            
            <input type="submit" id="reservationBtn1" value="예약신청">
            
         </form>
      
      </div>
   </c:if>
   
   
   <!--------- 회원 예약 --------------->
   <c:if test="${step==4 }">
   
      <!------------------- 로그인시 예약확인 페이지(member_num이 있음) ----------------->
      <%-- <c:if test="${member_num!=null }"> --%>
         <div id="step5Page">
      
         <h1>회원 예약</h1>
         
         <div class="caption">예약 정보를 확인해주세요.</div>
         
         <form action="insert.do" method="post">
                  
                  
            <!-- 입력했던 예약 정보 출력 ----------------------->
            
            <div class="admin_title_div">
               <div class="admin_title_text">
                  예약 정보
               </div>
            </div>
            
            <div class="reservationBorder">
               <div class="reservationContents">
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-hotel"></i>&nbsp;&nbsp;호텔</span>
                     <span class="reserveHotel rightFloat">${fbdto.hotel_local}</span>
                  </div>
 
 
                   <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-home"></i>&nbsp;&nbsp;객실</span>
                     <span class="contents">${fbdto.room_name}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-users"></i>&nbsp;&nbsp;인원</span>
                     <span class="contents">${fbdto.head_count}명</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;체크인</span>
                     <span class="contents">${fbdto.check_in}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;체크아웃</span>
                     <span class="contents">${fbdto.check_out}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-couch"></i>&nbsp;&nbsp;룸구성</span>
                     <span class="contents">${fbdto.room_config}</span>
                  </div>
                  
                  
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-bed"></i>&nbsp;&nbsp;침대</span>
                     <span class="contents">${fbdto.type}</span>
                  </div>
            
                  
                  <hr>
                  
                  
                  <!-- 3명 이상 시 표시 ------------------------------------>
                  <c:if test="${fbdto.head_count > 3 }">
                     <!-- 침대를 추가했다면 갯수표시 / 미추가시 "없음" 표시 ---------->
                     <div>
                        <span class="smalltext noaccountSub">
                        <i class="fas fa-bed"></i>&nbsp;&nbsp;침대 추가</span>
                        <c:if test="${sessionScope.fbdto.add_bed== 0}">
                           <span class="contents">없음</span>
                        </c:if>
                        <c:if test="${sessionScope.fbdto.add_bed!= 0}">
                           <span class="contents">${fbdto.add_bed}개</span>
                        </c:if>
                     </div>
                  </c:if>
                  
                  <!-- 조식인원이 있을시 인원 표시 / 없을시 "없음" 표시 -------->
                  <div>
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-utensils"></i>&nbsp;&nbsp;조식</span>
                     <c:if test="${sessionScope.fbdto.breakfast_count== 0}">
                        <span class="contents">없음</span>
                     </c:if>
                     <c:if test="${sessionScope.fbdto.breakfast_count!= 0}">
                        <span class="contents">${fbdto.breakfast_count}명</span>
                     </c:if>
                  </div>
                  
                  
                  
                  <!-- 금액 -->
                  
                  <!-- 침대추가나 조식인원이 있을 시 표시 (없으면 객실가격이 곧 total가격이므로 표시할 필요없음) -->
                  <c:if test="${fbdto.add_bed!=0 or fbdto.breakfast_count!=0}">
                  <hr>
                     <!-- 기본 객실금액 표시 -->
                     <div>
                        <span class="smalltext noaccountSub">객실 금액</span>
                        <span class="contents">${fbdto.price}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 침대추가가 있을 때 침대추가 금액 표시 -->
                  <c:if test="${fbdto.add_bed!=0}">
                     <div>
                        <span class="smalltext noaccountSub">침대 추가 금액</span>
                        <span class="contents">${fbdto.add_bed*40000}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 조식인원이 있을 때 조식 금액 표시 -->
                  <c:if test="${fbdto.breakfast_count!=0}">
                     <div>
                        <span class="smalltext noaccountSub">조식 금액</span>
                        <span class="contents">${fbdto.breakfast_count*25000}원</span>
                     </div>
                  </c:if>
                  
                  <!-- 총 요금 합계 -->
                  <div class="totalPriceDiv">
                     <span class="smalltext noaccountSub">
                     <i class="fas fa-won-sign"></i>&nbsp;&nbsp;요금 합계</span>
                     <span id="totalPrice" class="contents">${sessionScope.fbdto.price+fbdto.add_bed*40000+fbdto.breakfast_count*25000} 원</span>
                  </div>
               </div>
            </div>
            

            <div class="admin_title_div">
               <div class="admin_title_text">
                  요청 사항
               </div>
            </div>
            
               <!-- 요청사항 -->
               <div>
                  <div class="textareaDiv">
                     <textarea rows="4" readonly="readonly">${sessionScope.fbdto.book_memo }</textarea>
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
      


   <!-- 예약확인 페이지 ---------------------------->    
   <c:if test="${step==5}">
      <div id="step6Page">
         <div id="step6PageContents">
            <img src="images/etc/check.png" alt="check" class="icon2">
            <br>
            <h2>예약되었습니다</h2>
            <div>이용해주셔서 감사합니다.<br>
            해당 날짜에 늦지 않게 체크인 부탁드립니다.</div>
            <br>
            <input type="button" value="예약확인" class="reservationBtn4" onclick="location.href='m_bookinglist.do'">
			<input type="button" value="룸서비스" class="reservationBtn4" onclick="location.href='roomaservice.do'">
         </div>
      </div>
   </c:if>

</div>
</body>
</html>
