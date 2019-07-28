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
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
	
	<div class="deleteform_div">

		<div class="qna_body_title_div">
			<div class="qna_title_text">
				
				<div>게시글 삭제</div>
				<div class="clearBoth"></div>	
			</div>
		</div>
		
					
							<div class="dashboard_li_empty">
								<i class="fas fa-unlock-alt"></i><br>
								글 작성시 사용하신 비밀번호를 입력해주세요
							</div>
					
		
		
	
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
	</div>

</body>
</html>

