<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hsStyle.css">
</head>
<body>
<div class="hyebody">
<div class="margin_div">
<h2 class="margin_h2">주문하기</h2>
<br>
<form action="ordercomplete.do">
	<table class="table">
		<c:set var="sum" value="0"/>
		<c:forEach var="mndto" items="${mnlist}" varStatus="i">
			<tr>
				<td>
					${i.count}
				</td>
				<td>
					<b>${mndto.menu_name_kor}</b>
				</td>
				<td>
					${mndto.qty}
					<!-- hidden -->
					<input type="hidden" name="cnt" value="${mndto.qty}">
				</td>
				<td>
					<i>${mndto.menu_price * mndto.qty}</i>
					<c:set var="sum" value="${sum + mndto.menu_price * mndto.qty}"/>
					<!-- hidden -->
					<%-- <input type="hidden" name="order_num" value="${maxOrderNum}"> --%>
					<input type="hidden" name="menu_num" value="${mndto.menu_num}">
				</td>
			</tr>
		</c:forEach>
	</table>
					<!-- room_order 데이터 테스트 -->
					<input type="hidden" name="member_num" value="${sessionScope.member_num}">
					<input type="hidden" name="room_status" value="접수">
					<input type="hidden" name="total_price" value="${sum}">
					
	<div class="totalPrice"><b>Total </b> <c:out value="${sum}"/> </div>
<br><br><br>
	<b>추가 요청사항</b> 
<br><br>
	<textarea  class="form-control" rows="5" name="memo" placeholder="룸서비스 이용시 요청 하실 사항이 있으시면 입력해 주십시오."></textarea>
		<br>
	<div class="center_div">
	<h4>이대로 주문하시겠습니까?</h4>
		<button type="button"
		 onClick="location.href='roomaservice.do'" class="room_btn1">더 추가하기</button>
		<button type="submit"
		 onClick="openAddrJeju()" class="room_btn2">주문하기</button>
	</div>
</form>
<br><br>
</div>
</div>
</body>
</html>