<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LG헬로비전</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/preview/js/animation.js"></script>
<script src="/preview/js/musign.js"></script>

<!-- 추가플러그인 -->
<script src="/preview/js/swiper.js"></script>
<link rel="stylesheet" href="/preview/css/swiper.css">

<!-- 뮤자인 -->
<link rel="stylesheet" href="/preview/css/mu_layout.css">

<link rel="stylesheet" href="/preview/css/main_in.css">

<script>

</script>
</head>
<body>


<c:forEach var="i" items="${list}" varStatus="loop">

	<c:if test="${i.banner ne '' }">
		<div id="main_popup" class="main_popup pop_idx${i.idx}">
			<div class="">
				<img src="${image_dir}popup/${i.banner}" alt="" onerror="this.src='/img/noimg.png'" />
			</div>

			<div class="popup_bottom">
				<span class="close_popup_day" onclick="pop_todayclose('${i.idx}')">오늘하루 열지않기</span>
				<div class="event-pop" onclick="pop_close('${i.idx}')"">닫기</div>
			</div>
		</div>
		
		<div id="main_popup" class="main_popup pop_idx${i.idx}" style="position: absolute; z-index: 10000; ">
			<div class="popup_bottom">
				<span class="close_popup_day" onclick="pop_todayclose('${i.idx}')">오늘하루 열지않기</span>
				<div class="event-pop" onclick="pop_close('${i.idx}')"">닫기</div>
			</div>
		</div>
	</c:if>
	
	
</c:forEach>


<script>
var openPopCnt = 0;
$(window).ready(function(){
	var pop_idx='';
	var pop_idx_arry=[];
	$('.main_popup').each(function(){ 
		pop_idx = $(this).attr('class').replace('main_popup','').trim();
		pop_idx_arry.push(pop_idx);
	})

	for (var i = 0; i < $('.main_popup').length+1; i++) {
		if(getCookie(pop_idx_arry[i])!="Y"){
			$("."+pop_idx_arry[i]).show('fade');
			if(pop_idx_arry[i] != undefined)
			{
    			openPopCnt ++;	
			}
		}
	}
	if(openPopCnt > 0)
	{
		$("#main_popup_bg").show();
	}
});
function pop_todayclose(idx){
	alert("미리보기에서는 해당 기능을 지원하지 않습니다.");
}
function pop_close(idx){
	$(".pop_idx"+idx).hide('fade');
	openPopCnt --;
	if(openPopCnt == 0)
	{
		$("#main_popup_bg").hide();
	}
}
</script>
				
</body>
</html>
