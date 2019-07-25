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



////////////////////////////

//STEP 2 페이지
$(document).ready(function(){
   //메인 체크인+체크아웃 오늘 날짜로 디폴트시키기
      //오늘날짜 구하기
      var today = new Date();
      
      var dd = today.getDate();
      var mm = today.getMonth()+1; //January is 0!
      var yyyy = today.getFullYear();
      
      if(dd<10) {
          dd='0'+dd
      } 
   
      if(mm<10) {
          mm='0'+mm
      }

      //input text에 디폴트값 삽입
      todayDate = (yyyy+"-"+mm+"-"+dd);
      document.getElementById("datepicker1").value = todayDate;
      document.getElementById("datepicker2").value = todayDate;
      
      //보여지는 값 삽입
      document.getElementById("checkIn_year").innerHTML = yyyy;
      document.getElementById("checkIn_month").innerHTML = mm;
      document.getElementById("checkIn_day").innerHTML = dd;
      
      //보여지는 값 삽입
      document.getElementById("checkOut_year").innerHTML = yyyy;
      document.getElementById("checkOut_month").innerHTML = mm;
      document.getElementById("checkOut_day").innerHTML = dd;
   
      
   // 메인 체크인 체크아웃 값 설정하지 않았을 때 버튼 비활성화시키기

      checkin = document.getElementById("datepicker1").value;
      checkout = document.getElementById("datepicker2").value;
      
      if(checkin == '' || checkout == '')
      {
         reservationBtn1.disabled = false;
      }
      else
      {
         reservationBtn1.disabled = true;
      }   
   
   //메인 페이지
   //인원 클릭시 팝업
   $('.checkCount').click(function(){
      $('#count_modal_back').removeClass('aboutRoomModalBack');
   });
   
   ////체크인 클릭시 팝업
   /*$('.checkIn').click(function(){
      $('#checkIn_modal_back').removeClass('aboutRoomModalBack');
   });*/
   
   // '확인' 아이콘 클릭시 팝업 삭제
   $('#modal_okBtn').click(function(){
      $('#count_modal_back').addClass('aboutRoomModalBack');
   });
   
   // 팝업 검은 배경 클릭시 팝업 삭제
   //$('.aboutRoomModalBack').click(function(){
   //   $('#count_modal_back').addClass('aboutRoomModalBack');
   //});
})



//STEP 1 페이지
//인원 수 버튼 클릭시 증가 및 감소
function headCountFunction(n){
   var text = document.getElementById("formHeadCountValue"); // <input="text" id="formHeadCountValue"> 선택
   text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
   text_val += n; // 계산
   text.value = text_val; // 계산된 값을 바꾼다
   
   if(text.value<=1)
   {
      text.value=1; // 0 이하 숫자 불가능
   }
   
   if(text.value>=7)
   {
      text.value=6; // 5 이상 숫자 불가능
   }
}



/*function check_insert(){
   
   // 메인 모달창에서 인원값 받아서 메인에 출력하는 함수
   var date = document.getElementById("datepicker1");
   
   var c = document.getElementById("check_count2");
   
   c.value = date_val;
   
   //글씨색 진하고 굵게
   //c.style.color = "#3a3125";
   //c.style.fontWeight = "bold";
}*/



// 날짜 설정
$(function(){

   //input을 datepicker로 선언
   $("#datepicker1").datepicker({
	   ignoreReadonly: true,
      dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+2M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            ,setDate: "today" //초기값을 오늘로 설정
            ,onClose: function( selectedDate ) {    
               /*console.log(selectedDate, typeof(selectedDate));
               let mili = Date.parse(selectedDate) + 86400000;
               var myDate = new Date(mili);
               selectedDate = Date.yyyymmdd(myDate);
               console.log(selectedDate);*/
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#datepicker2").datepicker( "option", "minDate", selectedDate)}
    });
   
   $("#datepicker2").datepicker({
	   ignoreReadonly: true,
      dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+2M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            ,setDate: "today" //초기값을 내일로 설정
            ,onClose: function(selectedDate) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#datepicker1").datepicker( "option", "maxDate", selectedDate );}
   });

});



//메인 - 메인 모달창에서 인원값 받아서 메인에 출력하는 함수
function value_insert(){
   
   // 메인 모달창에서 인원값 받아서 메인에 출력하는 함수
   var v = document.getElementById("formHeadCountValue");
   
   var c = document.getElementById("check_count2");

   v_val = parseInt(v.value);
   c_val = parseInt(c.value);
   
   c.value = v_val;
   
   //글씨색 진하고 굵게
   //c.style.color = "#3a3125";
   //c.style.fontWeight = "bold";
}

// breakfast_count
let bc = 0;
// add_bed
let ab = 0;



// 메인 - 날짜 클릭시 날짜값 받아서 바로 출력하는 함수
function checkDate(x,day){
   
   // datepicker 선택
   var date = document.getElementById(x);
   
   //console.log(date);
   
   // datepicker 의 value 구함
   date_val = date.value;
   
   //console.log(date_val);
   
   // - 로 풀어서 배열 만들기
   var dateArray = date_val.split('-');
   
   dateArray[0] = String(dateArray[0]);
   dateArray[1] = String(dateArray[1]);
   dateArray[2] = String(dateArray[2]);
   
   //console.log(dateArray[0]+dateArray[1]+dateArray[2]);
   
   var yy2 = (dateArray[0]);
   var mm2 = (dateArray[1]);
   var dd2 = (dateArray[2]);
   
   //console.log(document.getElementById("check"+day+"_year"));
   //console.log("check"+day+"_year");
   //console.log("yy: "+yy);

   // 값 삽입
   document.getElementById("check"+day+"_year").innerHTML = yy2;
   document.getElementById("check"+day+"_month").innerHTML = mm2;
   document.getElementById("check"+day+"_day").innerHTML = dd2;
   
   //console.log($("#checkIn_day").text());
   
   /*im = $("#checkIn_month").text();
   om = $("#checkOut_month").text();
   i = $("#checkIn_day").text();
   o = $("#checkOut_day").text();

   i = im+i
   o = om+o*/
   
   i = $("#datepicker1").val();
   o = $("#datepicker2").val();
   
//   console.log(i);
//   console.log(o);

   // 날짜가 같으면 버튼 비활성화
   if(o == i)
   {
      //document.getElementById("check"+day+"_day").innerHTML = dd*1+1;
//      console.log("같음");
      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = true;
      rsbtn.style.backgroundColor= "#a99e91";
      alert("체크인 날짜와 체크아웃 날짜가 같습니다. 다시 선택해 주십시오.");
   }
   /*else if(o < i)
   {
      alert("체크인 날짜가 체크아웃 날짜보다 늦습니다. 다시 선택해 주십시오.");
      //document.getElementById("check"+day+"_day").innerHTML = dd*1+1;
      reservationBtn1.disabled = true;
   }*/
   else
   {
//      console.log("같지않음");
      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = false;
      rsbtn.style.backgroundColor= "#685845";
   }
   
   //오늘날짜 구하기
   //오늘날짜 구하기
   var today = new Date();
   
   var dd = today.getDate();
   var mm = today.getMonth()+1; //January is 0!
   var yyyy = today.getFullYear();
   
   if(dd<10) {
       dd='0'+dd
   } 

   if(mm<10) {
       mm='0'+mm
   }

   //input text에 디폴트값 삽입
   todayDate = (yyyy+"-"+mm+"-"+dd);
   
//   console.log(todayDate);
//   console.log(o);
   
   if(o == todayDate)
   {
      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = true;
      rsbtn.style.backgroundColor= "#a99e91";
   }
   else
   {
      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = false;
   }
};