<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PlayGround - 게시글 리스트</title>
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
	        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
	        <div class="main-contents">
	          	<div class="h2_title_wrap">
	        		<h2>${board.board_name }</h2>
	        		<div class="title_btn">
	        			<c:if test="${user != null}">
	        				<a href="<c:url value="/post/insert" />" class="btn btn-outline-dark">게시판쓰기</a>
	        			</c:if>
	        		</div>
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
						<c:forEach items="${list}" var="post">
							<c:choose>
								<c:when test="${pm.cri.boNum == 2}">
									<tr>
										<td>${post.post_id}</td>
										<td>${post.board.board_name}</td>
										<td>
											<c:url var="url" value="/post/detail">
												<c:param name="num" value="${post.post_id}" />
											</c:url>
											<a href="${url}">${post.post_title}</a>
										</td>
										<td>
											<c:url var="page" value="/board/list">
												<c:param name="type" value="writer" />
												<c:param name="search" value="${post.post_user_id}" />
												<c:param name="page" value="1" />
												<c:param name="boNum" value="${pm.cri.boNum}" />
											</c:url>
											<a href="${page}">${post.user.user_nickname}</a>
										</td>
										<td>${post.post_view}</td>
									</tr>
								</c:when>
								<c:when test="${post.post_board_num == pm.cri.boNum }">
									<tr>
										<td>${post.post_id}</td>
										<td>${board.board_name}</td>
										<td>
											<c:url var="url" value="/post/detail">
												<c:param name="num" value="${post.post_id}" />
											</c:url>
											<a href="${url}">${post.post_title}</a>
										</td>
										<td>
											<c:url var="page" value="/board/list">
												<c:param name="type" value="writer" />
												<c:param name="search" value="${post.post_user_id}" />
												<c:param name="page" value="1" />
												<c:param name="boNum" value="${pm.cri.boNum}" />
											</c:url>
											<a href="${page}">${post.user.user_nickname}</a>
										</td>
										<td>${post.post_view}</td>
									</tr>
								</c:when>
								<c:when test="${list.size() == 0 }">
									<tr>
										<th colspan="5">
											<h3 class="text-center">등록된 게시글이 없습니다.</h3>
										</th>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item">
							<c:url var="prevUrl" value="/board/list">
								<c:param name="type" value="${pm.cri.type}" />
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${pm.startPage-1}" />
								<c:param name="boNum" value="${pm.cri.boNum}" />
							</c:url>
							<a class="page-link" href="${prevUrl}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="i">
						<c:url var="page" value="/board/list">
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${i}" />
							<c:param name="boNum" value="${pm.cri.boNum}" />
						</c:url>
						<li class="page-item <c:if test="${pm.cri.page == i }">active</c:if>">
							<a class="page-link" href="${page}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next }">
						<li class="page-item">
							<c:url var="nextUrl" value="/board/list">
								<c:param name="type" value="${pm.cri.type}" />
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${pm.endPage+1}" />
								<c:param name="boNum" value="${pm.cri.boNum}" />
							</c:url>
							<a class="page-link" href="${nextUrl}">다음</a>
						</li>
					</c:if>
				</ul>
				<form action="<c:url value="/board/list"/>" class="mb-3 mt-3" id="seachbox">
					<div class="input-group">
						<input type="hidden" name="boNum" value="${pm.cri.boNum}">
						<input type="hidden" name="page" value="1">
						<select name="type" class="form-control" id="search-select">
							<c:if test='${pm.cri.type == "all" }'>selected</c:if>
							<option value="all" <c:if test='${pm.cri.type == "all" }'>selected</c:if>>제목+작성자</option>
							<option value="title" <c:if test='${pm.cri.type == "title" }'>selected</c:if>>제목</option>
							<option value="writer" <c:if test='${pm.cri.type == "writer" }'>selected</c:if>>작성자</option>
						</select>
						<input type="text" class="form-control" id="search-input" placeholder="검색어" name="search" value="${pm.cri.search}">
						<button class="btn btn-dark col-2" id="search-btn">검색</button>
					</div>
				</form>
	        </div>
	      </div>
	    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>