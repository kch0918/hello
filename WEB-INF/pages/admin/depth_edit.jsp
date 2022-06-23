<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/header.jsp"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00db6d94492eb277f3294c40dac7d91c&libraries=services"></script>

<script>

var selCate1 = '${data.cate1}';
$( document ).ready(function() {
	$("#depth_cate1").val(selCate1);
});
function fncSubmit()
{
	var validationFlag = "Y";
	$(".notEmpty").each(function() 
	{
		if ($(this).val() == "") 
		{
			alert(get_label(this.id)+"을(를) 입력해주세요.");
			$("#" + this.id).focus();
			validationFlag = "N";
			return false;
		}
	});
	if(validationFlag == "Y")
	{
		$("#depthForm").ajaxSubmit({
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
}
</script>
<div class="title">
	<h2>광고수정</h2>
</div>

<div class="add-table">
	<form id="depthForm" name="depthForm" method="post" action="depth_edit_proc.php">
		<table>
			<tr>
				<td>대분류</td>
				<td>
					<select id="depth_cate1" name="depth_cate1" class="notEmpty">
						<option value="">선택하세요.</option>
						 <c:forEach var="i" items="${getCate1}" varStatus="loop">
							<option value="${i.cate1}">${i.cate1}</option>
	 					</c:forEach>
					</select>
					<label for="depth_cate1" class="notShow">대분류</label>
				</td>
			</tr>
			<tr>
				<td>중분류</td>
				<td>
					<input type="text" id="depth_cate2" name="depth_cate2" value="${data.cate2}">
				</td>
			</tr>
		</table>
		<div class="btn-wr text-center">
			<a class="btn btn01" href="javascript:fncSubmit();">등록</a>
			<a class="btn btn02" href="/admin/depth_list">목록</a>
		</div>
		<input type="hidden" id="idx" name="idx" value="${data.idx}">
	</form>
</div>

