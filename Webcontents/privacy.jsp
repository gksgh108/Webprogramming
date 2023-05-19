<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.*,my.dao.*,my.model.*,java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Darle - 개인정보처리방침</title>

<link href="mainstyle.css" rel="stylesheet" type="text/css">
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
    	<a href="/team_file/Purchase/purchase.jsp">ORDER</a> |
    	<strong><a href="/team_file/MyPage/myPage.jsp">MY PAGE</a></strong>
    <%
		} else if(login.equals("admin")) {
	%>
		<a href="/team_file/Login/logout.jsp">LOGOUT</a>&nbsp;
		<a href="/team_file/Modify/modifyForm.jsp?uid=<%=login %>">MODIFY</a>&nbsp; 
    	<a href="/team_file/Cart/cart.jsp">CART</a>&nbsp; 
    	<a href="/team_file/Purchase/purchase.jsp">ORDER</a> |
    	<strong><a href="/team_file/MyPage/myPage.jsp">MY PAGE</a></strong>&nbsp;
    	<strong><a href="/team_file/Admin/list.jsp">상품관리</a></strong> 
    <%
		}else{
	%>
		<a href="/team_file/Login/logout.jsp">LOGOUT</a>&nbsp;
		<a href="/team_file/Modify/modifyForm.jsp?uid=<%=login %>">MODIFY</a>&nbsp; 
    	<a href="/team_file/Cart/cart.jsp">CART</a>&nbsp; 
    	<a href="/team_file/Purchase/purchase.jsp">ORDER</a> |
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

<div class="privacy" style="width: 1580px; height: auto; border: 3px solid #000; margin-left: 450px; margin-top: 50px; clear:both;">
 <p>(주)다를은 (이하 &quot;회사&quot;는) 고객님의 개인정보를 중요시하며, &quot;개인정보 보호법&quot; 등 관련 법령을 준수하고 있습니다.<br />
    회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
  <p>■ 수집하는 개인정보 항목 및 수집방법<br />
    가. 수집하는 개인정보의 항목<br />
    o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br />
    - 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br />
    - 서비스 신청시 : 주소, 결제 정보</p>
  <p>o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다.</p>
  <p>나. 수집방법<br />
    - 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집</p>
  <p>■ 개인정보의 수집 및 이용목적<br />
    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
    o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br />
    콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br />
    o 회원 관리<br />
    회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br />
    o 마케팅 및 광고에 활용<br />
    이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p>
  <p>■ 개인정보의 보유 및 이용기간<br />
    원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
  <p>가. 회사 내부방침에 의한 정보보유 사유<br />
    회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 5년간 회원의 정보를 보유할 수 있습니다.</p>
  <p>나. 관련 법령에 의한 정보 보유 사유<br />
    전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br />
    o 계약 또는 청약철회 등에 관한 기록<br />
    -보존이유 : 전자상거래등에서의소비자보호에관한법률<br />
    -보존기간 : 5년<br />
    o 대금 결제 및 재화 등의 공급에 관한 기록<br />
    -보존이유: 전자상거래등에서의소비자보호에관한법률<br />
    -보존기간 : 5년<br />
    o 소비자 불만 또는 분쟁처리에 관한 기록<br />
    -보존이유 : 전자상거래등에서의소비자보호에관한법률<br />
    -보존기간 : 3년<br />
    o 로그 기록<br />
    -보존이유: 통신비밀보호법<br />
    -보존기간 : 3개월</p>
  <p>■ 개인정보의 파기절차 및 방법<br />
    회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br />
    o 파기절차<br />
    회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.<br />
    별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br />
    o 파기방법<br />
    전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
  <p>■ 개인정보 제공<br />
    회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br />
    o 이용자들이 사전에 동의한 경우<br />
    o 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
  <p>■ 수집한 개인정보의 위탁<br />
    회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br />
    o 위탁 대상자 :cj대한통운<br />
    o 위탁업무 내용 : 택배 배송 업무</p>
  <p>o 위탁 대상자 :카카오페이 / 케이에스넷 / 네이버페이 / 페이레터 <br />
    o 위탁업무 내용 : 결제 대행 및 위탁  </p>
  <p>o 위탁 대상자 :<br />
    o 위탁업무 내용 : </p>
  <p><br />
    ■ 이용자 및 법정대리인의 권리와 그 행사방법<br />
    o 이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.<br />
    o 이용자들의 개인정보 조회,수정을 위해서는 &quot;개인정보변경&quot;(또는 &quot;회원정보수정&quot; 등)을 가입해지(동의철회)를 위해서는 &quot;회원탈퇴&quot;를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.<br />
    o 혹은 개인정보보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.<br />
    o 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.<br />
    o 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 &quot;회사가 수집하는 개인정보의 보유 및 이용기간&quot;에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
  <p>■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br />
    회사는 귀하의 정보를 수시로 저장하고 찾아내는 &quot;쿠키(cookie)&quot; 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.<br />
    회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.<br />
    o 쿠키 등 사용 목적<br />
    1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br />
    2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br />
    o 쿠키 설정 거부 방법<br />
    1. 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br />
    2. 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보<br />
    3. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</p>
  <p>■ 개인정보에 관한 민원서비스<br />
    회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.<br />
    o 개인정보보호담당자<br />
    성명 :김도아 <br />
    소속 :다를 <br />
    전화번호 :01075874814<br />
    이메일 : darles.official@gmail.com</p>
  <p>o 개인정보보호책임자</p>
  위와동일<br />
   <br />
  o 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.
  <p><br />
    o 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br />
    o 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br />
    개인정보침해신고센터 (privacy.kisa.or.kr / 국번 없이 118)<br />
    개인정보분쟁조정위원회 (kopico.go.kr / 1833-6972)<br />
    대검찰청 사이버수사과 (spo.go.kr / 지역번호+1301)<br />
    경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)</p>
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
