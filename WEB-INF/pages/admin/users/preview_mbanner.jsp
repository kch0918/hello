<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LG헬로베전</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- <script src="/preview/js/jquery.nicescroll.min.js"></script> -->
<script src="/preview/js/animation.js"></script>
<script src="/preview/js/musign.js"></script>

<!-- 추가플러그인 -->
<script src="/preview/js/swiper.js"></script>
<link rel="stylesheet" href="/preview/css/swiper.css">

<!-- 뮤자인 -->
<link rel="stylesheet" href="/preview/css/mu_layout.css">
<!-- <script src="/preview/js/TweenMax.min.js"></script> -->
<!-- <script src="/preview/js/smooth-scrollbar.js"></script> -->
<!-- <script src="/preview/js/ScrollMagic.js"></script> -->
<!-- <script src="/preview/js/animation.gsap.js"></script> -->


<!-- 뮤자인 -->

<link rel="stylesheet" href="/preview/css/main_in.css">
<!-- <script src="/preview/js/main.js"></script> -->


	<link rel="stylesheet" href="/css/web/custom.css">
	<link rel="stylesheet" href="/css/web/musign.css">
	<link rel="stylesheet" href="/css/web/direct_mall.css">
	<link rel="stylesheet" href="/css/web/ad.css">
	<link rel="stylesheet" href="/css/web/board.css">
	<link rel="stylesheet" href="/css/web/contact.css">
	<link rel="stylesheet" href="/css/web/self.css">
	<link rel="stylesheet" href="/css/web/consult.css">
	<link rel="stylesheet" href="/css/web/privacy.css">
	<link rel="stylesheet" href="/css/web/animation.css">
	<link rel="stylesheet" href="/css/web/responsive.css">
	<link rel="stylesheet" href="/js/firecircle.css">
	<link rel="stylesheet" href="/js/jquery.simplyscroll.css">
	<link rel="stylesheet" href="/js/owl.carousel.css">
	<link rel="stylesheet" href="/js/swiper.css">
	
	<script src="https://www.youtube.com/iframe_api"></script>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="/js/bluebird.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="/js/jquery.counterup.min.js"></script>
	<script src="/js/progressbar.min.js"></script>
	<script src="/js/jquery.simplyscroll.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/swiper.min.js"></script>
	<script src="/js/animation.js"></script>
	<script src="/inc/js/function.js"></script>
	<script src="http://malsup.github.io/min/jquery.form.min.js"></script>
<script src="/js/musign/main.js"></script>

<script>
	$(function(){
		var swiper1 = new Swiper('.main-slide', {
			slidesPerView: 1,
			loop: true,
			autoplay: {
				delay: 3000,
				disableOnInteraction: false,
			},
			effect: 'fade',
			pagination: {
				el: '.swiper-pagination',
			},
		});
	})
	$(function(){
		var swiper2 = new Swiper('.rec-bot .swiper-container', {
			slidesPerView: 3,
			scrollbar: {
				el: '.swiper-scrollbar',
				draggable: true,
			},
		});
	})
	

</script>
</head>
<body>
<c:forEach var="i" items="${list}" varStatus="loop">		
	<div id="main-sec01" style="background: url(${image_dir}main_banner/${i.banner})no-repeat center center">
		<div class="vid_box">
			<div class="main_bar"></div>
			<p class="main_tit lg-txt">${data.main_title }</p>
			<p class="main_stit">${data.sub_title }</p>
	
			<div id="container"></div>
		</div>
<!-- src="https://www.youtube.com/embed/5XC4Bub_bcI ?autoplay=1&amp;mute=1&amp;controls=0" -->
		<iframe id="player"
			src="https://www.youtube.com/embed/QApcQh9_kQw?autoplay=1&amp;mute=1&amp;controls=0"
			width="100%" height="950" frameborder="0"
			allowfullscreen="allowfullscreen">
		</iframe>
	
		<div class="count_wr">
			<p class="count_tit">
				LG헬로비전과 <span class="count_stit">함께한</span>
			</p>
	
			<div class="ad_wr">
				<div class="ad_01">
					<div class="ad_img"></div>
					<div class="ad_box">
						<p class="ad_tit">총 광고 규모</p>
						<p class="ad_stit">
							<span id="ad_count1" class="ad_count"><fmt:formatNumber
									value="${won}" pattern="#,###" /></span><span class="ad_stit2">원</span>
						</p>
					</div>
				</div>
				<div class="ad_02">
					<div class="ad_img"></div>
					<div class="ad_box">
						<p class="ad_tit">총 광고주 수</p>
						<p class="ad_stit">
							<span id="ad_count2" class="ad_count"><fmt:formatNumber
									value="${gun}" pattern="#,###" /></span><span class="ad_stit2">건</span>
						</p>
	
					</div>
				</div>
			</div>
		</div>
		<div class="talk">
			<span class="talk_ct">1</span>
		</div>
	</div>
	<br><br>
</c:forEach>

</body>
</html>