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
<script src="js/hsScript.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
</head>
<body>

<script>
function openModal(title,img,desc,num){

	$(".modalTitle").text(title);
 	$(".modalImg").attr("src",img);
	$(".modalDesc").text(desc);
	$(".modalCart").attr("onclick","location.href='roomaservice.do?menu_num="+num+"'");
	$(".modalOrder").attr("onclick","location.href='cart.do?menu_num="+num+"'");
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
  
  <!-- onclick="isEmpty(${totalSize})"
  function isEmpty(totalSize){
	if(totalSize == 0){
		alert('메뉴를 담아주세요');
	}else{
		location.href='cart.do';
	}
}
<span class="badge">${totalSize}</span> -->
  
<a href="cart.do">
	<img alt="장바구니" src="images/menu/icon.png" class="icon">
</a>

<br><br><br><br>

<div class="container">
	<!-- Modal -->
		 <div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title modalTitle"></h4>
					</div>
					<div class="modal-body">
						<img class="modalImg" src="" width="100%">
						<p class="modalDesc">
						
						</p>
					</div>
					<div class="modal-footer">
				<button type="button" class="modalCart btn btn-default" data-dismiss="modal"
				onclick="">담기</button>
				<button type="button" class="modalOrder btn btn-default" data-dismiss="modal"
				onclick="">바로주문</button>
				</div>
			</div>
		</div>
	</div>
</div> 


<!-- Main -->
<main class="et-main"> 
<section class="et-slide" id="tab-Breakfast">
  <div class="row">
  		<c:forEach var="mndto" items="${list0}" varStatus="i">
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

</body>
</html>

