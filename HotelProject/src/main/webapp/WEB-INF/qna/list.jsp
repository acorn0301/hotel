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

총 ${totalCount } 개의 글이 있습니다.

<script>
	function getContent(board_num,pageNum){
		
		location.href="qnacontent.do?board_num=" +board_num + "&pageNum=" + pageNum; 
	}

</script>

<br> 
<table class="qnatable">
	<caption>Q & A</caption>
	

	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr class="tr1" onclick="getContent(${dto.board_num},${currentPage })">
			<td class="td_category" rowspan="2"><a href="content.do?num=${dto.board_num}&pageNum=${currentPage}"><span class="span_category">[${dto.category }]</span></a></td>
			<td class="td_subject">${dto.subject }</td>						
			<td class="td_reply" rowspan="2">
				<span class="text_reply_num">${dto.replyCount }</span><br><span class="text_reply">댓글</span>
			</td>
			
		</tr>
		<tr class="tr2">
			
			<td  class="td_etc" colspan="2">${dto.writer } &nbsp;&nbsp;&nbsp; ${dto.simpletime } &nbsp;&nbsp;&nbsp; ${dto.readcount}  </td> 	

			<%-- <td>
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-warning" onclick="location.href='updateform.do?num=${dto.board_num}&pageNum=${currentPage }'">수정</button>
					<button type="button" class="btn btn-sm btn-danger" onclick="location.href='stu/delete.do?num=${dto.board_num}&pageNum=${currentPage }'">삭제</button>
				</div>
			</td> --%>
		</tr>
	</c:forEach>
</table>

<div>
	<a href="qnaform.do?pageNum=${currentPage }"><i class="fa fa-edit"></i></a>
</div>



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

 
</body>
</html>

