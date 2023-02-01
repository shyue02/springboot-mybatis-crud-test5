let isuserNameSameCheck = false;

$("#btnUsernameSameCheck").click(() => {
	checkUserName();
});


function checkUserName() {
	let userName = $("#userName").val();

	$.ajax("/api/joinForm/userNameSameCheck?userName=" + userName, {
		type: "GET",
		dataType: "json",
	}).done((res) => {
		if (res.code == 1) { // 통신 성공
			if (res.data == false) {
				alert("중복되지 않았습니다.");
				isuserNameSameCheck = true;
			} else {
				alert("아이디가 중복되었어요. 다른 아이디를 사용해주세요.");
				isuserNameSameCheck = false;
				$("#userName").val("");
			}
		}
	});
}