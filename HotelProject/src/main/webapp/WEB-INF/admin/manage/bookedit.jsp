<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book edit form</title>
<link rel="stylesheet" href="css/jhStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="admin_body">

<div class="qna_body_title_div">
	<div class="qna_title_text">
			<div class="arrow_back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
			<div>예약정보수정</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	<form action="adminBookEdit.do" method="post">
	
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
				<td class="bookdetail_table_td td_for_selectbox">
					<select class="selectbox attr"  name="book_status" id="book_status_select">
						<option value="0">예약대기</option>
						<option value="1">예약접수</option>
						<option value="2">숙박중</option>
						<option value="3">지난예약</option>
						<option value="5">취소예약</option>
					</select>
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">회원명</td>
				<td class="bookdetail_table_td"> ${abdto.name }(${abdto.id })</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">인원</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select class="selectbox attr" id="head_count_select" name="head_count">
						<c:forEach begin="0" end="6" var="i">
							<option value="${i }">${i } 명</option>
						</c:forEach>
					</select>
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr ">
				<td class="bookdetail_table_th bookdetail_table_td">체크인</td>
				<td class="bookdetail_table_td td_for_selectbox"> <fmt:formatDate value="${abdto.check_in }" pattern="yyyy-MM-dd" var="chkin"/>
					<input class="selectbox attr" name="check_in" type="date" value="${chkin}" />
				</td>	
			</tr>
			<tr class="bookdetail_table_tr ">
				<td class="bookdetail_table_th bookdetail_table_td">체크아웃</td>
				<td class="bookdetail_table_td td_for_selectbox"> <fmt:formatDate value="${abdto.check_out }" pattern="yyyy-MM-dd" var="chkout" />
					<input type="date" name="check_out" class="selectbox attr" value="${chkout}" />
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">요청사항</td>
				<td class="bookdetail_table_td td_for_textarea">
					<textarea id="reply_content" name="book_memo" class="write_textarea admin_textarea attr" rows="1" cols="10" >${abdto.book_memo }</textarea>				
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">추가침대</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select name="add_bed" class="selectbox attr" id="add_bed_select">
						<option value="0">0 개</option>
						<option value="1">1 개</option>
						<option value="2">2 개</option>
					</select>					
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">조식인원</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select name="breakfast_count" class="selectbox attr" id="breakfast_count_select">
						<c:forEach begin="0" end="${abdto.head_count }" var="i">
							<option value="${i }">${i } 명</option>
						</c:forEach>
					</select>
					
				</td>	
			</tr>
			
			
				
		</table>
		
		
	
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실정보</td>
				<td class="bookdetail_table_td td_for_selectbox"> 
					<select class="selectbox attr" name="room_num" id="room_num_select">
						<c:forEach items="${list }" var="dto" >
							<option value="${dto.room_num }">${dto.room_num } ${dto.room_name } ${dto.type }  (${dto.room_local } 호)</option>
						</c:forEach>
					</select>
				
				<%-- ${abdto.room_num } (${abdto.hotel_local } ${abdto.room_local } 호) --%>
				
				</td>	
			</tr>
			
			
		</table>	
	</div>
	
	
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			
			<tr class="dashboard_tr_buttons twoBtns">
					<td colspan="2">
						<button type="button" onclick="history.back()">수정취소</button>				
						
						
						<button type="submit" class="lastBtn">수정확인</button>			
						
					</td>
				</tr>
		
		</table>
	</div>
	
		
</div>

	<!-- 히든으로 넘길것!! -->
	<input type="hidden" value="${abdto.book_num }" name="book_num">
	<input type="hidden" value="" id="head_count_change">
	<input type="hidden" value="" name="log_attr" id="log_attr">


</form>
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


	//예약 상태 selectbox 초기화 
		$("#book_status_select").val(${abdto.book_status}).prop("selected", true);

	//인원 selectbox 초기화
		$("#head_count_select").val(${abdto.head_count}).prop("selected", true);

	//추가침대 selectbox 초기화
		$("#add_bed_select").val(${abdto.add_bed}).prop("selected", true);
	
	//조식인원 selectbox 초기화
		$("#breakfast_count_select").val(${abdto.breakfast_count}).prop("selected", true);

	//객실정보 selectbox 초기화
		$("#room_num_select").val(${abdto.room_num}).prop("selected", true);
	
	//인원 변경시 조식인원의 max값도 변경되어야 한다.
	//시간 관계상 나중에 짜도록 한다.... ㅠㅠ 


</script>

</body>
</html>

