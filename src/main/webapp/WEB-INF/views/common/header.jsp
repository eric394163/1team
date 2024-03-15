<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Header</title>

<!-- 부트스트랩5 css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<h1>
					<a class="navbar-brand" href="<c:url value="/" />"> <img alt="LOGO"
						src="/team1/images/logo_blackversion.svg">

					</a>
				</h1>
				<form class="d-flex" action="<c:url value='/totalSearchList' />" method="get">
					<input class="form-control me-2" type="text" placeholder="검색어를 입력하세요" name="totalsearch" id="totalsearch">
					<button type="submit" class="btn btn-outline-success">검색</button>
				</form>
				
				<ul class="navbar-nav">
					<c:if test="${user == null}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/login" />">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/signup" />">회원가입</a>
						</li>
					</c:if>
					<c:if test="${user != null}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/mypage/main" />">마이페이지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/logout" />">로그아웃</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>
