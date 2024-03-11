<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
				<form class="d-flex">
					<input class="form-control me-2" type="text"
						placeholder="검색어를 입력하세요" name="search" id="search">
				</form>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="<c:url value="/login" />">로그인</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/signup" />">회원가입</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>