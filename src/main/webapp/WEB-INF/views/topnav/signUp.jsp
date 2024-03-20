<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 회원가입</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/team1/css/common.css" />
    <link rel="stylesheet" href="/team1/css/loginStyle.css" />
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
            <div class="login_title_wrap">
            	<h2>PLAY GROUND 회원가입</h2>
            </div>
            <p>** 모든 입력창은 작성해줘야 합니다.</p>
            <form
              action="<%=request.getContextPath()%>/signup"
              method="post"
              id="signupForm" 
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
                <label id="id-error2" class="error"></label>          
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
                <label id="id-error3" class="error"></label> 
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
                <button type="submit" class="btn btn-dark">가입하기</button>
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
              required: true
              //regex: /^\w{6,12}$/,
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
              //오늘 날짜 이후 선택 불가
              max: new Date().toISOString().split("T")[0],
              required: true,
            },
          },
          messages: {
            id: {
              required: "필수 항목입니다."
              //regex: "아이디는 6~12자의 영문 대소문자와 숫자로만 구성해야 합니다.",
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
              required: "필수 항목입니다.",
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
          "정규표현식에 맞지 않습니다."
        );
      });
    </script>
    
    <!-- 아이디 중복관련 -->
    <script type="text/javascript">
	    let flag1 = false;
		$('[name=id]').on('input',function(){
			$('#id-error2').text("");
			$('#id-error2').hide();
			
			let id = $(this).val();
	
			if(id == ''){
				$('#id-error2').text('아이디를 입력하세요.');
				$('#id-error2').css('color','red');
				$('#id-error2').show();
				return;
			}
			let idRegex = /^\w{6,12}$/;
			if(!idRegex.test(id)){
				$('#id-error2').text('아이디는 6~12자의 영문 대소문자와 숫자로만 구성해야 합니다.');
				$('#id-error2').css('color','red');
				$('#id-error2').show();
				return;
			}
		
			
			$.ajax({ //제이쿼리에서 제공하는 비동기 통신
				url: '<c:url value="/id/check"/>',
				method: 'get',
				async: true, //동기/비동기 선택, true: 비동기, false: 동기
				data: {
					'id': id
				},
				success: function(data){
					if(data && id){
						$('#id-error2').text('사용 가능한 아이디입니다.');
						$('#id-error2').css('color','green');
						$('#id-error2').show();
						flag = true;
					}else{
						$('#id-error2').text('이미 사용중인 아이디입니다.');
						$('#id-error2').css('color','red');
						$('#id-error2').show();
					}
				},
				error: function(a,b,c){
					console.log('예외 발생');
				}
			}); 
		});
		
		$('[name=id]').change(function(){
			flag1 = false;
		});
    </script>
    
    <!-- 이메일 중복관련 -->
    <script type="text/javascript">
	    let flag2 = false;
		$('[name=email]').on('input',function(){
			$('#id-error3').text("");
			$('#id-error3').hide();
			
			let email = $(this).val();
	
			if(email == ''){
				$('#id-error3').text('이메일을 입력하세요.');
				$('#id-error3').css('color','red');
				$('#id-error3').show();
				return;
			}

			
			$.ajax({ //제이쿼리에서 제공하는 비동기 통신
				url: '<c:url value="/email/check"/>',
				method: 'get',
				async: true, //동기/비동기 선택, true: 비동기, false: 동기
				data: {
					'email': email
				},
				success: function(data){
					if(data && email){
						$('#id-error3').text('사용 가능한 이메일입니다.');
						$('#id-error3').css('color','green');
						$('#id-error3').show();
						flag = true;
					}else{
						$('#id-error3').text('이미 사용중인 이메일입니다.');
						$('#id-error3').css('color','red');
						$('#id-error3').show();
					}
				},
				error: function(a,b,c){
					console.log('예외 발생');
				}
			}); 
		});
		
		$('[name=email]').change(function(){
			flag2 = false;
		});
    </script>
  </body>
</html>
