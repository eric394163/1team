<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
  
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/team1/css/common.css" />
    <link rel="stylesheet" href="/team1/css/style.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery Validation  -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="main-contents">
          <div class="login-form">
            <h2>회원가입</h2>
            <form
              action="<%=request.getContextPath()%>/signup"
              method="post"
              id="signupForm" // form id 확인 
            >
              <div class="form-group">
                <label for="id">아이디:</label>
                <input
                  type="text"
                  class="form-control"
                  id="id"
                  name="id"
                  required
                />
              </div>
              <div class="form-group">
                <label for="email">이메일:</label>
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="email"
                  required
                />
              </div>
              <div class="form-group">
                <label for="pw">비밀번호:</label>
                <input
                  type="password"
                  class="form-control"
                  id="pw"
                  name="pw"
                  required
                />
              </div>
              <div class="form-group">
                <label for="confirmPassword">비밀번호 확인:</label>
                <input
                  type="password"
                  class="form-control"
                  id="confirmPassword"
                  name="confirmPassword"
                  required
                />
              </div>
              <div class="form-group">
                <label for="nickname">닉네임:</label>
                <input
                  type="text"
                  class="form-control"
                  id="nickname"
                  name="nickname"
                  required
                />
              </div>
              <div class="form-group">
                <label for="birth">생일:</label>
                <input
                  type="date"
                  class="form-control"
                  id="birth"
                  name="birth"
                  required
                />
              </div>

              <div class="form-actions">
                <button type="submit" class="btn btn-primary">가입하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script type="text/javascript">
      $(document).ready(function () { 
        $("#signupForm").validate({ // form id 확인 
          rules: {
            id: {
              required: true,
              regex: /^\w{6,12}$/,
            },
            email: {
              required: true,
              email: true,
            },
            pw: {
              required: true,
              regex: /^[a-zA-Z0-9!@#]{6,15}$/,
            },
            confirmPassword: {
              equalTo: "#pw",
            },
            nickname: {
              required: true,
              regex: /^[a-zA-Z0-9가-힣_]{2,10}$/,
            },
            birth: {
              //오늘 날짜 이전 선택 불가
              max: new Date().toISOString().split("T")[0],
              required: true,
            },
          },
          messages: {
            id: {
              required: "필수 항목입니다.",
              regex:
                "아이디는 6~12자의 영문 대소문자와 숫자로만 구성해야 합니다.",
            },
            email: {
              required: "필수 항목입니다.",
              email: "올바른 이메일 주소를 입력해주세요.",
            },
            pw: {
              required: "필수 항목입니다.",
              regex:
                "비밀번호는 6~15자의 영문 대소문자, 숫자, 특수문자(!@#)로만 구성해야 합니다.",
            },
            confirmPassword: {
              equalTo: "입력하신 비밀번호와 일치해야 합니다.",
            },
            nickname: {
              required: "필수 항목입니다.",
              regex:
                "닉네임은 2~10자의 영문 대소문자, 숫자, 한글, 밑줄(_)로만 구성해야 합니다.",
            },
            birth: {
              max: "오늘 날짜 이전으로 선택해주세요.",
              required: "필수 항목입니다.",
            },
          },
        });

        $.validator.addMethod(
          "regex",
          function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
          },
          "Please check your input."
        );
      });
    </script>
  </body>
</html>
