<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.util.*,my.dao.*,my.model.*,java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Darle - 상품구매</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link href="purchase.css" rel="stylesheet" type="text/css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
	
function payBuyNow(){
	//document.getElementById("price").value
		var total_amount = document.getElementById("totalPrice").value;
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */
			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : '주문명:결제테스트',
			//결제창에서 보여질 이름
			amount : total_amount,
			//가격
			buyer_email : 'gksgh108@tukorea.ac.kr',
			buyer_name : '김한호',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				post_to_url();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
			
			// location.href="ordercomplete.jsp;
			
		});
	}
	
	//function sendData(id){
		//post_to_url("ordercom.jsp",{'id':id,'pass':deleteapss});
	//}
	
	function post_to_url(){
		var address = document.getElementById("member_post").value + document.getElementById("member_addr").value+document.getElementById("member_detail_address").value
		var path = "/team_file/ordercomplete.jsp";
		method = "post";
		var form = document.createElement("form");
		form.setAttribute("method",method)
		form.setAttribute("action",path)
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type","hidden");
		hiddenField.setAttribute("name","address");
		hiddenField.setAttribute("value",address);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
</script>
	
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userId = (String)session.getAttribute("LOGINID");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		Connection conn = ConnectionProvider.getConnection();
		Product product = null;
		User user = null;
		int totalPrice = Integer.parseInt(request.getParameter("price")); 
		session.setAttribute("pid", pid );
		session.setAttribute("amount", amount );
		session.setAttribute("totalPrice", totalPrice);
		try{
			ProductDao dao = new ProductDao();
			UserDao dao2 = new UserDao();
			PurchaseDao purdao = new PurchaseDao();
			product = dao.selectById(conn, pid);
			if (userId != null) {
				user = dao2.selectById(conn, userId);
			}
			else {
				userId = "비회원";
			}
			java.util.Date buyTime = new java.util.Date();
			Purchase purchase = new Purchase(userId, pid, amount, product.getPrice(), buyTime);
			purdao.insert(conn,purchase);
	%>

	<div class="wrap">
		<div class="top">
			<div class="back_menu">
				<a href="#"><img src="/team_file/image/back_menu.png" width="36"
					height="42" /></a>
		  </div>
			<div class="top_logo">로고 이미지</div>
	  </div>
		<div class="page_info">주문/결제</div>
		<div class="user_info">
			<div class="user_name">
				받는사람 <input name="user_name" type="text" value ="<%=user.getName()%>"/>
			</div>
			<div class="user_post">
				우편번호
				  <input name="member_post" id="member_post" type="text" 
										readonly="readonly" onclick="findAddr()"/>
			</div>
			<div class="user_address">
				주소 <input name="member_addr" id="member_addr" type="text" readonly="readonly" />
			</div>
			<div class="user_detail_address">
				상세주소 <input name="member_detail_address" id="member_detail_address" type="text" />
			</div>
			<div class="user_email">
				이메일 <input name="email" type="text" value="<%=user.getEmail()%>"/>
			</div>
		</div>
		<div class="message">
			<select name="requirement">
				<option value="--메세지 선택 (선택사항)--" selected="selected">--메세지
					선택 (선택사항)--</option>
				<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
				<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
				<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
				<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
			</select>
		</div>
		<div class="margin"></div>
					
			
		<div class="product_info">
			<div class="product_info_top">주문상품</div>
			<div class="product_image">
				<div class="product"><img src="/team_file/image/<%=product.getCategory() %>/<%=product.getPimage()%>/<%=product.getPimage()%>_1.jpg" width="150" height="150"/></div>
			</div>
			<div class="product_detail">
				<p><%=product.getPname()%></p>
				<p><%=amount%></p>
				<p><%=totalPrice+3000%>(배송비 포함)</p>
			</div>
			<input type="hidden" name = "totalPrice" id="totalPrice" value="<%=totalPrice+3000 %>" />
		</div>
		<div class="margin"></div>
		<div class="discount">
			<div class="discount_top">할인</div>
			<div class="discount_main">&nbsp; 포인트 <%=user.getPoint() %></div>
			<div class="discount_price">적용금액
            <div class="discount_total">(할인금액)<%=user.getPoint()%> 원</div>
            </div>
		</div>
		<div class="margin"></div>
		<div class="purchase_info">
			<div class="purchase_top">결제정보</div>
			<div class="purchase_detail">
				<p>&nbsp;주문상품 <%=product.getPname()%></p>
				<p>&nbsp;할인/포인트 <%=user.getPoint()%> </p>
				<p>&nbsp;배송비 3000</p>
			</div>
			<div class="total_price">결제금액
            <div class="discount_total">(결제금액) <%=totalPrice+3000%>원</div>
            </div>
		</div>
		<div class="margin"></div>
		
		<div class="margin"></div>
		<div class="point">
			적립혜택
			<div class="point_value">(상품 5%)원 예정</div>
		</div>
		<div class="margin"></div>
		<div class="submit">
			<input name="buy" id="check_module" type="button"
				onclick="payBuyNow()" value="결제하기" />
		</div>
		<%
				
					   		}catch (SQLException e){
								}finally {
							JdbcUtil.close(conn);
						}
					%>
</div>
</body>
</html>
