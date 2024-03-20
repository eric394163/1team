<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>		
<div class="main-wrap">
	<div class="inner-wrap">
		<jsp:include page="/WEB-INF/views/common/aside.jsp" />
		<div class="main-contents">
			<c:choose>
				<c:when test="${post != null }">
					<h1>게시글 상세</h1>
					<div>
						<div class="mb-3 mt-3">
						    <label for="community" class="form-label">게시판</label>
						    <input type="text" class="form-control" id="community" name="community" readonly value="${post.board.board_name}">
						</div>	
						 <div class="mb-3 mt-3">
						    <label for="writer" class="form-label">작성자</label>
						    <input type="text" class="form-control" id="writer" name="writer" value = "${post.post_user_id}" readonly>
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="date" class="form-label">작성일</label>
						    <fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd" /> 
						 </div>
						<div class="mb-3 mt-3">
						    <label for="title" class="form-label">제목</label>
						    <input type="text" class="form-control" id="title" name="title" readonly value="${post.post_title}">
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="view" class="form-label">조회수 :</label>
						    <input type="text" class="form-control" id="view" name="view" value = "${post.post_view}" readonly>
						 </div>
						 <div class="mb-3 mt-3">
						    <!-- <label for="view" class="form-label">추천수 :</label> -->
								<button class="btn btn-outline-success btn-up col=6">추천(${post.upvotes})</button>
								<button class="btn btn-outline-success btn-down col=6">비추천(${post.downvotes})</button>
						 </div>
						 
						 <div class="mb-3 mt-3">
						    <label for="content" class="form-label">내용</label>
						    <div class="form-control" style="min-height : 300px;">${post.post_content}</div>
						 </div>
						<div class="mb-3 mt-3">
						    <label for="file" class="form-label">첨부파일</label>
						    <c:choose>
								<c:when test="">
									<a href="<c:url value=""/>"></a>
								</c:when>
								<c:otherwise>
									<div>첨부파일 없음</div>
								</c:otherwise>
							</c:choose>
					    	<c:if test="${attach.attach_link_check == 0}">
						    	<c:forEach items="${fileList}" var="file">
						    		<a href="<c:url value="/download?filename=${attach.attach_path}" />" class="form-control" download="${attach.attach_path}">${attach.attach_path}</a>
						    	</c:forEach>
					    	</c:if>
						 </div>
						 <div class="mb-3 mt-6">
						    <label for="youtube" class="form-label">링크</label>
						    	<c:if test="${attach.attach_link_check == 1}">
							    	<a href="<c:url value="${attach.attach_path}" />"></a>
						    	</c:if>
						 </div>
						 <a href="<c:url value="/post/list" />" class="btn btn-outline-dark">목록으로</a>
					</div>
				</c:when>
				<c:otherwise>
					<h1>등록되지 않은 게시글이거나 삭제된 게시글입니다.</h1>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>