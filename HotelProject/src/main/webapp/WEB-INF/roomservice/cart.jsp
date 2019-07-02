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
카트리스트: ${cart_list} <br>
카트사이즈: ${size} <br>
menu_num: ${menu_num} <br>

<!-- 장바구니에 아무것도 없을때 뜨는 페이지 -->
<c:if test="${menu_num == 0}">
	메뉴넘 000000000 장바구니 없음!!!
</c:if>

<!-- 장바구니에  물건이 있을때 뜨는 페이지 -->
<c:if test="${menu_num != 0 }">
<form action="orderform.do">
	<table class="table">
		<tr>
			<th>&nbsp;</th>
			<th>상품</th>
			<th>수량</th>
			<th>가격</th>
			<th>&nbsp;</th>
		</tr>
			<c:forEach var="mndto" items="${list}">
				<tr>
					<td>
						<input type="checkbox">
					</td>
					<td>
						<img alt="${mndto.menu_name_kor}" src="${mndto.menu_img}" name="menu_img"
						class="img-responsive" width="99.9%" height="50">
					</td>
					<td>
						<input type="text" size="3" value="1">
					</td>
					<td>
						<i>${mndto.menu_price}</i>
					</td>
					<td>
						<!-- hidden -->
						<input type="hidden" name="menu_num" value="${mndto.menu_num}">
						<button class="btn btn-xs btn-default">삭제</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<button type="submit" class="center_div btn btn-lg btn-default">주문하기</button>
				</td>
			</tr>
	</table>
</form>
</c:if>
</body>
</html>

