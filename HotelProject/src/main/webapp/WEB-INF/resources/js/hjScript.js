//STEP 2 페이지
$(document).ready(function(){

   // (STEP3) hidden 값 삽입
   // *1 은 숫자열로 바꿔준다.
   bc = $("#hiddenBC").val()*1;
   ab = $("#hiddenAB").val()*1;
   
   
   //자세히 보기 클릭시 팝업
   $('.aboutRoomMD').click(function(){
      $('#aboutRoomModalBack').removeClass('aboutRoomModalBack');
   });
   
   // 'x' 아이콘 클릭시 팝업 삭제
   $('#aboutRoomModal .icon').click(function(){
      $('#aboutRoomModalBack').addClass('aboutRoomModalBack');
   });
   
   // 팝업 검은 배경 클릭시 팝업 삭제
   $('#aboutRoomModalBack').click(function(){
      $('#aboutRoomModalBack').addClass('aboutRoomModalBack');
   });
   
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



function check_insert(){
   
   // 메인 모달창에서 인원값 받아서 메인에 출력하는 함수
   var date = document.getElementById("datepicker1");
   
   var c = document.getElementById("check_count2");
   
   c.value = date_val;
   
   //글씨색 진하고 굵게
   //c.style.color = "#3a3125";
   //c.style.fontWeight = "bold";
}



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



function sameCheck(){
   i = $("#datepicker1").val();
   o = $("#datepicker2").val();
   
   // 날짜가 같으면 버튼 비활성화
   if(o == i)
   {

      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = true;
      rsbtn.style.backgroundColor= "#a99e91";
      alert("체크인 날짜와 체크아웃 날짜가 같습니다. 다시 선택해 주십시오.");
   }
   else
   {
//      console.log("같지않음");
      var rsbtn = document.getElementById("reservationBtn1");
      rsbtn.disabled = false;
      rsbtn.style.backgroundColor= "#685845";
   }
};


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
      rsbtn.style.backgroundColor= "#3a3125";
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


// 모달에 해당 룸 데이타 정보 가져오기
function modalData(name,img,type,max,config,price){
   $(".modalRoomName").text(name);
   $(".modalRoomImg").attr("src",("images/room/"+img));
   $(".modalRoomType").text(type);
   $(".modalRoommax").text(max);
   $(".modalRoomConfig").text(config);
   $(".modalRoomPrice").text(price);
}



// STEP 3 페이지



//침대 수 버튼 클릭시 증가 및 감소
function countFunction(n,m,max){
   
   //조식인원,침대추가,요청사항 전역변수

   let memo = '';
   
//   $("#add_bed_val").text(su);
//   $("#add_bf_val").text(su2);
   

   //침대추가
   ab += n;
      
      // 인원수 3명 이상일 때 침대 최대 개수 2개
      if(max>=3)
      {
         if(ab>2)
         {
            ab = 2;
         }
         if(ab<0)
         {
            ab = 0;
         }
      }
      
      $("#hiddenAB").val(ab); //값 변경

      $("#add_bed_val").text(ab); //값 변경
      
      
   //조식인원추가   
   bc += m;

//      console.log("bc + m " , bc );
      if(bc < 0)
      {
         bc=0; // 0 미만 숫자 불가능
      }
         
      if(bc > max)
      {
         bc=max; // 인원수 이상 숫자 불가능
      }
      
      $("#hiddenBC").val(bc);   //값 변경
      $("#add_bf_val").text(bc); //값 변경
   
   
   $("#bedAddPrice").val(ab*40000);
   $("#breakfastAddPrice").val(bc*25000);
   
}


// 비회원예약/회원예약 버튼 클릭시 페이지이동과 요청사항 값 넘기기
function goNext(n,n2){
   memo = $("#book_memo").val();
   
   if(n2>=3)
   {
      location.href = 'booking.do?step=' +n+ '&add_bed=' +ab+ '&breakfast_count=' +bc+ '&book_memo=' +memo;
   }
   
   if(n2<3)
   {
      location.href = 'booking.do?step=' +n+ '&add_bed=' +0+ '&breakfast_count=' +bc+ '&book_memo=' +memo;
   }
   
}





// 버튼 클릭시 메모 값 보내기
function addMemo(){
   let memo = $("#book_memo").text();
   
   let onclick1 = $("#reservationBtn3_1").attr("onclick");
   let onclick2 = $("#reservationBtn3_2").attr("onclick");   
   onclick1 = onclick1.substring(0,onclick1.length -1);
   onclick2 = onclick2.substring(0,onclick2.length -1);
   
   onclick1 += "&book_memo=" + memo + "'";
   onclick2 += "&book_memo=" + memo + "'";
   
//   console.log(onclick1);
   
   $("#reservationBtn3_1").attr("onclick", onclick1);
   $("#reservationBtn3_2").attr("onclick", onclick2);
}
