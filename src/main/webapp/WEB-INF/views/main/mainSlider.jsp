<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인이미지 슬라이더 제작</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet" href="/team1/css/mainSlider.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body>
	<!-- Swiper -->
	<main>
		<div class="mainSwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><iframe id="video1" width="818" height="458" src="https://www.youtube.com/embed/0Bvd2mInMJQ?enablejsapi=1&controls=0&loop=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
				<div class="swiper-slide"><img src="<c:url value="/images/main02.jpg" />" alt="메인이미지"></div>
				<div class="swiper-slide"><img src="<c:url value="/images/main03.jpg" />" alt="메인이미지"></div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</main>
	<script type="text/javascript">
		var tag = document.createElement('script');
	
	    tag.src = "https://www.youtube.com/iframe_api";
	    var firstScriptTag = document.getElementsByTagName('script')[0];
	    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		var player;
		function onYouTubeIframeAPIReady() {
	        player = new YT.Player('video1', {
	            height: '460',
	            width: '820',
	            events: {
	            	'onReady': onPlayerReady,
	            }
	        });
		}
		function onPlayerReady(event) {
			event.target.mute();
		    event.target.playVideo();
		}
	
		var swiper = new Swiper(".mainSwiper", {
			pagination: {
				el: ".mainSwiper .swiper-pagination",
				type: "fraction",
			},
			navigation: {
				nextEl: ".mainSwiper .swiper-button-next",
				prevEl: ".mainSwiper .swiper-button-prev",
			},
			loop: true,
			on: {
				transitionStart: function(){
					//player.pauseVideo();	
				},
				transitionEnd: function(){
					player.playVideo();	
				}
			}
			
		});
	</script>
</body>
</html>
