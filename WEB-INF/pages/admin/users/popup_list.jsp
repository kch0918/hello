<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
	$( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    $('.submenu').children().eq(2).addClass('on');
	$('.dep1').addClass('on');
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
	var is_imsi = "";
	var is_show = "";
	if($("#is_imsi").is(":checked"))
	{
		is_imsi = "Y";
	}
	else
	{
		is_imsi = "";
	}
	if(($("#is_show_n").is(":checked") && $("#is_show_y").is(":checked")) || (!$("#is_show_n").is(":checked") && !$("#is_show_y").is(":checked")))
	{
		is_show = "";
	}
	else
	{
		if($("#is_show_n").is(":checked"))
		{
			is_show = "N";
		}
		else if($("#is_show_y").is(":checked"))
		{
			is_show = "Y";
		}
		
	}
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/admin/getContent",
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
			finish_date : $("#finish_date").val().replace(/-/gi, ""),
			is_imsi : is_imsi,
			is_show : is_show,
			tb : 'tbl_popup'
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
					inner += '	<li>'+result.list[i].idx+'</li>';
					inner += '	<li class="res_name" onclick="javascript:location.href=\'./popup_upload?idx='+result.list[i].idx+'\'">'+nullChk(result.list[i].main_title)+'</li>';
					inner += '	<li>'+nullChk(result.list[i].name)+'</li>';
					inner += '	<li>'+cutDate(result.list[i].start_date)+'~'+cutDate(result.list[i].finish_date)+'</li>';
					inner += '	<li>'+cutDate(result.list[i].submit_date)+'</li>';
					if(result.list[i].is_show == "Y")
					{
						inner += '	<li onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].is_show)+'\');"><span class="bt_yn bt_y">'+nullChk(result.list[i].is_show)+'</span></li>';
					}
					else
					{
						inner += '	<li onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].is_show)+'\');"><span class="bt_yn bt_n">'+nullChk(result.list[i].is_show)+'</span></li>';
					}
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
function changeStatus(idx, val)
{
	var act = "";
	if(val == "N") {act = "Y";}
	else if(val == "Y") {act = "N";}
	
	$.ajax({
		type : "POST", 
		url : "/admin/changeStatus",
		dataType : "text",
		async : false,
		data : 
		{
			idx : idx,
			act : act,
			tb : 'tbl_popup'
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
				getList();
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});	
}
function changeStatusAll()
{
	var act = $("#selStatus").val();
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx = $(this).attr("id").replace("chk_", "");
			$.ajax({
				type : "POST", 
				url : "/admin/changeStatus",
				dataType : "text",
				async : false,
				data : 
				{
					idx : chkIdx,
					act : act,
					tb : 'tbl_popup'
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
						getList();
		    		}
		    		else
		    		{
		    			alert(result.msg);
		    		}
				}
			});	
		}
	});
	
	
}
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
				tb : 'tbl_popup'
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
function setSort()
{
	for(var i = 0; i<document.getElementsByName('idxs').length; i++)
	{
		var idx = document.getElementsByName('idxs')[i].getAttribute('id').split("_")[1];
		$.ajax({
			type : "GET", //전송방식을 지정한다 (POST,GET)
			url : "/admin/setSort?tb=tbl_popup&sort="+i+"&idx="+idx,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
			dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
			async:false,
			error : function() 
			{
				alert("통신 중 오류가 발생하였습니다.");
			},
			success : function(data) 
			{
			}
		});
	}
	alert("저장되었습니다.");
}

function preview()
{
	var chkList = "";
	$("input:checkbox[name='chk_val']").each(function(){
	    if($(this).is(":checked"))
    	{
    		chkList += $(this).attr("id").replace("chk_", "")+",";
    	}
	});
	if(chkList == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}
	
	window.open("./preview_popup?idx="+chkList);
}
</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>팝업 관리<span>팝업 리스트입니다.</span></p>
    		<input type="button" class="enroll" value="등록" onclick="location.href='/admin/users/popup_upload'"/>
    		<div class="seacrh_info search_bot select_a">
    			<table>
                    <tr>
                        <td class="search_txt">조건 선택</td>
                        <td>
                            <div class="m_line">
                                <!-- <div class="d_inline select">
                                    <p class="select-p">전체</p>
                                    <ul class="select-ul" id="">
                                        <li class="active">전체</li>
                                        <li>메인 타이틀</li>
                                        <li>작성자</li>
                                    </ul>
                                    <input type="hidden" id="" name="listSize" value="20">
                                </div> -->
                                <select de-data="전체" id="search_type" name="search_type" class="dis-no d_inline">
                                    <option value="">전체</option>
                                    <option value="title">제목</option>
                                    <option value="creater">작성자</option>
                                </select>
                                <div class="d_inline">
                                    <ul class="check_wrap">
                                        <li>
                                            <input type="checkbox" id="is_imsi" name="is_imsi" value="" class="regular-radio"/>
                                            <label for="is_imsi"><span>임시저장 목록만 보기</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="is_show_n" name="is_show_n" value="" class="regular-radio"/>
                                            <label for="is_show_n"><span>비노출 보기</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="is_show_y" name="is_show_y" value="" class="regular-radio"/>
                                            <label for="is_show_y"><span>노출 보기</span></label>
                                        </li>
                                 </ul>
                                </div> 
                            </div> 
                        </td>
                        <td class="lsit_search" rowspan="3">
                            <input type="button" name="" id="" class="search_bt" value="search" onclick="javascript:pagingReset(); getList();"/>
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
                    <li><a onclick="delContent();" class="del_bt"><img src="">선택 삭제</a></li>
                    <li>
                       <ul class="post_view main_post">
                            <li>선택한 게시글 노출여부</li>
                            <li>
                                <select de-data="Y" id="selStatus" name="selStatus" class="dis-no d_inline">
                                    <option>Y</option>
                                    <option>N</option>
                                </select>                                
                            </li>
                            <li><a onclick="changeStatusAll()" class="expose_bt">반영</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="right">
                    <ul class="view_type">
                        <li><a onclick="javascript:setSort();" >순서 반영하기</a></li>
                        <li><a onclick="javascript:preview();" class="color_p">화면 미리보기</a></li>
                    </ul>
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
            <div class="table-list text-center table-fix table-banner">
            <div>
                <div class="t_hd">
                <ul>
                    <li><input class="regular-radio" type="checkbox" id="chk_all" name="chk_all" value="chk_val"/><label for="chk_all"></label></li>
                    <li>NO.<span onclick="reSortAjax('sort_tbl_popup.idx')"><img src="/img/list_icon_down.png" id="sort_tbl_popup.idx"/></span></li>
                    <li>제목<span onclick="reSortAjax('sort_main_title')"><img src="/img/list_icon_down.png" id="sort_main_title"/></span></li>
                    <li>작성자<span onclick="reSortAjax('sort_name')"><img src="/img/list_icon_down.png" id="sort_name"/></span></li>
                    <li>기간<span onclick="reSortAjax('sort_start_date')"><img src="/img/list_icon_down.png" id="sort_start_date"/></span></li>
                    <li>등록일<span onclick="reSortAjax('sort_tbl_popup.submit_date')"><img src="/img/list_icon_down.png" id="sort_tbl_popup.submit_date"/></span></li>
                    <li>노출여부<span onclick="reSortAjax('sort_is_show')"><img src="/img/list_icon_down.png" id="sort_is_show"/></span></li>
                </ul>
                </div>
                <div class="tb_div sortable">
                    <ul>
                        <li><input class="regular-radio" type="checkbox" id="chk1" name="chk_val1"/><label for="chk1"></label></li>         
                        <li>4</li>
                        <li>메인배너</li>
                        <li>관리자</li>
                        <li>2020-120-01 ~ 2020-03-31</li>
                        <li>2020-12-31</li>
                        <li><span class="bt_yn bt_y">Y</span></li>                              
                    </ul>
                     <ul>
                        <li><input class="regular-radio" type="checkbox" id="chk2" name="chk_val1"/><label for="chk2"></li>         
                        <li>4</li>
                        <li>메인배너</li>
                        <li>관리자</li>
                        <li>2020-120-01 ~ 2020-03-31</li>
                        <li>2020-12-31</li>
                        <li><span class="bt_yn bt_n">N</span></li>                        
                    </ul>
                </div>
        </div>
    </div>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>