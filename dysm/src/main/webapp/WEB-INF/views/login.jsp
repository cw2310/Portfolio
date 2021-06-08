<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>

<section id="login-section">
	<div class="container">
		<div class="content">
		<h1>로그인</h1>
		<br><br><hr><br><br><br>
			<div class="input-group mb-3">
			  <span class="input-group-text">ID</span>
			  <input type="text" class="form-control" id="login-id" name="id" aria-label="Username" aria-describedby="basic-addon1" maxlength="20" placeholder="아이디 입력" required>
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text">비밀번호</span>
			  <input type="password" class="form-control" id="login-pw" name="password" aria-label="Username" aria-describedby="basic-addon1" maxlength="20" placeholder="비밀번호 입력" required>
			</div>
			
			<button type="button" class="input-group-text" id="login-btn"><span>로그인</span></button>
			
			<div class="login-menu"><a href="#">아이디 찾기</a><a href="#">비밀번호 찾기</a><a href="/signup">회원가입</a></div>
			<br><br><hr><br>
		</div>
	</div>
</section>

<script>
$(document).ready(function(){
	$("#login-id").focus();
	
	let $loginBtn = $("#login-btn");
	let $loginPw = $("#login-pw");
	
	
	// 로그인 버튼 onclick
	$loginBtn.on("click", function(){
		let $loginId = $("#login-id");
		
		$.ajax("/member/login",{
			type:'post',
			async:false,
			data:{id:$loginId.val(), password:$loginPw.val()},
			dataType:"json"
		})
		.done(function(result){ // 성공시 콜백
			if(result == true){
				console.log("로그인 성공");
				location.replace("/main");
			}else{
				alert("로그인 실패");
				$loginPw.val("").focus();
			}
		})
		.fail(function(){ // 에러시 콜백
			console.log("로그인 에러");
		})
		.always(function(result){ // 항상 실행(try catch의 finally)
			console.log("로그인 끝");
		})
	})
	
	// 비밀번호 input창에서 엔터 치면 로그인
	$loginPw.on("keypress", function(e){
		if(e.keyCode == 13){
			$loginBtn.trigger("click");
		}
	})

})
</script>

<%@ include file="includes/footer.jsp"%>

