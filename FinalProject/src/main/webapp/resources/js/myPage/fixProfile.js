$(document).ready(function() {
	$("#btnUpdateEmail").click(function() {
		$("#updEmail").toggle();
	});
	$("#btnUpdateNick").click(function() {
		$("#updNick").toggle();
	});
});


//문의하기 모달창
document.addEventListener('DOMContentLoaded', function() {
	var modal2 = document.getElementById("q_modal");
	var btn = document.getElementById("q_modal_btn");
	var span = document.getElementsByClassName("close2")[0];

	btn.onclick = function() {
		modal2.style.display = "block";
	}

	span.onclick = function() {
		modal2.style.display = "none";
	}

	window.onclick = function(event) {
		if (event.target == modal2) {
			modal2.style.display = "none";
		}
	}
});
window.onload = function() {
	document.addEventListener('DOMContentLoaded', function() {
		var modal2 = document.getElementById("q_modal");
		var btn = document.getElementById("q_modal_bt");
		var span = document.getElementsByClassName("close2")[0];

		btn.onclick = function() {
			modal2.style.display = "block";
		}

		span.onclick = function() {
			modal2.style.display = "none";
		}

		window.onclick = function(event) {
			if (event.target == modal2) {
				modal2.style.display = "none";
			}
		}
	});

	var minusBtn = document.querySelectorAll('.minus-btn');
	var plusBtn = document.querySelectorAll('.plus-btn');
	var inputField = document.querySelectorAll('.quantity input');

	minusBtn.forEach(function(btn, index) {
		btn.addEventListener('click', function() {
			if (inputField[index].value > 1) {
				inputField[index].value--;
			}
		});
	});

	plusBtn.forEach(function(btn, index) {
		btn.addEventListener('click', function() {
			inputField[index].value++;
		});
	});
	document.getElementById('checkAll').addEventListener('click', function() {
		let checkboxes = document.getElementsByClassName('itemCheck');
		for (let i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = this.checked;
		}
	});

}

function increaseQuantity(productId, price) {
	// 수량을 변경합니다.
	var quantityElement = document.getElementById('scCountVal' + productId).value;   // VALUE : 1
	quantityElement = Number(quantityElement) + 1;
	var priceElement = document.getElementById('scPriceVal' + productId);
	priceElement.value = quantityElement * price;

	/*     var currentQuantity = Number(quantityElement.value); // 1
		var newQuantity = currentQuantity + 1;  // 2
		quantityElement.value = newQuantity; // 2
		// 가격을 변경합니다.
		var totalPrice = newQuantity * price; // 2*3000
		var priceElement = document.getElementById('scPriceVal' + productId);
		priceElement.innerText = totalPrice; */
}

function decreaseQuantity(productId, price) {
	// 수량을 변경합니다.
	var quantityElement = document.getElementById('scCountVal' + productId).value;   // VALUE : 1
	quantityElement = Number(quantityElement) - 1;
	var priceElement = document.getElementById('scPriceVal' + productId);
	priceElement.value = quantityElement * price;
}
function deleteCartItem(sc_no) {
	var confirmation = confirm("정말로 삭제하시겠습니까?");
	if (confirmation) {
		window.location.href = "/cart/deleteCart.do?sc_no=" + sc_no;
	}
}



$(".cart__bigorderbtn.right").on("click", function(e){
	e.preventDefault(); // 기본 이벤트를 막아서 페이지 이동을 막습니다.

	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart__list__detail").each(function(index, element){
		if($(element).find(".itemCheck").is(":checked") === true){	//체크여부
			let sc_no = $(element).find("input[name='sc_no']").val();
			let sc_count = $(element).find("input[name='sc_count']").val();

			// 주문 번호와 상품의 sc_no, sc_count를 form에 입력
			let sc_no_input = "<input name='orders[" + orderNumber + "].sc_no' type='hidden' value='" + sc_no + "'>";
			form_contents += sc_no_input;
			
			let sc_count_input = "<input name='orders[" + orderNumber + "].sc_count' type='hidden' value='" + sc_count + "'>";
			form_contents += sc_count_input;
			
			orderNumber += 1;
		}
	});	

	// 주문 정보를 포함하는 폼을 생성합니다.
	let order_form = $("<form action='/productPayment' method='post'></form>");
	order_form.html(form_contents);
	
	// 폼을 문서에 추가하고 제출합니다.
	$("body").append(order_form);
	order_form.submit();
});





