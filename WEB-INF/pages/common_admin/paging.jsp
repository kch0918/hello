<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var page = 1;
var order_by = "";
var sort_type = "";
var scr_stat = getCookie("scr_stat");
var isLoading = false; //로딩중일땐 호출안되도록.
function pagingReset()
{
	page = 1;
	order_by = "";
	sort_type = "";
}

$(function(){
	$(".listSize").parent().addClass("listSize-box");
})
$(document).ready(function(){
	if(scr_stat == "ON")
	{
		$(".listSize-box").hide();
		$(".table-list").attr("style", "height:500px !important; overflow-y : scroll !important;");
		$(".table-list").scroll(function() {
			var scrollTop = $(this).scrollTop();
	        var innerHeight = $(this).innerHeight();
	        var scrollHeight = $(this).prop('scrollHeight');

	        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight)
	        {
	        	if(!isLoading)
	        	{
	        		isLoading = true;
		        	page = page + 1;
		        	pageMoveScroll(page);
	        	}
	        }
		});
	}
	else
	{
		$(".table-list").attr("style", "");
		$(".listSize-box").show();
	}
})
function makePaging(nowPage, s_page, e_page, pageNum, val)
{
	page = nowPage;
	var inner = "";
	if(scr_stat == "ON")
	{
		inner += '<div class="page_box" style="display:none;">';
	}
	else
	{
		inner += '<div class="page_box" style="display:block;">';
	}
	if(Number(page) > 5)
	{
		inner += '		<a class="bt_first" onclick="javascript:pageMoveAjax(1);"></a>';
		inner += '    	<a class="bt_left" onclick="javascript:pageMoveAjax('+(Number(s_page)-1)+');"></a>';
	}
	var pagingCnt = 0;
	inner += '<div class="page_num">'
	if(e_page != '0')
	{
		for(var i = Number(s_page); i <= Number(e_page); i++)
		{
			pagingCnt ++;
			if(i == page)
			{
				inner += '			<a onclick="javascript:pageMoveAjax('+i+');" id="p_'+i+'" class="bt_num bt_act">'+i+'</a>';
			}
			else
			{
				inner += '			<a onclick="javascript:pageMoveAjax('+i+');" id="p_'+i+'" class="bt_num">'+i+'</a>';
			}
		}
	}
	if(e_page == '0')
	{
		inner += '		 <a onclick="javascript:pageMoveAjax(1);" class="bt_num">1</a>';
	}
	if(pageNum != page)
	{
		if(Number(pageNum) > 5)
		{
			if(pagingCnt > 4)
			{
				inner += '</div>'
				if(Number(e_page)+1 > Number(pageNum))
				{
					inner += '            		<a class="bt_right" onclick="javascript:pageMoveAjax('+pageNum+');"></a>'; 
					inner += '            		<a class="bt_last" onclick="javascript:pageMoveAjax('+pageNum+');"></a>'; 
				}
				else
				{
					inner += '					<a class="bt_right" onclick="javascript:pageMoveAjax('+(Number(e_page)+1)+');"></a>';
					inner += '            		<a class="bt_last" onclick="javascript:pageMoveAjax('+pageNum+');"></a>'; 
				}
			}
		}
	}
	inner += '</div>';
	isLoading = false;
	return inner;
}
function reSortAjax(act)
{
	if(!isLoading)
	{
		sort_type = act.replace("sort_", "");
		console.log(sort_type);
		console.log(order_by);
		if(order_by == "")
		{
			order_by = "desc";
			$("#"+act).attr("src", "/img/list_icon_down.png");
		}
		else if(order_by == "desc")
		{
			order_by = "asc";
			$("#"+act).attr("src", "/img/list_icon_up.png");
		}
		else if(order_by == "asc")
		{
			order_by = "desc";
			$("#"+act).attr("src", "/img/list_icon_down.png");
		}
		page = 1;
		$("#order_by").val(order_by);
		$("#sort_type").val(sort_type);
		$("#page").val(page);
		getList();
	}
}
function pageMoveAjax(nowPage)
{
	if(!isLoading)
	{
		page = nowPage;
		$('#page').val(page);
		getList();
	}
}
function pageMoveScroll(nowPage)
{
	page = nowPage;
	getList('scroll');
}
function getListStart()
{
	$(".search_bt").prop("disabled", true);
	isLoading = true;
}
function getListEnd()
{
	$(".search_bt").prop("disabled", false);
	isLoading = false;
}

</script>
<div class="paging"></div>







