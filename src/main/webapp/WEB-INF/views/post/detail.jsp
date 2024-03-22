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
								<button class="btn btn-outline-success btn-up col=6">추천</button>
								<button class="btn btn-outline-success btn-down col=6">비추천</button>
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="content" class="form-label">내용</label>
						    <div class="form-control" style="min-height : 300px;">${post.post_content}</div>
						 </div>
						 <c:if test="${fileList != null && fileList.size() != 0}">
						 	 <div class="mb-3 mt-3">
							 		 <label for="file" class="form-label">첨부파일</label>
						 			 <c:forEach items="${fileList}" var="file">
								 		 <c:if test="${file.attach_link_check == 0}">
						 					 <a href="<c:url value="/download?filename=${file.attach_path}" />" class="form-control" download="${file.attach_path}">${file.attach_path}</a>
								 		 </c:if>
						 			 </c:forEach>
						 	 </div>
						 </c:if>
						 <c:if test="${link != null && link != ''}">
							 <div class="mb-3 mt-6">
						    		<c:if test="${link.attach_link_check == 1}">
									    <label for="link" class="form-label">링크</label>
						    			<a href="<c:url value="${link.attach_path}" />" class="form-control">${link.attach_path}</a> 
						    		</c:if>
							 </div>
						 </c:if>
						 <c:url value="/board/list" var="url">
						 	<c:param name="boNum" value="${post.post_board_num}" />
						 	<c:param name="page" value="${page}" />
						 	<c:param name="type" value="all" />
						 </c:url>
						 <a href="${url}" class="btn btn-outline-dark">목록으로</a>
						 <c:if test="${post.post_user_id == user.user_id}">
							 <a href="<c:url value="/post/update?num=${post.post_id}"/>" class="btn btn-outline-danger">수정</a>
							 <a href="<c:url value="/post/delete?num=${post.post_id}"/>" class="btn btn-outline-danger">삭제</a>
						 </c:if>
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