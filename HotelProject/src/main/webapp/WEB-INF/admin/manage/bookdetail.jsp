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
			<div class="arrow_back" onclick="location.href='adminBookList.do?book_status=${abdto.book_status}'"><i class="fas fa-chevron-left"></i></div>
			<div>예약상세</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">예약정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">예약번호</td>
				<td class="bookdetail_table_td"> ${abdto.book_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">예약상태</td>
				<td class="bookdetail_table_td">
					<c:if test="${abdto.book_status==0 }">예약대기</c:if>
					<c:if test="${abdto.book_status==1 }">예약접수</c:if>
					<c:if test="${abdto.book_status==2 }">숙박중</c:if>
					<c:if test="${abdto.book_status==3 }">지난예약</c:if>
					<c:if test="${abdto.book_status==5 }">취소예약</c:if>
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">접수일시</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${abdto.book_day }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">회원명</td>
				<td class="bookdetail_table_td"> ${abdto.name }(${abdto.id })</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">인원</td>
				<td class="bookdetail_table_td"> ${abdto.head_count } 명</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">체크인</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${abdto.check_in }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">체크아웃</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${abdto.check_out }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">결제가격</td>
				<td class="bookdetail_table_td"> 
					객실 - <fmt:formatNumber value="${abdto.price }" pattern="#,##0"/>원
					<c:if test="${abdto.add_bed != 0 }">
						<br>추가침대 - <fmt:formatNumber value="${abdto.add_bed*40000 }" pattern="#,##0"/>원
					</c:if>
					<c:if test="${abdto.breakfast_count != 0 }">
						<br>조식 -  <fmt:formatNumber value="${abdto.breakfast_count*25000 }" pattern="#,##0"/>원
					</c:if>	
					
					<br>
					<b>총  <fmt:formatNumber value="${abdto.price + abdto.breakfast_count*25000  + abdto.add_bed*40000 }" pattern="#,##0"/>원</b>
									
				
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">추가사항</td>
				<td class="bookdetail_table_td">
					<c:if test="${abdto.book_memo != null}">"${abdto.book_memo }" <br></c:if>
					<c:if test="${abdto.add_bed != 0 }">추가침대 - ${abdto.add_bed } 개 <br></c:if>
					<c:if test="${abdto.breakfast_count != 0 }">조식인원 - ${abdto.breakfast_count } 명</c:if>
					
				</td>	
			</tr>
			
				
		</table>
		
		
		
	<div class="admin_title_div">
		<div class="admin_title_text">객실정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실번호</td>
				<td class="bookdetail_table_td"> ${abdto.room_num } (${abdto.hotel_local } ${abdto.room_local } 호)</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실타입</td>
				<td class="bookdetail_table_td"> ${abdto.room_name } ${abdto.type }</td>	
			</tr>
			
		</table>	
	</div>
	
	<div class="admin_title_div">
		<div class="admin_title_text">고객정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">이름</td>
				<td class="bookdetail_table_td"> ${abdto.name } (${abdto.id }) 님</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">연락처</td>
				<td class="bookdetail_table_td"> ${abdto.phone }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">이메일</td>
				<td class="bookdetail_table_td"> ${abdto.email }</td>	
			</tr>
			<tr class="dashboard_tr_buttons">
					<td colspan="2">
						<button onclick="history.back()">목록으로</button>				
						
						<c:if test="${abdto.book_status < 5}">
							<c:if test="${abdto.book_status <3 }">
								<button onclick="nextStep()">확인처리</button>
							</c:if>				
							<button onclick="bookCancel()">예약취소</button>
						</c:if>
						<c:if test="${abdto.book_status == 5}">
							<button onclick="cancelRevoke()">취소철회</button>
							<button onclick="bookDelete()">예약삭제</button>				
						</c:if>
						<button class="lastBtn" onclick="location.href='adminBookEditForm.do?book_num=${abdto.book_num}'">정보수정</button>				
						
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
		
		//어떤 상태로 변경될 지 알려준다. 
		let book_status = ${abdto.book_status};
		let next_status = "";
		switch(book_status){
		case 0 :
			next_status = "예약접수";
			break;
		case 1 :
			next_status = "숙박중";
			break;
		case 2 :
			next_status = "지난예약";
			break;
			
		}		
		alert('예약 상태가 ' + next_status + "(으)로 변경됩니다. ");
		location.href="adminBookNestStepOne.do?book_num=" + ${abdto.book_num} + "&book_status=" + ${abdto.book_status} ;			
	} 
	
	//예약 취소 버튼을 눌렀을 때 
	function bookCancel(){
		
		let chk = confirm("예약을 취소하시겠습니까?");
		if(chk){
			location.href="adminBookCancelOne.do?book_num=" + ${abdto.book_num} + "&book_status=" + ${abdto.book_status};
		}			
	}
	
	//취소철회 버튼을 눌렀을 때
	function cancelRevoke(){
		
		location.href="adminBookCancelRevokeOne.do?book_num=" + ${abdto.book_num} + "&book_status=" + ${abdto.book_status};
			
				
	}
	
	//예약 삭제 버튼을 눌렀을 때 
	function bookDelete(){
		alert('아직 구현되지 않은 기능입니다.');
	}


</script>

</body>
</html>

