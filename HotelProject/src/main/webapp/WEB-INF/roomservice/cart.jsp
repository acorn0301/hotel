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
<script type="text/javascript">
	$(function(){
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
			console.log(menu_num);
			//,제거
			menu_num=menu_num.substring(10,menu_num.length-1);
			//,제거 확인하기
			console.log(menu_num);
			//컨트롤러 호출
			location.href="manycartdelete.do?menu_nums="+menu_num;
		});

		
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
		
	  		$(".delchk").click(function(){
 			chkcnt=$(".delchk");
 			selcnt=$(".delchk:checked");
 			if(cnkcnt.length==selcnt.length){
 				$(".chk-all").prop("checked","checked");
 			}else{
 				$(".chk-all").removeProp("checked");
 			}
 		});
	});
</script>
</head>
<body>

<!-- 장바구니에 아무것도 없을때 뜨는 페이지 -->
<c:if test="${mnlist == ''}">
<div class="row">
	<div class="center_div col-xs-4">
		<h4>장바구니가 비어 있습니다.</h4>
			<button type="button" class="btn btn-lg btn-default"
			onclick="location.href='home.do'">메인으로 돌아가기</button>
	</div>
</div>
</c:if>

<!-- 장바구니에  물건이 있을때 뜨는 페이지 -->
<c:if test="${mnlist != '' }">
<form action="orderform.do">
	<table class="table">
		<tr>
			<th><input type="checkbox" class="delchk" name="chk" checked="checked"></th>
			<th>상품</th>
			<th>수량</th>
			<th>가격</th>
			<th>&nbsp;</th>
		</tr>
			<c:forEach var="mndto" items="${mnlist}" varStatus="i">
				<tr>
					<td>
						<input type="checkbox" class="delchk" name="chk" menu_num="${mndto.menu_num}" checked="checked">
					</td>
					<td>
						<img alt="${mndto.menu_name_kor}" src="${mndto.menu_img}" name="menu_img"
						class="img-responsive" width="99.9%" height="50">
					</td>
					<td>
						${mndto.qty}
					</td>
					<td>
						<i>${mndto.menu_price*mndto.qty}</i>
					</td>
					<td>
						<!-- hidden -->
						<input type="hidden" name="menu_num" value="${mndto.menu_num}">
						<button type="button"
						class="btn btn-xs btn-default"
						onclick="location.href='cartdelete.do?menu_num=${mndto.menu_num}&qty=${mndto.qty}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<button type="button" class="btn btn-default btn-sm" id="btndel">선택삭제</button>   
					<button type="button" class="btn btn-default btn-sm" id="all">전체선택</button>
					<button type="submit" class="btn btn-default btn-sm">주문하기</button>
				</td>
			</tr>
	</table>
</form>
</c:if>

<br><br><br><br>

</body>
</html>

