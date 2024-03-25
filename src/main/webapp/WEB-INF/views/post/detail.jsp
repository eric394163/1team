<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PlayGround - 상세게시글보기</title>
	<link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>		
<div class="main-wrap">
	<div class="inner-wrap">
		<jsp:include page="/WEB-INF/views/common/aside.jsp" />
		<div class="main-contents">
			<div class="h2_title_wrap">
				<h2>상세게시글보기</h2> 
				<a href="<c:url value="/post/list"/>" class="btn btn-outline-dark">게시글 목록</a>
			</div>
			<c:choose>
				<c:when test="${post != null }">
					<div class="detail-box">
						 <div class="form-row">
						    <p class="board-name">${post.board.board_name}</p>
						 </div>	
						 <div class="form-row  first-line">
						    <div class="left-box">
						    	<c:if test="${writer != null && writer.user_role == '사용자'}">
						    		<img src="<c:url value="/images/face_login.svg" />" alt="얼굴아이콘" width="30" class="face-icon">
						    	</c:if>
						    	<c:if test="${writer != null && (writer.user_role == '관리자' || writer.user_role == '운영자')}">
						    		<img src="<c:url value="/images/face_login_admin.svg" />" alt="얼굴아이콘" width="30" class="face-icon">
						    	</c:if>
						    	<p>${writer.user_nickname}</p>
						 	</div>
						 	<div class="right-box">
						 		<img src="<c:url value="/images/calender_icon.svg" />" alt="달력아이콘" width="24" class="calender-icon">
						 		<fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd" /> 
						 		<img src="<c:url value="/images/eye_icon.svg" />" alt="눈아이콘" width="24" class="eye-icon">
						 		<span>${post.post_view}</span>
						 	</div>
						 </div>
						 <div class="form-row second-line">
						 	<div class="left-box">
						 		<span class="board-title">${post.post_title}</span>
						 	</div>
						    <div class="right-box">
						 		<img src="<c:url value="/images/siren_icon.svg" />" alt="사이렌아이콘" width="24" class="siren-icon">
						 		<span>${post.post_reported}</span> 
						 		<img src="<c:url value="/images/like_icon.svg" />" alt="라이크아이콘" width="24" class="like-icon">
						 		<span>${post.post_upvotes}</span>
						 	</div>
						 </div>
						 <c:if test="${link != null && link != ''}">
						 	<c:if test="${link.attach_link_check == 1}">
								 <div class="form-row link-box">
								    <label for="link">첨부링크 : </label>
					    			<a href="<c:url value="${link.attach_path}" />" target="_blank" class="link-text">${link.attach_path}</a>
								 </div>
							 </c:if>
						 </c:if>
						 <c:if test="${fileList != null && fileList.size() != 0}">
						 	 <div class="form-row file-box-wrap">
						 		 <label for="file"><img src="<c:url value="/images/save_icon.svg" />" alt="파일아이콘" width="24" class="save-icon">첨부파일 : </label>
						 		 <div class="file-box">
						 			 <c:forEach items="${fileList}" var="file" begin="0" varStatus="status">
								 		 <c:if test="${file.attach_link_check == 0}">
						 					 <a href="<c:url value="/download?filename=${file.attach_path}" />" title="${file.attach_path}" download="${file.attach_path}">첨부파일${status.index + 1}</a>
								 		 </c:if>
						 			 </c:forEach>
					 			 </div>
						 	 </div>
						 </c:if>
						 <div class="form-row content">
						    <div class="form-control second-box">${post.post_content}</div>
						 </div>
						 <div class="form-row btn-box">
							 <div class="left-box">
								<button type="button" id="btnUp" data-state="1" class="like-btn btn-up">
									<img src="<c:url value="/images/like_icon.svg" />" alt="라이크아이콘" width="24" class="like-icon2">
									좋아요
								</button>
								<button type="button" id="btnReport" class="report-btn">
									<img src="<c:url value="/images/siren_icon.svg" />" alt="신고아이콘" width="24" class="siren_icon2">
									신고
								</button>
								<button type="button" id="btnComment" class="comment-btn">
									<img src="<c:url value="/images/comment_icon.svg" />" alt="신고아이콘" width="24" class="comment_icon">
									<span class="text"></span>
								</button>
							</div>
						 </div>
						 <!-- 댓글 리스트를 보여주는 박스 -->
			  			 <div class="comment-list"></div>
			  			 <!-- 댓글 페이지네이션 박스 -->
				  		 <div class="comment-pagination">
			  			 	<ul class="pagination justify-content-center"></ul>
				  		 </div>
				  		 <!-- 댓글 입력 박스 -->
						 <div class="form-row comment-input-box">
							<div class="input-group">
								<textarea class="form-control comment-content"></textarea>
								<button type="button" class="btn btn-outline-dark btn-comment-insert">댓글 등록</button>
							</div>
					  	</div>
					  	<div class="form-row btn-last-box">
							<c:if test="${post.post_user_id == user.user_id}">
								 <a href="<c:url value="/post/update?num=${post.post_id}"/>" class="btn btn-outline-warning">수정</a>
								 <a href="<c:url value="/post/delete?num=${post.post_id}"/>" class="btn btn-outline-danger">삭제</a>
							</c:if>
							<c:if test="${post.post_user_id != user.user_id && (user.user_role == '관리자' || user.user_role == '운영자')}">
								 <a href="<c:url value="/post/delete?num=${post.post_id}"/>" class="btn btn-outline-danger">삭제</a>
							</c:if>
							<c:url value="/board/list" var="url">
							 	<c:param name="boNum" value="${post.post_board_num}" />
							 	<c:param name="page" value="${page == null?1:page}" />
							 	<c:param name="type" value="all" />
							 </c:url>
						  	<a href="${url}" class="btn btn-outline-dark">목록으로</a>
					  	</div>
					</div>
				</c:when>
				<c:otherwise>
					<h1>등록되지 않은 게시글이거나 삭제된 게시글입니다.</h1>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<!-- 신고 모달 -->
<div class="report-list-box">
	<div class="report-list">
	  	<h2>게시글 신고하기</h2>
	  	<form id="reportForm">
			<input type="hidden" id="report_post_id" name="post_id" value=""> 
			<div class="row-box">
			  <label for="report_user_nickname">작성자:</label>
			  <input type="text" id="report_user_nickname" name="report_user_nickname" readonly>
			</div>
			<div class="row-box">
			  <label for="report_post_title">제목:</label>
			  <input type="text" id="report_post_title" name="report_post_title" readonly>
			</div>
			<div class="row-box">
			  <label for="report_reason" class="col-form-label">신고 사유:</label>
			  <select class="form-select" id="report_reason" name="report_reason" required>
				<option value="">선택해주세요</option>
				<c:forEach items="${reportReasonList}" var="reason">
				  <option value="${reason.report_reason}">${reason.report_reason}</option> 
				</c:forEach>
			  </select>
			</div>
			<div class="row-box">
			  <label for="report_content" class="col-form-label">상세 내용:</label>
			  <textarea class="form-control" id="report_content" name="report_content"></textarea>
			</div>
		</form>
	  	<a href="#close" class="close_btn"><img src="<c:url value="/images/close_icon.svg" />" alt="닫기아이콘" width="30"></a>
		<button class="btn btn-dark">확인</button>
	</div>
 </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- 유튜브 주소 -->
<script type="text/javascript">
	let linkFile = '${link.attach_path}';
	let url = '';
	
	if(linkFile.indexOf('https://www.youtube.com/embed') != '-1'){
		$('.link-box').hide();
		url += 
		`
			<iframe width="560" height="315" src="\${linkFile}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		`;
		$('.link-box').after(url);
		
	}
</script>

<!-- 좋아요 -->
<script type="text/javascript">
	function checkLogin() {
		// 로그인 했을 때
		if('${user.user_id}' != '') {
			return true;
		}
		
		// 로그인 안 했을 때
		if(confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하시겠습니까?")) {
			location.href = '<c:url value="/login"/>';
		}
		return false;
	}

	$(".btn-up").click(function() {
		if(!checkLogin()) {
			return;
			
		}
		
		let upvote = $(this).data('state');
		let postId = '${post.post_id}';
		let like = {
				upvote : upvote,
				postId : postId
		}
		console.log(like);
		$.ajax({
			async : true,
			url : '<c:url value="/upvote/check"/>', 
			type : 'post', 
			data : like, 
			dataType : "json", 
			success : function(data) {
				switch(data) {
				case 1:
					alert('좋아요를 눌렀습니다.');
					break;
				case 0 :
					alert('좋아요를 취소했습니다.');
					break;
				default :
					alert('좋아요를 취소했습니다.');
				}
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown){
				
			}
		});	// ajax end
		
	});
	
</script>
<!-- 댓글 등록 -->
<script type="text/javascript">
//(댓글)등록 버튼 클릭 이벤트를 등록
$(".btn-comment-insert").click(function(){
	//로그인 체크
	if('${user.user_id}' == ''){
		//확인 누르면 로그인 페이지로
		if(confirm("로그인이 필요한 서비스입니다. 로그인으로 이동하겠습니까?")){
			location.href = "<c:url value='/login'/>";
			return;
		}
		//취소 누르면 현재 페이지에서 추천/비추천 동작을 안함
		else{
			return;
		}
	}
	
	//입력받은 댓글을 가져옴
	let content = $(".comment-content").val();
	//게시글 번호를 가져옴
	let num = '${post.post_id}';

	$.ajax({
		url : '<c:url value="/comment/insert"/>',
		method : "post",
		data : {
			content, //content : content
			num //num : num
		},
		success : function(data){
			if(data == "ok"){
				alert("댓글을 등록했습니다.");
				cri.page = 1;
				getCommentList(cri);
				$(".comment-content").val("");
			}else{
				alert("댓글을 등록하지 못했습니다.");
			}
		}, 
		error : function(a, b, c){
			
		}
	});
});//click end
</script>
<!-- 댓글 조회 -->
<script type="text/javascript">
//댓글 현재 페이지 정보
let cri = {
	page : 1,
	post_num : '${post.post_id}'
}
function getCommentList(cri){
	$.ajax({
		url : '<c:url value="/comment/list"/>',
		method : "post",
		data : cri,
		success : function(data){
		
			let str = '';
			
			for(let i in data.list){
				let btns = '';
				let nickname = data.writerList[i].user_nickname;
				let writerid = data.writerList[i].user_id;
				if('${user.user_id}' == data.list[i].comment_user_id){
					btns +=					
					`
					<div class="btn-comment-group">
						<a href="#update" title="댓글수정" class="btn-comment-update" data-num="\${data.list[i].comment_id}"><img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="20" class="write-icon"></a>
						<a href="#delete" title="댓글삭제" class="btn-comment-delete" data-num="\${data.list[i].comment_id}"><img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="20" class="trash-icon"></a>
					</div>
					`
				}else{
					btns +=			
					`
					<div class="btn-comment-group">
					`;
					if('${user.user_id}' == ''){        
                        btns += ``;
                    }else if(data.writerList[i].user_role == '사용자'){		
                    	
						btns +=	`<a href="#block" title="사용자차단" class="btn-comment-block" data-role="사용자" data-nickname="\${nickname}" data-writeid="\${writerid}"><img src="<c:url value="/images/block_icon.svg" />" alt="차단아이콘" width="20" class="block-icon"></a>`;
					}else if(data.writerList[i].user_role == '관리자'){		
						btns +=	`<a href="#block" title="사용자차단" class="btn-comment-block" data-role="관리자" data-nickname="\${nickname}" data-writeid="\${writerid}"><img src="<c:url value="/images/block_icon.svg" />" alt="차단아이콘" width="20" class="block-icon"></a>`;
					}else{
						btns +=	`<a href="#block" title="사용자차단" class="btn-comment-block" data-role="운영자" data-nickname="\${nickname}" data-writeid="\${writerid}"><img src="<c:url value="/images/block_icon.svg" />" alt="차단아이콘" width="20" class="block-icon"></a>`;
					}
					btns +=	
					`
					</div>
					`;
				}
				
				str +=
				`
				<div class="box-comment">
					<div class="comment-wrap">
				`;
				
				if(data.writerList[i].user_role == '사용자'){
					str += `<img src="<c:url value="/images/face_login.svg" />" alt="얼굴아이콘" width="30" class="face-icon">`;
				}else{
					str += `<img src="<c:url value="/images/face_login_admin.svg" />" alt="얼굴아이콘" width="30" class="face-icon">`;
				}
				str +=
				`
						\${nickname}
						<div class="comment_content">\${data.list[i].comment_content}</div>
					</div>
					\${btns}
				</div>
				`;
			}
			$(".comment-list").html(str);
			if(data.list.length != 0){
				$('.comment-list').addClass('active');
			}
			let total = JSON.parse(data.total);
			$(".comment-btn .text").html(total);
			//JSON.parse(문자열) : json형태의 문자열을 객체로 변환
			//JSON.stringify(객체) : 객체를 json형태의 문자열로 변환
			let pm = JSON.parse(data.pm);
			let pmStr = "";
			//이전 버튼 활성화 여부
			if(pm.prev){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
				</li>
				`;
			}
			//숫자 페이지
			for(i = pm.startPage; i<= pm.endPage; i++){
				let active = pm.cri.page == i ? "active" :"";
				pmStr += `
				<li class="page-item \${active}">
					<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
				</li>
				`
			}
			//다음 버튼 활성화 여부
			if(pm.next){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
				</li>
				`;
			}
			$(".comment-pagination>ul").html(pmStr);
		}, 
		error : function(a, b, c){
			
		}
	});
}

$(document).on("click",".comment-pagination .page-link", function(){
	cri.page = $(this).data("page");
	getCommentList(cri);
})

getCommentList(cri);
</script>
<!-- 댓글 삭제 -->
<script type="text/javascript">
$(document).on("click",".btn-comment-delete", function(){
	let num = $(this).data("num");
	$.ajax({
		url : '<c:url value="/comment/delete"/>',
		method : "post",
		data : {
			num
		},
		success : function(data){
			if(data == 'ok'){
				alert("댓글을 삭제했습니다.");
				getCommentList(cri);
				if($('.box-comment').length == 1){
					$('.comment-list').removeClass('active');
				}
			}else{
				alert("댓글을 삭제하지 못했습니다.");
			}
			
		}, 
		error : function(a, b, c){
			
		}
	});
});
</script>
<!-- 댓글 수정 구현 -->
<script type="text/javascript">
$(document).on("click", ".btn-comment-update", function(){
	initComment();
	//현재 댓글 보여주는 창이 textarea태그로 변경
	//기존 댓글 창을 감춤
	$(this).parents(".box-comment").find(".comment_content").hide();
	let comment = $(this).parents(".box-comment").find(".comment_content").text();
	let textarea = 
	`
	<textarea class="form-control com-input">\${comment}</textarea>
	`
	$(this).parents(".box-comment").find(".comment_content").after(textarea);
	
	//수정 삭제 버튼 대신 수정 완료 버튼으로 변경
	$(this).parent().hide();
	let num = $(this).data("num");
	let btn = 
	`
	<button class="btn btn-outline-dark btn-complete" data-num="\${num}">수정완료</button>
	`;
	$(this).parent().after(btn);
	
});//click end

function initComment(){
	//감추었던 댓글 내용을 보여줌
	$(".cm_content").show();
	//감추었던 수정/삭제 버튼을 보여줌
	$(".btn-comment-group").show();
	//추가했던 댓글 textarea태그를 삭제
	$(".com-input").remove();
	//추가했던 수정 완료 버튼을 삭제
	$(".btn-complete").remove();
}
//수정 완료 버튼 클릭 이벤트
$(document).on("click",".btn-complete", function(){
	//수정하기 위해 필요한 정보를 가져옴 : 수정된 내용, 댓글 번호
	let num = $(this).data("num");
	let content = $(".com-input").val();
	$.ajax({
		url : '<c:url value="/comment/update"/>',
		method : 'post',
		data : {
			num, //num : num,
			content //content : content
		},
		success : function(data){
			if(data == "ok"){
				alert("댓글을 수정했습니다.");
				getCommentList(cri);
			}else{
				alert("댓글을 수정하지 못했습니다.");
			}
		}, 
		error : function(xhr, status, error){
			
		}
	});
});
</script>
<!-- 사용자 차단 -->
<script type="text/javascript">
$(document).on('click','.btn-comment-block',function(){
	let blocked_user_id = $(this).data("writeid"); //차단당하는 아이디
	let role = $(this).data("role");
	let nickname = $(this).data("nickname");
	let blocking_user_id = '${user.user_id}'; //차단을 실행하는 아이디
	
	if(role == '운영자' || role == '관리자'){
		alert('운영자와 관리자는 차단할 수 없습니다.');
		return;
	}
	
	let q = confirm(nickname + "님의 모든 게시글과 댓글을 안보이게 차단합니다.");
	
	if(!q){
		return;
	}
	
	$.ajax({
		url : '<c:url value="/comment/block"/>',
		method : 'post',
		data : {
			blocked_user_id, 
			blocking_user_id 
		},
		success : function(data){
			if(data == "ok"){
				alert(nickname + "님을 차단했습니다.");
				getCommentList(cri);
			}else{
				alert("이미 차단한 사용자거나 없는 사용자입니다.");
			}
		}, 
		error : function(xhr, status, error){
			
		}
	});
});
</script>

<script>
	$(document).on("click", "#btnReport", function() {
		if('${user.user_id}' == ''){
			if(confirm("로그인이 필요한 서비스입니다. 로그인으로 이동하겠습니까?")){
				location.href = "<c:url value='/login'/>";
				return;
			}else{
				return;
			}
		}
		var postId = '${post.post_id}';
		var author = '${writer.user_nickname}';
		var title = '${post.post_title}';

		$('#report_post_id').val(postId);
		$('#report_user_nickname').val(author);
		$('#report_post_title').val(title);
		
		console.log(postId);
		console.log(author);
		console.log(title);


	  	// 모달 표시
		$('.report-list-box').show();
	});
  

	$("#reportForm").on("submit", function(event) {
	  event.preventDefault(); // 폼 기본 제출 방지
	  var formData = $(this).serialize();

	  console.log(formData);
	  console.log("신고 폼 제출");

	  // AJAX 요청
	  $.ajax({
		type: "POST",
		url: "<c:url value='/post/report'/>", 
		data: formData,
		dataType: "json", // 서버로부터 JSON 형식의 응답을 기대합니다.
		success: function(response) {
		// 서버로부터 받은 메시지를 alert로 표시합니다.
			alert(response.message);
			location.reload();
			$('#reportModal').modal('hide');
			},
		error: function(xhr, status, error) {
			// 서버로부터 받은 에러 메시지를 alert로 표시합니다.
			// 서버 측에서 적절한 JSON 응답을 보내야 합니다.
			var errorMessage = xhr.status + ': ' + xhr.statusText
			alert('Error - ' + errorMessage);
		}
	  });
	});


	$('.close_btn').click(function(){
		$('.report-list-box').hide();
	});
	$('.report-list-box button').click(function(){
		$('.report-list-box').hide();
		$("#reportForm").submit(); 
	});
  </script>

</body>
</html>