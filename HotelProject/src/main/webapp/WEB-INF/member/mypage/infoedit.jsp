<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

나의 정보를 수정할 수 있는 폼이 뜬다. 
완료 후 mypage.do 호출해서 mypage 메인으로 돌아가도록 해주자 

<h3>정보 수정</h3>
<div>
<form class="form-inline" action="mypage.do" method="post">
아이디
<input type="text" name="id" class="form-control" autofocus="autofocus" required="required" placeholder="아이디"><input type="button" value="중복확인" class="btn btn-sm btn-basic"><br><br>

비밀번호
<input type="password" name="pass" class="form-control" required="required" placeholder="비밀번호" ><br>

비밀번호 확인
<input type="password" name="passok" class="form-control" required="required" placeholder="비밀번호확인" ><br>

이름
<input type="text" name="name" class="form-control" value="dto.name"><br>

성별
<input type="radio" name="gender" class="form-control" checked="checked" value="남성">남성
<input type="radio" name="gender" class="form-control" value="여성">여성
<input type="radio" name="gender" class="form-control" value="비공개">비공개<br><br>

전화번호
<input type="text" name="tel" class="form-control" placeholder="하이픈(-) 없이 입력해주세요"><br>

생년월일
<input type="date" name="birth" class="form-control" ><br>

이메일
<input type="text" name="email" class="form-control" placeholder="acorn@email.com"><br>

<input type="submit" class="btn btn-l btn-default" value="수정하기">

</form>
</div>
</body>
</html>
