<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hiyo. 타임라인</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		
		<link rel="stylesheet" href="/static/css/_common.css" type="text/css">
		
		</head>
	<body>
		<div id="wrap" class="">
			<header  class="d-flex">
				<div class="header-logo-box d-flex justify-content-center align-items-center">
					<div>
						<img src="/static/img/headerLogo.png">
					</div>
				</div>
				<div class="header-serchbar-box d-flex align-items-center">
					<input type="text" class="form-control">
				</div>
				<div class="header-icon-box d-flex justify-content-end align-items-center">
					<c:if test="${not empty userName }">
						<div class="mr-4 text-white">
							${userName }님
						</div>	
					</c:if>
					<div class="mr-3">
						<a href="/post/timeline_view"><i class="bi bi-house"></i></a>
					</div>
					<div class="mr-3">
						<a href="#"><i class="bi bi-person"></i></a>
					</div>
					<div class="mr-3">
						<a href="/user/sign_out"><i class="bi bi-box-arrow-in-right"></i></a>
					</div>
				</div>
			</header>
			<section class="d-flex">
				<article class="timeLine-box"></article>
				<article class="fixed-box"></article>
			</section>
		</div>
	</body>
</html>