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

function cancelChk(pageNum){
	
	var result  = confirm('글 작성을 취소하시겠습니까?');
	
	if(result){
		location.href="qnalist.do?pageNum=" + pageNum;
	}else{
		
	}
}
</script>

<form action="qnawrite.do" method="post">

	<div class="form_group">
		<select class="selectbox" name="category">
		
			<option value="일반">문의유형을 선택해주세요</option>
			<option value="예약">예약</option>
			<option value="가격">가격</option>
			<option value="환불">환불</option>
			<option value="기타">기타</option>
		</select>
	</div>
	<div class="form_group">
		<input type="text" name="subject" class="inputbox" id="subject" title="제목" placeholder="제목" required="required">
	</div>
	
	<!-- 비로그인 상태에 한해 작성자 란을 띄워준다. -->
	<c:if test="${sessionScope.member_num == null}">
		<div class="form_group">
			<input type="text" name="writer" class="inputbox" id="writer" title="작성자" placeholder="작성자" value="" required="required">
		</div>
		<div class="form_group">
			<input type="password" name="board_pass" class="inputbox" id="password" title="비밀번호" placeholder="비밀번호" value="" required="required">
		</div>
	</c:if>
	<!-- 로그인 회원의 경우 작성자란이 자동으로 이름으로 들어간다. -->	
	<c:if test="${sessionScope.member_num != null}">
		<input type="hidden" name="writer" value="${writer }">
	</c:if>
	
	
	<div class="textbox">
		<textarea name="content" id="content" class="blind" rows="15" cols="40"> </textarea>
	</div>
	
	<div class="btns_group"> 
	        <div class="btn_cell">
	        	<button class="btn btn-lg btn-default" onclick="cancelChk(${pageNum})" type="button">취소</button>
	        </div> 
	        <div class="btn_cell"> 
	        	<button class="btn btn-lg btn_submit" type="submit">등록</button>
	        </div> 
	</div>
	
	
	<!-- hidden 으로 보낼 내용 -->
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="board_img" value="">
	

</form>

</body>
</html>

