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
	            ${nickname}(${id})님 <br>
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
					<span class="float-start">나의 활동내역</span>
					<span class="float-end">▽</span>
				</a>
				<ul class="subnav">
					<li><a href="<c:url value="/mypage/postlist" />" class="nav-link text-white">내가 쓴 글 확인</a></li>
					<li><a href="<c:url value="/mypage/commentlist" />" class="nav-link text-white">내가 댓글 쓴 글 확인</a></li>
					<li><a href="<c:url value="/mypage/likelist" />" class="nav-link text-white">좋아요 누른 글 확인</a></li>
				</ul>
			</li>
			<li class="nav-item"><a href="<c:url value="/mypage/signupdate" />" class="nav-link text-white">나의 정보수정</a></li>
			<li class="nav-item"><a href="<c:url value="/mypage/blocklist" />" class="nav-link text-white">내가 차단한 목록보기</a></li>
			<li class="nav-item"><a href="<c:url value="/mypage/deleteid" />" class="nav-link text-white">회원 탈퇴</a></li>
		</ul>
		<c:if test="${user != null && (user.user_role == '관리자' || user_role == '운영자')}">
        	<hr />
	        <div class="manage-btn">
        		<a class="nav-link" href="#">관리자 페이지</a>
	        </div>
        </c:if>
      </div>
    </aside>
    <script type="text/javascript">
    	//주소 담는 변수
    	let url = location.href;
    	
    	if(url.indexOf('postlist') != -1){ //주소에 postlist를 갖고 있다면(=내가 쓴 글 확인 페이지라면)
    		//첫번째 li태그의 a태그에 active 처리
    		$('.subnav li').eq(0).find('a').removeClass('text-white');
    		$('.subnav li').eq(0).find('a').addClass('active');
    	}else if(url.indexOf('commentlist') != -1){ //주소에 commentlist를 갖고 있다면(=내가 댓글 쓴 글 확인 페이지라면)
    		//두번째 li태그의 a태그에 active 처리
    		$('.subnav li').eq(1).find('a').removeClass('text-white');
    		$('.subnav li').eq(1).find('a').addClass('active');
    	}else if(url.indexOf('likelist') != -1){ //주소에 likelist를 갖고 있다면(=좋아요 누른 글 확인 페이지라면)
    		//세번째 li태그의 a태그에 active 처리
    		$('.subnav li').eq(2).find('a').removeClass('text-white');
    		$('.subnav li').eq(2).find('a').addClass('active');
    	}else if(url.indexOf('signupdate') != -1){ //주소에 signupdate를 갖고 있다면(=나의 정보수정 페이지라면)
    		//해당 a태그에 active 처리
    		$('.nav-pills .nav-item').eq(0).find('a').removeClass('text-white');
    		$('.nav-pills .nav-item').eq(0).find('a').addClass('active');
    	}else if(url.indexOf('blocklist') != -1){ //주소에 blocklist를 갖고 있다면(=내가 차단한 목록보기 페이지라면)
    		//해당 a태그에 active 처리
    		$('.nav-pills .nav-item').eq(1).find('a').removeClass('text-white');
    		$('.nav-pills .nav-item').eq(1).find('a').addClass('active');
    	}else if(url.indexOf('deleteid') != -1){ //주소에 blocklist를 갖고 있다면(=내가 차단한 목록보기 페이지라면)
    		//해당 a태그에 active 처리
    		$('.nav-pills .nav-item').eq(2).find('a').removeClass('text-white');
    		$('.nav-pills .nav-item').eq(2).find('a').addClass('active');
    	}
    
    
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
