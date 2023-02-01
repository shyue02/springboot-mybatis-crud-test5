let isuserNameSameCheck = false;


// 회원가입
$("#btnJoin").click(()=>{
	join();
})

// 아이디 중복 체크
$("#btnUsernameSameCheck").click(() => {
	checkUserName();
});


function join(){
	if(isuserNameSameCheck== false){
		alert("아이디 중복 확인을 해주세요");
		return;
	}
	
	let data ={
		userName : $("#userName").val(),
		userPassword : $("#userPassword").val(),
		userEmail : $("#userEmail").val()
	};
	
	$.ajax("/join", {
		type : "POST",
		dataType : "json",
		data : JSON.stringify(data),
		headers :{ //http header에 들고 갈 요청 데이터
			"Content-Type" : "application/json"	//json 타입의 컨텍트 타입을 날림
		}
	}).done((res)=> {
		if(res.code == 1){
			location.replace("/loginForm");
		}else {
			alert("회원가입에 실패하였습니다.");
			history.back();
		}
	});
}

function checkUserName() {
	let userName = $("#userName").val();

	$.ajax("/api/joinForm/userNameSameCheck?userName=" + userName, {
		type: "GET",
		dataType: "json",
	}).done((res) => {
		if (res.code == 1) { // 통신 성공
			if (res.data == false) {
				alert("사용 가능한 아이디입니다.");
				isuserNameSameCheck = true;
			} else {
				alert("아이디가 중복되었어요. 다른 아이디를 사용해주세요.");
				isuserNameSameCheck = false;
				$("#userName").val("");
			}
		}
	});
}