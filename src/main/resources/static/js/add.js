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
			location.href = "/product";
		} else {
			alert("상품명을 확인해주세요");
			history.back();
		}
	});
}


// 상품명 중복 확인
function checkProductName() {
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