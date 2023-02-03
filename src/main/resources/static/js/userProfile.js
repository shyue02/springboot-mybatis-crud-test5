$("#btnUpdate").click(()=>{
	userUpdate();
});


function userUpdate(){
	let data ={
		userPassword : $("#userPassword").val(),
		userEmail : $("#userEmail").val()
	};
	
	$.ajax("/api/user/profile", {
		type : "POST",
		dataType : "json",
		data : JSON.stringify(data),
		headers :{ //http header에 들고 갈 요청 데이터
			"Content-Type" : "application/json"	//json 타입의 컨텍트 타입을 날림
		}
	}).done((res)=> {
		if(res.code == 1){
			alert("회원정보 수정 완료")
			location.reload(); //새로고침
		}else {
			alert("회원정보 수정 실패");
		}
	});
}