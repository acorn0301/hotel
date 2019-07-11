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


// 날짜 설정
$(function(){
	/*$.datepicker.setDefaults({
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
             ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)         
	})*/
	
	//input을 datepicker로 선언
	$("#datepicker1").datepicker({
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
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            ,setDate: "today" //초기값을 오늘로 설정
            ,onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#datepicker2").datepicker( "option", "minDate", selectedDate )}
    });
	
	$("#datepicker2").datepicker({
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
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            ,setDate: "+1D" //초기값을 내일로 설정
            ,onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#datepicker1").datepicker( "option", "maxDate", selectedDate );}
	});
});






//페이지 첫 접속이 아닐시, session에 저장된 호텔 지점을 select 상태로
//var Local = sessionStorage.getItem(localList);
//hotelLocal = (String)session.getAttribute("hotelLocal");
//$(".formHotelLocal").val(hotelLocal).prop("selected",true)


//STEP 2 페이지
$(document).ready(function(){
	
	
	
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

function modalData(name,img,type,max,config,price){
	$(".modalRoomName").text(name);
	$(".modalRoomImg").attr("src",("images/room/"+img));
	$(".modalRoomType").text(type);
	$(".modalRoommax").text(max);
	$(".modalRoomConfig").text(config);
	$(".modalRoomPrice").text(price);
}





// STEP 3 페이지

//조식인원,침대추가,요청사항 전역변수
let bc=0;
let ab=0;
let memo= "";

//침대 수 버튼 클릭시 증가 및 감소
function countFunction(n,m,max){
	//침대추가
	if(ab <= max){

		ab += n;
		
		if(max<=3) // 인원수 3이하일때
		{
			if(ab<=0)
			{
				ab=0; // 0 미만 숫자 불가능
			}
			
			if(ab>=1)
			{
				ab=1; // 1 이상 숫자 불가능
			}
		}
		
		//인원수 4명 이상일 때
		if(max>3)
		{
			if(ab<=0)
			{
				ab=0; // 0 미만 숫자 불가능
			}
			
			if(ab>=max-1)
			{
				ab=max-1; // 인원수-1 이상 숫자 불가능
			}
		}
		$("#add_bed_val").text(ab); //값 변경
		
	};
	
	
	if( bc <= max){
		
		bc += m;

		if(bc<=0)
		{
			bc=0; // 0 미만 숫자 불가능
		}
			
		if(bc>max)
		{
			bc=max; // 인원수 이상 숫자 불가능
		}
		
		$("#add_bf_val").text(bc); //값 변경
	};
	
	$("#bedAddPrice").val(ab*40000);
	$("#breakfastAddPrice").val(bc*25000);
	
	//value
	/*$("#reservationBtn3_1").attr("onclick","location.href='booking.do?step=3&add_bed=" + value1 + "&breakfast_count=" + value2 + "'");
	
	$("#reservationBtn3_2").attr("onclick","location.href='booking.do?step=4&add_bed=" + value1 + "&breakfast_count=" + value2 + "'");*/
}


// 비회원예약/회원예약 버튼 클릭시 페이지이동과 요청사항 값 넘기기
function goNext(n){
	memo = $("#book_memo").val();
	
	console.log("메모: "+memo);
	
	location.href = 'booking.do?step=' +n+ '&add_bed=' +ab+ '&breakfast_count=' +bc+ '&book_memo=' +memo;

}





/*function bedCountFunction(n,m){
	var bedtext = document.getElementById("formBedCountValue"); // <input="text" id="bedCountValue"> 선택
	bedtext_val = parseInt(bedtext.value); // 폼 값을 숫자열로 변환
	bedtext_val += n; // 계산
	bedtext.value = bedtext_val; // 계산된 값을 바꾼다
	
	
	if(m<=3)
	{
		if(bedtext.value<=0)
		{
			bedtext.value=0; // 0 미만 숫자 불가능
		}
		
		if(bedtext.value>=1)
		{
			bedtext.value=1; // m-1 이상 숫자 불가능
		}
	}
	
	if(m>=3)
	{
		if(bedtext.value<=0)
		{
			bedtext.value=0; // 0 미만 숫자 불가능
		}
		
		if(bedtext.value>=3)
		{
			bedtext.value=3; // m-1 이상 숫자 불가능
		}
	}
}*/


//침대 수 증가에 따른 가격 증가
/*function bedAddPriceFunction(){
	var bed = document.getElementById("add_bed_val")*1; //침대 갯수 구하기
	bed_val = parseInt(bed.value); //침대 갯수를 숫자열로 변환
	bedPrice = bed_val*40000;
	document.getElementById("bedAddPrice").value = parseInt(bedPrice);
	
}*/


/*
//조식인원 수 버튼 클릭시 증가 및 감소
function breakfastCountFunction(n,m){
	let value = $("#add_bf_val").text()*1;
	value += n;
	$("#add_bf_val").text(value);
	$("#add_bf_name").val(value);
	$(".reservationBtn3").attr("onclick","location.href='booking.do?step=3&braekfast_count=" + value + "'");
}
*/


/*function breakfastCountFunction(n,m){
	var bftext = $("#formBreakfastCountValue"); // <input="text" id="bedCountValue"> 선택
	bftext_val = parseInt(bftext.val()); // 폼 값을 숫자열로 변환
	bftext_val += n; // 계산
	$("#formBreakfastCountValue").val(bftext_val);
	bftext.value = bftext_val; // 계산된 값을 바꾼다
	
	//var headCount = "<%= session.getAttribute('headCount') %>";
	
	if(bftext.val<=0)
	{
		bftext.val=0; // 0 미만 숫자 불가능
	}
	
	if(bftext.val>=m)
	{
		bftext.val=m; // 해당 인원 이상 수 불가능
	}
}*/



//조식 인원 수 증가에 따른 가격 증가
/*function breakfastAddPriceFunction(){
	var bf = document.getElementById("formBreakfastCountValue"); //조식 인원 수 구하기
	bf_val = parseInt(bf.value); //조식 인원 수를 숫자열로 변환
	bfPrice = bf_val*25000;
	document.getElementById("breakfastAddPrice").value = bfPrice;	
}*/






/*// 회원 / 비회원 버튼에 따라 submit step값 보내기
function reservationSubmit(index){

	//비회원 버튼 (예약확인/비회원 정보입력)
	if(index==3){
		alert("ddd");
		document.optionForm.action="booking.do?step=3";
		location.href="booking.do?step=3";
			
	}
	
	//회원 버튼 (로그아웃시 로그인페이지 / 로그인시 예약확인)
	if(index==4){
		document.optionForm.action="booking.do?step=4";
	}
	
	document.optionForm.submit();
}*/

