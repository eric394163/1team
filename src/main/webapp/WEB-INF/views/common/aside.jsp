<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>aside</title>
  </head>
  <body>
    <aside>
      <div
        class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
        style="width: 280px"
      >
        <div class="login-box">
          <c:if test="${user == null}">
          	<img alt="로그아웃얼굴" src="/team1/images/face_logout.svg" width="80" /> <br />
	          <p>
	            로그인 후 더 편하게 <br>
	            PLAY GROUND를 <br>
	            이용해 보세요
	          </p>
	          <ul>
	            <li><a href="<c:url value="/login" />">로그인</a></li>
	            <li><a href="<c:url value="/signup" />">회원가입</a></li>
	          </ul>
          </c:if>
          <c:if test="${user != null && user.user_role == '사용자'}">
          	<img alt="로그인얼굴" src="/team1/images/face_login.svg" width="80" /> <br />
	          <p>
	            ${user.user_nickname}(${user.user_id})님 <br>
	            PLAY GROUND에 오신 걸<br> 
	            환영합니다.
	          </p>
	          <ul>
	            <li><a href="<c:url value="/mypage/postlist" />">마이페이지</a></li>
	            <li><a href="<c:url value="/logout" />">로그아웃</a></li>
	          </ul>
          </c:if>
          <c:if test="${user != null && (user.user_role == '관리자' || user.user_role == '운영자')}">
          	<img alt="로그인얼굴" src="/team1/images/face_login_admin.svg" width="80" /> <br />
	          <p>
	            ${user.user_nickname}(${user.user_id})님 <br>
	            PLAY GROUND에 오신 걸<br> 
	            환영합니다.
	          </p>
	          <ul>
	            <li><a href="<c:url value="/mypage/postlist" />">마이페이지</a></li>
	            <li><a href="<c:url value="/logout" />">로그아웃</a></li>
	          </ul>
          </c:if>
        </div>
        <hr />
        <ul class="nav nav-pills flex-column mb-auto">
			<c:forEach items="${boardList}" var="board">
				<c:if test="${board.board_category_num == 1}">
					<li class="nav-item">
						<c:url var="url1" value="/board/list">
							<c:param name="boNum" value="${board.board_id}" />
							<c:param name="type" value="all" />
							<c:param name="page" value="1" />
						</c:url>
						<a href="${url1}" class="${boNum == board.board_id ? 'nav-link active' : 'nav-link text-white'}">${board.board_name}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:forEach items="${categoryList}" var="category" begin="1">
			<li class="drop-down">
				<a href="#drop" class="nav-link text-white clearfix">
					<span class="float-start">${category.category_name}</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<c:forEach items="${boardList}" var="board">
						<c:if test="${category.category_id == board.board_category_num}">
							<li>
								<c:url var="url2" value="/board/list">
									<c:param name="boNum" value="${board.board_id}" />
									<c:param name="type" value="all" />
									<c:param name="page" value="1" />
								</c:url>
								<a href="${url2}" class="${boNum == board.board_id ? 'nav-link active' : 'nav-link text-white'}">${board.board_name}</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
			</c:forEach>
		</ul>
		<c:if test="${user != null && (user.user_role == '관리자' || user.user_role == '운영자')}">
        	<hr />
	        <div class="manage-btn">
        		<a class="nav-link" href="<c:url value="/admin/categoryinsert" />">관리자 페이지</a>
	        </div>
        </c:if>
      </div>
    </aside>
    <script type="text/javascript">
		//초기실행 - 드롭다운메뉴의 후손인 nav-link가 active클래스를 갖고 있다면 처음에 열려 있게 처리
		$(".drop-down").each(function(index){
			var has = $(this).find('.nav-link').hasClass('active');
			if(has){
				$(this).find(".float-end").addClass("active");
				$(this).find('.subnav').stop().slideDown(0);
			}
		});
    
        //클릭이벤트
		$(".drop-down .nav-link").click(function () {
			let is = $(this).next().is(":hidden");
		
			if (is) {
				$(".drop-down .nav-link").children(".float-end").removeClass("active");
				$(".drop-down .nav-link").next().stop().slideUp("fast");
				$(this).children(".float-end").addClass("active");
				$(this).next().stop().slideDown("fast");
			} else {
				$(this).children(".float-end").removeClass("active");
				$(this).next().stop().slideUp("fast");
			}
		});
    </script>
  </body>
</html>
