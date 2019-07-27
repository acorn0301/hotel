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
			<div>메뉴추가</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	<form action="adminMenuEdit.do" method="post" enctype="multipart/form-data">
	
	<div class="admin_title_div">
		<div class="admin_title_text">메뉴정보</div>
	</div>
	<div class="dashboard_div_table">
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td colspan="2" class="bookdetail_table_td td_for_selectbox">
					<img width="100%" src="<%=root %>/save/images/menu/${dto.menu_img }">
				</td>	
			</tr>
		
		
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">카테고리</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<select class="selectbox"  name="menu_type_num" id="menu_type_select">
						<c:forEach items="${list }" var="dto">
							<option value="${dto.menu_type_num}">${dto.menu_type }</option>
						</c:forEach>
					</select>
					
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">국문이름</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_name_kor" class="inputbox" id="menu_name_kor" title="메뉴명(국문)"  value="${dto.menu_name_kor }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">영문이름</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_name_eng" class="inputbox" id="menu_name_eng" title="메뉴명(한글)"  value="${dto.menu_name_eng }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴가격</td>
				<td class="bookdetail_table_td td_for_selectbox">
					<input type="text" name="menu_price" class="inputbox" id="menu_price" title="메뉴가격"  value="${dto.menu_price }" required="required">				
				</td>	
			</tr>
			
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴설명</td>
				<td class="bookdetail_table_td td_for_textarea">
					<textarea id="menu_desc" name="menu_desc" class="write_textarea admin_textarea" rows="1" cols="10" >${dto.menu_desc }</textarea>				
				</td>	
			</tr>
			
		
			
			
							
		</table>
		
		
	

	
	
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table last_table">
			
			<tr class="dashboard_tr_buttons twoBtns">
					<td colspan="2">
						<button onclick="history.back()">취소</button>				
						
						
						<button class="lastBtn" type="submit">확인</button>			
						
					</td>
				</tr>
		
		</table>
	</div>
	
		
</div>

	<!-- 히든으로 넘길것!! -->

	<input type="hidden" id="menu_type" name="menu_type" value="Breakfast">

</form>
</div>
</div>


<script>

	$("#menu_type_select").change( function(){
		let menu_type_num = $("#menu_type_select").val();
		console.log(menu_type_num);
		let menu_type_arr = ['Breakfast', 'Specialties', 'Bakery', 'Appetizers', 'Pastas', 'Dessert', 'Beverage', 'Drink'];
		
		let menu_type = menu_type_arr[menu_type_num];
		console.log(menu_type);
		$("#menu_type").val(menu_type);
	})
	
	
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
	});
				
			
</script>

</body>
</html>

