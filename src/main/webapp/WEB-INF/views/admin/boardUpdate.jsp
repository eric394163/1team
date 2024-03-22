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
   					<form action="<c:url value="/admin/board/update" />" class="left-box">
    					<input type="text" class="category-name" name="board_name" value="\${board.board_name}" tabindex="-1" readonly>
    					<input type="hidden" value="\${board.board_id}" name="board_id">
    					<button type="submit" class="btn btn-dark">수정</button>
   					</form>
   					<div class="right-box">
   						<a href="#update" class="category-update"><img src="<c:url value="/images/write_icon.svg" />" alt="수정아이콘" width="20"></a>
   						<c:url value="/admin/board/delete" var="url">
   							<c:param name="categoryName" value="\${board.board_name}" />
   						</c:url>
    					<a href="${url}" class="category-delete"><img src="<c:url value="/images/trash_icon.svg" />" alt="삭제아이콘" width="20"></a>
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

</script>
<script type="text/javascript">
//업데이트(연필) 아이콘 클릭했을 때
$(document).on("click",".category-update", function(){
	//해당 input태그 - readonly속성 추가
	$(this).parents('li').find('.category-name').prop('readonly', false);
	//초점받게 처리
	$(this).parents('li').find('.category-name').attr('tabindex','0');
	
	//해당 버튼 보이게 처리
	$(this).parents('li').find('.btn-dark').show();
});
</script>
  </body>
</html>