<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/yeStyle.css">
<title>Insert title here</title>

</head>
<body>

<div id="m_mybookingForm">
    <form action="" method="post">
       <div class="contents">
         <div class="ctnMypage ctnMypageRsv">
            <div class="headTit">
            <h2 class="tit">내 예약내역</h2>
            </div>
            
            <c:if test="${bookCount == 0}">
               <tr >
                  <td colspan="2">
                     <div class="dashboard_li_empty">
                        <i class="fas fa-exclamation-triangle"></i><br>
                        <strong>${mbdto.name }</strong> 님의 예약내역이 없습니다.
                     </div>
                  </td>
               </tr>
            </c:if>
            
            <c:if test="${bookCount !=0}">
            <div class="rsvRoom">
               <div class="rsvCate">
               
                  <div class="num">
                     총 <strong>${bookCount}</strong> 개의 예약 정보가 있습니다
                  </div>
               </div>
<!--             <div class="msg">최근 3개월 이내의 예약정보를 확인하실 수 있습니다.</div> -->
               
               <div class="form_group"></div>
            </div>
<!--             <div class="rsvInfoBox">
               <div class="rInfoA">
               
               </div>
            </div> -->
            
            
   <br>         

   <div class="dashboard_div">
      <div class="admin_title_div">
         <div class="admin_title_text">
            예약내역
         </div>
      </div>
         <div class="dashboard_div_table">
            <ul>
               <c:forEach items="${list}" var="dto">
                  <li>
                     <div onClick="location.href='m_bookinglistDetail.do?book_num=${dto.book_num}'">
                     <div class="dashboard_li_div2">
                        <div class="booklist_div">
                           <span class="list_hotel_local">${dto.hotel_local }점</span>
                           <span class="list_room_local color2">${dto.room_local}호 &nbsp;</span>
                           <span>
                              <span class="list_hotel_local"><i class='fas fa-user color1'></i>&nbsp;${dto.head_count }&nbsp;</span>
                              
                              <c:if test="${dto.add_bed > 0}">
                                 <span class="glyphicon glyphicon-bed color6"></span>&nbsp;
                              </c:if>
                              
                              <c:if test="${dto.breakfast_count >0 }">
                                 <i class='fas fa-utensils color7' ></i>
                              </c:if>
                           </span>&nbsp;&nbsp;
                           <%-- <span class="list_book_day color3"><fmt:formatDate value="${dto.book_day }" pattern="yyyy-MM-dd HH:mm"/></span> --%>
                        </div>
                        
<%--                         <div class="booklist_div">
                            <span class="list_name">${dto.name }님</span>
                           <span class="list_id">
                              <c:if test="${dto.id != 'nc_id' }"> (${dto.id })</c:if>
                              <c:if test="${dto.id == 'nc_id' }"> (비회원예약)</c:if>
                           </span>&nbsp;&nbsp;
                           <span class="list_book_day color3"><fmt:formatDate value="${dto.book_day }" pattern="yyyy-MM-dd HH:mm"/></span>
                        </div> --%>
                        
                        <div class="booklist_div">
                           <span class="checkday"><i class="far fa-calendar-check"></i></span>&nbsp;&nbsp;&nbsp;
                           <span class="list_check_in_out color4">
                              <fmt:formatDate value="${dto.check_in }" pattern="MM / dd"/>
                               -
                               <fmt:formatDate value="${dto.check_out }" pattern="MM / dd "/></span>
                              <%-- <span class="list_status">(${book_status })</span> --%>
                           &nbsp; 
                            <div>
                              <c:if test="${abdto.book_status==0 }">예약대기</c:if>
                              <c:if test="${abdto.book_status==1 }">예약접수</c:if>
                              <c:if test="${abdto.book_status==2 }">숙박중</c:if>
                              <c:if test="${abdto.book_status==3 }">지난예약</c:if>
                              <c:if test="${abdto.book_status==5 }">취소예약</c:if>
                            </div>
                        </div>
                        
                     </div>
                     </div>
                  </li>   
               </c:forEach>
            </ul>
      </div>   
   </div>
   </c:if>
         </div>
      </div>
   </form>
</div> 

</body>
</html>
