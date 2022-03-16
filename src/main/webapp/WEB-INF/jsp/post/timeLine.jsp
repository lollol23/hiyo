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
		<link rel="stylesheet" href="/static/css/timeLine.css" type="text/css">
	</head>
	<body>
		<div id="wrap" class="">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<section class="d-flex timeline-section">
				<article class="timeLine-box">
					<!-- 글쓰기상자 -->
					<div id="create-post-box" class="d-none mt-2">
						<div class="create-box-in-box d-flex justify-content-center mt-1">
							<div id="preview-img-box" class="justify-content-center">
								<img src="" id="previewImg" width="700" height="300">
							</div>
						</div>
						<div class="d-flex justify-content-center mt-1">
							<div class="create-box-in-box2">	
								<div class="d-flex">
									<div class="mr-2">									
										<label>이미지경로</label>
									</div>
									<a href="#" id="imageUploadBtn"><i class="bi bi-card-image"></i></a>
									<input type="file" id="fileInput" class="d-none">
								</div>
								<label>내용</label><textarea class="form-control" rows="5" id="contentInput"></textarea>
								<div class="float-right">
									<button type="button" class="btn btn-color mt-2 justify-content-end" id="uploadBtn">업로드</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 타임라인 리스트 -->
					<c:forEach var="postDetail" items="${postList }">
						<div class="timeline-post-box mt-4">
						<div class="post-name-box pl-3  mt-1 d-flex">
							<div><img src="${userProfileImg }" id="previewImgUpdate"></div>
							<div class="pl-3 font-weight-bold">
								${postDetail.post.userName }
							</div>
						</div>
						<div class="">
							<div id="img-box" class="">
								<img src="${postDetail.post.imagePath }" id="image" width="789" height="300">
							</div>
						</div>
						<div class="like-box">
								<div class="pl-3 pt-2">
									<c:choose>
										<c:when test="${postDetail.isLike }">
											<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }" >
												<i class="bi bi-heart-fill heart-icon text-danger"></i>
											</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }" >
												<i class="bi bi-heart heart-icon text-dark"></i>		
											</a>
										</c:otherwise>
									</c:choose>
							<span class="middle-size ml-1"> 좋아요 ${postDetail.likeCount }개 </span>
								</div>
						</div>
						<div class="content-box d-flex pl-3">
							<div class="content-box-userName font-weight-bold middle-size">${postDetail.post.userName }</div>
							<div class="content-box-contents middle-size">${postDetail.post.content }</div>
						</div>
						<div class="comment-box">
							<div class=" border-bottom m-3">
								<!-- 댓글-->
								<div  class="middle-size">
									댓글
								</div>
							</div>
							<div class="middle-size m-3">
								<c:forEach var="comment" items="${postDetail.commentList }">
									<div class="mt-1">
										<b>${comment.userName }</b> ${comment.content }
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- 댓글입력 -->
						<div class="comment-input-box d-flex">				
							<input type="text" class="form-control comment-input" id="commentInput-${postDetail.post.id }" placeholder="댓글작성...">
							<button class="btn uploadCommentBtn" data-post-id="${postDetail.post.id }">게시</button>
						</div>
					</div>
					</c:forEach>
				</article>
				<article class="fixed-box">
					<div class="middle-size m-3 font-weight-bold">
						<span>팔로우 목록</span>
					</div>
				</article>
				<!-- 오른쪽아래 글쓰기 버튼 -->
				<button type="button" class=" btn create-div d-flex align-items-center justify-content-center" id="createPostBtn">
					<i class="bi bi-pencil-square header-icons"></i>
				</button>
			</section>
		</div>
		<script>
			$(document).ready(function(){
				var visibleBox = false;
				$("#createPostBtn").on("click", function(e) {
					var visibleBox = true;
					if(visibleBox) {
						$("#create-post-box").removeClass("d-none");
						return;
					} else {
						return;
					}
				});
				$("#imageUploadBtn").on("click", function() {
					$("#fileInput").click();
				});
				$("#fileInput").on("change", function() {
					var reader = new FileReader();
					reader.onload = function (e) {
				        document.getElementById("previewImg").src = e.target.result;
				    };
				    reader.readAsDataURL(this.files[0]);
				});
				$("#uploadBtn").on("click", function() {
					var content = $("#contentInput").val().trim();
					if(content == null || content == "") {
						alert("내용을 입력하세요");
						return ;
					}
					if($("#fileInput")[0].files.length == 0) {
						alert("파일을 추가하세요");
						return ;
					}
					var formData = new FormData();
					formData.append("file", $("#fileInput")[0].files[0]);
					formData.append("content", content);
					
					$.ajax({
							encType:'multipart/form-data',
							type:"post",
							url:"/post/create",
							processData:false,
							contentType:false,
							data:formData,
							success:function(data) {
								if(data.result == "success") {
									location.reload();
								} else {
									alert("글쓰기실패~");
								}
							}, error:function(e) {
								alert("error");
							}
					});
				});
				$(".uploadCommentBtn").on("click", function() {
					var postId = $(this).data("post-id");
					var content = $("#commentInput-" + postId).val();
					
					if(content == null || content == "") {
						alert("댓글을 입력하세요.");
						return;
					}
					
					$.ajax({
							type:"post",
							url:"/post/comment/create",
							data:{"postId":postId, "content":content},
							success:function(data) {
								if(data.result == "success") {
									location.reload();
								} else {
									alert("댓글작성실패");
								}
							},
							error:function(e) {
								alert("error");
							}
					});
				});	
				$(".likeBtn").on("click", function(e) {
					e.preventDefault();
					
					var postId = $(this).data("post-id");
					
					$.ajax({
						type:"get",
						url:"/post/like",
						data:{"postId":postId},
						success: function(data) {
							
							if(data.result == "success") {
								location.reload();
							} else {
								alert("좋아요 실패");
							}
						},
						error: function(e) {
							alert("error");
						}
						
					});
				});
			});
		</script>
	</body>
</html>