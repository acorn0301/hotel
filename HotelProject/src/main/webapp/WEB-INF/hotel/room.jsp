<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/hsStyle.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="hyebody">
<!-- 상단 메뉴바 -->
<div class="admin_subject_div">
	<div class="admin_subject_text">
		객실
	</div>
</div>

<!-- 스탠다드 내용 -->
<div class="admin_title_div_list_center">
	<div class="admin_title_text">
		스탠다드
	</div>
</div>
<div>
<a href="standard.do">
	<img alt="스탠다드룸" src="images/room/standard/9.jpg" class="imgallwidth">
	<br>
	<div class="list_left_div">객실크기 : 22.4㎡ <br>
		침대타입 : 더블, 트윈, 패밀리 트윈
	</div>
</a>
<br>
</div>
<br>

<!-- 디럭스 내용 -->
<div class="admin_title_div_list_center">
	<div class="admin_title_text">
		디럭스
	</div>
</div>
<div>
<a href="deluxe.do">
	<img alt="디럭스룸" src="images/room/deluxe/6.jpg" class="imgallwidth">
	<br>
	<div class="list_left_div">객실크기 : 22.4㎡ <br>
		침대타입 : 더블, 트윈
	</div>
</a>
<br>
</div>
<br>

<!-- 그랜드 내용 -->
<div class="admin_title_div_list_center">
	<div class="admin_title_text">
		그랜드
	</div>
</div>
<div>
<a href="grand.do">
	<img alt="그랜드룸" src="images/room/grand/17.jpg" class="imgallwidth">
	<br>
	<div class="list_left_div">객실크기 : 44.8㎡ <br>
		침대타입 : 더블
	</div>
</a>
<br>
</div>
<br>
</div>
</body>
</html>

