<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 게시판 수정/삭제</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/adminStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/admin/aside.jsp" />
			<div class="main-contents">
				<!-- 내용채우기 -->
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>관리자페이지 - 게시판 수정/삭제</h2>
	        	</div>
	        	<div class="admin-box">
	        		<div class="h3-title-wrap">
	        			<h3>▣ 카테고리 리스트</h3>
	        			<p>
		        			<img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="16"> : 수정,
		        			<img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="16"> : 삭제
		        		</p>
	        		</div>
	        		<select class="form-control category-list" id="category" name="category" onchange="getBoardList()">
				    	<c:forEach items="${categoryList}" var="category">
				    		<option id="ca" value="${category.category_id}">${category.category_name}</option>
				    	</c:forEach>
				    </select>
				    <h3>▣ 게시판 리스트</h3>
	        		<ul class="category-list category-update board-list">
        				
	        		</ul>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
<script type="text/javascript">
function getBoardList(){
	let num = $("#category option:selected").val();
	let info = {
		category_id : num
	}
	
	$.ajax({
		url : '<c:url value="/admin/boardupdate"/>',
		method : "post",
		data : info,
		success : function(data){
			let str = '';
			for(board of data.list){
				str +=
				`
				<li>
   					<div class="left-box">
    					<input type="text" class="category-name board-name" name="board_name" value="\${board.board_name}" tabindex="-1" readonly>
    					<button type="submit" class="btn btn-dark board-update" data-bonum="\${board.board_id}">수정</button>
   					</div>
   					<div class="right-box">
   						<a href="#update" class="category-update board-update-icon"><img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="20"></a>
    					<a href="javascript:void(0);" class="category-delete board-delete" data-bonum="\${board.board_id}"><img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="20"></a>
   					</div>
   				</li>
				`;
			}
			$(".board-list").html(str);
		}, 
		error : function(a, b, c){
			
		}
	});
}
getBoardList();
</script>
<script type="text/javascript">
//업데이트(연필) 아이콘 클릭했을 때
$(document).on("click",".board-update-icon", function(){
	initIcon();
	$(this).parents('li').find('.board-name').hide();
	let bo_name = $(this).parents("li").find(".board-name").val();
	let input = 
	`
	<input input type="text" class="category-name name-input" value="\${bo_name}">
	`
	$(this).parents("li").find(".board-name").after(input);
	//해당 버튼 보이게 처리
	$(this).parents('li').find('.btn-dark').show();
});
function initIcon(){
	//수정 초기화
	$(".board-name").show();
	$(".name-input").remove();
	$('.btn-dark').hide();
}
</script>
<script type="text/javascript">
//게시판 삭제버튼
$(document).on("click",".board-delete", function(){
	let num = $(this).data("bonum");
	$.ajax({
		url : '<c:url value="/admin/board/delete"/>',
		method : 'get',
		data : {
			board_id : num
		},
		success : function(data){
			if(data == "ok"){
				alert("게시판 삭제했습니다.");
				getBoardList();
			}else{
				alert("게시판 삭제 못함.");
			}
		}, 
		error : function(xhr, status, error){
			
		}
	});
});
</script>
<script type="text/javascript">
//게시글 수정버튼
$(document).on("click",".board-update", function(){
	let num = $(this).data("bonum");
	let name = $(".name-input").val();
	$.ajax({
		url : '<c:url value="/admin/board/update"/>',
		method : 'get',
		data : {
			board_id : num,
			board_name : name
		},
		success : function(data){
			if(data == "ok"){
				alert("게시판 수정 했다.");
				getBoardList();
			}else{
				alert("게시판 수정 못함.");
			}
		}, 
		error : function(xhr, status, error){
			
		}
	});
});
</script>
  </body>
</html>