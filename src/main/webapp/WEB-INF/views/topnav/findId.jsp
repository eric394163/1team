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
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<h1>아이디 찾기</h1>
				<hr>
				<div class="login-form">
					<form action="<c:url value="/findId"/>" method="post">
						<div class="form-group">
							<label for="email">이메일:</label>
							<input type="text" id="email" placeholder="이메일" name="email">
							<label class="error-email" class="error text-danger" for="email"></label>
						</div>
						<div class="form-group">
							<label for="birth">생년월일:</label>
							<input type="text" id="birth" placeholder="yyyy-MM-dd" name="birth">
							<label class="error-birth" class="error text-danger" for="birth"></label>
						</div>
						<div class="form-actions">
							<button class="btn btn-outline-success">아이디 찾기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
		$("form").validate({
			rules : {
				birth : {
					required : true,
					regex : /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/
				},
				email : {
					required : true,
					email : true
				}
			}, 
			messages : {
				birth : {
					required : "필수 항목입니다.",
					regex : "yyyy-MM-dd형식으로 입력해야 합니다."
				},
				me_email : {
					required : "필수 항목입니다.",
					email : "이메일 형식이 아닙니다."
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
</script>
</body>
</html>