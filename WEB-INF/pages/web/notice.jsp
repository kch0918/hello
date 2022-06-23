<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp"/>
<script>

$(document).ready(function(){
	getList();
});

var searchName = $("#searchName").val();

// 게시판 목록 조회
function getList(val)
{
	$.ajax({
		type : "POST", 
		url : "./getWebnoticetList",
		dataType : "text",
		data : 
		{
			page : page,
			search_name : $("#searchName").val(),
			cate : '공지사항'
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			$(".serch_cont_txt").html("전체 "+result.listCnt+"개&nbsp");
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<tr>';
					inner += '	<td class="notice-list-uid">'+result.list[i].idx+'</td>';
					inner += '	 <td class="notice-list-title">'; 
					inner += ' 		<a href="/notice_view?idx='+result.list[i].idx+'">';
					inner += '		<div class="notice-default-cut-strings">';
					inner += '		<li>'+result.list[i].main_title+'</li>';
					inner += '		</a>';
					inner += '	</td>';
					inner += '	<td class="notice-list-date">'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '</tr>';
				}
			}
			else
			{
			}
			$("#target").html(inner);
			$(".board-pagination").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
		}
	});	
}
	
</script>

<div id="board-sec01">
	<div class="board_tab">
		<h3>공지사항</h3>
		<ul>
			<li class="on"><a href="./notice">공지사항</a></li>
			<li><a href="./info">이용안내</a></li>
		</ul>
	</div>
	
	<!-- 게시판 정보 시작 -->
	<div class="notice-list-header">
		<div class="notice-total-count">
			<span class="color-r serch_cont_txt">전체 75</span>의 게시물이 있습니다.
		</div>

		<!-- 검색폼 시작 -->
		<div class="board-search">
				<input type="text" name="searchName"  id="searchName" placeholder="검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/>
				<button type="" class="portfolio-thumbnail-button-small" onclick="javascript:getList();">검색</button>
		</div>
		<!-- 검색폼 끝 -->
	</div>
	<!-- 게시판 정보 끝 -->
	
	<!-- 리스트 시작 -->
	<div class="notice-list">
		<table>
			<thead>
				<tr>
					<td class="notice-list-uid">No.</td>
					<td class="notice-list-title">제목</td>
					<td class="notice-list-date">등록일</td>
				</tr>
			</thead>
			<tbody id="target">
			
			</tbody>
		</table>
	</div>
	<!-- 리스트 끝 -->
	
	<!-- 페이징 시작 -->
	<jsp:include page="/WEB-INF/pages/web/layout/paging.jsp"/>
<!-- 	<div class="board-pagination"> -->
<!-- 		<ul class="board-pagination-pages"> -->
<!-- 			<li class="first-page"><a href="">처음</a></li> -->
<!-- 			<li class="prev-page"><a href="">«</a></li> -->
<!-- 			<li class="active"><a href="">1</a></li> -->
<!-- 			<li><a href="">2</a></li> -->
<!-- 			<li><a href="">3</a></li> -->
<!-- 			<li class="next-page"><a href="">»</a></li> -->
<!-- 			<li class="last-page"><a href="">마지막</a></li>		 -->
<!-- 		</ul> -->
<!-- 	</div> -->
	<!-- 페이징 끝 -->
</div>



<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>