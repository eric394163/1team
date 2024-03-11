<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/team1/css/style.css" />
<style type="text/css">
	.main-wrap{ background-color: #212529; }
	.inner-wrap{  width: 1440px; max-width: 100%; min-height: 1000px;  margin: 0 auto; display: flex; background-color: #fff; align-items: stretch;  }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="main-wrap">
			<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp"/>
			<div class="main-contents">
				<!-- 메인페이지에서만 보이는 것 인클루드 -->
				<div>
					<a href="<c:url value="/post/insert" />">게시글 쓰기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>


    



 
