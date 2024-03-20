<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 로그인</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/loginStyle.css">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <!-- 로그인 폼 추가 -->
        <div class="main-contents">
          <div class="login-form login">
            <div class="login_title_wrap">
            	<h2>PLAY GROUND 로그인</h2>
            </div>
            <p>로그인 후 더 편하게 PLAY GROUND를 이용해 보세요.</p>
            <form action="<%=request.getContextPath()%>/login" method="post">
              <div class="form-group">
                <label for="username">아이디:</label>
                <input
                  type="text"
                  id="id"
                  name="id"
                  class="form-control"
                  required
                />
              </div>
              <div class="form-group">
                <label for="password">비밀번호:</label>
                <input
                  type="password"
                  id="pw"
                  name="pw"
                  class="form-control"
                  required
                />
              </div>
              <div class="form-actions login">
                <button type="submit" class="btn btn-dark">로그인</button>
              </div>
              <ul class="bottom-text">
              	<li><a href="<c:url value="/findId"/>">아이디찾기</a></li>
              	<li><a href="<c:url value="/findPw"/>">비밀번호찾기</a></li>
              </ul>
            </form>
            <div class="bottom-img-box">
            	<img alt=""배경" src="<c:url value="/images/rock_icon.svg" />" width="300">
            	<p>즐길 준비 되었는가?</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>