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
<link rel="stylesheet" href="/team1/css/style.css">
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
				<h1>새 비밀번호</h1>
				<hr>
				<div class="login-form">
					<form action="<c:url value="/newPw"/>" method="post" id="new-pw">
						<input type="hidden" name="id" value="${id}">
						<div class="form-group">
							<label for="pw">비밀번호:</label>
							<input type="text" class="form-control" id="pw" placeholder="비밀번호" name="pw">
							<label class="pw-error" class="error text-danger" for="pw"></label>
						</div>
						<div class="form-group">
							<label for="pw2">비밀번호 확인:</label>
							<input type="text" class="form-control" id="pw2" placeholder="비밀번호 확인" name="pw2">
							<label class="pw2-error" class="error text-danger" for="pw2"></label>
						</div>
						<div class="form-actions">
							<button class="btn btn-outline-success">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			$("#new-pw").validate({
				rules : {
					pw : {
						required: true,
			            regex: /^[a-zA-Z0-9!@#]{6,15}$/
					},
					pw2 : {
						equalTo : pw
					}
				}, 
				messages : {
					pw : {
						required: "필수 항목입니다.",
			            regex: "비밀번호는 6~15자의 영문 대소문자, 숫자, 특수문자(!@#)로만 구성해야 합니다."
					},
					pw2 : {
						equalTo : "입력하신 비밀번호와 일치해야 합니다."
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