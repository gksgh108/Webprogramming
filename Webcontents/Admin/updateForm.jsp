<%@page import="javax.swing.text.Document"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="javax.xml.crypto.dsig.spec.ExcC14NParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Darle - 제품정보수정</title>
<link href="inquirystyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/team_file/js/rollover.js"></script>
</head>

<body onLoad="MM_preloadImages('/team_file/image/facebook_01-02.jpg','/team_file/image/instagram_02-05.jpg','/team_file/image/youtube_03.jpg')">
<div class="wrap">
  <div class="page_header">
    <div class="user_menu">
    <%
		String login = (String) session.getAttribute("LOGINID");
		if (login == null) {
	%>
    <a href="/team_file/Login/loginForm.jsp">LOGIN</a>&nbsp;
	<a href="/team_file/SignUp/signUpForm.jsp">JOIN US</a>&nbsp; 
    <a href="/team_file/Cart/cart.jsp">CART</a>&nbsp; 
    <a href="/team_file/Order/orderlist.jsp">ORDER</a> |
    <strong><a href="/team_file/MyPage/myPage.jsp">MY PAGE</a></strong>
    <%
		} else if(login.equals("admin")) {
	%>
	<a href="/team_file/Login/logout.jsp">LOGOUT</a>&nbsp;
	<a href="/team_file/Modify/modifyForm.jsp?uid=<%=login %>">MODIFY</a>&nbsp; 
    <a href="/team_file/Cart/cart.jsp">CART</a>&nbsp; 
    <a href="/team_file/Order/orderlist.jsp">ORDER</a> |
    <strong><a href="/team_file/MyPage/myPage.jsp">MY PAGE</a></strong>&nbsp;
    <strong><a href="/team_file/Admin/list.jsp">상품관리</a></strong> 
    <%
		}else{
	%>
	<a href="/team_file/Login/logout.jsp">LOGOUT</a>&nbsp;
	<a href="/team_file/Modify/modifyForm.jsp?uid=<%=login %>">MODIFY</a>&nbsp; 
    <a href="/team_file/Cart/cart.jsp">CART</a>&nbsp; 
    <a href="/team_file/Order/orderlist.jsp">ORDER</a> |
    <strong><a href="/team_file/MyPage/myPage.jsp">MY PAGE</a></strong>
    <%} %>
    </div>
    
    <div class="page_menu">
    <a href="/team_file/Notice/noticeboard.jsp">공지사항</a>&nbsp;
    <a href="#">이벤트</a>&nbsp;
    <a href="/team_file/Inquiry/inquiryboard.jsp">상품문의</a>&nbsp;
    <a href="/team_file/Review/review.jsp">상품후기</a>
    </div>
  </div>
  <div class="logo_header">
  <div class="logo"><a href="/team_file/Main/main.jsp"><img src="/team_file/image/MainImage.jpg"></img></a></div>
    <div id="sns">
    <a href="https://ko-kr.facebook.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/facebook','','/team_file/image/facebook_01-02.jpg',1)"><img src="/team_file/image/youtube_01.jpg" width="40" height="40" id="facebook"></a>
    <a href="https://www.instagram.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/instagram','','/team_file/image/instagram_02-05.jpg',1)"><img src="/team_file/image/youtube_02.jpg" width="42" height="40" id="instagram"></a>
    <a href="https://www.youtube.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/youtube','','/team_file/image/youtube_03.jpg',1)"><img src="/team_file/image/instagram_02-03.jpg" width="39" height="40" id="youtube"></a></div>
    
  </div>
  <div class="menu_header">
    <div id="menu">
					<ul>
						<li><a href="/team_file/Category/category.jsp">ALL</a></li>
						<li><a href="/team_file/Category/category.jsp?category=outer">아우터</a>
							<ul>
								<li><a href="outer.jsp?menu=아우터&menu_detail=코트">코트</a></li>
								<li><a href="outer.jsp?menu=아우터&menu_detail=자켓/점퍼">자켓/점퍼</a></li>
								<li><a href="outer.jsp?menu=아우터&menu_detail=가디건">가디건</a></li>
							</ul></li>
						<li><a href="/team_file/Category/category.jsp?category=top">상의</a>
							<ul>
								<li><a href="outer.jsp?menu=상의&menu_detail=니트">니트</a></li>
								<li><a href="outer.jsp?menu=상의&menu_detail=긴팔티">긴팔티</a></li>
								<li><a href="outer.jsp?menu=상의&menu_detail=맨투맨/후드티">맨투맨/후드티</a></li>
							</ul></li>
						<li><a href="/team_file/Category/category.jsp?category=shirts">셔츠</a>
							<ul>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=무지">무지</a></li>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=체크">체크</a></li>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=스트라이프/패턴">스트라이프/패턴</a></li>
							</ul></li>
						<li><a href="/team_file/Category/category.jsp?category=suit">수트</a>
							<ul>
								<li><a href="outer.jsp?menu=수트&menu_detail=SUIT">SUIT</a></li>
							</ul></li>
						<li><a href="/team_file/Category/category.jsp?category=bottom">하의</a>
							<ul>
								<li><a href="outer.jsp?menu=하의&menu_detail=슬랙스">슬랙스</a></li>
								<li><a href="outer.jsp?menu=하의&menu_detail=데님">데님</a></li>
								<li><a href="outer.jsp?menu=하의&menu_detail=면팬츠">면팬츠</a></li>
							</ul></li>
						<li><a href="/team_file/Category/category.jsp?category=training">트레이닝복</a></li>
					</ul>
				</div>
  </div>
    <%
  	Connection conn = ConnectionProvider.getConnection();
	Product prod = null;
	int pid = Integer.parseInt(request.getParameter("pid"));
	
	try{
  		ProductDao prodDao = new ProductDao();
		prod = prodDao.selectById(conn, pid);
  	}catch(SQLException e){}
  	finally{
  		JdbcUtil.close(conn);
	}
  	if(prod != null){
	%>       
	
	
    
  <div id="detail">
<div class="updateFrm" style="text-align: center; margin-left:800px; margin-top: 100px; margin-bottom: 100px;">
        <c:set var="p" value="<%=prod %>"/>
                  <form action="/team_file/Admin/update.jsp" method="post" enctype="multipart/form-data" name="form1">
                    <input type="hidden" name="pid" value="${p.pid}">
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                      <tr><th></th>
                      <td class="updateImg" colspan="2" align="center"><img src="/team_file/image/${p.category }/${p.pimage}/${p.pimage}_1.jpg" width="500" height="500"></td></tr>
                      <tr>
                        <th><label for="namefield">상 품 명</label></th>
                        <td>
                        <input name="namefield" type="text" value="${p.pname }"></td>
                      </tr>
                      <tr>
                        <th><label for="pricefield">가 격</label></th>
                        <td>
                        <input name="pricefield" type="text" value="${p.price }"></td>
                      </tr>
                      <tr>
                        <th><label for="colorfield">색 상</label></th>
                        <td>
                        <input name="colorfield" type="text" value="${p.pcolor }"></td>
                      </tr>
                      <tr>
                        <th><label for="amountfield">수 량</label></th>
                        <td>
                        <input name="amountfield" type="text" value="${p.amount }"></td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" align="right" class="btnstyle">
                        <input type="submit" name="ok" id="ok" value="확인">
                        <input type="button" name="cancel1" id="cancel1" value="취소" onclick="cancan()"></td>
                      </tr>
                    </table>
                  </form>
         <%} %>
         
	</div>
</div>

  <div class="empty"></div>
  <div class="company_menu">
  <div class="company">
    <a href="#">회사소개 </a> &nbsp; | &nbsp;
    <a href="/team_file/agreement.jsp">이용약관 </a>&nbsp; | &nbsp;
    <a href="/team_file/privacy.jsp">개인정보처리방침 </a>&nbsp; | &nbsp;
    <a href="/team_file/Inquiry/inquiryboard.jsp">상품문의 </a>&nbsp; | &nbsp;
    <a href="/team_file/Review/review.jsp">상품후기</a>
  </div>
    <div class="sns"> 
     <a href="https://ko-kr.facebook.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/facebook2','','/team_file/image/facebook_01-02.jpg',1)"><img src="/team_file/image/youtube_01.jpg" width="40" height="40" id="facebook2"></a>
     <a href="https://www.instagram.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/instagram2','','/team_file/image/instagram_02-05.jpg',1)"><img src="/team_file/image/youtube_02.jpg" width="42" height="40" id="instagram2"></a>
     <a href="https://www.youtube.com/" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/team_file/image/youtube2','','/team_file/image/youtube_03.jpg',1)"><img src="/team_file/image/instagram_02-03.jpg" width="39" height="40" id="youtube2"></a>
      </div>
  </div>
  <div class="info">
    <div class="footer_ban2">
	  <h2>CUSTOMER CENTER</h2>
            <h1>
            ☎ 01091589646 
            </h1>
            <p>평일 오전 10:00 ~ 오후 6:00</p>
            <p> 점심시간 오후 12:00 ~ 오후 1:00</p>
            <p> 토 / 일 / 공휴일 휴무 </p>
	</div>
			<div class="footer_ban">
			  <h2>ACCOUNT INFO</h2>
			  <p> 하나 291-910344-99807			</p>
			  <p>예금주: 다를(김한호) </p>
			</div>
			<div class="footer_ban">
			  <h2>FAVORITE MENU</h2>
			  <p> <a href="/team_file/Login/loginForm.jsp">로그인</a> / <a href="/team_file/SignUp/signUpForm.jsp">회원가입</a></p>
			  <p><a href="#">관심상품</a></p>
			  <p><a href="/team_file/Cart/cart.jsp">장바구니</a></p>
			  <p><a href="#">주문조회</a></p>
			  <p><a href="/team_file/MyPage/myPage.jsp">마이페이지</a></p>
			</div>
			<div class="footer_ban">
			  <h2>RETURN / EXCHANGE</h2>
			  <p> 시흥시 산기대학로 237 공학관 D동 401호</p>
			  <p>자세한 교환·반품절차 안내는 문의란 및 <a href="#">공지사항</a>을 참고해주세요 </p>
			</div>
  </div>
  <div class="info2">
    <div class="company_info">
      <p>상호 : 다를 대표 : 김한호, 오진수, 전형서 사업자 등록번호 : 413-19-01037 [사업자정보확인]</p>
      <p>주소 : 15073 경기도 시흥시 정왕동 산기대학로 공학관 D동 4층 401호 대표전화 : 01091589646</p>
      <p>통신판매업 신고 : 2021-고양덕양구-1707 개인정보관리책임자 : 김한호 (gksgh108@tukorea.ac.kr)</p>
      <p>&nbsp;</p>
      <p>COPYRIGHT © <strong>d'Arles</strong> ALL RIGHTS RESERVED. HOSTING CAFE24DESIGNED By DFLOOR</p>
    </div>
    <div class="purchase_info">
    <a href="https://www.inicis.com/"><img src="/team_file/image/아랫부분_08_01.jpg" width="390" height="138"></a>
    <a href="#"><img src="/team_file/image/아랫부분_08_02.jpg" width="142" height="96"></a>
    <a href="https://www.ftc.go.kr/"><img src="/team_file/image/아랫부분_08_03.jpg" width="130" height="96"></a><a href="#"><img src="/team_file/image/아랫부분_08_04.jpg" width="113" height="96"></a></div>
  </div>
</div>


<script type="text/javascript">
	function cancan(){
		var cancel = confirm("상품 정보 수정을 취소하시겠습니까?");
    	if(cancel)	
    		location.href="/team_file/Admin/list.jsp";
    	else
    		history.go(-1);
    	
    };
</script>
</body>
</html>