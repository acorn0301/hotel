<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yeStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="admin_body">
	<div class="headTit">
		<h2 class="tit">예약상세</h2>
	</div>

<div class="dashboard_div2">
	
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
				<td class="bookdetail_table_td"> ${abdto.book_status }</td>	
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
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">회원명</td>
				<td class="bookdetail_table_td"> ${abdto.name }(${abdto.id })</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">체크인</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${abdto.check_in }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">체크아웃</td>
				<td class="bookdetail_table_td"> <fmt:formatDate value="${abdto.check_out }" pattern="yyyy-MM-dd HH:mm"/></td>	
			</tr>
		</table>	
	</div>
	
	<div class="admin_title_div">
		<div class="admin_title_text">고객정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
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
		
		</table>	
	</div><br>
	
	<div class="mybookingbtn">
		<input type="submit" id="mybookingCancel" value="예약취소" onclick="">
		<input type="button" id="mybookinglist" value="목록가기" onclick="history.back()">
	</div><br>

</div>
</div>
</div>

</body>
</html>

