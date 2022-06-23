'use strict';

function portInit()
{
	$("#port-sec01 .portfolio-list tr").each(function(){	
		$(this).find(".portfolio-list-thumbnail a").removeAttr("href");
		var src = $(this).find(".port_link").text(); // 동영상 링크
		var img = $(this).find(".cont-img > img").attr("src"); // 이미지 주소
		
		var widd = $(window).width();
		$(this).on("click",function(){
			pop_go();
		})	
		function pop_go(){
			$(".vid_pop").find("iframe").attr("src", src);
			$(".vid_pop iframe").css({"width":widd*0.75, "height": widd*0.45, "margin-top":-(widd*0.45)/2});
			
			var chk_vid = $(".vid_pop iframe").attr("src");
			// 동영상 없을 때
			if(chk_vid == "") {
				$(".vid_pop").prepend("<img src=" + img + " class='vid_img'>");	
			}
			$(".vid_pop").show();
		}
		
		$(".btn_close").on("click",function(){
			close();
		})
		function close(){
			$(".vid_pop").hide();
			$(".vid_pop iframe").attr("src","");
			$(".vid_pop .vid_img").remove();
		}
		
	})
}
$(function() {
	
	/* header - gnb*/
	const path = window.location.pathname;
	const header = document.querySelector('header');
	const logo = document.querySelector('.logo img')
	const ham = document.querySelector('.ham_menu');
	
	if(path.indexOf('index') === -1) {
		header.style.position = 'relative';
		logo.setAttribute('src', '/img/web/img/main_logo_on.png');
		ham.setAttribute('src', '/img/web/img/main_ham_bt.png');	
	}
	
	ham.addEventListener('click', function() {
		const hdMode = header.classList.contains('on');
		
		if(hdMode === true) {
			$(".gnb_wr").slideUp(300);
			header.classList.remove('on');
			
			if(path.indexOf('index') > -1) {
				setTimeout(function() {
					header.style.background= 'transparent';
					logo.setAttribute('src', '/img/web/img/main_logo.png');
					ham.setAttribute('src', '/img/web/img/main_ham.png');
				}, 300);
			}
			
		}else {

			if(path.indexOf('index') > -1) {
				header.style.background= '#fff';
				logo.setAttribute('src', '/img/web/img/main_logo_on.png');
				ham.setAttribute('src', '/img/web/img/close_bt.png');	
			}
			
			$(".gnb_wr").slideDown(300);
			header.classList.add('on');
		}
				
	})
	
	/* btn-top */
	document.addEventListener('scroll', function() {
		let scroll = document.documentElement.scrollTop;
		const ht = window.innerHeight;
		const top = document.querySelector('.btn_top');
		
		if(scroll >= ht) {
			top.style.display = 'block';
		}else {
			top.style.display = 'none';
		}
		
	})

	$(".btn_top").click(function() {
		$("html, body").animate({"scrollTop":"0"}, 500);
	})
	
	/* footer */
	$(".fam_box").click(function() {
		var chk = $(this).hasClass("on");

		if(chk == true) {
			$(this).removeClass("on");
			$(".fam_list").slideUp(300);
		}else {
			$(this).addClass("on");
			$(".fam_list").slideDown(300);
		}
	})
	
	/* 컨설팅 */
	$('.consult_tab ul li').click(function() {
		let idx = $(this).index();
		
		$('.consult_tab ul li, .consult_wr .consult_box').removeClass('on');
		$('.consult_tab ul li').eq(idx).addClass('on');
		$('.consult_wr').each(function() {
			$(this).find('.consult_box').eq(idx).addClass('on');
		})
		
	})
	
	/* 포트폴리오 */
	
	/*신한카드*/
	var loca = window.location.pathname;	
	if(loca.indexOf('contact_sh') > -1){
		$('a').attr("target","_blank");
	}
	
	
	/* 다이렉트몰 */
	$("#dir-sec03 .pg_list_mo").addClass("owl-carousel");
	$('#dir-sec03 .pg_list_mo').owlCarousel({
		loop:true,
		items:1,
		margin:10,
		nav:false,
		dots:true,
		autoplay:false
	})
	

	
	/* 매채소개 */
	var mySwiper1 = new Swiper ('.swiper-container1', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		slidesPerView: 4,
		slidesPerColumn: 1,
		spaceBetween: 20,
		pagination: false
	})

	var mySwiper2 = new Swiper ('.swiper-container2', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		slidesPerView: 4,
		slidesPerColumn: 2,
		spaceBetween: 15,
		breakpoints : {				
			767 : {  
				slidesPerView : 6
			},
			479 : {  
				slidesPerView : 4	
			}
		},
		pagination: false,
		autoplay: {
			delay: 2500,
			disableOnInteraction: false,
		 }
		/*
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		}*/

	})
	
	var mySwiper3 = new Swiper ('.swiper-container3', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		slidesPerView: 4,
		slidesPerColumn: 2,
		spaceBetween: 15,
		breakpoints : {				
			767 : {  
				slidesPerView : 6
			},
			479 : {  
				slidesPerView : 4	
			}
		},
		pagination: false,
		autoplay: {
			delay: 2500,
			disableOnInteraction: false,
		 }
	})

	
	
	
})


// 문의 버튼 스크롤시 위치조정
//$(window).ready(function(){
//
//	var gnbTop = $('#main-sec01').offset().top;  // 현재 window scrollTop
//	var _qnabtn = $('div[data-ch-testid ="launcher"]');
//	$(window).scroll(function(){
//		var s = $(window).scrollTop();	// 현재 window scrollTop
//		if( s > gnbTop - 80 ){
//			_qnabtn.attr('style','bottom:5% !important')
//			console.log("zz");
//		} else if( 0 == s) {
//			_qnabtn.attr('style','bottom:23.5% !important')
//			console.log("zzd");
//		}
//	})
//
//
//});




$(window).on('click', function(){
	
	/* 휴엔케어/사이버대학교/공공기관 영역 */
	var tab = $('.succe-tab > li');
	var cont = $('.success-inbox');
	
	$.each(tab, function(index, item){
		$(this).click(function(){
			cont.removeClass('on');
			cont.eq(index).addClass('on');
			tab.removeClass('on');
			$(this).addClass('on');		
			tab.removeClass('subcolor');
			
			if($(this).index() === 0){
				//tab.index(1).addClass('subcolor');
				tab.eq(1).addClass('subcolor');
			}else if($(this).index() === 1){
				tab.eq(0).addClass('subcolor');
			}else{
				tab.eq(0).addClass('subcolor');
			}
			
		});
		
	});
	
	
	
	
	/* 운영성과/운영방향 영역 */
	var tab2 = $('.success-inbox.on .succe-tab-sub li');
	var cont2 = $('.success-inbox.on .su-res-box');	
	
	$.each(tab2, function(index, item){
		$(this).click(function(){
			cont2.removeClass('on');
			cont2.eq(index).addClass('on');
			tab2.removeClass('on');
			$(this).addClass('on');
			console.log($(this));
		});
	});
	
	
	
	
	
});
