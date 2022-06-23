<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var page = 1;
function pagingReset()
{
	page = 1;
}

$(document).ready(function(){
	
})
function makePaging(nowPage, s_page, e_page, pageNum, val)
{
	page = nowPage;
	var inner = "";
	inner += '<ul class="board-pagination-pages">';
	if(Number(page) > 5)
	{
		inner += '		<li class="first-page"><a onclick="javascript:pageMoveAjax(1);">처음</a></li>';
		inner += '		<li class="prev-page"><a onclick="javascript:pageMoveAjax('+(Number(s_page)-1)+');">«</a></li>';
	}
	var pagingCnt = 0;
	if(e_page != '0')
	{
		for(var i = Number(s_page); i <= Number(e_page); i++)
		{
			pagingCnt ++;
			if(i == page)
			{
				inner += '			<li class="active"><a onclick="javascript:pageMoveAjax('+i+');">'+i+'</a></li>';
			}
			else
			{
				inner += '			<li><a onclick="javascript:pageMoveAjax('+i+');">'+i+'</a></li>';
			}
		}
	}
	if(e_page == '0')
	{
		inner += '		 <li><a onclick="javascript:pageMoveAjax('+i+');">1</a></li>';
	}
	if(pageNum != page)
	{
		if(Number(pageNum) > 5)
		{
			if(pagingCnt > 4)
			{
				if(Number(e_page)+1 > Number(pageNum))
				{
					inner += '            		<li class="next-page"><a onclick="javascript:pageMoveAjax('+pageNum+');">»</a></li>'; 
					inner += '            		<li class="last-page"><a onclick="javascript:pageMoveAjax('+pageNum+');">마지막</a></li>'; 
				}
				else
				{
					inner += '            		<li class="next-page"><a onclick="javascript:pageMoveAjax('+(Number(e_page)+1)+');">»</a></li>'; 
					inner += '            		<li class="last-page"><a onclick="javascript:pageMoveAjax('+pageNum+');">마지막</a></li>'; 
				}
			}
		}
	}
	inner += '</ul>';
	return inner;
}

function pageMoveAjax(nowPage)
{
	page = nowPage;
	$('#page').val(page);
	getList();
}

</script>
<div class="board-pagination"></div>







