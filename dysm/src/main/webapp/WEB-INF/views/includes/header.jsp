<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
</script>

<link rel="stylesheet" href="/resources/css/dysm.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/dysm.js"></script>

<meta charset="UTF-8">
<title>---- DYSM ----</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-brand">
      <a class="navbar-brand" href="/main">
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-nut" viewBox="0 0 15 18">
  <path d="m11.42 2 3.428 6-3.428 6H4.58L1.152 8 4.58 2h6.84zM4.58 1a1 1 0 0 0-.868.504l-3.428 6a1 1 0 0 0 0 .992l3.428 6A1 1 0 0 0 4.58 15h6.84a1 1 0 0 0 .868-.504l3.429-6a1 1 0 0 0 0-.992l-3.429-6A1 1 0 0 0 11.42 1H4.58z"/>
  <path d="M6.848 5.933a2.5 2.5 0 1 0 2.5 4.33 2.5 2.5 0 0 0-2.5-4.33zm-1.78 3.915a3.5 3.5 0 1 1 6.061-3.5 3.5 3.5 0 0 1-6.062 3.5z"/>
</svg>
      DYSM</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="/intro">회사소개</a>
        </li>
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link" href="/location">오시는길</a> -->
<!--         </li> -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">제품정보</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/product1">가공</a>
            <a class="dropdown-item" href="/product2">소재</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/order"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 20">
  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg> 주문하기</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/question/list">문의사항</a>
        </li>
        <c:if test="${empty memberId}"> <!-- empty (null 또는 "")일 때 true -->
        	 <li class="nav-item">
		  		<a class="nav-link" id="goto-login" href="/login">로그인</a>
		    </li>
		   </c:if>
		   <c:if test="${!empty memberId}">
		   	<li class="nav-item">
<!-- 		   		<form method="post" action="/member/personal"> -->
<!-- 	    				<button class="nav-link" id="personal-botn">개인정보</button> -->
<!-- 	    			</form> -->
						<a class="nav-link" id="personal-botn" href="/member/personal">개인정보</a>
	    		</li>
	    		<li class="nav-item">
	    			<a class="nav-link" id="logout-btn" href="/member/logout">로그아웃</a>
				</li>	    		
			 </c:if>

      </ul>
    </div>
  </div>
</nav>