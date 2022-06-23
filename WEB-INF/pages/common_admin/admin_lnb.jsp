<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<div id="inb">
	<ul class="mainmenu">
		<li class="dep1">
			<span>메인컨텐츠 관리</span>
			<ul class="submenu">
				<li><a href="/admin/users/main_list">메인배너 관리</a></li>
				<li class="dis-no"><a href="/admin/users/sub_list">중간배너 관리</a></li>
				<li><a href="/admin/users/popup_list">팝업 관리</a></li>
			</ul>
		</li>
		<li> 
			<a href="/admin/users/adest_list">광고견적 관리</a>	
		</li>
		<li>
			<a href="/admin/users/estimate_list">견적분류 관리</a>	
		</li>
		<li>
			<a href="/admin/users/request_list">견적신청 리스트</a>	
		</li>
		<li>
			<a href="/admin/users/portfolio_list">포트폴리오 관리</a>			
		</li>
		<li>
			<a href="/admin/users/adquest_list">광고문의 관리</a>			
		</li>
		<li>
			<a href="/admin/users/adquest_list_sh">신한카드 광고문의 관리</a>			
		</li>
		<li>
			<a href="/admin/users/notice_list">게시판 관리</a>			
		</li>
		<li>
			<a href="/admin/users/ad_category">업종별 광고컨설팅 관리</a>			
		</li>
		<li>
			<a href="/admin/users/adtrend_list">광고트렌드 분석</a>			
		</li> 
		<li>
			<a href="/admin/users/user_log">사용자 로그 관리</a>			
		</li>
	</ul>
</div>

<script>
$(window).ready(function() {
	$('.submenu li a[href *="' + window.location.pathname +'"]').addClass('on');



	var submenuA = $('.submenu li a');
    $('.dep1').mouseenter(function(){
        $('.submenu').stop().slideDown(500); 
        // submenuA.css('color', '#fff');
    });
     $('.dep1').mouseleave(function(){
        $('.submenu').slideUp(500); 
		$('#inb').stop().removeClass('off');
    });
	
})

</script>