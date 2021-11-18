<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hiyo. 회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap" class="">
		<section class="content d-flex justify-content-center align-items-center">
			<div class="content-left-box d-flex justify-content-center align-items-center">
				<img src="/static/img/hiyoLogo.png" class="logo-img">
			</div>
			<div class="content-right-box d-flex justify-content-center align-items-center">
				<div>
					<div class="login-box d-flex justify-content-center align-items-center">
						
						<div class="">
							<h1 class="text-center">Hiyo.</h1>
							<div class="text-center text-secondary">친구들의 사진과 동영상을 보려면<br> 가입하세요.</div>
							<hr>
							<form id="signUpForm">
								<div class="d-flex">
									<input type="text" id="loginIdInput" class="form-control input-style" placeholder="아이디">
									<button type="button" class="btn btn-sm ml-2 btn-color" id="isDuplicateBtn">중복확인</button>
								</div>
								<input type="password" name="password" id="passwordInput"  class="form-control input-style mt-2" placeholder="비밀번호">
								<input type="password" name="passwordConfirm" id="passwordConfirmInput"  class="form-control input-style mt-2" placeholder="비밀번호확인">
								<input type="text" name="name" id="nameInput"  class="form-control input-style mt-2" placeholder="이름">
								<input type="text"  name="nickName" id="nickNameInput" class="form-control input-style mt-2" placeholder="사용자 이름">
								<input type="submit" class="btn btn-color btn-block mt-3" value="가입">
							</form>
						</div>
					</div>
					<div class="login-small-box mt-2 d-flex justify-content-center align-items-center">
						<div>
							계정이 있으신가요? <a href="/user/signin_view">로그인</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer class="text-center">
			© 2021 Hiyo from Meta
		</footer>
	</div>
	<script>
		$(document).ready(function() {
			$("#signUpForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val();
				var nickName = $("#nickNameInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				if(password == null || password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				if(passwordConfirm == null || passwordConfirm == "") {
					alert("비밀번호확인을 입력하세요");
					return;
				}
				if(name == null || name == "") {
					alert("이름을 입력하세요");
					return;
				}
				if(nickName == null || nickName == "") {
					alert("닉네임을 입력하세요");
					return;
				}
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지않습니다");
					return;
				}
				
				$.ajax({
						type:"post",
						url:"/user/sign_up",
						data:{"loginId":loginId, "password":password, "name":name, "nickName":nickName},
						success:function(data) {
							if(data.result == "success") {
								alert("회원가입성공");
								location.href="/user/signin_view";
							} else {
								alert("회원가입실패");
							}
						},
						error:function(e) {
							alert("회원가입에러");					
						}
				});
			});
		});
	</script>
</body>
</html>
