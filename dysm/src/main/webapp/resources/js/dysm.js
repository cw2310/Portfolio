
$(document).ready(function(){ 

	// 뒤로가기 했을때 새로고침하기 위한거	
	// window는 전역객체라서 새로고침 해도 값이 유지됨
	if(window.name != "reload"){
		window.name = "reload";
		window.location.reload();
	}else
		window.name = "";
	
})









