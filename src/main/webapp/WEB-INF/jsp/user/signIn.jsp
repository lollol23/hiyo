<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIYO.</title>
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
							<form="loginForm">
								<input type="text" class="form-control input-style mt-5" placeholder="아이디">
								<input type="password" class="form-control input-style mt-2" placeholder="비밀번호">
								<input type="submit" class="form-control btn-color mt-3" value="로그인">
							</form>
							<hr>
							<div class="text-center">비밀번호를 잊으셨나요?</div>
						</div>
					</div>
					<div class="login-small-box mt-2 d-flex justify-content-center align-items-center">
						<div>계정이 없으신가요? <a href="/user/signup_view">가입하기</a></div>
					</div>
				</div>
			</div>
		</section>
		<footer class="text-center">
			© 2021 Hiyo from Meta
		</footer>
	</div>
</body>
</html>