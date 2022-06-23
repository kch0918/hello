<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js"></script>

<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(7).addClass('on');
    // ckeditor
	CKEDITOR.replace('contents', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
});

$(window).ready(function(){
	$("#banner").on('change',function(){
	  var fileName = $("#banner").val();
	  $(".upload-name1").val(fileName);
	});
	if(nullChk('${idx}') != "")
	{
		init();
	}
})
function init()
{
	$("#contents").val(repWord(nullChk('${data.contents}')));
	$("#main_title").val('${data.main_title}');
	$("#cate").val('${data.cate}');
	$(".cate").html('${data.cate}');
	$("#start_date").val(cutDate('${data.start_date}'));
	$("#finish_date").val(cutDate('${data.finish_date}'));
	$("input:radio[name='is_show']:radio[value='${data.is_show}']").prop('checked', true);
	$(".upload-name1").val('${data.banner}');
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
	// ckeditor 내용 적용
	CKEDITOR.instances.contents.updateElement(); 
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
		<p>게시글 등록</p>	
        <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"></li>
                <li>게시글 관리</li>
                <li>게시글 등록</li>
        </ul>	
	</div>
	<div class="write_cont_box">
		<form id="fncForm" name="fncForm" action="/admin/notice_upload_proc" method="post" enctype="multipart/form-data">
			<table class="write_cont">
					<tr class="write_li_add select_a">
						<td><p class="write_cont_tit">게시판 선택</p></td>
	                    <td>
	                        <select de-data="공지사항" id="cate" name="cate" class="dis-no d_inline portfolio_tit">
	                            <option value="공지사항">공지사항</option>
	                            <option value="이용안내">이용안내</option>
	                        </select>
	                    </td>
					</tr>
	                <tr class="write_li_add">
	                    <td><p class="write_cont_tit">제목</p></td>
	                    <td>
	                        <input type="text" id="main_title" name="main_title" class="info_area" placeholder="제목을 입력해주세요." onkeyup="javascript:lengthCheck('main_title', 30);"/>
	                        <label for="main_title" id="main_title_length">0/30자</label>
	                    </td>
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
		                    <td><p class="write_cont_tit">첨부파일</p></td>
		                    <td>
		                        <label for="banner" class="bt_add">이미지 첨부</label>
		                        <span><input type="text" id="" name="" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."/></span><span class="file_desc">*최대 100MB의 이미지 파일을 등록할 수 있습니다 (이미지 사이즈 000x000 권장)</span>
		                        <input type="file" id="banner" name="banner" class="file_area upload-hidden" onchange="checkFile(this)"/>
		                    </td>
		                </tr>                
			</table>
			<input type="hidden" id="idx" name="idx" value=""/>
			<input type="hidden" id="is_imsi" name="is_imsi" value=""/>
	        <textarea class="w_edit" id="contents" name="contents" style="width: 100%;"></textarea>
	        </form>
	</div>
</div>
<div class="write_bt">
             <ul>
                <li><a href="/admin/users/notice_list" class="bt_cont">목록</a></li>
                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
                <li><a onclick="javascript:fncSubmit('imsi');" class="pause">임시저장하기</a></li>
            </ul>
        </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>