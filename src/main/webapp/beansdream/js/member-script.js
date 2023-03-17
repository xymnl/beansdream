function idCheck(id){
	if(id == '') {
		alert("아이디를 입력해주세요");
		document.regFrm.userid.focus();
		return;
	}
	url = "idCheck.jsp?id="+id;
	window.open(url, "IDCheck", "width=500, height=500, left=500, top=300");
}

function zipCheck() {
	url = "zipCheck.jsp?check=y";
	window.open(url, "zipCodeCheck", "width=500, height=500, left=500, top=300");
}