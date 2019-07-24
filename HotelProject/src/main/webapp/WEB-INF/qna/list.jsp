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
</head>
<body>

<script>
	function getContent(board_num, pageNum, fromWhere, category, board_status){
		
		location.href="qnacontent.do?board_num=" +board_num + "&pageNum=" + pageNum + "&fromWhere=" + fromWhere + "&category=" + category + "&board_status=" + board_status; 
	}

</script>

<br> 

<div class="qna_body">
<div class="qna_body_title_div">
	<div class="qna_title_text">문의게시판</div>
</div>

<c:if test="${fromWhere == 'admin' }">

	<div class="">
			<select class="selectbox dashboard_selectbox" name="" id="category_select">
				<option value="all">전체문의</option>
				<option value="일반">일반문의</option>
				<option value="예약">예약문의</option>
				<option value="객실">객실문의</option>
				<option value="가격">가격문의</option>
				<option value="환불">환불문의</option>
				<option value="기타">기타문의</option>
				<option value="완료">완료문의</option>
			</select>
	</div>
</c:if>


<table class="qnatable">

	<c:if test="${size==0 }">
		<tr >
			<td colspan="3">
				<div class="dashboard_li_empty">
						<i class="fas fa-exclamation-triangle"></i><br>
								조건에 해당하는 글이 없습니다.
				</div>
			</td>
		</tr>
	</c:if>
	
	
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr class="tr1" onclick="getContent(${dto.board_num},${currentPage },'${fromWhere }', '${category }', ${board_status })">
			<td class="td_category" rowspan="2">
					<span class="span_category">[${dto.category }]</span>
			</td>
			<td class="td_subject">${dto.subject }</td>						
			<td class="td_reply" rowspan="2">
				<span class="text_reply_num">${dto.replyCount }</span><br><span class="text_reply">댓글</span>
			</td>
			
		</tr>
		<tr class="tr2">
			
			<td  class="td_etc" colspan="2">${dto.writer } &nbsp;&nbsp;&nbsp; ${dto.simpletime } &nbsp;&nbsp;<i class="fas fa-eye"></i>&nbsp; ${dto.readcount}  </td> 	

			<%-- <td>
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-warning" onclick="location.href='updateform.do?num=${dto.board_num}&pageNum=${currentPage }'">수정</button>
					<button type="button" class="btn btn-sm btn-danger" onclick="location.href='stu/delete.do?num=${dto.board_num}&pageNum=${currentPage }'">삭제</button>
				</div>
			</td> --%>
		</tr>
	</c:forEach>
</table>




<!-- 페이징 처리 -->
<div class="text-center">
	<ul class="pagination">
		<c:if test="${startPage > 1 }">
			<li><a href="qnalist.do?pageNum=${1}">처음으로</a>
		</c:if>
		<c:if test="${startPage > 1 }">
			<li><a href="qnalist.do?pageNum=${startPage-1 }"><-</a>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}" varStatus="i">
			<c:if test="${pp==currentPage }">
				<li><a style="color:red" href="qnalist.do?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<c:if test="${pp!=currentPage }">
				<li><a href="qnalist.do?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage}">
			<li><a href="qnalist.do?pageNum=${endPage+1}">-></a>
		</c:if>
		<c:if test="${endPage < totalPage }">
			<li><a href="qnalist.do?pageNum=${totalPage}">끝으로</a>
		</c:if>
	</ul>
</div>
<!-- 페이징 끝 -->

<!-- 글쓰기 버튼 시작-->
<c:if test="${fromWhere != 'admin' }">
	<div class="qna_write_btn_div">
		<a href="qnaform.do?pageNum=${currentPage }">
			<img src="images/icon/writeicon.svg">
			
		</a>
	</div>
</c:if>
<!-- 글쓰기 버튼 끝 -->

 </div>
 <input type="hidden" id="hiddenCategory" value="${category }">
 
<script>

	//category 값으로 상단 셀렉트의 selected 값을 변경시켜주자 
	let category = $("#hiddenCategory").val();
	$("#category_select").val(category).prop("selected", true);

	
	//셀렉트 박스 변경시 조건에 맞는 문의내역을 다시 가져와야 한다.
	$("#category_select").change(function(){
		let category = $("#category_select:selected").val();
		location.href="qnalist.do?category=" + category + "&fromWhere=admin&board_status=0" ;
	})


</script> 
 
 
</body>
</html>

