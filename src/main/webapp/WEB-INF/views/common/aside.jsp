<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
          <c:if test="${user != null}">
          	<img alt="로그인얼굴" src="/team1/images/face_login.svg" width="80" /> <br />
	          <p>
	            ${nickname}(${id})님 <br>
	            PLAY GROUND에 오신 걸<br> 
	            환영합니다.
	          </p>
	          <ul>
	            <li><a href="<c:url value="/mypage/main" />">마이페이지</a></li>
	            <li><a href="<c:url value="/logout" />">로그아웃</a></li>
	          </ul>
          </c:if>
        </div>
        <hr />
        <ul class="nav nav-pills flex-column mb-auto">
         	<c:forEach items="${categoryList}" var="category">
         		<c:if test="${counts[category.category_id - 1] == 1}">
         			<c:forEach items="${boardList}" var="board">
         				<c:if test="${category.category_id == board.board_category_num}">
		         			<li class="nav-item">
		         				<c:url var="url" value="/post/sublist">
								    <c:param name="boNum" value="${board.board_id}" />
								    <c:param name="page" value="1" />
								</c:url>
		         				<a href="${url}" class="${boNum == board.board_id ? 'nav-link active' : 'nav-link text-white'}">${board.board_name}</a>
		         			</li>
		         		</c:if>
         			</c:forEach>
         		</c:if>
         		<c:if test="${counts[category.category_id - 1] != 1}">
         			<li class="drop-down">
         				<a href="#" class="nav-link text-white clearfix">
         					<span class="float-start">${category.category_name}</span>
							<span class="float-end">▽</span>
         				</a>
         				<ul>
         					<c:forEach items="${boardList}" var="board">
         						<c:if test="${category.category_id == board.board_category_num}">
									<li>
										<c:url var="url" value="/post/sublist">
										    <c:param name="boNum" value="${board.board_id}" />
										    <c:param name="page" value="1" />
										</c:url>
										<a href="${url}" class="${boNum == board.board_id ? 'nav-link active' : 'nav-link text-white'}">${board.board_name}</a>
									</li>
								</c:if>
         					</c:forEach>
         				</ul>
         			</li>
         		</c:if>
         	</c:forEach>
        </ul>
        <hr />
        <div class="manage-btn">
          <a class="nav-link" href="#">관리자 페이지</a>
        </div>
      </div>
    </aside>
    <script type="text/javascript">
      $(".drop-down .nav-link").click(function () {
        let is = $(this).next().is(":hidden");

        if (is) {
       	  $(".drop-down .nav-link")
            .children(".float-end")
            .removeClass("active");
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
