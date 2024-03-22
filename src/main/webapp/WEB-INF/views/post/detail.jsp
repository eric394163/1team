<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>		
<div class="main-wrap">
	<div class="inner-wrap">
		<jsp:include page="/WEB-INF/views/common/aside.jsp" />
		<div class="main-contents">
			<c:choose>
				<c:when test="${post != null }">
					<h1>게시글 상세</h1>
					<div>
						<div class="mb-3 mt-3">
						    <label for="community" class="form-label">게시판</label>
						    <input type="text" class="form-control" id="community" name="community" readonly value="${post.board.board_name}">
						</div>	
						 <div class="mb-3 mt-3">
						    <label for="writer" class="form-label">작성자</label>
						    <input type="text" class="form-control" id="writer" name="writer" value = "${post.post_user_id}" readonly>
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="date" class="form-label">작성일</label>
						    <fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd" /> 
						 </div>
						<div class="mb-3 mt-3">
						    <label for="title" class="form-label">제목</label>
						    <input type="text" class="form-control" id="title" name="title" readonly value="${post.post_title}">
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="view" class="form-label">조회수 :</label>
						    <input type="text" class="form-control" id="view" name="view" value = "${post.post_view}" readonly>
						 </div>
						 <div class="mb-3 mt-3">
						    <!-- <label for="view" class="form-label">추천수 :</label> -->
								<button class="btn btn-outline-success btn-up col=6">추천</button>
								<button class="btn btn-outline-success btn-down col=6">비추천</button>
						 </div>
						 <div class="mb-3 mt-3">
						    <label for="content" class="form-label">내용</label>
						    <div class="form-control" style="min-height : 300px;">${post.post_content}</div>
						 </div>
						 <c:if test="${fileList != null && fileList.size() != 0}">
						 	 <div class="mb-3 mt-3">
							 		 <label for="file" class="form-label">첨부파일</label>
						 			 <c:forEach items="${fileList}" var="file">
								 		 <c:if test="${file.attach_link_check == 0}">
						 					 <a href="<c:url value="/download?filename=${file.attach_path}" />" class="form-control" download="${file.attach_path}">${file.attach_path}</a>
								 		 </c:if>
						 			 </c:forEach>
						 	 </div>
						 </c:if>
						 <c:if test="${link != null && link != ''}">
							 <div class="mb-3 mt-6">
						    		<c:if test="${link.attach_link_check == 1}">
									    <label for="link" class="form-label">링크</label>
						    			<a href="<c:url value="${link.attach_path}" />" class="form-control">${link.attach_path}</a> 
						    		</c:if>
							 </div>
						 </c:if>
						 <a href="<c:url value="/post/list" />" class="btn btn-outline-dark">목록으로</a>
						 <c:if test="${post.post_user_id == user.user_id}">
							 <a href="<c:url value="/post/update?num=${post.post_id}"/>" class="btn btn-outline-danger">수정</a>
							 <a href="<c:url value="/post/delete?num=${post.post_id}"/>" class="btn btn-outline-danger">삭제</a>
						 </c:if>
						 <hr>
						 <div class="mt-3 mb-3 comment-box">
					  		<h3>댓글</h3>
					  		<!-- 댓글 리스트를 보여주는 박스 -->
					  		<div class="comment-list">
					  			<div class="input-group mb-3">
									<div class="col-3"></div>
									<div class="col-9"></div>
								</div>
					  		</div>
					  		<!-- 댓글 페이지네이션 박스 -->
					  		<div class="comment-pagination">
					  			<ul class="pagination justify-content-center">
					  				
					  			</ul>
					  		</div>
					  		<!-- 댓글 입력 박스 -->
					  		<div class="comment-input-box">
								<div class="input-group">
									<textarea class="form-control comment-content"></textarea>
									<button type="button" class="btn btn-outline-success btn-comment-insert">등록</button>
								</div>
					  		</div>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
//댓글 리스트를 화면에 출력하는 함수
function getCommentList(cri){
	$.ajax({
		url : '<c:url value="/comment/list"/>',
		method : "post",
		data : cri,
		success : function(data){
		
			let str = '';
			for(comment of data.list){
				let btns = '';
				if('${user.user_id}' == comment.comment_user_id){
					btns +=					
					`
					<div class="btn-comment-group">
						<button class="btn btn-outline-warning btn-comment-update" data-num="\${comment.comment_id}">수정</button>
						<button class="btn btn-outline-danger btn-comment-delete" data-num="\${comment.comment_id}">삭제</button>
					</div>
					`
				}
				
				str +=
				`
				<div class="input-group mb-3 box-comment">
					<div class="col-3">\${comment.comment_user_id}</div>
					<div class="col-6 comment_content">\${comment.comment_content}</div>
					\${btns}
				</div>
				`;
			}
			$(".comment-list").html(str);
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
			console.log(data);
			if(data == 'ok'){
				alert("댓글을 삭제했습니다.");
				getCommentList(cri);
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
	$(this).parents(".box-comment").find(".cm_content").hide();
	let comment = $(this).parents(".box-comment").find(".cm_content").text();
	let textarea = 
	`
	<textarea class="form-control com-input">\${comment}</textarea>
	`
	$(this).parents(".box-comment").find(".cm_content").after(textarea);
	
	//수정 삭제 버튼 대신 수정 완료 버튼으로 변경
	$(this).parent().hide();
	let num = $(this).data("num");
	let btn = 
	`
	<button class="btn btn-outline-success btn-complete" data-num="\${num}">수정완료</button>
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
</body>
</html>