<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 뮤직 커뮤니티</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="main-contents">
        	<div class="h2_title_wrap">
        		<h2>${board.board_name}</h2>
        		<div class="title_btn">
        			<button type="button" class="btn btn-outline-dark">게시판쓰기</button>
        			<button type="button" class="btn btn-outline-dark">게시판목록</button>
        		</div>
        	</div>
        	<table class="table">
				<thead class="table-dark">
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="post">
					<c:if test="${post.post_board_num == board_id }">
						<tr>
							<td>[${board.board_name}]</td>
							<td>
								<c:url var="url" value="/post/subdetail">
									<c:param name="num" value="${post.post_id}" />
								</c:url>
								<a href="${url}">${post.post_title}</a>
							</td>
							<td>
								<c:url var="page" value="/post/sublist">
									<c:param name="type" value="writer" />
									<c:param name="search" value="${post.post_user_id}" />
									<c:param name="page" value="1" />
								</c:url>
								${post.post_user_id }
							</td>
							<td>${post.post_view }</td>
						</tr>
					</c:if>
					</c:forEach>
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="4">
								<h3 class="text-center">등록된 게시글이 없습니다.</h3>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<form action="<c:url value="/post/sublist"/>" class="mb-3 mt-3" id="seachbox">
				<div class="input-group">
					<select name="type" class="form-control" id="search-select">
						<c:if test='${pm.cri.type == "all" }'>selected</c:if>
						<option value="all" <c:if test='${pm.cri.type == "all" }'>selected</c:if>>전체</option>
						<option value="title" <c:if test='${pm.cri.type == "title" }'>selected</c:if>>제목</option>
						<option value="writer" <c:if test='${pm.cri.type == "writer" }'>selected</c:if>>작성자</option>
					</select>
					<input type="text" class="form-control" id="search-input" placeholder="검색어" name="search" value="${pm.cri.search }">
					<button class="btn btn-dark col-2" id="search-btn">검색</button>
				</div>
			</form>
			<ul class="pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<c:url var="prevUrl" value="/post/sublist">
							<c:param name="boNum" value="${board_id}" />
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${pm.startPage-1}" />
						</c:url>
						<a class="page-link" href="${prevUrl}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="i">
					<li class="page-item <c:if test="${pm.cri.page == i }">active</c:if>">
						<c:url var="page" value="/post/sublist">
							<c:param name="boNum" value="${board_id}" />
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${i}" />
						</c:url>
						<a class="page-link" href="${page}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next }">
					<li class="page-item">
						<c:url var="nextUrl" value="/post/sublist">
							<c:param name="boNum" value="${board_id}" />
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
