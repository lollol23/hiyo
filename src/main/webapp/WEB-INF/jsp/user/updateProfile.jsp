<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		
	<link rel="stylesheet" href="/static/css/_common.css" type="text/css">
	<link rel="stylesheet" href="/static/css/timeLine.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<section class="d-flex timeline-section">
				<div class="update-profile-box mt-4">
					<div class="m-3 pt-3">
						<h3>회원정보변경</h2>
					</div>
					<div class="d-flex m-3 pt-3">
						<div class="update-profile-input-left-box">이름</div>
						<input type="text" class="form-control" id="nameInput" placeholder="이름" value="${userName }">
					</div>
					<div class="d-flex m-3 pt-3">
						<div class="update-profile-input-left-box">닉네임</div>
						<input type="text" class="form-control" id="nickNameInput" placeholder="닉네임" value="${userNickName }">
					</div>
					<div class="d-flex m-3 pt-3">
						<div class="update-profile-input-left-box">소개</div>
						<textarea class="form-control" rows="5" id="introduceInput"></textarea>
					</div>
					<div class="d-flex m-3 pt-3 justify-content-end">
						<button class="btn save-btn" id="saveBtn">프로필 저장</button>
					</div>
					<div class="m-3 pt-3">
						<h3>프로필 이미지변경</h2>
					</div>
					<div class="d-flex m-3 pt-3">
						<div class="update-profile-input-left-box">프로필 이미지</div>
						<a href="#" id="imageUploadBtn"><i class="bi bi-card-image"></i></a>
						<input type="file" id="fileInput" class="d-none">
						<div class="ml-3">미리보기</div>
						<div class="preview-img-div ml-5"><img src="${userProfileImg }" id="previewImgUpdate"></div>
					 </div>
					<div class="d-flex m-3 pt-3 justify-content-end">
						<button class="btn save-btn" id="profileImgSaveBtn">이미지 저장</button>
					</div>
				</div>
			</section>
	</div>
	<script>
		$(document).ready(function(){
			$("#imageUploadBtn").on("click", function() {
				$("#fileInput").click();
			});
			$("#saveBtn").on("click", function(){
				
				var userName = $("#nameInput").val();
				var userNickName = $("#nickNameInput").val();
				var introduce = $("#introduceInput").val();
				
				if(userName == null || userName == "") {
					alert("이름을 입력하세요");
					return;
				}
				if(userNickName == null || userNickName == "") {
					alert("닉네임을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/update",
					data:{"userName":userName, "userNickName":userNickName, "introduce":introduce},
					success:function(data) {
						if(data.result == "success") {
							alert("회원정보변경");
							location.href="/user/updateprofile_view";
						} else {
							alert("정보변경실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
			});
			$("#profileImgSaveBtn").on("click", function() {
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return;
				}
				var formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				$.ajax({
					encType:'multipart/form-data',
					type:"post",
					url:"/user/update_profileImg",
					processData:false,
					contentType:false,
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							alert("프로필 이미지 저장 완료");
							location.reload();
						} else {
							alert("저장실패~");
						}
					}, error:function(e) {
						alert("error");
					}
				});
			});
			$("#fileInput").on("change", function() {
				var reader = new FileReader();
				reader.onload = function (e) {
			        document.getElementById("previewImgUpdate").src = e.target.result;
			    };
			    reader.readAsDataURL(this.files[0]);
			});
		});
	</script>
</body>
</html>