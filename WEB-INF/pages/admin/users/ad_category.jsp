<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(8).addClass('on');
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    bannerInit();
});
function bannerInit()
{
	$("#banner").on('change',function(){
	  	  var fileName = $("#banner").val();
	  	  $(".upload-name").val(fileName);
	  	});
	$("#m_banner").on('change',function(){
	  	  var fileName = $("#m_banner").val();
	  	  $(".upload-name1").val(fileName);
	  	});
}

$(document).ready(function() {
	getList();
});
function delAd(idx)
{
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/delContent",
			dataType : "text",
			async : false,
			data : 
			{
				idx : idx+',',
				tb : 'tbl_ad'
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
function getList(paging_type) 
{
	$.ajax({
		type : "POST", 
		url : "/admin/getAd",
		dataType : "text",
		data : 
		{
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<ul id="adList_'+i+'">';
					inner += '	<li>'+result.list[i].cate+'</li>';
					inner += '	<li><img src="/upload/ad/'+result.list[i].banner+'" alt="" style="width:57px; height:45px;"></li>';
					inner += '	<li><img src="/upload/ad/'+result.list[i].m_banner+'" alt="" style="width:57px; height:45px;"></li>';
					inner += '	<li><div class="cate_add">';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs">';
					if(result.list[i].is_show == "Y")
					{
						inner += '        <span class="bt_yn bt_y" onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].is_show)+'\');">'+nullChk(result.list[i].is_show)+'</span>';
					}
					else
					{
						inner += '        <span class="bt_yn bt_n" onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].is_show)+'\');">'+nullChk(result.list[i].is_show)+'</span>';
					}
					inner += '        <ul class="d_inline bt_del">';
					inner += '            <li onclick="javascript:editAd(\''+escape(JSON.stringify(result.list[i]))+'\', '+i+');">수정</li>';
					inner += '            <li onclick="javascript:delAd(\''+result.list[i].idx+'\');">삭제</li>';
					inner += '        </ul>';
					inner += '    </div>';
					inner += '	</li>';
					inner += '</ul>';
				}
			}
			else
			{
				inner += '<ul>';
				inner += '	<li style="width: 100%;">등록된 업종별 광고 컨설팅이 없습니다.</li>';
				inner += '</ul>';
			}
			$(".tb_div").html(inner);
		}
	});	
}
function setSort()
{
	for(var i = 0; i<document.getElementsByName('idxs').length; i++)
	{
		var idx = document.getElementsByName('idxs')[i].getAttribute('id').split("_")[1];
		$.ajax({
			type : "GET", //전송방식을 지정한다 (POST,GET)
			url : "/admin/setSort?tb=tbl_ad&sort="+i+"&idx="+idx,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
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
			tb : 'tbl_ad'
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
var tmphtml = "";
function editAd(ret, idx)
{
	tmphtml = $("#adList_"+idx).html();
	var result = JSON.parse(unescape(ret));
	var inner = "";
	inner += '<li><input type="text" id="cate" name="cate" value="'+result.cate+'" class="info_area" placeholder="제목을 입력해주세요."></li>';
	inner += '<li><label for="banner" class="bt_add">이미지 첨부</label>';
	inner += '<span><input type="text" id="" name="" value="'+result.banner+'" class="file_area upload-name" placeholder="이미지를 첨부해주세요."></span>';
	inner += '<input type="file" id="banner" name="banner" class="file_area upload-hidden" onchange="checkFile(this)"/></li>';
	inner += '<li><label for="m_banner" class="bt_add">이미지 첨부</label>';
	inner += '<span><input type="text" id="" name="" value="'+result.m_banner+'" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."></span>';
	inner += '<input type="file" id="m_banner" name="m_banner" class="file_area upload-hidden" onchange="checkFile(this)"/></li>';
	inner += '<li>';
	inner += '    <div class="cate_add fix_select_wrap">';
	inner += '        <select de-data="Y" id="is_show" name="is_show" class="dis-no d_inline">';
	inner += '            <option value="Y">Y</option>';
	inner += '            <option value="N">N</option>';
	inner += '        </select></div>';
	inner += '        <ul class="d_inline">';
	inner += '            <li class="bt_circle color_p" onclick="javascript:fncSubmit('+result.idx+');">확인</li>';
	inner += '            <li onclick="javascript:editCancle('+idx+');">취소</li>';
	inner += '        </ul>';
	inner += '    </div>';
	inner += '</li>';
	
	
	$("#adList_"+idx).html(inner);
	bannerInit();
}
function editCancle(idx)
{
	console.log(tmphtml);
	$("#adList_"+idx).html(tmphtml);
}
function addAd()
{
	var inner = "";
	inner += '<ul id="new_ul">';
	inner += '<li><input type="text" id="cate" name="cate" value="" class="info_area" placeholder="제목을 입력해주세요."></li>';
	inner += '<li><label for="banner" class="bt_add">이미지 첨부</label>';
	inner += '<span><input type="text" id="" name="" class="file_area upload-name" placeholder="이미지를 첨부해주세요."></span>';
	inner += '<input type="file" id="banner" name="banner" class="file_area upload-hidden" onchange="checkFile(this)"/></li>';
	inner += '<li><label for="m_banner" class="bt_add">이미지 첨부</label>';
	inner += '<span><input type="text" id="" name="" class="file_area upload-name1" placeholder="이미지를 첨부해주세요."></span>';
	inner += '<input type="file" id="m_banner" name="m_banner" class="file_area upload-hidden" onchange="checkFile(this)"/></li>';
	inner += '<li>';
	inner += '    <div class="cate_add fix_select_wrap">';
	inner += '        <select de-data="Y" id="is_show" name="is_show" class="dis-no d_inline">';
	inner += '            <option value="Y">Y</option>';
	inner += '            <option value="N">N</option>';
	inner += '        </select></div>';
	inner += '        <ul class="d_inline">';
	inner += '            <li class="bt_circle color_p" onclick="javascript:fncSubmit(\'new\');">확인</li>';
	inner += '            <li onclick="javascript:newCancle();">취소</li>';
	inner += '        </ul>';
	inner += '    </div>';
	inner += '</li>';
	inner += '</ul>';
	
	$(".tb_div").prepend(inner);
	bannerInit();
}
function newCancle()
{
	$("#new_ul").remove();
}
function fncSubmit(act)
{
	$("#idx").val(act); //새로 등록인경우 new 이고 수정인경우 seq 번호가 넘어온다.
	$("#fncForm_consulting_form").ajaxSubmit({
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

	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpeg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

	else return;
	
	f.outerHTML = f.outerHTML;
	
}

</script>
<form id="fncForm_consulting_form" name="fncForm" action="/admin/ad_upload_proc" method="post" enctype="multipart/form-data">
<div id="container" class="review write">
<div class="contain_inner">
	<div class="search">
		<p>업종별 광고 컨설팅 관리<span>카테고리별 수정 가능한 페이지입니다.</span></p>
	</div>
       <div class="info_box">     
            <ul class="right view_type">
                <li>
                    <a onclick="javascript:setSort();" class="order_list">순서 반영하기</a>
                    <div class="order_talk">
                        <p>※ 순서는 드래그앱드롭으로 변경 가능합니다<br>
                        ※ 제일 상단에 위치한 카테고리가 첫번째입니다</p>
                    </div>
                </li>
                <li><a onclick="javascript:addAd()" class="color_p bt_cate">카테고리 추가</a></li>
            </ul>             
        </div>
         <div class="search_con_wrap">
            <div class="search_cont">
                <div class="table-list text-center table-fix table-category">
                    <div class="tb_wrap">
                        <div class="t_hd">
                            <ul>
                                <li>카테고리명<span id="" onclick=""><img src="/img/list_icon_down.png"/></span></li>
                                <li>PC 노출 이미지<span id="" onclick=""><img src="/img/list_icon_down.png"/></span></li>
                                <li>MO 노출 이미지<span id="" onclick=""><img src="/img/list_icon_down.png"/></span></li>
                                <li>노출 설정<span id="" onclick=""><img src="/img/list_icon_down.png"/></span></li>
                            </ul>
                        </div>
                        	<div class="tb_div sortable">
	                            <ul>
	                                <li><input type="text" id="" name="" class="info_area" placeholder="제목을 입력해주세요."/></li>
	                                <li><label for="upload-photo" class="bt_add">이미지 첨부</label>
	                                <span><input type="text" id="" name="" class="file_area upload-name" placeholder="이미지를 첨부해주세요."/></span>
	                                <input type="file" id="upload-photo" name="" class="file_area upload-hidden"/></li>
	                                <li>
	                                    <div class="cate_add fix_select_wrap">
	                                        <select de-data="Y" class="dis-no d_inline">
	                                            <option>Y</option>
	                                            <option>N</option>
	                                        </select>
	                                        <ul class="d_inline">
	                                            <li class="bt_circle color_p">확인</li>
	                                            <li>취소</li>
	                                        </ul>
	                                    </div>
	                                </li>
	                            </ul>
	                            <ul>            
	                                <li>예식장 · 장례식장</li>
	                                <li><img src="/img/test01.png" alt=""/></li>
	                                <li><div class="cate_add">
	                                        <span class="bt_yn bt_n">N</span>
	                                        <ul class="d_inline bt_del">
	                                            <li>수정</li>
	                                            <li>삭제</li>
	                                        </ul>
	                                    </div>
	                                </li>
	                            </ul>
	                            <ul>            
	                                <li>예식장 · 장례식장</li>
	                                <li><img src="/img/test01.png" alt=""/></li>
	                                <li><div class="cate_add">
	                                        <span class="bt_yn bt_y">Y</span>
	                                        <ul class="d_inline bt_del">
	                                            <li>수정</li>
	                                            <li>삭제</li>
	                                        </ul>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="idx" name="idx"/>
</form>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>
