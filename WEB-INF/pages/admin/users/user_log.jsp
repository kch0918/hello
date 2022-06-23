<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(10).addClass('on');
	$( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    $('.submenu').children().eq(0).addClass('on');
	$("#chk_all").change(function() {
		if($("input:checkbox[name='chk_all']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", false);
		}
	});
	getList();
});
function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/admin/getUserList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : order_by,
			sort_type : sort_type,
			listSize : "10"
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			$(".serch_cont_txt").html("결과 "+result.listCnt+" / 전체 "+result.listCnt_all+"개");
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<ul>';
					inner += '	<li>';
					inner += '		<input class="regular-radio" type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs">';
					inner += '	</li>';
					inner += '	<li>'+(i+1)+'</li>';	
					inner += '	<li>'+result.list[i].id+'</li>';	
					inner += '	<li>'+result.list[i].submit_date+'</li>';	
					inner += '	<li>'+result.list[i].ip+'</li>';	
					inner += '	<li>'+result.list[i].result+'</li>';	
					inner += '</ul>';
				}
			}
			else
			{
				inner += '<ul>';
				inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
				inner += '</ul>';
			}
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			if(paging_type == "scroll")
			{
				if(result.list.length > 0)
				{
					$(".tb_div").append(inner);
				}
			}
			else
			{
				$(".tb_div").html(inner);
			}
			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			getListEnd();
		}
	});	
}
</script>

<div id="container" class="report">
	<div class="contain_inner">
        <div class="search_con_wrap">
            <div class="info_box">
                <ul class="left">
                    <li><span class="serch_cont_txt"><strong>결과 10개</strong> / 전체 75개</span></li>
                </ul>            
            </div>
        	<div class="search_cont">        	    
            <div class="table-list text-center table-fix table-banner">
            <div>
                <div class="t_hd">
                <ul>
                    <li><input class="regular-radio" type="checkbox" id="chk_all" name="chk_all" value="chk_val"/><label for="chk_all"></label></li>
                    <li>NO.<span onclick="reSortAjax('sort_tbl_mbanner.idx')"><img src="/img/list_icon_down.png" id="sort_tbl_mbanner.idx"/></span></li>
                    <li>계정<span onclick="reSortAjax('sort_main_title')"><img src="/img/list_icon_down.png" id="sort_main_title"/></span></li>
                    <li>날짜/시간<span onclick="reSortAjax('sort_name')"><img src="/img/list_icon_down.png" id="sort_name"/></span></li>
                    <li>IP<span onclick="reSortAjax('sort_start_date')"><img src="/img/list_icon_down.png" id="sort_start_date"/></span></li>
                    <li>성공여부<span onclick="reSortAjax('sort_tbl_mbanner.submit_date')"><img src="/img/list_icon_down.png" id="sort_tbl_mbanner.submit_date"/></span></li>
                </ul>
                </div>
                <div class="tb_div sortable">

                </div>
        	</div>
   	 </div>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>