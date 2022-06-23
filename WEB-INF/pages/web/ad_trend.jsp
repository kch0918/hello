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
function getList(val)
{
	$.ajax({
		type : "POST", 
		url : "./getTrend",
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
					inner += '<tr onclick="javascript:location.href=\'./trend_view?idx='+result.list[i].idx+'\'">';
					inner += '	<td class="portfolio-list-thumbnail">';
					inner += ' 		<a>';
					inner += '			<img src="/upload/port/'+result.list[i].thumbnail+'" style="width:400px; height:250px;">';
					inner += '			<div class=""></div>';
					inner += '		</a>';
					inner += '	</td>';
					inner += '	<td class="portfolio-list-title">';
					inner += '		<a href="/trend_view?idx='+result.list[i].idx+'">'+result.list[i].main_title+'</a>';
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
<div id="port-sec01" class="ad_trend">
	<div class="port_wr">
		<div>
			<h3>광고 트렌드 분석</h3>
		</div>
		<!-- 검색폼 시작 -->
		<div class="board-search">
				<input type="text" id="search_name" name="keyword" placeholder="검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);">
				<button type="" onclick="javascript:getList();" class="portfolio-thumbnail-button-small">검색</button>
		</div>
		<!-- 검색폼 끝 -->
			
	</div>
	
	<div class="portfolio-category category-pc">

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

<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>