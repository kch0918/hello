'use strict';

$(function() {

	$(window).load(function() {
		$('#ad_count1, #ad_count2').counterUp({
			delay: 50,
			time: 3000
		});	
		$(".ad_count").css("opacity", "1");
	})

	/* main-partners */
	$(window).ready(function() {
		setTimeout(function(){
			$(".scroller").simplyScroll(); 	
		}, 500);
		
	})
	
	/* main - vid */
	const vid_id = document.querySelector('#main-sec01 #player').getAttribute('src').split("embed/")[1].split("?")[0];
	const vid = 'https://www.googleapis.com/youtube/v3/videos?id=' + vid_id + '&key=AIzaSyBtrNxBQ2Y91_p9wdlvlRc2WDb0yOrA4NI&part=snippet,contentDetails,statistics,status';
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			const jsonObj = JSON.parse(this.response);
			const duration = jsonObj['items'][0].contentDetails.duration; // 재생시간
			const chageDuration = changeTime(duration); // 변환시간

			const bar = new ProgressBar.Circle(container, {
			   strokeWidth: 3,
			   easing: 'easeInOut',
			   duration: chageDuration,
			   color: '#ed174d',
			   trailColor: '#eee',
			   trailWidth: 1,
			   svgStyle: null
			});
			bar.animate(1.0);  // circle 카운트 (Number from 0.0 to 1.0)
		}

	};
	xhr.open("GET", vid, true);
	xhr.send();
	
	
	
	/* main - step */
	document.addEventListener('scroll', function() {
		let scroll = document.documentElement.scrollTop;
		const sec1 = document.getElementById('main-sec04');
		const sec2 = document.getElementById('main-sec05');

		const secPos1 = window.pageYOffset + sec1.getBoundingClientRect().top;
		const secPos2 = window.pageYOffset + sec2.getBoundingClientRect().top;

		if(scroll > secPos1-200 && scroll < secPos2-200) {
			sec1.classList.add('on');
			activeStep(4);
		}else if(scroll > secPos2-200){
			sec2.classList.add('on');
			activeStep(5);
		}

	})

	/* grid-box */
	$(".grid_wr > div").each(function() {
		var wid = $(window).width();
		var idx = $(this).index();
		
		if(wid >= 1024) {
			$(this).mouseenter(function() {
				$(this).addClass("on");
				$(this).find("img").attr("src","../img/icon_arrowp.png");
			})
			$(this).mouseleave(function() {
				$(this).removeClass("on");

				if(idx==0 || idx==1) {
					$(this).find("img").attr("src","../img/icon_arrowb.png");
				}else if(idx==2) {
					$(this).find("img").attr("src","../img/icon_arrowh.png");
				}
			})
		}

		$(this).click(function() {
			if(idx==0) {
				location.href="/self/quotation";
			}else if(idx==1) {
				location.href="ad_broadcast";
			}else if(idx==2) {
				location.href="direct_mall";
			}
		})
	})
	
})

// 재생시간 변환
function changeTime(duration) {
	const hourRegex = new RegExp("[0-9]{1,2}H", "gi");
	const minRegex = new RegExp("[0-9]{1,2}M", "gi");
	const secRegex = new RegExp("[0-9]{1,2}S", "gi");
 
	let hour = hourRegex.exec(duration);
	let min = minRegex.exec(duration);
	let sec = secRegex.exec(duration);
	  
	if(hour!==null){
		hour = hour.toString().split("H")[0] + ":";
	}else{
		hour = "";
	}
	if(min !==null){
		min = min.toString().split("M")[0];
		if(min.length<2){
		 min = "0"+min;
		}
	 }else{
		min = "00";
	 }
	 if(sec !==null){
		sec = sec.toString().split("S")[0];
		if(sec.length<2){
		 sec = "0"+sec;
		}
	 }else{
		 sec = "00";
	 }
	 duration = hour+min+":"+sec;

	 const vid_time = (hour*3600000) + (min*60000) + (sec*1000);

	 return vid_time;
}

// what we do
function activeStep(idx) {
	const num = '#main-sec0' + idx;
	const whatList = document.querySelector(num + ' .what_list').children;

	for(let i=0; i<whatList.length; i++) {
		(function(j) {
			setTimeout(function() {
				$(".what_list li").removeClass('on');
				whatList[j].classList.add('on');
			},2000 * j);
		})(i);
	}

}

function toCommaStringF( number ) {
	var number_string = number.toString();
	var number_parts = number_string.split('.');
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	
	if (number_parts.length > 1) {
		return number_parts[0].replace( regexp, ',' ) + '.' + number_parts[1]; 
	} else { 
		return number_string.replace( regexp, ',' ); 
	} 
}

function getCnt(){
	$.ajax({
		url: "/admin/selFakeCnt.php",
		type: "POST",
		success: function(data){
			var result = JSON.parse(data)[0];
			var won = toCommaStringF(result.won);
			var gun = toCommaStringF(result.gun);
			var wonCont = document.querySelectorAll("#ad_count1");
			var gunCont = document.querySelectorAll("#ad_count2");
			for(var i = 0; i < wonCont.length; i++){
				wonCont[i].textContent = won;
			}
			for(var i = 0; i < gunCont.length; i++){
				gunCont[i].textContent = gun;
			}
		}
	});
}
