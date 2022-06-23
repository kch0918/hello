<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.submenu').children().eq(1).addClass('on');
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
	$("#description").val('${data.description}');
	$("input:radio[name='is_show']:radio[value='${data.is_show}']").prop('checked', true);
	$("#start_date").val(cutDate('${data.start_date}'));
	$("#finish_date").val(cutDate('${data.finish_date}'));
	$(".upload-name1").val('${data.banner}');
	$(".upload-name2").val('${data.m_banner}');
	$("input:radio[name='is_btn']:radio[value='${data.is_btn}']").prop('checked', true);
	isBtn('${data.is_btn}');
	$("#btn_nm").val('${data.btn_nm}');
	$("#btn_link").val('${data.btn_link}');
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
	lengthCheck('description', 30);
	lengthCheck('btn_nm', 30);
	
	$("#idx").val(nullChk('${idx}'));
}
function isBtn(val)
{
	if(val == "Y")
	{
		$("#btn_display").show();
	}
	else
	{
		$("#btn_display").hide();
	}
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
</script>

<div id="container" class="review write">
<div class="contain_inner">
	<div class="search">
		<p>중간배너 등록 및 수정</p>	
        <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"></li>
                <li>메인컨텐츠 관리</li>
                <li>중간배너 관리</li>
                <li>중간배너 등록 및 수정</li>
        </ul>	
	</div>
	<div class="write_cont_box">
		<form id="fncForm" name="fncForm" action="/admin/subbanner_upload_proc" method="post" enctype="multipart/form-data">
			<table class="write_cont">
					<tr class="write_li_add">
						<td><p class="write_cont_tit">배너명</p></td>
	                    <td>
	                        <input type="text" id="main_title" name="main_title" class="info_area" placeholder="배너명을 입력해주세요." onkeyup="javascript:lengthCheck('main_title', 30);"/>
	                        <label for="main_title" id="main_title_length">0/30자</label>
	                    </td>
					</tr>
					<tr class="write_li_add">
						<td><p class="write_cont_tit">배너이미지 설명</p></td>
						<td>
	                        <input type="text" id="description" name="description" class="info_area" placeholder="배너이미지 설명을 입력해주세요." onkeyup="javascript:lengthCheck('description', 30);"/>
	                        <label for="description" id="description_length">0/30자</label>
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
	                <tr class="write_li_file">
	                    <td><p class="write_cont_tit">PC 메인배너 등록</p></td>
	                    <td>
	                        <label for="banner" class="bt_add">이미지 첨부</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 5MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 000x000 권장)</span>
	                        <input type="file" id="banner" name="banner" class="file_area upload-hidden"/>
	                    </td>
	                </tr>
	                 <tr class="write_li_file">
	                    <td><p class="write_cont_tit">모바일 메인배너 등록</p></td>
	                     <td><label for="m_banner" class="bt_add">이미지 첨부</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name2" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 5MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 000x000 권장)</span>
	                        <input type="file" id="m_banner" name="m_banner" class="file_area upload-hidden"/>
	                    </td>
	                </tr>
	                <tr class="write_li_file">
	                    <td><p class="write_cont_tit">버튼 생성</p></td>
	                    <td>
	                        <ul class="check_wrap video_up">
	                            <li>
	                                <input type="radio" id="is_btn1" name="is_btn" value="Y" class="regular-radio" checked="" onclick="javascript:isBtn('Y');"/>
	                                <label for="is_btn1"><span>추가</span></label>
	                            </li>
	                            <li>
	                                <input type="radio" id="is_btn2" name="is_btn" value="N" class="regular-radio" onclick="javascript:isBtn('N');"/>
	                                <label for="is_btn2"><span>버튼 없음</span></label>
	                            </li>
	                        </ul>
	                        <div class="video_up" id="btn_display">
	                            <div class="bt_add_box bt_label">
	                                <span>버튼명</span>
	                                <input type="text" id="btn_nm" name="btn_nm" class="" placeholder="버튼명을 입력해주세요." onkeyup="javascript:lengthCheck('btn_nm', 30);"/>
	                                <label for="btn_nm" id="btn_nm_length">0/30자</label>
	                            </div>
	                            <div class="bt_add_box">
	                                <span>연결링크</span>
	                                <input type="text" id="btn_link" name="btn_link" class="" placeholder="연결링크를 입력해주세요."/>
	                                <div class="select_link">
	                                    <select id="btn_pop" name="btn_pop" de-data="현재창" class="dis-no d_inline">
	                                        <option value="now">현재창</option>
											<option value="new">새창</option>
	                                    </select>
	                                </div>
	                            </div>                               
	                        </div>
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
                <li><a href="/admin/users/sub_list" class="bt_cont">목록</a></li>
                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
                <li><a onclick="javascript:fncSubmit('imsi');" class="pause">임시저장하기</a></li>
            </ul>
        </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>