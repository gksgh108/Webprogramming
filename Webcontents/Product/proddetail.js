var target = document.getElementById();
var black_cnt = document.getElementById("black_cnt").value;

function show_menu1(){
	var show = document.getElementById("menu1");
	show.style.display = 'block';
}
function show_menu2(){
	var show = document.getElementById("menu2");
	show.style.display = 'block';
}
function show_menu3(){
	var show = document.getElementById("menu3");
	show.style.display = 'block';
}
function show_menu4(){
	var show = document.getElementById("menu4");
	show.style.display = 'block';
}


function hide_menu1(){
	var hide = document.getElementById("menu1");
	hide.style.display = 'none';
}
function hide_menu2(){
	var hide = document.getElementById("menu2");
	hide.style.display = 'none';
}
function hide_menu3(){
	var hide = document.getElementById("menu3");
	hide.style.display = 'none';
}
function hide_menu4(){
	var hide = document.getElementById("menu4");
	hide.style.display = 'none';
}

function putPurchase(pid){
	var amount = parseInt(purchase.amount1.value.trim()) + parseInt(purchase.amount2.value.trim()) + 
			parseInt(purchase.amount3.value.trim()) + parseInt(purchase.amount4.value.trim());
			location.href='/team_file/Purchase/purchase.jsp?pid='+pid+'&amount='+amount+'&price'+price;
}
function putcart(pid){
	var amount = parseInt(purchase.amount1.value.trim()) + parseInt(purchase.amount2.value.trim()) + 
		parseInt(purchase.amount3.value.trim()) + parseInt(purchase.amount4.value.trim());
	var goCart = confirm("상품을 장바구니에 추가하였습니다!\n장바구니로 이동하시겠습니까?");
	if(goCart){
		location.href='/team_file/Cart/cart.jsp?pid='+pid+'&amount='+amount+'&price='+price;
	}else{
		history.go(-1);
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
	}
	sum1.value= amount1.value*sell_price;
	total.value = parseInt(total.value) - sell_price;
}

function minus2(){
	var amount1 = document.getElementById("amount2");
	var sum1 = document.getElementById("sum2");
	var sell_price = parseInt(purchase.sell_price.value.trim());
	var total = document.getElementById("totalPrice");
			
	amount1.value--;
	if(amount1.value<0){
		amount1.value = 0;
	}
	sum1.value= amount1.value*sell_price;
	total.value = parseInt(total.value) - sell_price;
}

