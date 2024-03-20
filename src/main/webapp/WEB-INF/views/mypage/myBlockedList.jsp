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
	        		<h2>마이페이지 - 내가 차단한 목록보기</h2>
	        	</div>
	        	<div class="all-check-area">
	        		<button type="button" class="btn btn-outline-dark">선택차단해제</button>
	        	</div>
	        	<table class="table block-table">
					<thead class="table-dark">
						<tr>
							<th><input type="checkbox" id="all-chk" /></th>
							<th>번호</th>
							<th>차단한 사용자</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="user">
							<tr>
								<td><input type="checkbox" class="block-chk"></td>
								<td>${user.blocked_id}</td>
								<td>${user.blocked_user_id}</td>
								<td><button type="button" class="btn btn-outline-dark">차단해제</button></td>
							</tr>
						</c:forEach>
						<c:if test="${list.size() == 0 }">
							<tr>
								<th colspan="4">차단한 사용자가 없습니다.</th>
							</tr>
						</c:if>
					</tbody>
				</table>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev }">
						<li class="page-item">
							<c:url var="prevUrl" value="/">
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${pm.startPage-1}" />
							</c:url>
						<a class="page-link" href="${prevUrl}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
							<c:url var="page" value="/">
								<c:param name="search" value="${pm.cri.search}" />
								<c:param name="page" value="${i}" />
							</c:url>
							<a class="page-link" href="${page }">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next }">
						<li class="page-item">
							<c:url var="nextUrl" value="/">
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
	
	<script type="text/javascript">
		//모두체크를 체크하면, 클래스가 block-chk가 모두 체크, 그렇지 않으면 미체크
		//prop() : 태그의 속성을 컨트롤하는 메서드
		//게터 - prop('checked') : true/false로 얻어오는 게터
		//세터 - prop('checked', true/false) : true/false로 변경하는 세터
		
	</script>
  </body>
</html>