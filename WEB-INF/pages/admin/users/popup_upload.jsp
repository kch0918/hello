<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.submenu').children().eq(2).addClass('on');
	$('.dep1').addClass('on');
});
$(window).ready(function(){
	$("#banner").on('change',function(){
	  var fileName = $("#banner").val();
	  $(".upload-name1").val(fileName);
	});
	$("#m_banner").on('change',function(){
	  var fileName = $("#m_banner").val();
	  $(".upload-name2").val(fileName);
	});
	if(nullChk('${idx}') != "")
	{
		init();
	}
})
function init()
{
	$("#main_title").val('${data.main_title}');
	$("input:radio[name='is_show']:radio[value='${data.is_show}']").prop('checked', true);
	$("#start_date").val(cutDate('${data.start_date}'));
	$("#finish_date").val(cutDate('${data.finish_date}'));
	$("#margin_top").val('${data.margin_top}');
	$("#margin_left").val('${data.margin_left}');
	$("#url").val('${data.url}');
	if('${data.is_center}' == 'Y')
	{
		$("input:checkbox[id='is_center']").prop("checked", true);
	}
	else if('${data.is_center}' == 'N')
	{
		$("input:checkbox[id='is_center']").prop("checked", false);
	}
	if('${data.not_today}' == 'Y')
	{
		$("input:checkbox[id='not_today']").prop("checked", true);
	}
	else if('${data.not_today}' == 'N')
	{
		$("input:checkbox[id='not_today']").prop("checked", false);
	}
	$(".upload-name1").val('${data.banner}');
	$("#btn_pop").val('${data.btn_pop}');
	if('${data.btn_pop}' == 'now')
	{
		$(".btn_pop").html('현재창');
	}
	else
	{
		$(".btn_pop").html('새창');
	}
	lengthCheck('main_title', 30);
	
	$("#idx").val(nullChk('${idx}'));
}
function fncSubmit(val)
{
	if(val == "imsi")
	{
		$("#is_imsi").val('Y');
	}
	else
	{
		$("#is_imsi").val('N');
	}
	$("#fncForm").ajaxSubmit({
		success: function(data)
		{
			console.log(data);
			var result = JSON.parse(data);
    		if(result.isSuc == "success")
    		{
    			alert(result.msg);
    			location.reload();
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});
}

/* 특정 파일 업로드 */
function checkFile(f){

	var file = f.files;

	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

	else return;
	
	f.outerHTML = f.outerHTML;
	
}

</script>

<div id="container" class="review write">
<div class="contain_inner">
	<div class="search">
		<p>팝업 등록 및 수정</p>	
        <ul class="breadcrumb">
           <li><img src="/img/adm-i03.png" alt="홈"></li>
           <li>메인컨텐츠 관리</li>
           <li>팝업 관리</li>
           <li>팝업 등록 및 수정</li>
        </ul>	
	</div>
	<div class="write_cont_box">
		<form id="fncForm" name="fncForm" action="/admin/popup_upload_proc" method="post" enctype="multipart/form-data">
			<table class="write_cont popup_table">
					<tr class="write_li_add">
						<td><p class="write_cont_tit">제목</p></td>
	                    <td>
	                        <input type="text" id="main_title" name="main_title" class="info_area" placeholder="제목을 입력해주세요." onkeyup="javascript:lengthCheck('main_title', 30);"/>
	                        <label for="main_title" id="main_title_length">0/30자</label>
	                    </td>
					</tr>
	                <tr class="write_check">
		                    <td><p class="write_cont_tit">노출 여부</p></td>
		                    <td><ul class="check_wrap">
		                        <li>
		                            <input type="radio"  id="is_show1" name="is_show" value="Y" class="regular-radio" checked/>
		                            <label for="is_show1"><span>Y</span></label>
		                        </li>
		                        <li>
		                            <input type="radio"  id="is_show2" name="is_show" value="N" class="regular-radio"/>
		                            <label for="is_show2"><span>N</span></label>
		                        </li>
		                    </ul></td>
		                </tr>
						<tr class="write_li_file">
							<td><p class="write_cont_tit write_ver">기간</p></td>
							<td>
		                        <div class="date_wrap">
		                            <div class="date_box">
		                                <input type="text" id="start_date" name="start_date" autocomplete="off" class="search_date" placeholder="2020-08-20"/>
		                            </div>
		                            <div class="date_box l_margin">
		                                <input type="text" id="finish_date" name="finish_date" class="search_date" autocomplete="off" placeholder="2020-08-26"/>
		                            </div>
		                        </div>
		                    </td>                 
						</tr>
	                 <tr class="write_check">
	                    <td><p class="write_cont_tit">위치</p></td>
	                    <td><ul class="check_wrap pos_wrap">
	                        <li>
	                       		 상단에서 <input type="text" id="margin_top" name="margin_top" class="pos_txt"/> pixel
	                        </li>
	                        <li>
	                       		좌측에서 <input type="text" id="margin_left" name="margin_left" class="pos_txt"/> pixel  
	                        </li>
	                         <li>
	                            <input type="checkbox" id="is_center" name="is_center" value="Y"  class="regular-radio today_show"  checked/>
	                            <label for="is_center" class="today_show_label"><span class="today_show_span">중앙에 배치하기</span></label>
	                        </li>
	                    </ul></td>
	                </tr>
	                  <tr class="write_check">
	                    <td><p class="write_cont_tit">오늘 하루 열지 않기</p></td>
	                    <td><ul class="check_wrap">
	                        <li>
	                            <input type="checkbox" id="not_today" name="not_today" value="Y" class="regular-radio today_show" checked/>
	                            <label for="not_today"><span class="today_show_span">'오늘 하루 열지 않기' 기능을 사용함</span></label>
	                        </li>
	                    </ul></td>
	                </tr>
	                 <tr class="write_check">
	                    <td><p class="write_cont_tit">연결링크</p></td>
						<td><div class="bt_add_box">
	                                <input type="text" id="url" name="url" class="" placeholder="연결링크를 입력해주세요."/>
	                                <div class="select_link">
	                                    <select id="btn_pop" name="btn_pop" de-data="현재창" class="dis-no d_inline">
	                                        <option value="now">현재창</option>
											<option value="new">새창</option>
	                                    </select>
	                                </div>
	                            </div>
						</td>
					</tr>
	                <tr class="write_li_file">
	                    <td><p class="write_cont_tit">이미지 첨부</p></td>
	                    <td>
	                        <label for="banner" class="bt_add">이미지 첨부</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 5MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 000x000 권장)</span>
	                        <input type="file" id="banner" name="banner" class="file_area upload-hidden" onchange="checkFile(this)"/>
	                    </td>
	                </tr>
			</table>
			<input type="hidden" id="idx" name="idx" value=""/>
			<input type="hidden" id="is_imsi" name="is_imsi" value=""/>
		</form>
	</div>
</div>
<div class="write_bt">
            <ul>
                <li><a href="/admin/users/popup_list" class="bt_cont">목록</a></li>
                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
                <li><a onclick="javascript:fncSubmit('imsi');" class="pause">임시저장하기</a></li>
            </ul>
        </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>