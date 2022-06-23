<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="ad-sec01">
	<div class="ad_top">
		<h2 class="lg-txt">광고 매체 소개</h2>
		<p class="ad_intro">
			LG헬로비전 광고에서 제공하는 매체별 광고를 소개합니다. <strong>우리는 광고주가 가장 적은 비용으로
				가장 높은 효과를 낼 수 있게 합니다.</strong>
		</p>
	</div>
</div>


<div id="ad-sec02">
	<ul class="ad_tab">
		<li><a href="./ad_broadcast">TV 광고</a></li>
		<li><a href="./ad_online">온라인 광고</a></li>
		<li><a href="./ad_outside">옥외 광고</a></li>
		<li><a href="./ad_paper">지면 광고</a></li>
	</ul>
</div>



<script>
$(function() {
	$(window).ready(function() {
		const url = document.location.pathname;	
		$('.ad_tab li > a').each(function() {
			const tab = $(this).attr("href").split('/')[1];
			if(url.indexOf(tab) > -1) {
				$(this).parents('li').addClass('on');
			}
		})
	})
})

</script>