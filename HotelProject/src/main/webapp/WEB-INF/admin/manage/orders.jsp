<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jhStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>




<div class="admin_body">

	<div class="qna_body_title_div">
		<div class="qna_title_text">
			<div class="arrow_back" onclick="location.href='admin.do'"><i class="fas fa-chevron-left"></i></div>
			<div>룸서비스</div>
			<div class="clearBoth"></div>					
		</div>

	</div>

	
	<div class="dashboard_div">
		<div class="">
			<%-- <div class="admin_title_text">
				<c:if test="${room_status==0 }">신규주문</c:if>
				<c:if test="${room_status==1 }">준비중</c:if>
				<c:if test="${room_status==2 }">처리완료</c:if>
				<c:if test="${room_status==3 }">지난주문</c:if>
			</div> --%>
			
			<select class="selectbox dashboard_selectbox" name="" id="order_status_select">
				<option value="0" >신규주문</option>
				<option value="1" >준비중</option>
				<option value="2" >처리완료</option>
				<option value="3" >지난주문</option>
				<option value="5" >취소주문</option>

			</select>
		</div>
		<div class="dashboard_div_table">
<!-- 			<ul>
 -->			
 			<table class="dashboard_table">
				<tr class="dashboard_tr_buttons">
					<td colspan="2">
						<button onclick="chkAll()" id="selectAllBtn">전체선택</button>
						<button onclick="chkNone()" id="selectNoneBtn">선택해제</button>
						<c:if test="${room_status < 3}">
							<button onclick="nextStep()">확인처리</button>				
							<button onclick="orderCancel()">주문취소</button>
						</c:if>
						<c:if test="${room_status == 5}">
							<button onclick="cancelRevoke()">취소철회</button>
							<button onclick="bookDelete()">주문삭제</button>				
						</c:if>
						<button class="lastBtn" onclick="search()">조건검색</button>
					</td>
				</tr>
				<c:if test="${size==0 }">
					<tr>
						<td colspan="2">
							<div class="dashboard_li_empty">
								<i class="fas fa-exclamation-triangle"></i><br>
								조건에 해당하는 주문건이 없습니다.
							</div>
						</td>
					</tr>
				</c:if>
				
				<c:forEach items="${list}" var="dto" >
					<!-- <li> -->
					<tr class="dashboard_tr">
					<td class="dashboard_td_chkbox">
						<input class="adminChkBox" type="checkbox" value="${dto.order_num }" name="chkbox">
					</td>
					<td>
						<div onClick="location.href='adminOrderListDetail.do?order_num=${dto.order_num}'">
						<div class="dashboard_li_div3">
<!-- 							<span class="arrowRight"><i class="fas fa-angle-right"></i></span>
 -->							<div class="booklist_div">
								<span class="list_hotel_local">${dto.hotel_local }점</span>
								<span class="list_room_local color2">${dto.room_local}호 &nbsp;&nbsp;</span>
						
							</div>
							
							<div class="booklist_div">
								<span class="list_name">${dto.name }님</span>
								<span class="list_id">(${dto.id })</span>
								<span class="list_book_day color3"><fmt:formatDate value="${dto.time }" pattern="yyyy-MM-dd HH:mm"/></span>
							</div>
							
							<div class="booklist_div">
									
									<c:forEach items="${dto.order_detail }" var="oddto">
										<div>
											<span>${oddto.menu_name_kor }</span>
											<span>  ${oddto.qty } 개</span>
										</div>
									</c:forEach>
								
							</div>
		
						</div>
						</div>
						</td>
						</tr>
					<!-- </li> -->	
				</c:forEach>
			</table>
<!-- 			</ul>
 -->		</div>	
	</div>

<input type="hidden" value="${room_status }" id="hiddenRoomStatus">
</div>

<script>
	//book_status 값으로 상단 셀렉트의 selected 값을 변경시켜주자 
	let order_status = $("#hiddenRoomStatus").val();
	$("#order_status_select").val(order_status).prop("selected", true);
	
	//선택해제 버튼은 초기값 hide 
	$("#selectNoneBtn").hide();
	
	//전체선택 버튼을 눌렀을 때
	function chkAll(){
		$(".adminChkBox").prop("checked", true);
		$("#selectAllBtn").hide();
		$("#selectNoneBtn").show();
	}
	
	//선택해제 버튼을 눌렀을 때 
	function chkNone(){
		$(".adminChkBox").prop("checked", false);
		$("#selectAllBtn").show();
		$("#selectNoneBtn").hide();
	}
	
	
	
	//확인 처리 버튼을 눌렀을 때  
	function nextStep(){
		let sum = $("input:checkbox[name=chkbox]:checked").length;
		if(sum==0){
			alert("하나 이상의 주문건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let order_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var order_num = $(this).val(); 
  					order_nums.push(order_num);
  					
  			})			
			let order_nums_str = order_nums.join(",");
 			location.href="adminOrderNextStep.do?order_nums_str=" + order_nums_str + "&room_status=" + ${room_status};
			
		}		
	}
	
	
	//주문 취소 버튼을 눌렀을 때 
	function orderCancel(){
		let sum = $("input:checkbox[name=chkbox]:checked").length;
		if(sum==0){
			alert("하나 이상의 주문건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let order_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var order_num = $(this).val(); 
  					order_nums.push(order_num);
  					
  			})
			
			let order_nums_str = order_nums.join(",");	
			
			alert("해당 주문건이 취소주문으로 변경되었습니다.")
			
 			location.href="adminOrderCancel.do?order_nums_str=" + order_nums_str + "&room_status=" + ${room_status};
			
		}		
	}
	
	
	
	
	
	//셀렉트 박스 변경시 조건에 맞는 예약내역을 다시 가져와야 한다.
	$("#order_status_select").change(function(){
		let order_status = $("#order_status_select:selected").val();
		location.href="adminOrderList.do?room_status=" + order_status;
	})
	
	
	
	
	//취소철회 버튼을 눌렀을 때
	function cancelRevoke(){
		let sum = $("input:checkbox[name=chkbox]:checked").length;
		if(sum==0){
			alert("하나 이상의 예약건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let order_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var order_num = $(this).val(); 
  					order_nums.push(order_num);
  					
  			})
			
			let order_nums_str = order_nums.join(",");		
			
			alert("철회된 취소건은 신규주문으로 처리됩니다.")
			
 			location.href="adminOrderCancelRevoke.do?order_nums_str=" + order_nums_str + "&room_status=" + ${room_status};
			
		}		
	}
		
	//주문 삭제 버튼을 눌렀을 때 
	function bookDelete(){
		alert('아직 구현되지 않은 기능입니다.');
	}
	
	//조건검색 버튼을 눌렀을 때 
	
	function search(){
		alert('아직 구현되지 않은 기능입니다.');
	}
	
	
	

</script>

</body>
</html>

