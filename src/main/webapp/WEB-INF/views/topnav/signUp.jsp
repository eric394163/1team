<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <!-- 부트스트랩5 css/js -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/style.css">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="main-contents">
          <div class="login-form">
            <h2>회원가입</h2>
            <form action="<%=request.getContextPath()%>/signup" method="post">
              <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" required />
              </div>
              <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required />
              </div>
              <div class="form-group">
                <label for="pw">비밀번호:</label>
                <input type="password" id="pw" name="pw" required />
              </div>
              <div class="form-group">
                <label for="confirmPassword">비밀번호 확인:</label>
                <input
                  type="password"
                  id="confirmPassword"
                  name="confirmPassword"
                  required
                />
              </div>

              <div class="form-group">
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" required />
              </div>

              <div class="form-group">
                <label for="birth">생일:</label>
                <input type="date" id="birth" name="birth" required />
              </div>

              <div class="form-actions">
                <button type="submit">가입하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
