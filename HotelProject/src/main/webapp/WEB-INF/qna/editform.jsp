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

	function cancelChk(pageNum, board_num){
	
		var result  = confirm('글 수정을 취소하시겠습니까?');
		
		if(result){
			location.href="qnacontent.do?pageNum=" + pageNum + "&board_num=" + board_num + "&fromWhere=${fromWhere}&category=${category}&board_status=" + ${board_status};
		}else{
			
		}	
	};
	
	function check(f, password){
		if(password == $("#password").val()){
			return true;
		}else{		
			alert("비밀번호가 다릅니다.");
			return false;
		}
	}
</script>


<div class="qna_body">
<form action="qnaedit.do" method="post" onsubmit="return check(this,'${qdto.board_pass}')">

	<div class="form_group">
		<input type="text" name="subject" class="inputbox" id="subject" title="제목" placeholder="제목" value="${qdto.subject }" required="required">
	</div>


	<div class="form_group">
		<input type="password" name="board_pass" class="inputbox" id="password" title="비밀번호" placeholder="비밀번호를 입력하세요" required="required">
	</div>


	
	<div class="textbox">
		<textarea id="content" name="content" class="write_textarea" rows="3" cols="30" >${qdto.content }</textarea>
	</div>
	
	<div class="btns_group"> 
	        <div class="btn_cell">
	        	<button class="btn btn-lg btn-default" onclick="cancelChk(${pageNum},${qdto.board_num })" type="button">취소</button>
	        </div> 
	        <div class="btn_cell"> 
	        	<button class="btn btn-lg btn_submit" type="submit">수정</button>
	        </div> 
	</div>
	
	
	<!-- hidden 으로 보낼 내용 -->
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="board_num" value="${qdto.board_num }">
	<input type="hidden" name="board_img" value="${qdto.board_img }">
	<input type="hidden" name="fromWhere" value="${fromWhere}">
	<input type="hidden" name="category" value="${category}">
	<input type="hidden" name="board_status" value="${board_status}">
	
	

</form>

</div>
</body>
</html>

