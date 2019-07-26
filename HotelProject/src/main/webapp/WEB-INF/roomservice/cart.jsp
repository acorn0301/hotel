<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hsStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script type="text/javascript">
	$(function(){
		//삭제시 체크한 넘버만 넘기기
 		 $("#btndel").click(function(){
			//체크박스 개수 얻기
			chkcnt=$(".delchk");
			console.log("체크박스 개수:"+chkcnt.length);
			selcnt=$(".delchk:checked");
			console.log("선택된 체크박스 개수:"+selcnt.length);
			//선택된 체크박스가 없을 경우 경고
			if(selcnt.length==0){
				alert("선택해주세요");
				return false;
			}
			
			var menu_num=""; //선택한 글에서 num을 얻어서 ,로 연결
			for(i=0;i<chkcnt.length;i++)
			{
				if(chkcnt[i].checked){
					var n=$(".delchk").eq(i).attr("menu_num");
					menu_num+=n+",";
				}	
			}
			//console.log(menu_num);
			//,제거
			menu_num=menu_num.substring(0,menu_num.length-1);
			//,제거 확인하기
			//console.log(menu_num);
			//컨트롤러 호출
			location.href="manycartdelete.do?menu_nums="+menu_num;
		});
		
 		 //주문시 체크한것들만 num 연결해서 넘기기
 		 $("#order").click(function(){
 			//체크박스 개수 얻기
 			chkcnt=$(".delchk");
 			console.log("체크박스 개수:"+chkcnt.length);
 			selcnt=$(".delchk:checked");
 			console.log("선택된 체크박스 개수:"+selcnt.length);
 			//선택된 체크박스가 없을 경우 경고
 			if(selcnt.length==0){
 				alert("선택해주세요");
 				return false;
 			}
 			
 			var menu_num=""; //선택한 글에서 num을 얻어서 ,로 연결
 			for(i=0;i<chkcnt.length;i++)
 			{
 				if(chkcnt[i].checked){
 					var n=$(".delchk").eq(i).attr("menu_num");
 					menu_num+=n+",";
 				}
 			}
 			//console.log(menu_num);
 			//,제거
 			menu_num=menu_num.substring(0,menu_num.length-1);
 			//,제거 확인하기
 			console.log(menu_num);
 			//컨트롤러 호출
 			location.href="orderform.do?menu_nums="+menu_num;
 		});
 		 
 		 //전체선택 클릭시
 		var alln = true;
 		$("#all").click(function(){
 			//let n=$("input[name=chk]");
 			//console.log(alln);
 			if(alln==true){
 				$("input[name=chk]").prop("checked","checked");
 				alln = false;
 			}else{
 				$("input[name=chk]").removeProp("checked");
 				alln = true;
 			}
 		});
 		 
 		//상단 체크박스 누르면 전체선택/해제 가능 및 전체선택이 되어야만 상단에 체크표시
 		$(".alldelchk").click(function(){
 			chkcnt=$(".delchk");
 			selcnt=$(".delchk:checked");
 			//console.log("체크박스 개수:"+chkcnt.length);
 			//console.log("선택된 체크박스 개수:"+selcnt.length);
 			if(chkcnt.length = selcnt.length){
 				$("input[name=chk]").removeProp("checked");
 			}else{
 				$("input[name=chk]").prop("checked","checked");
 			}
 		});
 		
 		//하위 체크박스 눌렀을때 상위 체크박스 검사 후 체크
 		$(".delchk").click(function(){
 			chkcnt=$(".delchk");
 			selcnt=$(".delchk:checked");
 			//console.log("체크박스 개수:"+chkcnt.length);
 			//console.log("선택된 체크박스 개수:"+selcnt.length);
 			if(chkcnt.length >= selcnt.length){
 				$(".alldelchk").prop("checked","checked");
 			}if(selcnt.length == 0){
 				$(".alldelchk").removeProp("checked");				
 			}
 		});
 		
	});
</script>
</head>
<body>
 <%
		String root=request.getContextPath();//프로젝트 루트 경로
%>
  

<!-- 장바구니에 아무것도 없을때 뜨는 페이지 -->
<c:if test="${mnlist == null}">
<div class="null_cart">
		<i class='fas fa-bullhorn' style='font-size:70px; color:#3a3125;'></i>
		<br><br>
		<h4><b>장바구니가 비어 있습니다.</b></h4> 
		<div class="container">
  		  <div class="row">
			<div class="col-sm-offset-3 col-sm-6">
				<button type="button" class="null_cart_btn"
				onclick="location.href='roomaservice.do'">목록으로 돌아가기</button>
			</div>
		</div>
	</div>
</div>
</c:if>

<!-- 장바구니에  물건이 있을때 뜨는 페이지 -->
<c:if test="${mnlist != null}">
	<table class="table">
	<c:set var="sum" value="0"/> <!-- 합계 구할 변수 -->
		<tr>
			<th width="2%"><input type="checkbox" class="alldelchk" name="chk" checked="checked"></th>
			<th width="16%">상품</th>
			<th width="16%">메뉴명</th>
			<th width="16%">수량</th>
			<th width="16%">가격</th>
			<th width="16%">삭제</th>
		</tr>
			<c:forEach var="mndto" items="${mnlist}" varStatus="i">
				<tr>
					<td>
						<input type="checkbox" class="delchk" name="chk" menu_num="${mndto.menu_num}" checked="checked">
					</td>
					<td>
						<img alt="${mndto.menu_name_kor}" src="<%=root %>/save/images/menu/${mndto.menu_img }" name="menu_img"
						class="img-responsive" width="100%" height="50">
					</td>
					<td>
						${mndto.menu_name_eng}
					</td>
					<td>
						${mndto.qty}
						<input type="hidden" class="qty" name="qty" qty="${mndto.qty}" value="${mndto.qty}">
					</td>
					<td>
						<fmt:formatNumber pattern=",000" value="${mndto.menu_price*mndto.qty}"/>
						<c:set var="sum" value="${sum+(mndto.menu_price*mndto.qty)}"/>
					</td>
					<td>
						<!-- hidden -->
						<input type="hidden" name="menu_num" value="${mndto.menu_num}">
						<button type="button"
						class="cart_sm_button"
						onclick="location.href='cartdelete.do?menu_num=${mndto.menu_num}&qty=${mndto.qty}'">x</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6"> 
					<div class="totalPrice"><b>Total </b> <fmt:formatNumber pattern=",000" value="${sum}"/> </div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<button type="button" class="cart_button" id="btndel">선택삭제</button>   
					<button type="button" class="cart_button" id="all">전체선택</button>
					<button type="button" class="cart_button" id="order">주문하기</button>
				</td>
			</tr>
	</table>
</c:if>
<br><br><br><br>
</body>
</html>

