<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(4).addClass('on');
});
$(window).ready(function(){
	$("#banner").on('change',function(){
	  var fileName = $("#banner").val();
	  $(".upload-name1").val(fileName);
	});
	$("#thumbnail").on('change',function(){
	  var fileName = $("#thumbnail").val();
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
	$("#cate").val('${data.cate}');
	$(".cate").html('${data.cate}');
	$("input:radio[name='is_show']:radio[value='${data.is_show}']").prop('checked', true);
	$("#url").val('${data.url}');
	$(".upload-name1").val('${data.banner}');
	$(".upload-name2").val('${data.thumbnail}');
	if('${data.is_top}' == 'Y')
	{
		$("input:checkbox[id='is_top']").prop("checked", true);
	}
	else if('${data.is_top}' == 'N')
	{
		$("input:checkbox[id='is_top']").prop("checked", false);
	}
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
		<p>포트폴리오 관리</p>	
        <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"></li>
                <li>포트폴리오 관리</li>
                <li>포트폴리오 등록</li>
        </ul>	
	</div>
	<div class="write_cont_box">
		<form id="fncForm" name="fncForm" action="/admin/port_upload_proc" method="post" enctype="multipart/form-data">
			<table class="write_cont">
					<tr class="write_li_add select_a polio_select">
						<td><p class="write_cont_tit">분류/제목</p></td>
	                    <td>
	                        <select de-data="분류" id="cate" name="cate" class="dis-no d_inline portfolio_tit">
	                            <option value="음식점">음식점</option>
	                            <option value="보험 · 분양">보험 · 분양</option>
	                            <option value="예식장 · 장례식장">예식장 · 장례식장</option>
	                            <option value="행사 · 이벤트 · 캠페인">행사 · 이벤트 · 캠페인</option>
	                            <option value="패션 · 뷰티">패션 · 뷰티</option>
	                            <option value="가구 · 인테리어">가구 · 인테리어</option>
	                            <option value="건강 · 스포츠">건강 · 스포츠</option>
	                            <option value="펫">펫</option>
	                            <option value="키즈">키즈</option>
	                        </select>
	                        <input type="text" id="main_title" name="main_title" class="main_tit info_area" placeholder="제목을 입력해주세요."/>                       
	                    </td>
					</tr>
	                <tr class="write_check">
	                    <td><p class="write_cont_tit">옵션</p></td>
	                    <td><ul class="check_wrap">
	                        <li>
	                            <input type="checkbox" id="is_top" name="is_top" value="Y" class="regular-radio" checked/>
	                            <label for="is_top"><span>상단 고정</span></label>
	                        </li>
	                    </ul></td>
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
	                    <td><p class="write_cont_tit">썸네일</p></td>
	                    <td>
	                        <label for="thumbnail" class="bt_add">이미지 첨부</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name2" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 5MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 400x250 권장)</span>
	                        <input type="file" id="thumbnail" name="thumbnail" class="file_area upload-hidden" onchange="checkFile(this)"/>
	                    </td>
	                </tr>  
	                <tr class="write_li_add">
	                    <td><p class="write_cont_tit">동영상 링크</p></td>
	                    <td>
	                        <input type="text" id="url" name="url" class="info_area" placeholder="링크를 입력해주세요."/>
	                    </td>
	                </tr>
	                <tr class="write_li_file">
	                    <td><p class="write_cont_tit">첨부파일</p></td>
	                    <td>
	                        <label for="banner" class="bt_add">이미지 첨부</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 5MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 400x250 권장)</span>
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
                <li><a href="/admin/users/portfolio_list" class="bt_cont">목록</a></li>
                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
                <li><a onclick="javascript:fncSubmit('imsi');" class="pause">임시저장하기</a></li>
            </ul>
        </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>