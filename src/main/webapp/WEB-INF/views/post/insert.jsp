<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> post insert </title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<style type="text/css">
	.inner-wrap {
		display: flex;
	}
	
	aside {
		width: 20%;
	}
	
	div.main-contents {
		display: flex;
	    justify-content: center;
	    width: 80%;
	    margin: auto;
	}
	
	form>div {
		width: 100%;
	}
	
	.insert-form {
	    width: 80%;
	    display: flex;
	    justify-content: flex-start;
	    flex-wrap: wrap;
	    margin-bottom: 30px;
	}
	
	hr {
		width: 100%;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="main-wrap">
			<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<form action="<c:url value="/post/insert"/>" method = "post" enctype ="multipart/form-data" class="insert-form">
					<h3>게시글 쓰기</h3> 
					<hr>
					<div class="mb-3 mt-3">
					    <label for="board" class="form-label">게시판 선택</label>
					    <select class="form-control" id="board" name="board" required="required">
						    <option value="" selected disabled hidden>게시판을 선택해주세요.</option>
					    	<c:forEach items="${list}" var="board">
								<option value="${board.board_id}">${board.board_name}</option>
					    	</c:forEach>
					    </select>
					</div>
					<div class="mb-3 mt-3">
					    <label for="title" class="form-label">제목</label>
					    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
					 </div>
					 <div class="mb-3 mt-3">
					    <label for="content" class="form-label">내용</label>
					    <textarea rows="10" class="form-control" id="content" placeholder="내용을 입력하세요" name="content" ></textarea>
					 </div>
					<!--  <div class="mb-3 mt-3">
					    <label for="content" class="form-label">첨부파일</label>
					    <input type="file" class="form-control" name="file">
					    <input type="file" class="form-control" name="file">
			           	<input type="file" class="form-control" name="file">
					 </div> -->
					 <button class="btn btn-outline-warning col-12">게시글 등록</button>
				</form>				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	 
	</script>
</body>
</html>