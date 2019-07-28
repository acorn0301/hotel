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
<script>
	
</script>



<div class="admin_body">

	<div class="qna_body_title_div">
		<div class="qna_title_text">
			<div class="arrow_back" onclick="location.href='admin.do'"><i class="fas fa-chevron-left"></i></div>
			<div>예약관리</div>
			<div class="clearBoth"></div>
		</div>
	</div>

	
	<div class="dashboard_div">
		<div class="">
			<%-- <div class="admin_title_text">
				<c:if test="${book_status==0 }">예약대기</c:if>
				<c:if test="${book_status==1 }">예약완료</c:if>
				<c:if test="${book_status==-1 }">체크인</c:if>
				<c:if test="${book_status==2 }">숙박중</c:if>
				<c:if test="${book_status==-2 }">체크아웃</c:if>
				<c:if test="${book_status==3 }">지난예약</c:if>		
			</div> --%>
			
			<select class="selectbox dashboard_selectbox" name="" id="book_status_select">
				<option value="0" id="book_status0">예약대기</option>
				<option value="1" id="book_status1">예약완료</option>
				<option value="-1" id="book_status-1">체크인</option>
				<option value="-2" id="book_status-2">체크아웃</option>
				<option value="2" id="book_status3">숙박중</option>
				<option value="3" id="book_status4">지난예약</option>
				<option value="5" id="book_status4">취소예약</option>
			</select>
		</div>
		<div class="dashboard_div_table">
			<!-- <ul> -->
			<table class="dashboard_table">
				<tr class="dashboard_tr_buttons">
					<td colspan="2">
						<button onclick="chkAll()" id="selectAllBtn">전체선택</button>
						<button onclick="chkNone()" id="selectNoneBtn">선택해제</button>
						<c:if test="${book_status < 5}">
							<c:if test="${book_status <3 }">
								<button onclick="nextStep()">확인처리</button>
							</c:if>				
							<button onclick="bookCancel()">예약취소</button>
						</c:if>
						<c:if test="${book_status == 5}">
							<button onclick="cancelRevoke()">취소철회</button>
							<button onclick="bookDelete()">예약삭제</button>				
						</c:if>
						<button class="lastBtn" onclick="search()">조건검색</button>
					</td>
				</tr>
				
				<c:if test="${size==0 }">
					<tr >
						<td colspan="2">
							<div class="dashboard_li_empty">
								<i class="fas fa-exclamation-triangle"></i><br>
								조건에 해당하는 예약건이 없습니다.
							</div>
						</td>
					</tr>
				</c:if>
			
				<c:forEach items="${list}" var="dto">
					<!-- <li> -->
					<tr class="dashboard_tr">
					<td class="dashboard_td_chkbox">
						<input class="adminChkBox" type="checkbox" value="${dto.book_num }" name="chkbox">
					</td>
					<td>
						<div >
						<div class="dashboard_li_div2" onClick="location.href='adminBookListDetail.do?book_num=${dto.book_num}'">
							<div class="booklist_div">
								<span class="list_hotel_local">${dto.hotel_local }점</span>
								<span class="list_room_local color2">${dto.room_local}호 &nbsp;&nbsp;</span>
								<span>
									
									<span class="list_hotel_local"><i class='fas fa-user color1'></i>&nbsp;${dto.head_count }&nbsp;</span>
									
									<c:if test="${dto.add_bed > 0}">
										<span class="glyphicon glyphicon-bed color6"></span>&nbsp;
									</c:if>
									
									<c:if test="${dto.breakfast_count >0 }">
										<i class='fas fa-utensils color7' ></i>
									</c:if>
									
									
								</span> 
							</div>
							
							<div class="booklist_div">
								<span class="list_name">${dto.name }님</span>
								<span class="list_id">
									<c:if test="${dto.id != 'nc_id' }"> (${dto.id })</c:if>
									<c:if test="${dto.id == 'nc_id' }"> (비회원예약)</c:if>
								</span>
								<span class="list_book_day color3"><fmt:formatDate value="${dto.book_day }" pattern="yyyy-MM-dd HH:mm"/></span>
							</div>
							
							<div class="booklist_div">
								<span class="list_check_in_out color4">
									<fmt:formatDate value="${dto.check_in }" pattern="MM / dd"/>
								 	-
								 	<fmt:formatDate value="${dto.check_out }" pattern="MM / dd "/></span>
								
							</div>
						</div>
						
						
						
						
						</div>
						</td>
						</tr>
					<!-- </li> -->	
				</c:forEach>
			</table>
			<!-- </ul> -->
		</div>	
	</div>


</div>
<input type="hidden" value="${book_status }" id="hiddenBookStatus">


<script type="text/javascript">
	//book_status 값으로 상단 셀렉트의 selected 값을 변경시켜주자 
	let book_status = $("#hiddenBookStatus").val();
	$("#book_status_select").val(book_status).prop("selected", true);
	
	
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
			alert("하나 이상의 예약건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let book_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var book_num = $(this).val(); 
  					book_nums.push(book_num);
  					
  			})			
			let book_nums_str = book_nums.join(",");
 			location.href="adminBookNestStep.do?book_nums_str=" + book_nums_str + "&book_status=" + ${book_status};
			
		}		
	}
	
	//예약 취소 버튼을 눌렀을 때 
	function bookCancel(){
		let sum = $("input:checkbox[name=chkbox]:checked").length;
		if(sum==0){
			alert("하나 이상의 예약건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let book_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var book_num = $(this).val(); 
  					book_nums.push(book_num);
  					
  			})
			
			let book_nums_str = book_nums.join(",");		
 			location.href="adminBookCancel.do?book_nums_str=" + book_nums_str + "&book_status=" + ${book_status};
			
		}		
	}
	
	
	//셀렉트 박스 변경시 조건에 맞는 예약내역을 다시 가져와야 한다.
	$("#book_status_select").change(function(){
		let book_status = $("#book_status_select:selected").val();
		location.href="adminBookList.do?book_status=" + book_status;
	})
	
	//취소철회 버튼을 눌렀을 때
	function cancelRevoke(){
		let sum = $("input:checkbox[name=chkbox]:checked").length;
		if(sum==0){
			alert("하나 이상의 예약건을 선택해 주세요.");
		}else{
			//체크된 아이들의 value 값을 모두 모아... 
			//컨트롤러로 가서 db 처리하자.
			
			let book_nums = [];
			$("input:checkbox[name=chkbox]:checked").each(function() {
  					var book_num = $(this).val(); 
  					book_nums.push(book_num);
  					
  			})
			
			let book_nums_str = book_nums.join(",");		
 			location.href="adminBookCancelRevoke.do?book_nums_str=" + book_nums_str + "&book_status=" + ${book_status};
			
		}		
	}
	
	//예약 삭제 버튼을 눌렀을 때 
	function bookDelete(){
		alert('준비중입니다.');
	}
	
	//조건검색 버튼을 눌렀을 때 
	
	function search(){
		alert('준비중입니다.');
	}
	
	
</script>

</body>
</html>

