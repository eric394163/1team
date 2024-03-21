<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>아이디 찾기</title>
<link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<link rel="stylesheet" href="/team1/css/loginStyle.css">
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
				<div class="login-form login">
					<div class="login_title_wrap">
		            	<h2>PLAY GROUND - 비밀번호 찾기</h2>
		            </div>
					<form action="<c:url value="/findPw"/>" method="post" id="find-pw">
						<div class="form-group">
							<label for="email">아이디:</label>
							<input type="text" class="form-control" id="id" placeholder="아이디" name="id">
							<label class="id-error" class="error text-danger" for="id"></label>
						</div>
						<div class="form-group">
							<label for="email">이메일:</label>
							<input type="text" class="form-control" id="email" placeholder="이메일" name="email">
							<label class="email-error" class="error text-danger" for="email"></label>
						</div>
						<div class="form-group">
							<label for="birth">생년월일:</label>
							<input type="text" class="form-control" id="birth" placeholder="yyyy-MM-dd" name="birth">
							<label class="birth-error" class="error text-danger" for="birth"></label>
						</div>
						<div class="form-actions login">
							<button class="btn btn-dark">비밀번호 찾기</button>
						</div>
						<ul class="bottom-text">
							<li><a href="<c:url value="/login"/>">로그인</a></li>
			              	<li><a href="<c:url value="/findId"/>">아이디찾기</a></li>
		                </ul>
					</form>
					<div class="bottom-img-box">
		            	<img alt="배경" src="<c:url value="/images/face_mask_icon.svg" />" width="300">
		            	<p>아직도 아니 나니?</p>
		            </div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			$("#find-pw").validate({
				rules : {
					id : {
						required : true,
						regex : /^\w{6,13}$/
					},
					email : {
						required : true,
						email : true
					},
					birth : {
						required : true,
						regex : /(^\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/
					}
				}, 
				messages : {
					id : {
						required : "필수 항목입니다.",
						regex : "아이디는 숫자 영문 6~13자입니다."
					},
					email : {
						required : "필수 항목입니다.",
						email : "이메일 형식이 아닙니다."
					},
					birth : {
						required : "필수 항목입니다.",
						regex : "yyyy-MM-dd형식으로 입력해야 합니다."
					}
				}
			});
			$.validator.addMethod(
					"regex",
					function (value, element, regexp){
						var re= new RegExp(regexp);
						return this.optional(element) || re.test(value);
					},
					"정규표현식에 맞지 않습니다."
			)
		});
</script>
</body>
</html>