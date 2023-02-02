let isuserNameSameCheck = false;
let userNameCheckEvent = true;


// 회원가입
$("#btnJoin").click(()=>{
	join();
})

// 아이디 중복 체크
$("#btnUsernameSameCheck").click(() => {
	checkUserName();
});



function join(){ //회원가입
	if(isuserNameSameCheck== false){
		alert("아이디 중복 확인을 해주세요");
		return;
	}
	
	if(userNameCheckEvent != $("#userName").val()){
		alert("아이디 중복 확인을 다시 해주세요");
		return;
	}
	
	if(blankUserName() == true){
		alert("아이디를 입력해주세요");
		return;
	}
	
	if(blankUserPassword() == true){
		alert("비밀번호를 입력해주세요");
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
			//history.back(); -> 이전 페이지로 이동
			location.replace("/joinForm");	// 회원가입 실패 시 다시 회원가입 페이지로
		}
	});
}

function checkUserName() { //아이디 중복 체크
	let userName = $("#userName").val();

	$.ajax("/api/joinForm/userNameSameCheck?userName=" + userName, {
		type: "GET",
		dataType: "json",
	}).done((res) => {
		if (res.code == 1) { // 통신 성공
			if (res.data == false) {
				alert("사용 가능한 아이디입니다.");
				isuserNameSameCheck = true;
				userNameCheckEvent = $("#userName").val();
			} else {
				alert("아이디가 중복되었어요. 다른 아이디를 사용해주세요.");
				isuserNameSameCheck = false;
				$("#userName").val("");
			}
		}
	});
}

function blankUserName() {	// 아이디 공백만 막아줌, 띄어쓰기는 못 막아준다.
	let username = $("#userName").val();
	if(!username){
		return true;
	}
}

function blankUserPassword() {	// 비밀번호 공백 막아줌
	let userpw = $("#userPassword").val();
	if(!userpw){
		return true;
	}
}