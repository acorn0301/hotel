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
<h2 class="margin_h2">주문완료</h2>
<br>
<div class="center_div">
<i class='fas fa-check' style='font-size:50px; color:#3a3125;'></i>
<br><br>
<b>${member_name}</b>님의 주문이 완료되었습니다.
</div>
<br>
<table class="table">
	<tr>
		<td colspan="3"><b>주문내역</b></td>
	</tr>
		<c:set var="sum" value="0"/>
	<c:forEach var="mndto" items="${mnlist}">
	<tr>
		<td>${mndto.menu_name_kor}</td>
		<td>${mndto.qty}</td>
		<td><i>${mndto.menu_price * mndto.qty}</i></td>
		<c:set var="sum" value="${sum + mndto.menu_price * mndto.qty}"/>
	</tr>
	</c:forEach>
</table>
<br>
	<div class="totalPrice"><b>Total </b> <c:out value="${sum}"/> </div>

<br><br><br><br>

	<div class="complete_msg">
		약 <b>30분</b> 뒤 <b>${room_local}호</b>로 찾아가도록 하겠습니다. <br>
		이용해주셔서 감사합니다.
	</div>
<br>	
<div class="container">
<div class="row">
<div class="col-sm-offset-3 col-sm-6">
		<div class="center_div">
			<button type="button" class="null_cart_btn"
			onclick="location.href='home.do'">메인으로 돌아가기</button>
		</div>
</div></div></div>
<br><br>
</div>
</div>
</body>
</html>

