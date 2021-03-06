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
    $('.mainmenu').children().eq(9).addClass('on');
	CKEDITOR.replace('contents', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
	
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
	$("#contents").val(repWord(nullChk('${data.contents}')));
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
    			location.href="/admin/users/adtrend_list"
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});
}

/* ?????? ?????? ????????? */
function checkFile(f){

	var file = f.files;

	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png ????????? ????????? ?????????.\n\n?????? ?????? : ' + file[0].name);

	else return;
	
	f.outerHTML = f.outerHTML;

}

</script>

<div id="container" class="review write">
<div class="contain_inner">
	<div class="search">
		<p>??????????????? ?????? ?????? ??????</p>	
        <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="???"></li>
                <li>??????????????? ?????? ??????</li>
                <li>??????????????? ?????? ?????? ??????</li>
        </ul>	
	</div>
	<div class="write_cont_box">
		<form id="fncForm" name="fncForm" action="/admin/adtrend_upload_proc" method="post" enctype="multipart/form-data">
			<table class="write_cont">
					<tr class="write_li_add select_a polio_select">
						<td><p class="write_cont_tit">??????</p></td>
	                    <td>
	                        <input type="text" id="main_title" name="main_title" class="main_tit info_area" placeholder="????????? ??????????????????."/>                       
	                    </td>
					</tr>
	                <tr class="write_check">
	                    <td><p class="write_cont_tit">??????</p></td>
	                    <td><ul class="check_wrap">
	                        <li>
	                            <input type="checkbox" id="is_top" name="is_top" value="Y" class="regular-radio" checked/>
	                            <label for="is_top"><span>?????? ??????</span></label>
	                        </li>
	                    </ul></td>
	                </tr>
	                <tr class="write_check">
	                    <td><p class="write_cont_tit">?????? ??????</p></td>
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
	                    <td><p class="write_cont_tit">?????????</p></td>
	                    <td>
	                        <label for="thumbnail" class="bt_add">????????? ??????</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name2" placeholder="???????????? ??????????????????."/></span><span class="file_desc">*?????? 5MB??? ????????? ????????? ????????? ??? ???????????? (????????? ????????? 400x250 ??????)</span>
	                        <input type="file" id="thumbnail" name="thumbnail" class="file_area upload-hidden" onchange="checkFile(this)"/>
	                    </td>
	                </tr>  
	                <tr class="write_li_add">
	                    <td><p class="write_cont_tit">????????? ??????</p></td>
	                    <td>
	                        <input type="text" id="url" name="url" class="info_area" placeholder="????????? ??????????????????."/>
	                    </td>
	                </tr>
	                <tr class="write_li_file">
	                    <td><p class="write_cont_tit">????????????</p></td>
	                    <td>
	                        <label for="banner" class="bt_add">????????? ??????</label>
	                        <span><input type="text" id="" name="" class="file_area upload-name1" placeholder="???????????? ??????????????????."/></span><span class="file_desc">*?????? 5MB??? ????????? ????????? ????????? ??? ???????????? (????????? ????????? 400x250 ??????)</span>
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
                <li><a href="/admin/users/adtrend_list" class="bt_cont">??????</a></li>
                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">??????</a></li>
                <li><a onclick="javascript:fncSubmit('imsi');" class="pause">??????????????????</a></li>
            </ul>
        </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>