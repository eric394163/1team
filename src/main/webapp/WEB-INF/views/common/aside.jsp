<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
	.manage-btn {
		border: 1px solid #fff;
	}
	.manage-btn .nav-link {
		display : block;
		width : 100%;
		height : 50px;
		text-align : center;
		line-height : 50px;
	}
	#main-sub-nav1, #main-sub-nav2 {
		display : none;
	}
	.login-box {
		border: 1px solid #fff;
		padding: 20px;
		text-align: center;
	}
	.login-box p {
		padding-top: 10px;
		font-size:14px;
	}
	.login-box ul {
		list-style: none;
		padding: 0;
		margin: 0;
		display : flex;
		width : 100%;
		justify-content : center;
	}
	.login-box a {
		display : block;
		color : #fff;
		text-decoration : none;
		padding: 6px 0px;
		width : 100px;
		border : 1px solid #fff;
	}
	
	.login-box li:first-child a {
		border-right : none;
	}
	
	.float-end.active {
		transform: rotate(180deg);
	}
	
	aside .nav-pills .nav-link.active{
		background-color: #fff;
		color : #333;
	}
	aside .d-flex{ height: 100%; padding-top: 0!important; padding-bottom: 0!important; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<aside>
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;">
			<div class="login-box">
				<img alt="예시이미지" src="https://via.placeholder.com/80">
				<br>
				<p>로그인 후 더 편하게 <br> PLAY GROUND를 이용해 보세요</p>
				<ul>
					<li>
						<a href="/team1/login">로그인</a>
					</li>
					 <li>
						<a href="/team1/signup">회원가입</a>
					</li>
				</ul>
			</div>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="#" class="nav-link active" aria-current="page"> 
						공지 게시판
					</a>
				</li>
				<li>
					<a href="#" class="nav-link text-white"> 
						전체 게시판
					</a>
				</li>
				<li class="drop-down">
					<a href="#" class="nav-link text-white clearfix"> 
						<span class="float-start">일반 카테고리</span>
						<span class="float-end">▽</span>
					</a>
					<ul class="nav nav-pills flex-column mb-auto" id="main-sub-nav1">
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 1</a>
						</li>					
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 2</a>
						</li>					
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 3</a>
						</li>					
					</ul>
				</li>
				<li class="drop-down">
					<a href="#" class="nav-link text-white clearfix"> 
						<span class="float-start">음악 카테고리</span>
						<span class="float-end">▽</span>
					</a>
					<ul class="nav nav-pills flex-column mb-auto" id="main-sub-nav2">
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 1</a>
						</li>					
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 2</a>
						</li>					
						<li style="padding-left:35px;">
							<a href="#" class="nav-link text-white">하위 게시판 3</a>
						</li>					
					</ul>
				</li>
			</ul>
			<hr>
			<div class="manage-btn">
				<a class="nav-link" href="#">관리자 페이지</a>
			</div>
		</div>
	</aside>
	<script type="text/javascript">
		$(".drop-down .nav-link").click(function() {
			let is = $(this).next().is(':hidden');
			
			if(is) {
				$(".drop-down .nav-link").next().stop().slideUp('fast');
				$(".drop-down .nav-link").children('.float-end').removeClass('active');
				$(this).next().stop().slideDown('fast');
				$(this).children('.float-end').addClass('active');
			} else {
				$(this).next().stop().slideUp('fast');
				$(this).children('.float-end').removeClass('active');
			}
			
		});
	</script>
</body>
</html>