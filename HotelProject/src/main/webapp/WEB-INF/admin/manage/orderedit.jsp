<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order edit form</title>
<link rel="stylesheet" href="css/jhStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="admin_body">

<div class="qna_body_title_div">
	<div class="qna_title_text">
	
			<div class="arrow_back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
			<div>주문정보수정</div>
			<div class="clearBoth"></div>
	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">주문정보</div>
	</div>
	<div class="dashboard_div_table">
	
	<form action="adminOrderEdit.do" method="post">
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">주문번호</td>
				<td class="bookdetail_table_td"> ${aodto.order_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">주문상태</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select class="selectbox attr"  name="room_status" id="room_status_select">
						<option value="0">신규주문</option>
						<option value="1">준비중</option>
						<option value="2">처리완료</option>
						<option value="3">지난주문</option>
						<option value="5">취소주문</option>
					</select>
		
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">접수일시</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${aodto.time }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">회원명</td>
				<td class="bookdetail_table_td"> ${aodto.name }(${aodto.id })</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실정보</td>
				<td class="bookdetail_table_td"> ${aodto.hotel_local } ${aodto.room_local } 호</td>	
			</tr>
			
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">요청사항</td>
				<td class="bookdetail_table_td td_for_textarea">
				
					<!-- textarea 로 하는게 나을것 같기도 함  -->
					<textarea id="memo" name="memo" class="write_textarea admin_textarea attr" rows="1" cols="10" >${aodto.memo }</textarea>				
					
					<%-- <input type="text" value="${aodto.memo }" name="memo"> --%>
					
				</td>	
			</tr>
			
				
		</table>
		

	
	<div class="admin_title_div">
		<div class="admin_title_text">메뉴수정           
			<span class="glyphicon glyphicon-plus plus_icon" onclick="plusMenuInput()"></span>
			<div class="clearBoth"></div>
		</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table" id="plusMenuTable">
				
				
		
				<c:forEach items="${aodto.order_detail }" var="oddto" varStatus="i">
					<!-- i.index가 토큰처럼 사용된다. 따라서 변수로 미리 받아주고 쓰려고 한다.. -->
					<c:set var="oddto_index" value="${i.index }"></c:set>
					
					<tr class="bookdetail_table_tr">
						<td class="bookdetail_table_th bookdetail_table_td">메뉴명</td>
						<td class="bookdetail_table_td td_for_selectbox"> 
					
					
						<select class="selectbox attr" name="menu_num${oddto_index}" id="menu_num_select${oddto_index}">
							<option value="0">메뉴를 선택해 주세요</option>
							<c:forEach items="${menulist }" var="dto">
								<option value="${dto.menu_num }">${dto.menu_name_kor } (${dto.menu_type })</option>
							</c:forEach>
						</select>
						
					</td>		
					</tr>
					
					<tr class="bookdetail_table_tr tr_strong">
						<td class="bookdetail_table_th bookdetail_table_td ">수량</td>
						<td class="bookdetail_table_td td_for_selectbox"> 
							<select class="selectbox attr"  name="qty${oddto_index}" id="qty_select${oddto_index}">
								<c:forEach begin="0" end="20" var="i">
									<option value="${i }">${i } 개</option>
								</c:forEach>
							</select>
							
							
						</td>	
					</tr>
					
				
				</c:forEach>

			
				<!-- 여기서부터는 i 를 사용할 수 없으니까.. 자바 스크립트로 보낼 인풋 히든을 만들자   -->

			
		
			
		</table>	
	</div>

					


	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			
			
			<tr class="dashboard_tr_buttons twoBtns">
					<td colspan="2">
						<button onclick="history.back()">수정취소</button>				
						
						
						<button class="lastBtn" type="submit">수정확인</button>				
						
					</td>
				</tr>
		
		</table>
	</div>
	
	<!-- 히든 값!!  -->
	<input type="hidden" value="${aodto.room_status}" id="hiddenRoomStatus">
	<c:forEach items="${aodto.order_detail }" var="oddto" varStatus="i">
		<input type="hidden" id="qty${i.index}" value="${oddto.qty }">
		<input type="hidden" id="menu_num${i.index }" value="${oddto.menu_num }">
	</c:forEach>
	<input type="hidden" value="${oddto_index }" id="oddto_index" name="oddto_index">
		
	
	<!-- 히든으로 넘겨야 하는  -->
	<input type="hidden" value="${aodto.order_num }" name="order_num">
	<input type="hidden" value="" name="log_attr" id="log_attr">
	
	
	</form>	
	</div>
	
		
</div>
</div>


<script>

	let log_attr = []; 
	//attr 변경시마다 log_attr에 반영 
	
	$('.attr').change(function(){
		let attr = $(this).attr("name");
		if(log_attr.indexOf(attr) == -1){
			log_attr.push(attr);
			console.log("log_attr: " , log_attr);
		}
		$("#log_attr").val(log_attr.join(","));
	});

	//주문상태 select 초기값 설정
	$("#room_status_select").val(${aodto.room_status}).prop("selected", true);
	
	//메뉴명, 수량 select 초기값 설정 
	for(let i = 0 ; i < ${oddtoSize} ; i++ ){
		let qty = $("#qty" + i).val();
		let menu_num = $("#menu_num" + i).val();
		
		$("#menu_num_select" + i).val(menu_num).prop("selected", true);
		$("#qty_select" + i).val(qty).prop("selected",true);
	}
	
	
	

	//확인 처리 버튼을 눌렀을 때  
	function nextStep(){
	
		location.href="adminOrderNextStepOne.do?order_num=" + ${aodto.order_num} + "&room_status=" + ${aodto.room_status};			
	} 
	
	//예약 취소 버튼을 눌렀을 때 
	function orderCancel(){
		
		let chk = confirm("주문을 취소하시겠습니까?");
		if(chk){
			location.href="adminOrderCancelOne.do?order_num=" + ${aodto.order_num} + "&room_status=" + ${aodto.room_status};
		}			
	}
	
	//취소철회 버튼을 눌렀을 때
	function cancelRevoke(){
		
		location.href="adminOrderCancelRevokeOne.do?order_num=" + ${aodto.order_num} + "&room_status=" + ${aodto.room_status};

				
	}
	
	//예약 삭제 버튼을 눌렀을 때 
	function bookDelete(){
		alert('아직 구현되지 않은 기능입니다.');
	}

		
	//주문 삭제 버튼을 눌렀을 때 
	function bookDelete(){
		alert('아직 구현되지 않은 기능입니다.');
	}
	
	//메뉴 추가 + 아이콘 눌렀을 때... 더 추가해 줍니다. 
	function plusMenuInput(){
		
		let oddto_index = $("#oddto_index").val()*1 +1;
		$("#oddto_index").val(oddto_index);
		
		let plusMenuTr = '<tr class="bookdetail_table_tr">'+
			'<td class="bookdetail_table_th bookdetail_table_td">메뉴명</td>'+
			'<td class="bookdetail_table_td td_for_selectbox">'+
			
			
				'<select class="selectbox " name="menu_num'+ oddto_index +'" id="menu_num_select">'+
					'<option value="0">메뉴를 선택해 주세요</option>'+
					'<c:forEach items="${menulist }" var="dto">'+
						'<option value="${dto.menu_num }">${dto.menu_name_kor } (${dto.menu_type })</option>'+
					'</c:forEach>'+
				'</select>'+
				
			'</td></tr><tr class="bookdetail_table_tr tr_strong">'+
			'<td class="bookdetail_table_th bookdetail_table_td ">수량</td>'+
			'<td class="bookdetail_table_td td_for_selectbox">'+ 
				'<select class="selectbox" name="qty' + oddto_index + '" id="qty_select">'+
					'<c:forEach begin="0" end="20" var="i">'+
						'<option value="${i }">${i } 개</option>'+
					'</c:forEach>'+
				'</select></td></tr>';
				
		$("#plusMenuTable").append(plusMenuTr);
		
		
	}
</script>

</body>
</html>

