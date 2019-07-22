<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review write form</title>
<link rel="stylesheet" href="css/jhStyle.css">

</head>
<body>

<script>

function cancelChk(pageNum){
	
	var result  = confirm('글 작성을 취소하시겠습니까?');
	
	if(result){
		location.href="history.back()";
	}else{
		
	}
}

function fillStar(i, className){
	
	console.log(className);
	
	//선택된 별 만큼 채워주고, 나머지는 비워준다. 
	$("." + className + ">.stars_div>.stars:eq(" + i + ")").removeClass("far");
 	$("." + className + ">.stars_div>.stars:lt(" + i + ")").removeClass("far");
	$("." + className + ">.stars_div>.stars:eq(" + i + ")").addClass("fas");
 	$("." + className + ">.stars_div>.stars:lt(" + i + ")").addClass("fas");
 	$("." + className + ">.stars_div>.stars:gt(" + i + ")").removeClass("fas");	
 	$("." + className + ">.stars_div>.stars:gt(" + i + ")").addClass("far");

 	//선택된 별의 인덱스+1 이 실제 점수값으로 들어간다.
 	$("#" + className).val(i+1);
 	
 
}

</script>


<div class="qna_body">


<div class="qna_body_title_div">
	<div class="qna_title_text">리뷰남기기</div>
</div>


<form action="reviewwrite.do" method="post" enctype="multipart/form-data">


	<div class="admin_title_div">
		<div class="admin_title_text">별점을 남겨주세요</div>
	</div>

	<div class="form_group">
		<div class="review_stars_div">
			<div class="review_clean">청소 상태는 어땠나요?
				<div class="stars_div">
				<c:forEach begin="0" end="4" var="i">
					<i class="far fa-star stars" onclick="fillStar(${i}, 'review_clean')"></i>
				</c:forEach>
				</div>
				<div class="clearBoth"></div>
			</div>
			
			<div class="review_dining">식사는 만족스러웠나요?
				<div class="stars_div">
				<c:forEach begin="0" end="4" var="i">
					<i class="far fa-star stars" onclick="fillStar(${i}, 'review_dining')"></i>
				</c:forEach>
				</div>
				<div class="clearBoth"></div>
			</div>
			
			<div class="review_location">위치가 좋았나요?
				<div class="stars_div">
				<c:forEach begin="0" end="4" var="i">
					<i class="far fa-star stars" onclick="fillStar(${i}, 'review_location')"></i>
				</c:forEach>
				</div>
				<div class="clearBoth"></div>
			</div>
			
			<div class="review_service">직원들은 친절했나요?
				<div class="stars_div">
				<c:forEach begin="0" end="4" var="i">
					<i class="far fa-star stars" onclick="fillStar(${i}, 'review_service')"></i>
				</c:forEach>
				</div>
				<div class="clearBoth"></div>
			</div>
			
			<div class="review_price">가격은 합리적이었나요?
				<div class="stars_div li_last">
				<c:forEach begin="0" end="4" var="i">
					<i class="far fa-star stars" onclick="fillStar(${i}, 'review_price')"></i>
				</c:forEach>
				</div>
				<div class="clearBoth"></div>
			</div>
	
		</div>	
	</div>
	

	
	<div class="admin_title_div">
		<div class="admin_title_text">당신의 경험을 들려주세요</div>
	</div>
	
	<div class="textbox li_last">
		<textarea id="reply_content" name="review_comment" placeholder="내용을 입력하세요" class="write_textarea" rows="3" cols="30" required="required"></textarea>
		
	</div>
	
		<div class="admin_title_div">
		<div class="admin_title_text">멋진 사진을 공유하세요</div>
	</div>
	
	<div class="form_group">
		<input type="file" name="upfile" class="form-control myfileinput" required="required">
	</div>
	
	<div class="btns_group"> 
	        <div class="btn_cell">
	        	<button class="btn btn-lg btn-default" onclick="cancelChk()" type="button">취소</button>
	        </div> 
	        <div class="btn_cell"> 
	        	<button class="btn btn-lg btn_submit" type="submit">등록</button>
	        </div> 
	</div>
	
	
	<!-- hidden 으로 보낼 내용 -->
	<input type="hidden" name="member_num" value="${member_num }">
	<input type="hidden" name="book_num" value="${book_num }">
	<input type="hidden" name="review_clean" value="0" id="review_clean">
	<input type="hidden" name="review_dining" value="0" id="review_dining">
	<input type="hidden" name="review_location" value="0" id="review_location">
	<input type="hidden" name="review_service" value="0" id="review_service">
	<input type="hidden" name="review_price" value="0" id="review_price">


</form>

</div>
</body>
</html>

		