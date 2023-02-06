let isproductNameSameCheck = false;
let isproductNameCheckEvent = true;

// 상품등록
$("#btnInsert").click(() => {
	insertProduct();
});

// 상품명 중복 확인
$("#btnProductSameCheck").click(() => {
	checkProductName();
});// 리스너



// 상품등록
function insertProduct() {
	if (isproductNameSameCheck == false) {
		alert("상품명 중복 확인을 해주세요");
		return;
	}
	
	if (isproductNameCheckEvent != $("#name").val()) {
		alert("상품명 중복 확인을 다시 해주세요!");
		return;
	}
	
	if(blankProductName() == true){
		alert("상품명을 입력해주세요");
		return
	}
	
	if(numProductPrice() == false){
		alert("상품가격에 숫자만 입력해주세요");
		return;
	}

	if(numProductQty() == false){
		alert("상품수량에 숫자만 입력해주세요");
		return;
	}
	
	let data = {
		productName: $("#name").val(),
		productPrice: $("#price").val(),
		productQty: $("#qty").val()
	};

	$.ajax("/product/add", {
		type: "POST",
		dataType: "json",
		data: JSON.stringify(data),	//http body에 들고 갈 요청 데이터
		headers: { //http header에 들고 갈 요청 데이터
			"Content-Type": "application/json"	//json 타입 content type 날릴거임
		}
	}).done((res) => {
		if (res.code == 1) {
			alert("상품등록이 완료되었습니다.")
			//location.href = "/product"; -> 중복체크 기능이 없을 시, 상품등록 후 뒤로가기를 하면 중복 등록이 가능
			location.replace("/");
		} else {
			alert("상품등록에 실패하였습니다.");
			history.back();
		}
	});
}


// 상품명 중복 확인
function checkProductName() {
	if(blankProductName() == true){
		alert("상품명을 입력해주세요");
		return
	}

	let productName = $("#name").val();


	$.ajax("/api/product/productNameSameCheck?productName=" + productName, {
		type: "GET",
		dataType: "json",
		async: true
	}).done((res) => {
		if (res.code == 1) { // 통신 성공
			if (res.data == false) {
				alert("상품명이 중복되지 않았습니다.");
				isproductNameSameCheck = true;
				isproductNameCheckEvent = $("#name").val();
			} else {
				alert("상품명이 중복되었어요. 다른 상품명을 입력하세요.");
				isproductNameSameCheck = false;
				$("#name").val("");
			}
		}
	});
}

function blankProductName() {	// 상품명 공백 || 띄어쓰기 막아줌
	let productName = $("#name").val();
	let blank = /\s/g;
	if(!productName || blank.test(productName)){
		return true;
	}
}

function numProductPrice() {	// 상품가격에 숫자만 입력 가능
	let productPrice = $("#price").val();
	let numRule = /^[0-9]+$/;
	if (numRule.test(productPrice)) {
		return true;
	} else {
		return false;
	}
}

function numProductQty() {	// 상품수량에 숫자만 입력 가능
	let productQty = $("#qty").val();
	let numRule = /^[0-9]+$/;
	if (numRule.test(productQty)) {
		return true;
	} else {
		return false;
	}
}