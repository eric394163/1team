<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	header .navbar>.container-fluid{ width: 1440px; max-width: 100%; }
	.d-flex{
		width: 50%;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<h1>
					<a class="navbar-brand" href="<c:url value="/" />"> 
						<img
						alt="LOGO"
						src="http://playground.dothome.co.kr/logo_blackversion.svg">
					</a>
				</h1>
				<form class="d-flex">
			        <input class="form-control me-2" type="text" placeholder="검색어를 입력하세요" name="search" id="search">
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
							<a class="nav-link" href="<c:url value="/mypage" />">마이페이지</a>
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