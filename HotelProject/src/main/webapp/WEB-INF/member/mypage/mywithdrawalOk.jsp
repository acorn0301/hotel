<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<link rel="stylesheet" href="css/jhStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="home.do" method="post">
<div class="withdrawalForm">
<br>

   <div class="dashboard_li_empty">
      <i class="fas fa-check-square"></i><br>
      회원 탈퇴가 완료되었습니다<br>
      회원님의 정보가 정상적으로 삭제되었습니다
      <br>
   </div>

</div>

<div class="btncenter">
   <input type="submit" value="메인으로" id="wdok">
</div>
</form>
</body>
</html>
