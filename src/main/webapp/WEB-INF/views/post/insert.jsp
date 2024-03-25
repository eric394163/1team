<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PlayGround - 게시글 쓰기</title>
	<link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="main-wrap">
			<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<div class="h2_title_wrap">
					<h2>게시글 쓰기</h2> 
				</div>
				<form action="<c:url value="/post/insert"/>" method = "post" enctype ="multipart/form-data" class="insert-form">
					<div class="form-row">
					    <label for="board" class="form-label">게시판 선택</label>
					    <select class="form-control second-box" id="board" name="board"  required="required">
						    <option value="" selected disabled hidden>게시판을 선택해주세요.</option>
						    <c:choose>
								<c:when test="${user.user_role == '사용자'}">
									<c:forEach items="${list}" var="board" begin="2">
										<option value="${board.board_id}">${board.board_name}</option>
									</c:forEach>
								</c:when>
								<c:when test="${user.user_role == '관리자' || user.user_role == '운영자'}">
									<c:forEach items="${list}" var="board">
										<c:if test="${board.board_id != 2}">
											<option value="${board.board_id}">${board.board_name}</option>
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
						</select>
					    <span class="icon">▼</span>
					</div>
					<div class="form-row">
					    <label for="title" class="form-label">제목</label>
					    <input type="text" class="form-control second-box" id="title" placeholder="제목을 입력하세요" name="title">
					 </div>
					 <div class="form-row content">
					    <label for="content" class="form-label">내용</label>
					    <textarea rows="10" class="form-control second-box" id="content" name="content" ></textarea>
					 </div>
					<div class="form-row content">
					    <label for="file" class="form-label">첨부파일</label>
					    <div class="file-box">
					    	<input type="file" class="form-control second-box file" name="file">
						    <input type="file" class="form-control second-box file" name="file">
						    <input type="file" class="form-control second-box file" name="file">
					    </div>
					 </div>
					 <div class="form-row">
					    <label for="youtube" class="form-label">링크</label>
					    <input type="text" class="form-control second-box" name="youtube" placeholder="http:// 혹은 https:// 로 시작하는 주소를 입력하세요.">
					 </div>
					 <div class="form-row last">
					 	<button class="btn btn-dark">게시글 등록</button>
					 </div>
				</form>				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$('#content').summernote({
		  placeholder: '내용을 입력하세요.',
		  tabsize: 2,
		  height: 400
		});
	</script>
</body>
</html>