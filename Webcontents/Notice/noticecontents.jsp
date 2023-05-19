<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.*,my.dao.*,my.model.*,java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Darle - 공지사항</title>

<link href="noticestyle.css" rel="stylesheet" type="text/css">
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
						<li><a href="newpage.jsp?">NEW</a></li>
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
  <div class="main">
  <h3>공지사항</h3>
  <div class = "board_view">
  <table width="1580">
  	<tr>
    	<div class="tabletop">
    	<td width ="190">제목</td>
    	<td width = "1390">제목}</td>
        </div>
  	</tr>
  	<tr>
    	<td width ="190">작성자</td>
    	<td width = "1390">작성자명}</td>
  	</tr>
  	<tr>
    	<td width ="190">작성일 작성일}</td>
    	<td width = "1390">조회수 조회수}</td>
  	</tr>
  	<tr>
    	<td colspan="2"><textarea name="content" cols="70" rows="10" id="content"></textarea></td>
    	</tr>
</table>

    <div class = "bt_wrap">
    	<a href="noticeboard.jsp" class="on">목록</a>
    </div>
    <div class="comment">
            
                <div class="input">
                    <p><strong>댓글달기</strong></p>
                    <p>
                      <span class="">이름 : 
                      <input id="comment_name" name="comment_name" fw-filter="isFill" fw-label="댓글작성자" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  />
                      </span>비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" class="inputTypeText" value="" type="password"  />
                      
                    </p>
                    
              </div>
                <div class="view">
                    <textarea id="commentmain" name="comment" fw-filter="isFill" fw-label="댓글내용" fw-msg="" ></textarea>	<input name="comment" type="submit" id="comment" onclick="" value="확인">
                </div>
                <p></p>
                <p class="grade displaynone"></p>
                <p class="captcha ">
                                       <input id="captcha" name="captcha" fw-filter="isFill" fw-label="보안문자" fw-msg="" class="inputType" placeholder="보안문자를 입력해 주세요." value="" type="text"  />                    <span class="ec-base-help txtInfo">왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)</span>
                </p>
           
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

</body>
</html>
