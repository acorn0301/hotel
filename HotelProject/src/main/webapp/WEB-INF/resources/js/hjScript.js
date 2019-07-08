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
//침대 수 버튼 클릭시 증가 및 감소
function bedCountFunction(n,m){
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
	
	
}


//침대 수 증가에 따른 가격 증가
function bedAddPriceFunction(){
	var bed = document.getElementById("formBedCountValue"); //침대 갯수 구하기
	bed_val = parseInt(bed.value); //침대 갯수를 숫자열로 변환
	bedPrice = bed_val*40000;
	document.getElementById("bedAddPrice").value = bedPrice;	
}


//조식인원 수 버튼 클릭시 증가 및 감소
function breakfastCountFunction(n,m){
	var bftext = document.getElementById("formBreakfastCountValue"); // <input="text" id="bedCountValue"> 선택
	bftext_val = parseInt(bftext.value); // 폼 값을 숫자열로 변환
	bftext_val += n; // 계산
	bftext.value = bftext_val; // 계산된 값을 바꾼다
	
	//var headCount = "<%= session.getAttribute('headCount') %>";
	
	if(bftext.value<=0)
	{
		bftext.value=0; // 0 미만 숫자 불가능
	}
	
	if(bftext.value>=m)
	{
		bftext.value=m; // 해당 인원 이상 수 불가능
	}
}



//조식 인원 수 증가에 따른 가격 증가
function breakfastAddPriceFunction(){
	var bf = document.getElementById("formBreakfastCountValue"); //조식 인원 수 구하기
	bf_val = parseInt(bf.value); //조식 인원 수를 숫자열로 변환
	bfPrice = bf_val*25000;
	document.getElementById("breakfastAddPrice").value = bfPrice;	
}





// 회원 / 비회원 버튼에 따라 submit step값 보내기
function reservationSubmit(index){

	//비회원 버튼 (예약확인/비회원 정보입력)
	if(index==3){
		/*document.optionForm.action="booking.do?step=3";*/
		location.href="booking.do?step=3";
			
	}
	
	//회원 버튼 (로그아웃시 로그인페이지 / 로그인시 예약확인)
	if(index==4){
		document.optionForm.action="booking.do?step=4";
	}
	
	document.optionForm.submit();
}

