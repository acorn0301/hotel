<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<link rel="stylesheet" href="css/jhStyle.css">
<script src="js/yeScript.js"></script>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="joincomplete">
<form class="form-inline" action="mypage.do" method="post">
<br>
<!-- h1><i class="fas fa-edit"></i></h1>
<h3>회원 수정이 완료되었습니다</h3><br> -->
<br><br><br>
	<div class="dashboard_li_empty">
		<i class="fas fa-edit"></i><br>
		회원정보 수정이 완료되었습니다
	</div>

<br>
<div>
<input type="submit" id="mypageGo" value="마이페이지 이동">
</div>
</form>
</div>
</body>
</html>
