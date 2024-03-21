<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 카테고리 등록</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/adminStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/admin/aside.jsp" />
			<div class="main-contents">
				<!-- 내용채우기 -->
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>관리자페이지 - 카테고리 등록</h2>
	        	</div>
	        	<div class="admin-box">
	        		<h3>▣ 기존 카테고리 리스트</h3>
	        		<ul class="category-list">
	        			<c:forEach items="${categoryList}" var="category" begin="0" varStatus="status">
	        				<li>
	        					<span class="category-num">${status.index + 1}</span>
	        					<span class="category-name">${category.category_name}</span>
	        				</li>
	        			</c:forEach>
	        		</ul>
	        		<form action="<c:url value="/admin/categoryinsert" />" method="post">
	        			<div class="form-group">
	        				<label for="category">새로운 카테고리명 입력 : </label>
	        				<input type="text" id="category" name="category" class="form-control" placeholder="기존 카테고리와는 다른 카테고리명으로 입력하세요." required />
	        				<button type="submit" class="btn btn-dark">카테고리추가</button>
	        			</div>
	        		</form>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>