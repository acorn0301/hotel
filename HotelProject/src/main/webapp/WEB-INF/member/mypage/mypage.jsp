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

<div class="myinfo">
	<h3>[ ${mbdto.name} ] 님의 마이페이지</h3><br>
	<div>
		<img id="imgThumb" src="images/mypage/user_pic.jpg" width="100" height="100">
		<span class="mask"></span>
	</div>
</div>

<div>

</div>
<!-- 프로필 이미지 -->
<%-- <c:if test="${mbdto.imagename!='noImg' && mbdto.image=='yes'}">
	<img src="mypage/${mbdto.imagename}" style="max-width:400px;"><br>
</c:if>
<c:if test="${mbdto.imagename!='noImg' && mbdto.image=='no'}">
	<img src="images/mypage/user_pic.jpg" style="max-width:150px;"><br>
</c:if> --%>

<div class="linkBox">
	<ul class="linkLIst">
		<li class="first"><a href="bookingCheck.do">예약 확인/취소</a></li>
		<li><a href="roomaservice.do">룸서비스 주문내역</a></li>
		<li><a href="infoEdit.do">내 정보수정</a></li>
		<li><a href="qnalist.do">문의하기</a></li>			
		<li class="last"><a href="withdrawal.do">회원탈퇴</a></li>
	</ul>
</div>

</form>
</div>
</body>
</html>

