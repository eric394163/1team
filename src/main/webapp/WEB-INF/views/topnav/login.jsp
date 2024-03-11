<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="/team1/css/style.css" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <!-- 로그인 폼 추가 -->
        <div class="main-contents">
          <div class="login-form">
            <form action="<%=request.getContextPath()%>/login" method="post">
              <div class="form-group">
                <label for="username">아이디:</label>
                <input
                  type="text"
                  id="id"
                  placeholder="아이디"
                  name="id"
                  required
                />
              </div>
              <div class="form-group">
                <label for="password">비밀번호:</label>
                <input
                  type="password"
                  id="pw"
                  placeholder="비밀번호"
                  name="pw"
                  required
                />
              </div>
              <div class="form-actions">
                <button type="submit">로그인</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>