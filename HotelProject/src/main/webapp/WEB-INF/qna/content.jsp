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
	
	function gotoList(pageNum){
		
		location.href="qnalist.do?pageNum="+pageNum;
	}
</script>

<div id="qna_content_div">
	
	<!-- 제목 및 메뉴 부분 -->
	<div class="qna_title_div">
		<div><span onclick="gotoList(${pageNum})"> < 목록으로</span></div>
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
		<div class="section_comment">
			<div class="section_commnet_top">
				<h4>댓글 ${replyTotalCount } ></h4>
			</div>
			<ul>
				<c:forEach items="${replylist }" var="qrdto">
					<li class="li_comment">
						<span><b>${qrdto.name}</b></span><br>
						<div class="li_comment_content"> ${qrdto.reply_content }</div>
						<span class="info_date"><fmt:formatDate value="${qrdto.reply_writeday }" pattern="yyyy-MM-dd HH:mm"/></span>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		
		
		
		<!-- 로그인 시에만 댓글 창이 열린다. -->
		<c:if test="${member_num != 'no' }">
			<div class="comment_content_wrap">
				<div class="comment_write_wrap">		
					<div class="comment_box_write">
						<form method="post" action="qnareplyinsert.do">
							<div class="comment_box_write_inner">
								<div class="comment_box_profile_area">
									${member_name }
								</div>
								<div class="comment_box_write_area">
									<div class="comment_box_write_inbox">
	                                   <textarea id="reply_content" name="reply_content" placeholder="댓글을 남겨보세요." class="comment_textarea" rows="3" cols="30" ></textarea>
	                                	<input type="hidden" name="board_num" value="${board_num }">
	                               		<input type="hidden" name="member_num" value="3">
	                               		<input type="hidden" name="pageNum" value="${pageNum }">
	                               		<!-- 일단 로그인기능이 없으니 member_num은 3으로 준다  -->
	                                </div>
								</div>
								<div class="comment_box_upload_area">
									<button type="submit" class="comment_btn_upload">등록</button>
								</div>					
							</div>
						</form>
					</div>
				</div>			
			</div>
	
		</c:if>
		
	</div>

</div>

</body>
</html>

