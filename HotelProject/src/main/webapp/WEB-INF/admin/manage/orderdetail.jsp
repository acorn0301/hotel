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
	<div class="qna_title_text">룸서비스 주문상세</div>
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
				<td class="bookdetail_table_td"> ${aodto.room_status }</td>	
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
	
		<table class="bookdetail_table">
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
		
		</table>	
	</div>
	
		
</div>
</div>
</div>

</body>
</html>

