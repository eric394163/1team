<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 카테고리 수정/삭제</title>
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
	        		<h2>관리자페이지 - 카테고리 수정/삭제</h2>
	        	</div>
	        	<div class="admin-box">
	        		<div class="h3-title-wrap">
	        			<h3>▣ 기존 카테고리 리스트</h3>
	        			<p>
		        			<img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="16"> : 수정,
		        			<img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="16"> : 삭제
		        		</p>
	        		</div>
	        		<ul class="category-list category-update">
	        			<c:forEach items="${categoryList}" var="category" begin="0" varStatus="status">
	        				<li>
	        					<form action="<c:url value="/admin/categoryupdate" />" class="left-box">
		        					<span class="category-num">${status.index + 1}</span>
		        					<input type="text" class="category-name" name="category_name" value="${category.category_name}" readonly>
		        					<button type="submit" class="btn btn-dark">수정</button>
	        					</form>
	        					<div class="right-box">
	        						<a href="#update" class="category-update"><img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="20"></a>
	        						<c:url value="/admin/categorydelete" var="url">
	        							<c:param name="categoryNum" value="${category.category_id}" />
	        						</c:url>
		        					<a href="${url}" class="category-delete"><img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="20"></a>
	        					</div>
	        				</li>
	        			</c:forEach>
	        		</ul>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script type="text/javascript">
		//업데이트(연필) 아이콘 클릭했을 때
		$('.category-update').click(function(){
			//해당 input태그 - readonly속성 추가
			$(this).parents('li').find('.category-name').prop('readonly', false);
			
			//해당 버튼 보이게 처리
			$(this).parents('li').find('.btn-dark').show();
		});
	</script>
  </body>
</html>