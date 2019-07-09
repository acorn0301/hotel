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
<!-- <script src="js/hsScript.js"></script> -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
</head>
<body>
<script>
function openModal(title,img,desc,menu_num){
		
	var qty = 1;
	   
	$(".modalTitle").text(title);
 	$(".modalImg").attr("src",img);
	$(".modalDesc").text(desc);
	
 	$("#qty").val(qty);
 	
 	// 수량 - 버튼, 0 이하 선택 불가능
  	$(".minus").click(function(){
 		$("#qty").val(--qty);
 		console.log(qty);
 		if(qty < 1){
 			qty = 1;
 			$("#qty").val(qty);
 		} 
 		$(".modalCart").attr("onclick","location.href='insertcart.do?menu_num="+menu_num+"&qty="+qty+"'");
 		$(".modalOrder").attr("onclick","location.href='onecart.do?menu_num="+menu_num+"&qty="+qty+"'");
 	}); 
 	
 	// 수량 + 버튼, 10 이상 선택 불가능
  	$(".plus").click(function(){
 		$("#qty").val(++qty); 
 		console.log(qty);
 		if(qty > 10){ 
 			qty = 10;
 			$("#qty").val(qty);
 		}
 		$(".modalCart").attr("onclick","location.href='insertcart.do?menu_num="+menu_num+"&qty="+qty+"'");
 		$(".modalOrder").attr("onclick","location.href='onecart.do?menu_num="+menu_num+"&qty="+qty+"'");
 	});
 	
 	$(".modalCart").attr("onclick","location.href='insertcart.do?menu_num="+menu_num+"&qty="+qty+"'"); //+"&qty="+qty_val+"'"
 	$(".modalOrder").attr("onclick","location.href='onecart.do?menu_num="+menu_num+"&qty="+qty+"'");
}
</script>


<!-- 카테고리도 나중에는 for문 돌릴것임 -->

<!-- Hero -->
<%--    <section class="et-hero-tabs">
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="#tab-Breakfast">Breakfast</a>
      <a class="et-hero-tab" href="#tab-Specialties">Specialties</a>
      <a class="et-hero-tab" href="#tab-Bakery">Bakery</a>
	  <a class="et-hero-tab" href="#tab-Appetizers">Appetizers</a>
      <a class="et-hero-tab" href="#tab-Pastas">Pastas</a>
      <a class="et-hero-tab" href="#tab-Dessert">Dessert</a>
      <a class="et-hero-tab" href="#tab-Beverage">Beverage</a>
      <a class="et-hero-tab" href="#tab-Drink">Drink</a> 
      <div class="et-hero-tab-slider" ></div>
		<a class="et-hero-tab" href="cart.do"> <!-- 장바구니로 이동해야함 -->
		<img alt="장바구니" src="images/menu/icon.png" class="icon">
			<span class="badge">${cart_size}</span>
		</a>
   	</div>
  </section> --%>
  
 <div class="hyebody">
 <div class="qna_body_title_div">
	<div class="qna_title_text">룸서비스</div>
</div>
 
  
<a href="cart.do">
	<img alt="장바구니" src="images/menu/carticon.svg" class="icon">
</a>

<br>

<div class="container">
	<!-- Modal -->
		 <div class="center_div modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title modalTitle"></h4>
					</div>
					<div class="modal-body">
						<img class="modalImg" src="" width="100%">
							<br><br>
						<p class="modalDesc">
						
						</p>
					</div>
					<div class="modal-footer">
					<div class="center_div">

               <button type="button" class="button minus" onclick="">-</button> <!-- headCountFunction(-1) -->
             	  <input type="text" id="qty" class="form_control center inputQty" name="qty" value="" size="5">
               <button type="button" class="button plus" onclick="">+</button> <!-- headCountFunction(1) -->
               
					</div>
					<br>
					<div class="center_div">
					<button type="button" class="button modalOrder" data-dismiss="modal"
					onclick="">바로주문</button>&nbsp;&nbsp;
					<button type="button" class="button modalCart" data-dismiss="modal" >담기</button>	
						<br>			
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 


<!-- Main -->
<main class="et-main"> 
<section class="et-slide" id="tab-Breakfast">
  <div class="row">
  	<div class="admin_title_div">
		<div class="admin_title_text">&nbsp;&nbsp;Breakfast</div></div>
  		<c:forEach var="mndto" items="${list0}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
	    			<br>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>

<br><br><br><br><br><br>

 <section class="et-slide" id="tab-Specialties">
  <div class="row">
  		<c:forEach var="mndto" items="${list1}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
 
 <br><br><br><br><br><br>
 
 <section class="et-slide" id="tab-Bakery">
  <div class="row">
  		<c:forEach var="mndto" items="${list2}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>

<br><br><br><br><br><br>

 <section class="et-slide" id="tab-Appetizers">
  <div class="row">
  		<c:forEach var="mndto" items="${list3}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
 
 <br><br><br><br><br><br>

 
  <section class="et-slide" id="tab-Pastas">
  <div class="row">
  		<c:forEach var="mndto" items="${list4}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
 
 <br><br><br><br><br><br>
 
  <section class="et-slide" id="tab-Dessert">
  <div class="row">
  		<c:forEach var="mndto" items="${list5}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
 
 <br><br><br><br><br><br>
 
  <section class="et-slide" id="tab-Beverage">
  <div class="row">
  		<c:forEach var="mndto" items="${list6}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
 
 <br><br><br><br><br><br>
 
  <section class="et-slide" id="tab-Drink">
  <div class="row">
  		<c:forEach var="mndto" items="${list7}" varStatus="i">
    		<div class="col-xs-6">
    			<a href="#" data-toggle="modal" data-target="#myModal"
    			 onclick="openModal('${mndto.menu_name_eng}','${mndto.menu_img}','${mndto.menu_desc}','${mndto.menu_num}')">
	    			<img src="${mndto.menu_img}" class="img-responsive" width="99.9%" height="200">
	    			<br>
	    			<b>${mndto.menu_name_eng}</b>&nbsp;<i>${mndto.menu_price}</i>
    			</a>
    		</div>
    	</c:forEach>
  	</div>
 </section>
</main>

<br><br><br><br>

</div>
</body>
</html>

