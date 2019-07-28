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
<link rel="stylesheet" href="css/jhStyle.css">
</head>
<body>
<div class="hyebody">
<div class="margin_div minus_margin_div">
<!-- <h2 class="margin_h2">주문완료</h2> -->


	  <!-- 상단 서비스 메뉴명 -->
 <div class="qna_body_title_div">
	<div class="qna_title_text">룸서비스</div></div>

<!-- 카테고리 별 상단 메뉴 -->
   	<div class="admin_title_div admin_title_div_order">
	<div class="sub_title_div">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문완료</div></div>

<br>
<%-- <div class="center_div">
<i class='fas fa-check' style='font-size:50px; color:#3a3125;'></i>
<br><br>
<b>${member_name}</b>님의 주문이 완료되었습니다.
</div> --%>

	
	<div class="dashboard_li_empty" style="margin-top:-20px">
		<i class='fas fa-check' ></i><br>
			주문이 완료되었습니다.
	</div>


<br>
<%-- <table class="table">
	<tr>
		<td colspan="3"><b>주문내역</b></td>
	</tr>
		<c:set var="sum" value="0"/>
	<c:forEach var="mndto" items="${onelist}">
	<tr>
		<td>${mndto.menu_name_kor}</td>
		<td>${qty}</td>
		<td><i>
			<fmt:formatNumber value="${mndto.menu_price}" pattern="#,##0"/> 원
			
			
			</i></td>
		<c:set var="sum" value="${sum+mndto.menu_price}"/>
	</tr>
	</c:forEach>
</table>
<br>
	<div class="totalPrice"><b>Total </b> <fmt:formatNumber value="${sum}" pattern="#,##0"/> 원</div>

 --%>
	<div class="complete_msg">
		약 <b>30분</b> 뒤 <b>${room_local}호</b>로 찾아가도록 하겠습니다. <br>
		이용해주셔서 감사합니다.
	</div>
<br>	
<div class="container" style="margin-top:20px">
<div class="row">
<div class="col-sm-offset-3 col-sm-6">
		<div class="center_div">
			<button type="button" class="null_cart_btn"
			onclick="location.href='home.do'">메인으로 돌아가기</button>
		</div>
</div></div></div>

<table class="table" style="margin-top:40px;">
	<tr>
		<td colspan="3"><b>${member_name }님의 주문내역</b></td>
	</tr>
		<c:set var="sum" value="0"/>
	<c:forEach var="mndto" items="${onelist}">
	<tr>
		<td>${mndto.menu_name_kor}</td>
		<td>${qty}</td>
		<td><i>
			<fmt:formatNumber value="${mndto.menu_price }" pattern="#,##0"/> 원
		</i></td>
		<c:set var="sum" value="${mndto.menu_price}"/>
	</tr>
	</c:forEach>
</table>

	<div class="totalPrice"><b>Total </b> <fmt:formatNumber value="${sum }" pattern="#,##0"/> 원 </div>


<br><br>
</div>
</div>
</body>
</html>

