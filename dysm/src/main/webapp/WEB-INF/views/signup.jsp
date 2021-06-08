<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>

<section id="signup-section">
	<div class="container">
		<div class="content">
		<h1>회원가입</h1>
		<br><br><hr><br><br>
			<form method="post" action="/member/insert" id="signup-form">
			
				<label>ID<span class="req">*</span></label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="id" id="id-input" placeholder="영어, 숫자만 가능(1~20자)" aria-label="Username" aria-describedby="basic-addon1" maxlength="20" required>
					<button type="button" class="input-group-text" id="id-btn" disabled><span>중복확인</span></button>
				</div>
				<span id="id-msg"></span>
				<br><br><br>
				
				<label>비밀번호<span class="req">*</span></label>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="password" id="pw-input" placeholder="영어, 숫자, 특수문자 포함(8~20자)" aria-label="Username" aria-describedby="basic-addon1" maxlength="20" required>
				</div>
				<span id="pw-msg"></span>
				<br>
				<div class="input-group mb-3">	
					<input type="password" class="form-control" id="pw-chk-input" placeholder="비밀번호 확인" aria-label="Username" aria-describedby="basic-addon1" maxlength="20" required>
				</div>
				<span id="pw-chk-msg"></span>
				<br><br><br>
				
				<label>이메일<span class="no-req">(선택)</span></label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="email" id="email-input" placeholder="xxx@xxxxx.xxx" aria-label="Username" maxlength="40">
				</div>
				<span id="email-msg"></span>
				<br><br><br>

				<label>휴대폰 번호<span class="req">*</span></label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="phone" id="phone-input" placeholder="숫자만 입력하세요" aria-label="Username" aria-describedby="basic-addon1" maxlength="11">
					<button type="button" class="input-group-text" id="phone-btn" disabled><span>인증번호 받기</span></button>
				</div>

				<label>인증번호 입력<span class="req">*</span></label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="phone-chk-input" aria-label="Username" aria-describedby="basic-addon1" maxlength="4" disabled>
					<button type="button" class="input-group-text" id="phone-chk-btn" disabled><span>확인</span></button>
				</div>
				<span id="phone-msg"></span>
				<br><br><br><br>
				
				<div class="input-group mb-3">
					<button class="input-group-text" id="signup-btn" disabled><span>회원가입</span></button>
				</div>
				<br><br><hr>
			</form>
		</div>
	</div>
</section>

<script>
$(document).ready(function(){
	//submit 하기 전에 입력 잘 됐는지 체크(전부 true이어야 회원가입 가능)
	let chkId=false, chkPw=false, chkPhone=false;
	let phoneChkNum = 0;
	
	let $idInput = $("#id-input");
	let $pwInputAll = $("#pw-input, #pw-chk-input");
	let $pwInput = $("#pw-input");
	let $idBtn = $("#id-btn");
	let $pwChkInput = $("#pw-chk-input");
	let $emailInput = $("#email-input");
	let $phoneInput = $("#phone-input");
	let $phoneBtn = $("#phone-btn");
	let $phoneChkInput = $("#phone-chk-input");
	let $phoneChkBtn = $("#phone-chk-btn");
	let $signupBtn = $("#signup-btn");
	let $signupFm = $("#signup-form");
	
	
	// 모든 필수입력사항 정상입력되면 회원가입 버튼 활성화 
	$signupFm.on("input click", function(){
		if(chkId && chkPw && chkPhone)
			$signupBtn.removeAttr("disabled").css("background", "#212529");
		else
			$signupBtn.attr("disabled", true).css("background", "darkgray");
	})
	
	$signupFm.on("submit", function(){
		alert("'"+$idInput.val()+"'님 회원가입 성공!");
	})
	
	
	// 아이디 입력
	$idInput.on("input", function(){
		let idRegEx = /^\w{1,}$/; // [A-Za-z0-9_]와 같음
		let $idMsg = $("#id-msg");
		
		if(idRegEx.test($idInput.val())){
			$idMsg.html("중복확인 필요").css("color", "red");
			$idBtn.removeAttr("disabled").css("background", "#212529");
		}else{
			$idMsg.html("영어, 숫자만 입력 가능합니다.").css("color", "red");
			$idBtn.attr("disabled", true).css("background", "darkgray");
		}
		chkId = false;
	})
	
	// 아이디 중복 확인
	$idBtn.on("click", function(){
		let $idMsg = $("#id-msg");
		
		$.ajax("/member/idDuplication",{
			type:'post',
			async:false,
			data:"id="+$idInput.val(),
			dataType:"json"
		})
		.done(function(result){ // 성공시 콜백
			if(result == true){
				$idMsg.html("이미 사용중인 ID 입니다.").css("color","red");
			}else{
				$idMsg.html("사용 가능한 ID 입니다.").css("color","green");
				chkId = true;
				$pwInput.focus();
				$idBtn.attr("disabled", true).css("background", "darkgray");
			}
		})
		.fail(function(){ // 에러시 콜백
			alert("에러");
		})
		.always(function(){ // 항상 실행(try catch의 finally)
			console.log("중복확인완료");
		})
	})
	
	// 비밀번호, 비밀번호 확인
	$pwInputAll.on("input", function(){
		// 영어, 숫자, 특수문자 포함(8~20자리)
		let pwRegEx = /(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[`\-\=\[\]\\;\',.\/\s~!@#$%^&*\(\)_+\{\}:\"<>?]).{8,20}/;
		let $pwMsg = $("#pw-msg");
		let $pwChkMsg = $("#pw-chk-msg");
		
		if(pwRegEx.test($pwInput.val())){
			$pwMsg.html("사용 가능한 비밀번호 입니다.").css("color","green");
			if($pwInput.val() == $pwChkInput.val()){ // 비번 일치 여부
				$pwChkMsg.html("비밀번호가 일치합니다.").css("color","green");
				chkPw = true;
			}else{
				$pwChkMsg.html("비밀번호가 일치하지 않습니다.").css("color","red");
				chkPw = false;
			}
		}else{
			$pwMsg.html("영어, 숫자, 특수문자를 포함해야 합니다.(8~20자)").css("color","red");
			chkPw = false;
		}
	})
	
	// 이메일 입력
	$emailInput.on("input", function(){
		// 문자1이상시작, @, 문자1이상, (점0또는1+문자1이상), 점1, 문자1이상끝
		let emailRegEx = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.?[a-zA-Z])*\.[a-zA-Z]{1,}$/;
		let $emailMsg = $("#email-msg");
		
		if(emailRegEx.test($emailInput.val()) || ($emailInput.val() == ""))
			$emailMsg.html("");
		else
			$emailMsg.html("[주의]이메일 주소가 정확한지 확인해 주세요").css("color","orange");
	})
	
	// 전화번호, 전화번호 인증
	$phoneInput.on("input", function(){
		let phoneRegEx = /^[0-9]{11}$/; // 숫자만 11자리
		let $phoneBtn = $("#phone-btn")
		
		if(phoneRegEx.test($phoneInput.val())){
			$phoneBtn.removeAttr("disabled").css("background", "#212529");
			$phoneBtn.focus();
		}
		else
			$phoneBtn.attr("disabled", true).css("background", "darkgray");
	})
	
	$phoneBtn.on("click", function(){
		let $phoneChkInput = $("#phone-chk-input");
	
		do{ // 4자리수 뽑으려고 1000이하면 반복
			phoneChkNum = Math.floor(Math.random()*10000);
		}while(phoneChkNum<1000)
			alert("[Web발신]\n[DYSM]인증번호 ["+phoneChkNum+"]를 입력해 주세요.");
		
		// 인증번호 입력창 입력 가능하게 하기
		$phoneChkInput.removeAttr("disabled");
		$phoneChkInput.focus();
	})
	
	$phoneChkInput.on("input", function(){
		let phoneRegEx = /^[0-9]{4}$/; // 숫자만 4자리
		let $phoneChkBtn = $("#phone-chk-btn");
		
		if(phoneRegEx.test($phoneChkInput.val())){
			$phoneChkBtn.removeAttr("disabled").css("background", "#212529");
			$phoneChkBtn.focus();
		}else{
			$phoneChkBtn.attr("disabled", true).css("background", "darkgray");
		}
	})
	
	$phoneChkBtn.on("click", function(){
		let $phoneChkInput = $("#phone-chk-input");
		let $phoneMsg = $("#phone-msg");
		
		if($phoneChkInput.val() != phoneChkNum){ // 인증번호와 다르면
			$phoneMsg.html("인증실패").css("color", "red");
			$phoneChkInput.val("");
			chkPhone = false;
		}else{
			$phoneMsg.html("인증성공").css("color", "green");
			chkPhone = true;
			$phoneInput.attr("readonly", true).css("background", "#e9ecef");
			$phoneBtn.attr("disabled", true).css("background", "darkgray");
			$phoneChkInput.attr("readonly", true).css("background", "#e9ecef");
			$phoneChkBtn.attr("disabled", true).css("background", "darkgray");
		}
	})

})
</script>

<%@ include file="includes/footer.jsp"%>

