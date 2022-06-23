<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp"/>
<script>
$(document).ready(function(){
	// getList('전체');
	$('.portfolio-category-list').find('li').find('a').click(function() {
		pagingReset();
		$('.portfolio-category-list').find('li').removeClass("on");
		$(this).parents("li").addClass("on");
		getList($(this).html());
	});
	
	getList();
})
function getList()
{
	$.ajax({
		type : "POST", 
		url : "./getPortfolio",
		dataType : "text",
		data : 
		{
			page : page,
			search_type : $("#search_name").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			//console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<tr>';
					inner += '	<td class="portfolio-list-thumbnail">';
					inner += '		<a href="">';
					inner += '			<img src="/upload/port/'+result.list[i].thumbnail+'" style="width:400px; height:250px;">';
					inner += '			<div class="thum_bg"></div>';
					inner += '		</a>';
					inner += '	</td>';
					inner += '	<td class="portfolio-list-title">';
					inner += '		<a href="">'+result.list[i].main_title+'</a>';
					inner += '	</td>';
					inner += '	<td class="port_link">'+result.list[i].url+'</td>';
					inner += '	<td class="cont-img"><img src="/upload/port/'+result.list[i].banner+'" alt=""></td>';
					inner += '</tr>';
				}
			}
			else
			{
			}
			$("#target").html(inner);
			portInit();
			$(".board-pagination").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
		}
	});	
	
}
</script>
<div id="port-sec01">
	<div class="port_wr">
		<div>
			<h3>Portfolio</h3>
		</div>
		<!-- 검색폼 시작 -->
		<div class="board-search">
				<input type="text" id="search_name" name="keyword" placeholder="검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);">
				<button type=""  onclick="javascript:getList();" class="portfolio-thumbnail-button-small">검색</button>
		</div>
		<!-- 검색폼 끝 -->
			
	</div>
	
	<div class="portfolio-category category-pc">
		<ul class="portfolio-category-list">
			<li class="on"><a>전체</a></li>
			<!-- <li><a>음식점</a></li>
			<li><a>보험 · 분양</a></li>
			<li><a>예식장 · 장례식장</a></li>
			<li><a>행사 · 이벤트 · 캠페인</a></li>
			<li><a>패션 · 뷰티</a></li>
			<li><a>가구 · 인테리어</a></li>
			<li><a>건강 · 스포츠</a></li>
			<li><a>교육</a></li>
			<li><a>펫</a></li>
			<li><a>키즈</a></li> -->
		</ul>
	</div>
	
	
	<!-- 리스트 시작 -->
	<div class="portfolio-list">
		<table>
			<thead>

			</thead>
			<tbody id="target">

			</tbody>
				
		</table>
	</div>
	<!-- 리스트 끝 -->
	
	<!-- 페이징 시작 -->
	<jsp:include page="/WEB-INF/pages/web/layout/paging.jsp"/>
	<!-- 페이징 끝 -->
		

</div>

<div class="vid_pop"><iframe src="https://www.youtube.com/embed/jKMh6bbJDuE" id="targetFrame" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
<img class="btn_close" src="/img/web/img/btn_close.png" /></div>

<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>