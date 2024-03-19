<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 마이페이지 - 회원 탈퇴</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/mypageStyle.css">
	<link rel="stylesheet" href="/team1/css/common.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/mypage/aside.jsp" />
			<div class="main-contents">
				<!-- 내용채우기 -->
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>마이페이지 - 회원 탈퇴</h2>
	        	</div>
	        	<div class="explain-box">
	        		<h3>회원탈퇴를 신청하기 전에, 다음 내용을 꼭 확인해주세요.</h3>
	        		<ul>
	        			<li>고객정보 및 개인서비스 기록은 개인정보 처리방침 기준에 따라 삭제됩니다.</li>
	        			<li>작성한 게시글과 댓글은 모두 삭제됩니다.</li>
	        			<li>회원 탈퇴 시 같은 이메일로는 다시 가입할 수 없습니다.</li>
	        			<li>회원 탈퇴 시 더이상 <span class="title">Play Ground</span> 서비스 사용이 불가능합니다.</li>
	        		</ul>
	        		<hr>
	        		<div class="check-area">
	        			<input type="checkbox" id="drop-chk" name="drop_chk">
	        			<label for="drop-chk">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
	        		</div>
	        	</div>
	        	<div class="btn-area">
	        		<a href="#btn-drop" class="btn btn-dark btn-drop">회원탈퇴</a>
	        		<a href="#btn-cancle" class="btn btn-outline-dark btn-cancle">탈퇴취소</a>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
		//취소버튼 클릭 시 메인페이지로 이동
		$('.btn-cancle').click(function(){
			alert('회원탈퇴를 취소하였습니다. 메인페이지로 이동합니다.');
			location.href = <c:url value="/" />;
		});
		
		//탈퇴버튼 클릭 시 
		$('.btn-drop').click(function(){
			//체크박스 체크 여부 확인
			let dropChk = $('#drop-chk').prop('checked');
			
			if(dropChk){
				//user/delete로 보내서 회원 탈퇴(회원정보 수정 => 이메일기록만 남기고 다른 데이터 UUID로 변경) & 회원 게시글, 댓글 삭제
				let q = confirm("정말로 탈퇴하시겠습니까?");
				let id = '${user.user_id}';
				
				if(q){ //확인버튼 눌렀다면
					$.ajax({ //제이쿼리에서 제공하는 비동기 통신
						url: '<c:url value="/user/delete"/>',
						method: 'get',
						async: true,
						data: {
							'id': id
						},
						success: function(data){
							console.log(data.id);
						},
						error: function(a,b,c){
							console.log('예외 발생');
						}
					}); 
				}else{ //취소버튼 눌렀다면
					alert('좋은 선택입니다. Play Ground서비스를 다시 이용하세요.');
					location.href = <c:url value="/" />;
				}
			}else{
				alert('안내사항에 동의해주세요.');
			}
		});
	</script>
  </body>
</html>