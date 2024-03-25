<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 게시판 등록</title>
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
	        		<h2>관리자페이지 - 게시판 등록</h2>
	        	</div>
	        	<div class="admin-box">
	        		<div class="h3-title-wrap">
	        			<h3>▣ 카테고리 선택</h3>
	        		</div>
	        		<form action="<c:url value="/admin/boardinsert" />" method="post">
	        			
	        			<select class="form-control" id="category" name="category">
					    	<c:forEach items="${categoryList}" var="category">
					    		<option value="${category.category_id}">${category.category_name}</option>
					    	</c:forEach>
					    </select>
	        			<div class="form-group insert-box">
	        				<label for="category">새로운 게시판명 입력 : </label>
	        				<input type="text" id="board" name="board" class="form-control mb-1" placeholder="기존 게시판과는 다른 게시판명으로 입력하세요." required />
	        				<button type="submit" class="btn btn-dark">게시판추가</button>
	        			</div>
	        		</form>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>