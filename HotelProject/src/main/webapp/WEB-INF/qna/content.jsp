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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<script>
	function toggleOptionLayer(){
		if($('.qna_option_layer').is(':hidden')){
			$('.qna_option_layer').show();		
		}else{
			$('.qna_option_layer').hide();
		}
	};
	
	function gotoDeleteForm(board_num, pageNum){
		
		location.href="qnadeleteform.do?board_num="+board_num+"&pageNum="+pageNum;
	}
	
	function gotoEditForm(board_num, pageNum){
		
		location.href="qnaeditform.do?board_num="+board_num+"&pageNum="+pageNum;
	}
</script>

<div id="qna_content_div">
	
	<!-- 제목 및 메뉴 부분 -->
	<div class="qna_title_div">
		<h2 class="qna_title">${qdto.subject }</h2>
		<div class="qna_writer_wrap">
			<div class="info">${qdto.writer }</div>
			<div class="info">
				<span class="info_date"><fmt:formatDate value="${qdto.writeday }" pattern="yyyy-MM-dd HH:mm"/></span>
				<span class="info_readcount">조회 ${qdto.readcount }</span>
			</div>
		</div>
		<div class="qna_aside_layer" id="" >
			<a class="btn_aside" onclick="toggleOptionLayer()"><span class="glyphicon glyphicon-option-vertical"></span></a>
			<div class="qna_option_layer">
				<ul>
					<li onclick="gotoEditForm(${qdto.board_num},${pageNum })">
						<a class="btn_aside_li">수정하기&nbsp;&nbsp;<i class="fa fa-edit"></i></a>
					</li>
					<li onclick="gotoDeleteForm(${qdto.board_num},${pageNum })">
						<a class="btn_aside_li">삭제하기&nbsp;&nbsp;<i class="fa fa-trash-o"></i></a>
					</li>					
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 본문 -->
	<div class="qna_post_content">
		<div>
			${qdto.content }
		</div>
	</div>
	
	<div class="qna_comment_area">
	...댓글 들어올 장소 
	</div>

</div>

</body>
</html>

