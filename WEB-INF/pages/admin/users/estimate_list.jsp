<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script>

$(document).ready(function(){
    $('.mainmenu').children().eq(2).addClass('on');
    
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

 	$(document).ready(function(){
 		//	$("#p_"+page).addClass("active");
 		//	$("#search_name").val(search_name);
 		//	if(order_by == "desc")
 		//	{
 		//		$("#sort_"+sort_type).html('<img src="/img/icon_up.png">');
 		//	}
 		//	else if(order_by == "asc")
 		//	{
 		//		$("#sort_"+sort_type).html('<img src="/img/icon_down.png">');
 		//	}
 		//	if(listSize != "")
 		//	{
 		//		$("#listSize").val(listSize);
 		//	}
 		})
 		
// 삭제
function delContent()
{
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += '\''+$(this).attr("id").replace("chk_", "")+"\',";
		}
	});
	if(chkIdx == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/delContent",
			dataType : "text",
			async : false,
			data : 
			{
				idx : chkIdx,
				tb : 'tbl_cate'
			},
			error : function() 
			{
				console.log("AJAX ERROR");
			},
			success : function(data) 
			{
				console.log(data);
				var result = JSON.parse(data);
				if(result.isSuc == "success")
	    		{
	    			alert(result.msg);
	    			getList();
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});	
	}
}
	
// 게시판 목록 조회
function getList(paging_type)
{
	getListStart();
	$.ajax({
		type : "POST", 			
		url : "/admin/getestimatelist",	
		dataType : "text",
		data : 
   		{
			page : page,
			order_by : order_by,
			sort_type : sort_type,
			listSize : $("#listSize").val(),
			search_type : $("#search_type").val(),
			search_name : $("#search_name").val(),
			start_date : $("#start_date").val().replace(/-/gi, ""),
			finish_date : $("#finish_date").val().replace(/-/gi, "")
   		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
   			var result = JSON.parse(data);
   			$(".serch_cont_txt").html("결과 "+result.listCnt+" / 전체"+result.listCnt_all+"개");
			var inner = "";
			
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<ul><a href="/admin/users/estimate_edit?idx='+result.list[i].idx+'">';
					inner += '	<li>';
					inner += '		<input class="regular-radio" type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs">';
					inner += '	</li>';
					inner += '	<li>'+result.list[i].cate1+'</li>';
					inner += '  <li>'+result.list[i].cate2+'</li>';
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
    	<div class="search">
    	<p>견적 분류 관리<span>견적 분류 관리 리스트입니다.</span></p>
    		<input type="button" class="enroll" value="등록" onclick="location.href='/admin/users/estimate_upload'"/>
    		<div class="seacrh_info search_bot select_a">
    			<table>
                    <tr>
                        <td class="search_txt">조건 선택</td>
                        <td>
                            <div class="m_line">
                               <select de-data="전체" id="search_type" name="search_type" class="dis-no d_inline">
                                    <option value="">전체</option>
                                    <option value="cate1">대분류</option>
                                    <option value="cate2">중분류</option>
                                </select>
                                <!-- <div class="d_inline">
                                    <ul class="check_wrap">
                                        <li>
                                            <input type="radio" id="list_tem" name="view_check" value="" class="regular-radio" checked="">
                                            <label for="list_tem"><span>임시저장 목록 보기</span></label>
                                        </li>
                                        <li>
                                            <input type="radio" id="list_sec" name="view_check" value="" class="regular-radio">
                                            <label for="list_sec"><span>비밀글만 보기</span></label>
                                        </li>
                                    </ul>
                                </div>  -->
                            </div> 
                        </td>
                        <td class="lsit_search" rowspan="3">
                            <input type="button" onclick="getList()" class="search_bt" value="search" onclick="javascript:pagingReset(); getList();"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="search_txt">검색어</td>
                        <td>
                            <div class="m_line serch_key_box">
                                <input type="text" id="search_name" name="search_name" class="search_key" placeholder="검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="search_txt">기간 검색</td>
                        <td>
                            <div class="m_line">
                                <div class="date_line">
                                    <div class="date_box"><input type="text" id="start_date" name="" class="search_date" autocomplete="off" placeholder="2020-08-20"/></div>
                                    <div class="date_box"><input type="text" id="finish_date" name="" class="search_date" autocomplete="off" placeholder="2020-08-26"/></div>
                                </div>
                                <div class="check_box">
                                    <ul class="check_wrap check_d">
                                        <li onclick="setDateBySearch('all');"><input type="radio" id="allChk" name="during" value="" class="regular-radio" checked/><label for="allChk"><span>전체</span></label></li>
                                        <li onclick="setDateBySearch('7');"><input type="radio" id="radio-1-2" name="during" value="" class="regular-radio"/><label for="radio-1-2"><span>7일</span></label></li>
                                        <li onclick="setDateBySearch('15');"><input type="radio" id="radio-1-3" name="during" value="" class="regular-radio"/><label for="radio-1-3"><span>15일</span></label></li>
                                        <li onclick="setDateBySearch('1');"><input type="radio" id="radio-1-4" name="during" value="" class="regular-radio" /><label for="radio-1-4"><span>1개월</span></label></li>
                                        <li onclick="setDateBySearch('3');"><input type="radio" id="radio-1-5" name="during" value="" class="regular-radio"/><label for="radio-1-5"><span>3개월</span></label></li>
                                    </ul>
                                 </div>
                             </div>
                        </td>
                    </tr>
                </table>
    		</div>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                <ul class="left">
                    <li><span class="serch_cont_txt"><strong>결과 10개</strong> / 전체 75개</span></li>
                    <li><a onclick="delContent();" class="del_bt"><img src=""/>선택 삭제</a></li>
                    <!-- <li>
                        <ul class="post_view">
                            <li>선택한 게시글 노출여부</li>
                            <li><span class="diable_sel" disabled="true">N</span></li>
                            <li><a href="" class="expose_bt">반영</a></li>
                        </ul>
                    </li> -->
                </ul>
                     <ul class="right">
                         <select id="listSize" name="listSize" class="dis-no" onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
							<option value="10">10개 보기</option>
							<option value="20">20개 보기</option>
							<option value="50">50개 보기</option>
							<option value="100">100개 보기</option>
							<option value="300">300개 보기</option>
							<option value="500">500개 보기</option>
							<option value="1000">1000개 보기</option>
					  </select>
               	 </ul>                
            </div>
        	<div class="search_cont">        	    
            <div class="table-list text-center table-fix table-quot">
             <div>
                <div class="t_hd">
                <ul>
                	<li><input class="regular-radio" type="checkbox" id="chk_all" name="chk_all" value="chk_val"/><label for="chk_all"></label></li>
                    <li>대분류<span id="" onclick=""><img src="/img/list_icon_down.png"></span></li>
                    <li>중분류<span id="" onclick=""><img src="/img/list_icon_down.png"></span></li>
                </ul>
                </div>
                <div class="tb_div">
                </div>
        </div>
    </div>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>