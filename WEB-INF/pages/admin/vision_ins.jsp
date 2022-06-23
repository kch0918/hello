<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/header.jsp"/>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00db6d94492eb277f3294c40dac7d91c&libraries=services"></script>
<script>
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
			return false;f
		}
	});
	if(validationFlag == "Y")
	{
		$("#visionForm").ajaxSubmit({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
	    		if(result.isSuc == "success")
	    		{
		    		alert(result.msg);
// 	    			location.reload();
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});
	}
}

function cateChange()
{
	$.ajax({
		type : "POST", 
		url : "./vision_ins_mid",
		dataType : "text",
		data : 
		{
			idx : $("#vision_cate1").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			var result = JSON.parse(data);
			console.log(data);
			console.log(result);
			result = result.getCate2;
			console.log(result);
			var inner = "";
			for(var i = 0; i < result.length; i++)
			{
				inner += '<option value="'+result[i].idx+'">'+result[i].cate2+'</option>';
			}
			$("#vision_cate2").html(inner);
		}
	});
}

	
</script>

<div class="title">
	<h2>광고등록</h2>
</div>

<div class="add-table">
	<form id="visionForm" name="visionForm" method="post" action="vision_ins_proc">
		<table>
			<tr>
				<td>대분류</td>
				<td>
					<select id="vision_cate1" name="vision_cate1" onchange="cateChange();" class="notEmpty">
					<option value="">선택하세요.</option>
						 <c:forEach var="i" items="${getCate1}" varStatus="loop">
							<option value="${i.idx}">${i.cate1}</option>
	 					</c:forEach>
					</select>
					<label for="vision_cate1" class="notShow">대분류</label>
				</td>
			</tr>
			<tr>
				<td>중분류</td>
				<td>
					<select id="vision_cate2" name="vision_cate2">
					</select>
				</td>
			</tr>
			<tr>
				<td>과금타입</td>
				<td>
					<select id="vision_type" name="vision_type">
						<option value="one">XX원</option>
						<option value="view">1view당 XX원</option>
						<option value="click">1click당 XX원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>광고내용</td>
				<td><input type="text" id="vision_contents" name="vision_contents">
				</td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="number" id="vision_pay" name="vision_pay" class="notEmpty">
				<label for="vision_pay" class="notShow">단가</label>
				</td>
			</tr>
			<tr>
				<td>최소청약</td>
				<td><input type="number" id="vision_min_pay" name="vision_min_pay" class="notEmpty">
				<label for="vision_min_pay" class="notShow">최소청약</label>
				</td>
			</tr>
			<tr>
				<td>우선순위</td>
				<td><input type="number" id="vision_sort" name="vision_sort" class="notEmpty">
				<label for="vision_sort" class="notShow">우선순위</label>
				</td>
			</tr>
		</table>
		<div class="btn-wr text-center">
			<a class="btn btn01" href="javascript:fncSubmit();">등록</a>
			<a class="btn btn02" href="/admin/vision_list">목록</a>
		</div>
	</form>
</div>


