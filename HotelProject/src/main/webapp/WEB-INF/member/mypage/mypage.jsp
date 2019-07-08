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
</head>
<body>

<div id="mypageForm">
<form action="" method="post">
<div class="headTit">
	<h2 class="tit">마이페이지</h2>
	<div class="btnBack">
		<a href="#" onclick="history.back(); return false;">뒤로</a>
	</div>
</div>

<%-- <div>
${mbdto.name } 님의 정보
</div> --%>

<div class="linkBox">
	<ul class="linkLIst">
		<li class="first"><a href="bookingCheck.do">예약 확인/취소</a></li>
		<li><a href="roomaservice.do">룸서비스 주문내역</a></li>
		<li><a href="infoEdit.do">내 정보수정</a></li>
		<li><a href="qnalist.do">문의하기</a></li>			
		<li class="last"><a href="">회원탈퇴</a></li>
	</ul>
</div>

</form>
</div>
</body>
</html>

