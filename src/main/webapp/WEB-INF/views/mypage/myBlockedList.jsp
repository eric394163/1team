<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 마이페이지 - 내가 차단한 목록보기</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
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
	        		<h2>마이페이지 - 내가 차단한 목록보기</h2>
					<table class="table">
						<thead class="table-dark">
							<tr>
								<th>번호</th>
								<th>차단한 사용자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="user">
								<tr>
									<td>${user.blocked_id}</td>
									<td>${user.blocked_user_id}</td>
								</tr>
							</c:forEach>
							<c:if test="${list.size() == 0 }">
								<tr>
									<th colspan="5">
										<h4 class="text-center">차단한 사용자가 없습니다.</h4>
									</th>
								</tr>
							</c:if>
						</tbody>
					</table>
					<ul class="pagination justify-content-center">
						<c:if test="${pm.prev }">
							<li class="page-item">
								<c:url var="prevUrl" value="/">
									<c:param name="type" value="${pm.cri.type}" />
									<c:param name="search" value="${pm.cri.search}" />
									<c:param name="page" value="${pm.startPage-1}" />
								</c:url>
							<a class="page-link" href="${prevUrl}">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
							<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
								<c:url var="page" value="/">
									<c:param name="type" value="${pm.cri.type}" />
									<c:param name="search" value="${pm.cri.search}" />
									<c:param name="page" value="${i}" />
								</c:url>
								<a class="page-link" href="${page }">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${pm.next }">
							<li class="page-item">
								<c:url var="nextUrl" value="/">
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
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>