<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 마이페이지 - 좋아요 누른 게시글 확인</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/mypage/aside.jsp" />
			<div class="main-contents">
				<!-- 내용채우기 -->
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>마이페이지 - 좋아요 누른 게시글 확인</h2>
	        	</div>
	        	<table class="table">
					<thead class="table-dark">
						<tr>
							<th>번호</th>
							<th>게시판</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myList}" var="post">
							<tr>
								<td>${post.post_id}</td>
								<td>${post.board.board_name}</td>
								<td>
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${post.post_id}" />
									</c:url>
									<a href="${url}">${post.post_title}</a>
								</td>
								<td>${post.post_user_id}</td>
								<td>${post.post_view}</td>
							</tr>
						</c:forEach>
						<c:if test="${myList.size() == 0 }">
							<tr>
								<th colspan="5" class="text-center">등록된 게시글이 없습니다.</th>
							</tr>
						</c:if>
					</tbody>
				</table>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item">
							<c:url var="prevUrl" value="/mypage/commentlist">
								<c:param name="type" value="${pm.cri.type}" />
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${pm.startPage-1}" />
							</c:url>
							<a class="page-link" href="${prevUrl}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="i">
						<c:url var="page" value="/mypage/commentlist">
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${i}" />
						</c:url>
						<li class="page-item <c:if test="${pm.cri.page == i }">active</c:if>">
							<a class="page-link" href="${page}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next }">
						<li class="page-item">
							<c:url var="nextUrl" value="/mypage/commentlist">
								<c:param name="type" value="${pm.cri.type}" />
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${pm.endPage+1}" />
							</c:url>
							<a class="page-link" href="${nextUrl}">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>