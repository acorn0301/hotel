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
	
			<div class="arrow_back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
			<div>주문상세</div>
			<div class="clearBoth"></div>
	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">주문정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">주문번호</td>
				<td class="bookdetail_table_td"> ${aodto.order_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">주문상태</td>
				<td class="bookdetail_table_td">
					<c:if test="${aodto.room_status==0 }">신규주문</c:if>
					<c:if test="${aodto.room_status==1 }">준비중</c:if>
					<c:if test="${aodto.room_status==2 }">처리완료</c:if>
					<c:if test="${aodto.room_status==3 }">지난주문</c:if>
					<c:if test="${aodto.room_status==5 }">취소주문</c:if>
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
				<td class="bookdetail_table_th bookdetail_table_td">결제가격</td>
				<td class="bookdetail_table_td"> 
					<fmt:formatNumber value="${totalPrice}" pattern="#,##0"/> 원
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">요청사항</td>
				<td class="bookdetail_table_td">
					<c:if test="${aodto.memo == null }"> 없음 </c:if>
					${aodto.memo }
				</td>	
			</tr>
			
				
		</table>
		
		
		
	<div class="admin_title_div">
		<div class="admin_title_text">메뉴정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
		
			<c:forEach items="${aodto.order_detail }" var="oddto">

				<tr class="bookdetail_table_tr">
					<td class="bookdetail_table_th bookdetail_table_td">메뉴명</td>
					<td class="bookdetail_table_td"> ${oddto.menu_name_kor } (${oddto.menu_type })</td>	
				</tr>
				
				<tr class="bookdetail_table_tr tr_strong">
					<td class="bookdetail_table_th bookdetail_table_td ">가격</td>
					<td class="bookdetail_table_td"> <fmt:formatNumber value="${oddto.menu_price }" pattern="#,##0"/> 원 * ${oddto.qty } 개 = <fmt:formatNumber value="${oddto.menu_price * oddto.qty }" pattern="#,##0"/> 원</td>	
				</tr>
			</c:forEach>
			
		</table>	
	</div>
	
	<div class="admin_title_div">
		<div class="admin_title_text">고객정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">이름</td>
				<td class="bookdetail_table_td"> ${aodto.name } (${aodto.id }) 님</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">연락처</td>
				<td class="bookdetail_table_td"> ${aodto.phone }</td>	
			</tr>
			<tr class="bookdetail_table_tr ">
				<td class="bookdetail_table_th bookdetail_table_td">이메일</td>
				<td class="bookdetail_table_td"> ${aodto.email }</td>	
			</tr>
			
			
			<tr class="dashboard_tr_buttons">
					<td colspan="2">
						<button onclick="history.back()">목록으로</button>				
						
						<c:if test="${aodto.room_status < 5}">
							<c:if test="${aodto.room_status <3 }">
								<button onclick="nextStep()">확인처리</button>
							</c:if>				
							<button onclick="orderCancel()">주문취소</button>
						</c:if>
						<c:if test="${aodto.room_status == 5}">
							<button onclick="cancelRevoke()">취소철회</button>
							<button onclick="bookDelete()">주문삭제</button>				
						</c:if>
						<button class="lastBtn" onclick="">정보수정</button>				
						
					</td>
				</tr>
		
		</table>	
	</div>
	
		
</div>
</div>
</div>

<script>

	

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
</script>

</body>
</html>

