<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메인 - 인기게시글리스트</title>
  </head>
  <body>
  	<div class="popular-list">
  		<div class="h2_title_wrap">
       		<h2>주간인기게시글</h2>
       	</div>
  		<ul class="btn-area">
  			<li><a href="#view" class="active">조회수</a></li>
  			<li><a href="#like">좋아요</a></li>
  		</ul>
  		<div class="contents-wrap">
  			<div class="view-area">
  				<!-- 조회수 높은 게시판 -->
  				<jsp:include page="/WEB-INF/views/main/viewListView.jsp" />
  			</div>
  			<div class="like-area">
  				<!-- 좋아요 높은 게시판 -->
  				<jsp:include page="/WEB-INF/views/main/likeListView.jsp" />
  			</div>
  		</div>
  	</div>
  	<script type="text/javascript">
  		//탭바처리 제이쿼리
  		$(".btn-area a").click(function(){ //버튼 클릭
  			//버튼 CSS활성
  			$(".btn-area a").removeClass('active');
  			$(this).addClass('active');
  			
  			//컨텐츠 보이게 처리
  			let index = $(this).parent().index();
  			$(".contents-wrap > div").fadeOut(0);
  			$(".contents-wrap > div").eq(index).fadeIn(0);
  		});
  	</script>
  </body>
</html>