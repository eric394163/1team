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
          <c:if test="${user != null}">
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
        </div>
        <hr />
        <ul class="nav nav-pills flex-column mb-auto">
			<li class="drop-down">
				<a href="#drop" class="nav-link text-white clearfix">
					<span class="float-start">카테고리관리</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<li class="categoryinsert"><a href="<c:url value="/admin/categoryinsert" />" class="nav-link text-white">카테고리 등록</a></li>
					<li class="categoryupdate"><a href="<c:url value="/admin/categoryupdate" />" class="nav-link text-white">카테고리 수정/삭제</a></li>
				</ul>
			</li>
			<li class="drop-down">
				<a href="#drop" class="nav-link text-white clearfix">
					<span class="float-start">게시판관리</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<li class="boardinsert"><a href="<c:url value="/admin/boardinsert" />" class="nav-link text-white">게시판 등록</a></li>
					<li class="boardupdat"><a href="<c:url value="/admin/boardupdate" />" class="nav-link text-white">게시판 수정/삭제</a></li>
					<li class="boardreport"><a href="<c:url value="/admin/boardreport" />" class="nav-link text-white">신고게시판</a></li>
				</ul>
			</li>
			<li class="drop-down">
				<a href="#drop" class="nav-link text-white clearfix">
					<span class="float-start">게시글관리</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<li class="postdelete"><a href="<c:url value="/admin/postdelete" />" class="nav-link text-white">게시글 삭제</a></li>
				</ul>
			</li>
			<li class="drop-down">
				<a href="#drop" class="nav-link text-white clearfix">
					<span class="float-start">유저관리</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<li class="usermanage"><a href="<c:url value="/admin/usermanage" />" class="nav-link text-white">운영자 관리</a></li>
					<li class="userblock"><a href="<c:url value="/admin/userblock" />" class="nav-link text-white">회원 탈퇴</a></li>
				</ul>
			</li>
		</ul>
      </div>
    </aside>
    <script type="text/javascript">
    	//주소 담는 변수
    	let url = location.href;
    	
    	//초기실행 - 드롭다운메뉴의 후손인 subnav의 li가 갖은 클래스로 주소와 같은지 확인 후 같으면 a태그에 클래스 처리
		$(".drop-down .subnav li").each(function(index){
			//클래스명 담는 변수
			let className = $(this).attr("class");
			
			//클래스명과 같은 주소라면
			if(url.indexOf(className) != -1){ 
	    		$(this).find('a').removeClass('text-white');
	    		$(this).find('a').addClass('active');
	    	}
		});
    	
    
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
