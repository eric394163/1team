<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 운영자 관리</title>
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
			<jsp:include page="/WEB-INF/views/admin/aside.jsp" />
			<div class="main-contents">
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>관리자페이지 - 운영자 관리</h2>
	        	</div>
				<!-- 내용채우기 -->
				<input type='checkbox' name='authory' value='selectall' onclick='selectAll(this)'/> 전체 선택
				<form action="<c:url value="/admin/usermanage" />" method="post">
					<button type="submit" class="btn btn-dark" style="display: inline-block;">운영자 선정</button>
					<button type="submit" class="btn btn-dark" style="display: inline-block;">운영자 해제</button>
				
					<table class="table table hover">
						<thead>
							<tr>
								<th></th>
								<th>권한</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>생년월일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="user">
								<tr>
									<td><input type='checkbox' name='authory' value='${user.user_id}'></td>
									<td>${user.user_role}</td>
									<td>${user.user_id}</td>
									<td>${user.user_nickname}</td>
									<td>${user.user_email}</td>
									<td><fmt:formatDate value="${user.user_birth}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
							<c:if test="${list.size() == 0 }">
								<tr>
									<th colspan="5">
										<h4 class="text-center">등록된 사용자가 없습니다.</h4>
									</th>
								</tr>
							</c:if>
						</tbody>
					</table>
				</form>
				<ul class="pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<c:url var="prevUrl" value="/admin/usermanager">
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${pm.startPage-1}" />
						</c:url>
						<a class="page-link" href="${prevUrl}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
						<c:url var="page" value="/admin/usermanager">
							<c:param name="type" value="${pm.cri.type}" />
							<c:param name="search" value="${pm.cri.search}" />
							<c:param name="page" value="${i}" />
						</c:url>
						<a class="page-link" href="${page }">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<c:url var="nextUrl" value="/admin/usermanager">
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
	<script type="text/javascript">
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('authory');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	</script>
  </body>
</html>