<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jhStyle.css">

</head>
<body>

	<script>

		function deleteThis(board_num,password,pageNum){
			
			if(password == $('#password').val()){
				location.href="qnadelete.do?board_num=" + board_num +"&pageNum=" + pageNum;
			}else{
				alert("비밀번호가 틀립니다.");
			}
		}
	
	</script>

	<h2>비밀번호 확인</h2>
	<div class="form_group">
	</div>
	<div class="form_group">
		<input type="password" name="password" class="inputbox" id="password" title="비밀번호" placeholder="비밀번호" value="">
	</div>
	
	<div class="btns_group"> 
	        <div class="btn_cell">
	        	<button class="btn btn-lg btn-default" onclick="history.back()" type="button">취소</button>
	        </div> 
	        <div class="btn_cell"> 
	        	<button class="btn btn-lg btn_submit" type="button" onclick="deleteThis(${board_num},'${password }',${pageNum })">삭제</button>
	        </div> 
	</div>
	

</body>
</html>

