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
<title>Darle - 상품 상세 정보</title>
<link href="detail.css" rel="stylesheet" type="text/css">
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
    <%
	int pid = Integer.parseInt(request.getParameter("pid"));
  	Connection conn = ConnectionProvider.getConnection();
	Product prod = null;
	List<Review> revlist = null;
	int revCount = 0;

	ArrayList<Product> viewlist = (ArrayList)session.getAttribute("viewlist");
	
	try{
  		ProductDao prodDao = new ProductDao();
  		ReviewDao revDao = new ReviewDao();
  		
  		prod = prodDao.selectById(conn, pid);
  		prodDao.updateFav(conn, pid);
  		revlist = revDao.selectLikePid(conn, pid);
  		revCount = revDao.selectRevCount(conn,pid);
  		
  	    if(viewlist==null) {
  	    	viewlist = new ArrayList<Product>();
  	    	session.setAttribute("viewlist", viewlist);
  	    }
  	    if(viewlist.size() == 0 || (viewlist.get(viewlist.size()-1).getPid() != pid)){
  	    	viewlist.add(prod);
  	    }
  	}catch(SQLException e){}
	 finally{
		JdbcUtil.close(conn);}
  	if(prod != null){
	%>
  
  <c:set var="p" value="<%=prod%>"/>
  <div id="detail">
	<div class="purchase_form">
    <div class="product_path">홈 > 남성의류 > ${p.category} </div>
    <div class="product_picture">
    <img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}_1.jpg" width="500" height="500">
    </div>
    
    <div class="product_purchase">
    <form action="" name="purchase" method="post">
      <br>${p.pname}<br><br>
      <img src="/team_file/image/color.PNG"><br><br><hr>
      <input type="hidden" id="sell_price" value="${p.price}">
      소비자가		<span style="float:right;">KRW ${p.price}원</span><br><hr>
      <div class="product_select" id="test">
      > 색상 선택
      <input type="button" name="black" value="블랙" onClick="show_menu1()">
      <input type="button" name="green" value="그린"onClick="show_menu2()">
<!--      <input type="button" name="green" value="그린"onClick="show_menu3()">
      <input type="button" name="green" value="그린"onClick="show_menu4()">
    	-->  
      </div>
      
      
      <hr><p>최소 주문수량 1개 이상</p><hr>
      <div class="option_select" style="display:block">
      
      	<div class="option_select_menu" style="display:none; margin-top:20px;" id="menu1"><strong>블랙</strong>
			<input type="text" id="amount1" value="0" style="width:30px; margin-left:50px;">
			<input type="button" name="add" value="+" onclick="plus1()">
			<input type="button" name="minus" value="-" onclick="minus1()">
			<input type="button" value="x" name="hide" style="float:right;" onclick="hide_menu1()">
			<span style="float: right; margin-right:10px;">원</span>
      		<input type="text" id="sum1" value="0" style="float: right; width: 50px; border: 0px solid #000;" readonly>
      	</div>
      
        <div class="option_select_menu" style="display:none; margin-top:20px;" id="menu2"><strong>그린</strong>
			<input type="text" id="amount2" value="0" style="width:30px; margin-left:50px;">
			<input type="button" name="add" value="+" onclick="plus2()">
			<input type="button" name="minus" value="-" onclick="minus2()">
			<input type="button" value="x" name="hide" style="float:right;" onclick="hide_menu2()">
			<span style="float: right; margin-right:10px;">원</span>
      		<input type="text" id="sum2" value="0" style="float: right; width: 50px; border: 0px solid #000;" readonly>
      	</div>
      	
      	<div class="option_select_menu" style="display:none; margin-top:20px;" id="menu3"><strong>${p.pcolor}</strong>
			<select name="amount3" style="width:100px; margin-left:50px;">
				<option value="0">수량 선택</option>
				<option value="1">1개</option>
				<option value="2">2개</option>
				<option value="3">3개</option>
				<option value="4">4개</option>
			</select>
			<input type="button" value="x" name="hide" style="float:right;" onclick="hide_menu3()">
      		<span style="float: right; margin-right:10px;">KRW ${p.price}원</span>
      	</div>
      	
      	<div class="option_select_menu" style="display:none; margin-top:20px;" id="menu4"><strong>${p.pcolor}</strong>
			<select name="amount4" style="width:100px; margin-left:50px;">
				<option value="0">수량 선택</option>
				<option value="1">1개</option>
				<option value="2">2개</option>
				<option value="3">3개</option>
				<option value="4">4개</option>
			</select>
			<input type="button" value="x" name="hide" style="float:right;" onclick="hide_menu4()">
      		<span style="float: right; margin-right:10px;">KRW ${p.price}원</span>
      	</div>
      	
    </div>

	<p style="float: right;">Total :  <input type="text" id="totalPrice" value="0" style="width:100px; border: 0px solid #000; text-align: right;" readonly>원</p>  
	<br><br><br><hr><br>
	<input type="button" id="buy_now" onclick="putPurchase(${p.pid})" value="바로구매">
	<input type="button" id="put_cart" value="장바구니" onclick="putcart(${p.pid})">

    </form>
    </div>
    
    </div>


<script type="text/javascript">
function show_menu1(){
	var show = document.getElementById("menu1");
	show.style.display = 'block';
}
function show_menu2(){
	var show = document.getElementById("menu2");
	show.style.display = 'block';
}
/*
function show_menu3(){
	var show = document.getElementById("menu3");
	show.style.display = 'block';
}
function show_menu4(){
	var show = document.getElementById("menu4");
	show.style.display = 'block';
}
*/

function hide_menu1(){
	var hide = document.getElementById("menu1");
	hide.style.display = 'none';
}
function hide_menu2(){
	var hide = document.getElementById("menu2");
	hide.style.display = 'none';
}
/*
function hide_menu3(){
	var hide = document.getElementById("menu3");
	hide.style.display = 'none';
}
function hide_menu4(){
	var hide = document.getElementById("menu4");
	hide.style.display = 'none';
}
*/

function putPurchase(pid){
	var amount = parseInt(purchase.amount1.value.trim()) + parseInt(purchase.amount2.value.trim()) + 
			parseInt(purchase.amount3.value.trim()) + parseInt(purchase.amount4.value.trim());
	var price = purchase.totalPrice.value.trim();
	if(amount != 0)
		location.href='/team_file/Purchase/purchase.jsp?pid='+pid+'&amount='+amount+'&price='+price;
	else{
		alert("최소구매수량은 1개 이상입니다.");
	}
}
function putcart(pid){
	   var amount = parseInt(purchase.amount1.value.trim()) + parseInt(purchase.amount2.value.trim()) + 
	      parseInt(purchase.amount3.value.trim()) + parseInt(purchase.amount4.value.trim());
	   var price = purchase.totalPrice.value.trim();
	   if(amount != 0){
	      var goCart = confirm("상품을 장바구니에 추가하였습니다!\n장바구니로 이동하시겠습니까?");
	      if(goCart){
	         location.href='/team_file/Cart/cart.jsp?pid='+pid+'&amount='+amount+'&price='+price;
	      }else{
	         window.open('/team_file/Cart/cart.jsp?pid='+pid+'&amount='+amount+'&price='+price);
	      }
	   }else{
	      alert("최소구매수량은 1개 이상입니다.");
	   }
	}



function plus1(){
	var amount1 = document.getElementById("amount1");
	var sum1 = document.getElementById("sum1");
	var sell_price = parseInt(purchase.sell_price.value.trim());
	var total = document.getElementById("totalPrice");
		
	amount1.value++;
	sum1.value= amount1.value*sell_price;
	total.value = parseInt(total.value) + sell_price;

}

function plus2(){
	var amount1 = document.getElementById("amount2");
	var sum1 = document.getElementById("sum2");
	var sell_price = parseInt(purchase.sell_price.value.trim());
	var total = document.getElementById("totalPrice");
	
	amount1.value++;
	sum1.value= amount1.value*sell_price;
	total.value = parseInt(total.value) + sell_price;
}


function minus1(){
	var amount1 = document.getElementById("amount1");
	var sum1 = document.getElementById("sum1");
	var sell_price = parseInt(purchase.sell_price.value.trim());
	var total = document.getElementById("totalPrice");	
	

	amount1.value--;
	if(amount1.value<0){
		amount1.value = 0;
	}else{
		total.value = parseInt(total.value) - sell_price;
	}
	sum1.value= amount1.value*sell_price;
	
}

function minus2(){
	var amount1 = document.getElementById("amount2");
	var sum1 = document.getElementById("sum2");
	var sell_price = parseInt(purchase.sell_price.value.trim());
	var total = document.getElementById("totalPrice");
			
	amount1.value--;
	if(amount1.value<0){
		amount1.value = 0;
	}else{
		total.value = parseInt(total.value) - sell_price;
	}
	sum1.value= amount1.value*sell_price;
}


</script>

	
<div class="product_info">

	<div id="picture_info">
	<div class="anchor_block" style="height: 123px;"></div>
	<div class="anchor_margin" style="height: 30px;"></div>
<table width="700" height="50" border="0" cellpadding="3" cellspacing="0" class="anchor_table" align="center">
  <tr>
    <td><a href="#detail">상품구매</a></td>
    <td><a href="#picture_info"><strong>상품상세정보</strong></a></td>
    <td><a href="#purchase_guide">구매가이드</a></td>
    <td><a href="#purchase_review">구매후기</a></td>
    <td><a href="#product_question">상품문의</a></td>
  </tr>
</table>
	<img src="/team_file/image/Waring.png">
	<img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}.jpg">
	<img src="/team_file/image/${p.pcolor}.jpg">
	<img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}_Color.jpg">
	<img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}_Comment.jpg">
	<img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}_1.jpg">
	<img src="/team_file/image/${p.category}/${p.pimage}/${p.pimage}_1.jpg">
	</div>
	
</div>
<%} %>

<div id="purchase_guide">
<div class="anchor_block" style="height: 123px;"></div>
<div class="anchor_margin" style="height: 30px;"></div>
<table width="700" height="50" border="0" cellpadding="3" cellspacing="0" class="anchor_table" align="center">
  <tr>
    <td><a href="#detail">상품구매</a></td>
    <td><a href="#picture_info">상품상세정보</a></td>
    <td><a href="#purchase_guide"><strong>구매가이드</strong></a></td>
    <td><a href="#purchase_review">구매후기</a></td>
    <td><a href="#product_question">상품문의</a></td>
  </tr>
</table>
<div id="guide_text">

<p>■  <strong>상품 결제정보</strong></p><hr>
      <p>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.      </p>
      <p> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.        <br>
        주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다. <br><br><br></p>

    <p>■  <strong>배송안내</strong></p><hr>
      - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
<br><br><br>

    <p>■  <strong>교환 및 반품안내</strong></p><hr>
      <p>교환 및 반품 주소       <br>
- [10557] 경기도 고양시 덕양구 세솔로 122-12 (삼송동) 1층 다를</p>
      <p>교환 및 반품이 가능한 경우<br>
- 상품을 공급 받으신 날로부터 7일이내        <br>
단 , 의류 택을 제거 하였거나 의류가 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.        <br>
하얀색 계열 의류나 늘어날 수 있는 니트류는 착용시 교환 반품 환불이 불가능 합니다.        </p>
      <p>교환 및 반품이 불가능한 경우
        <br>
        - 고객님의 책임 있는 사유로 상품이 멸실 혹은 훼손된 경우.<br>
- 의류 택을 제거 하였거나 의류가 훼손되어 상품가치가 상실된 경우
        <br>
        - 고객님이 의류를 착용하여 가치가 현저히 감소한 경우 (향수,냄새 등)<br>
- 시간의 경과에 의하여 재판매가 곤란할 정도로 가치가 현저히 감소한 경우
        <br>
        - 자세한 내용은 고객상담센터를 이용해 주시기 바랍니다. 전화 (01075874814) 카카오톡 @darles</p>
      <p><br> 
        ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
          <br>
        (색상 교환, 사이즈 교환 등 포함) <br><br><br></p>
</div>

</div> 



<div id="purchase_review">
<div class="anchor_block" style="height: 123px;"></div>
<div class="anchor_margin" style="height: 30px;"></div>
<table width="700" height="50" border="0" cellpadding="3" cellspacing="0" class="anchor_table" align="center">
  <tr>
    <td><a href="#detail">상품구매</a></td>
    <td><a href="#picture_info">상품상세정보</a></td>
    <td><a href="#purchase_guide">구매가이드</a></td>
    <td><a href="#purchase_review"><strong>구매후기</strong></a></td>
    <td><a href="#product_question">상품문의</a></td>
  </tr>
</table>
<br><br><br>
<p align="center" style="font-size: x-large; font-weight: bold;">상품후기</p>
<p align="center" style="font-size: large;">상품 사용후기입니다.</p>

    <% 	if(revCount != 0){ %>
    <c:forEach var="r" items="<%=revlist %>">
    <hr>
    <table width="1000" id="review_form" cellpadding="10">
		<tr>
			<th><strong> ${r.title} </strong><br><br> ${r.content} </th>
			<td><img src="/team_file/image/${r.star}stars.PNG" width="120" height="30"><br><br>${r.userId}</td>
		</tr>
	</table>
	</c:forEach>
		<hr>
	<%}	else {%>
		<div class = "empty_review"><br><p style="text-align: center; text-shadow: gray;">상품 리뷰가 존재하지 않습니다</p><br></div>
	<%} %>
	<div class="bt_wrap">
		<input type="button" id="write_review" value="리뷰작성" onclick='location.href="/team_file/Review/reviewCreate.jsp?pid=${p.pid}"'>
		<input type="button" id="all_review" value="모두보기" onclick='location.href="/team_file/Review/review.jsp"'>
	</div>
	
	
	<div class="numbering">
		<c:forEach var="i" begin="1" end="${plv.pageTotalCount}">
			<a href="catalogWithNumber.jsp?page=${i}">[${i}]1111</a>
       	</c:forEach>
    </div>
	
</div>


<div id="product_question">
<div class="anchor_block" style="height: 123px;"></div>
<div class="anchor_margin" style="height: 30px;"></div>
<table width="700" height="50" border="0" cellpadding="3" cellspacing="0" class="anchor_table" align="center">
  <tr>
    <td><a href="#detail">상품구매</a></td>
    <td><a href="#picture_info">상품상세정보</a></td>
    <td><a href="#purchase_guide">구매가이드</a></td>
    <td><a href="#purchase_review">구매후기</a></td>
    <td><a href="#product_question"><strong>상품문의</strong></a></td>
  </tr>
</table>
<br><br><br>
<p align="center" style="font-size: x-large; font-weight: bold;">상품문의</p>
<p align="center" style="font-size: large;">상품 Q&A입니다.</p>
    <% 	if(false){ %>
    <c:forEach var="n" items="<%=revlist %>">
    <hr>

    <table width="1000" id="question_form">
       <tr>
    		<th width="120" scope="col">번호</th>
    		<th width="580" scope="col">제목</th>
     		<th width="150" scope="col">작성자</th>
			<th width="150" scope="col">작성일</th>
		</tr>
		<tr>
			<td>b.boardId}</td>
			<td>b.title}</td>
			<td>b.userId}</td>
			<td>b.bdate}</td>
		</tr>
	</table>
	</c:forEach>
	<%}	else {%>
	<div class = "empty_review"><br><p style="text-align: center; text-shadow: gray;">상품 문의가 존재하지 않습니다</p><br></div>
	
	<%} %>
	<div class="bt_wrap">
		<input type="button" id="write_q" value="문의하기" onclick='location.href="/team_file/Inquiry/inquirywrite.jsp"'>
		<input type="button" id="all_q" value="모두보기" onclick='location.href="/team_file/Inquiry/inquiryboard.jsp"'>
	</div>
	<div class="numbering">
		<c:forEach var="i" begin="1" end="${plv.pageTotalCount}">
			<a href="catalogWithNumber.jsp?page=${i}">[${i}]1111</a>
       	</c:forEach>
    </div>	
</div>       
</div>    
<div class="recentProd" style="text-align: center;">
<br><span style="font-size:x-large; ; vertical-align: middle;">최근 본 상품</span><br><hr>
<%
	ArrayList<Product> recentView = viewlist;
	Product prodR = null;
	int last = recentView.size()-1;
	int start = last-4;
	if(start<-1){
		start = -1;
	}
	for(int i=last; i>start; i--){
		prodR = recentView.get(i);
%>
	<a href="/team_file/Product/product_detail.jsp?pid=<%=prodR.getPid() %>">
	<img src="/team_file/image/<%=prodR.getCategory() %>/<%=prodR.getPimage() %>/<%=prodR.getPimage() %>_1.jpg" width="150" height="150" style="margin-top: 20px;"/></a>
<!--
ArrayList<String> viewlist = (ArrayList)session.getAttribute("productlist");
    if(viewlist==null)
    {
    	viewlist = new ArrayList<String>();
     session.setAttribute("pid", viewlist);
    }
    viewlist.add(Integer.toString(pid));
    
    
    for(int i=1; i<= pCount.intValue(); i++) {
	     	cart = (Cart)session.getAttribute("p" + i);
	     	if(cart != null){
		     	amount1 = cart.getAmount();
		     	product= dao.selectById(conn,cart.getPid());
		     	int total = product.getPrice() * amount1;
		     	totalPrice += total;
    -->
<%} %>
    
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