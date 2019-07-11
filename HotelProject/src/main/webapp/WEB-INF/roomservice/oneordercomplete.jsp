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
<br>
<h2>주문완료</h2>
<br><br>
<div class="center_div">
<b>${member_name}</b>님의 주문이 완료되었습니다.
</div>
<br>
<table class="table">
	<tr>
		<td colspan="3"><b>주문내역</b></td>
	</tr>
		<c:set var="sum" value="0"/>
	<c:forEach var="mndto" items="${onelist}">
	<tr>
		<td>${mndto.menu_name_kor}</td>
		<td>${qty}</td>
		<td><i>${mndto.menu_price}</i></td>
		<c:set var="sum" value="${sum+mndto.menu_price}"/>
	</tr>
	</c:forEach>
</table>
<br>
	<div class="totalPrice"><b>Total </b> <c:out value="${sum}"/> </div>

<br><br><br>

	<div class="complete_msg">
		약 <b>30분</b> 뒤 <b>호수(*)</b>로 찾아가도록 하겠습니다. <br>
		이용해주셔서 감사합니다.
	</div>
<br>	
		<div class="center_div">
			<button type="button" class="btn btn-lg btn-default"
			onclick="location.href='home.do'">메인으로 돌아가기</button>
		</div>
<br><br>
</body>
</html>

