<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book edit form</title>
<link rel="stylesheet" href="css/jhStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<%
		String root=request.getContextPath();//프로젝트 루트 경로
%>
<div class="admin_body">

<div class="qna_body_title_div">
	<div class="qna_title_text">
			<div class="arrow_back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
			<div>메뉴수정</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	<form action="adminMenuEdit.do" method="post" >
	
	<div class="admin_title_div">
		<div class="admin_title_text">메뉴정보</div>
	</div>
	<div class="dashboard_div_table">
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td colspan="2" class="bookdetail_table_td td_for_selectbox">
					<img width="100%" src="<%=root %>/save/images/menu/${mndto.menu_img }">
				</td>	
			</tr>
		
		
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">카테고리</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select class="selectbox attr"  name="menu_type_num" id="menu_type_select">
						<c:forEach items="${list }" var="dto">
							<option value="${dto.menu_type_num}">${dto.menu_type }</option>
						</c:forEach>
					</select>
					
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">국문이름</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_name_kor" class="inputbox attr" id="menu_name_kor" title="메뉴명(국문)"  value="${mndto.menu_name_kor }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">영문이름</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_name_eng" class="inputbox attr" id="menu_name_eng" title="메뉴명(한글)"  value="${mndto.menu_name_eng }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴가격</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_price" class="inputbox attr" id="menu_price" title="메뉴가격"  value="${mndto.menu_price }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴설명</td>
				<td class="bookdetail_table_td td_for_textarea">
					<textarea id="menu_desc" name="menu_desc" class="write_textarea admin_textarea attr" rows="1" cols="10" >${mndto.menu_desc }</textarea>				
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">관리자메모</td>
				<td class="bookdetail_table_td td_for_textarea">
					<textarea id="log_meno" name="log_memo" class="write_textarea admin_textarea" rows="1" cols="10" > </textarea>				
				</td>	
			</tr>
			
		
			
			
							
		</table>
		
		
	

	
	
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			
			<tr class="dashboard_tr_buttons twoBtns">
					<td colspan="2">
						<button type="button" onclick="editCancel(${mndto.menu_num})">취소</button>									
						<button class="lastBtn" type="submit">확인</button>			
						
					</td>
				</tr>
		
		</table>
	</div>
	
		
</div>

	<!-- 히든으로 넘길것!! -->

	<input type="hidden" id="menu_type" name="menu_type" value="Breakfast">
	<input type="hidden" name="menu_num" value="${mndto.menu_num }">
	<input type="hidden" name="log_attr" id="log_attr" value="">

</form>
</div>
</div>


<script>

	let log_attr = []; 
	//attr 변경시마다 log_attr에 반영 
	
	$('.attr').change(function(){
		let attr = $(this).attr("name");
		if(log_attr.indexOf(attr) == -1){
			log_attr.push(attr);
			console.log("log_attr: " , log_attr);
		}
		$("#log_attr").val(log_attr.join(","));
	});

	//카테고리 초기화
	$("#menu_type_select").val(${mndto.menu_type_num}).prop("selected", true);

	

	$("#menu_type_select").change( function(){
		let menu_type_num = $("#menu_type_select").val();
		let menu_type_arr = ['Breakfast', 'Specialties', 'Bakery', 'Appetizers', 'Pastas', 'Dessert', 'Beverage', 'Drink'];
		
		let menu_type = menu_type_arr[menu_type_num];
		$("#menu_type").val(menu_type);
	});
	
	/* 
	//이미지 미리보기 처리
	$("#upfile").change(function(){
				if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				     	$(".select_img img").attr("src", data.target.result);
				     	console.log(data.target.result);
				    }
				    reader.readAsDataURL(this.files[0]);
				}
	}); */
	
	
	function editCancel(menu_num){
		console.log(menu_num);
		let chk = confirm('메뉴 수정을 취소하시겠습니까?');
		console.log("chk" , chk);
		if(chk){
			location.href="adminMenuListDetail.do?menu_num=" + menu_num;
		}
	}
				
			
</script>

</body>
</html>

