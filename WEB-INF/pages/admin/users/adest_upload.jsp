<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(1).addClass('on');
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
     		$("#adestForm").ajaxSubmit({
     			success: function(data)
     			{
     				console.log(data);
     				var result = JSON.parse(data);
     	    		if(result.isSuc == "success")
     	    		{
     		    		alert(result.msg);
//      	    		location.reload();
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
     		url : "./adest_ins_mid",
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
     			$("#vision_cate2").html('');
     			$(".vision_cate2_ul").html('');
     			for(var i = 0; i < result.length; i++)
     			{
     				$("#vision_cate2").append('<option value="'+result[i].idx+'">'+result[i].cate2+'</option>');
     				$(".vision_cate2_ul").append('<li>'+result[i].cate2+'</li>');
     			}
     		}
     	});
     }
     function typeChange(data){
    	 document.querySelector("input[name=vision_type]").value = data;
     } 
</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>광고등록 및 수정</p>
            <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"/></li>
                <li>광고 견적 관리</li>
                <li>광고등록</li>
            </ul>       		
    	</div>
      <div class="uplaod_cont select_a">
		<form id="adestForm" name="adestForm" method="post" action="adest_ins_proc">
	           <table>
			        <tr>
						<td>대분류</td>
						<td>
						  <select id="vision_cate1" name="vision_cate1" class="dis-no d_inline" onchange="cateChange();" de-data="선택하세요.">
								 <c:forEach var="i" items="${getCate1}" varStatus="loop">
									<option value="${i.idx}">${i.cate1}</option>
			 					</c:forEach>
							</select>
						</td>
					</tr>
	               <tr>
	                 <td>중분류</td>
						<td>
							<select id="vision_cate2" name="vision_cate2" de-data="선택하세요." class="dis-no d_inline">
							</select>
						</td>
	               </tr>
	               <tr>
	                   <td>과금타입</td>
		                   <td>
			                   <div class="d_inline select">
			                        <p class="select-p"></p>
									<select id="vision_type" name="vision_type" class="dis-no d_inline">
										<option value="one">XX원</option>
										<option value="view">1view당 XX원</option>
										<option value="click">1click당 XX원</option>
									</select>
			                    </div>
		                    </td>
	               </tr>
	               <tr>
	                   <td>광고내용</td>
	                   <td><input type="text" id="vision_contents" name="vision_contents" placeholder="내용을 입력하세요."/></td>
	               </tr>
	               <tr>
	                   <td>단가</td>
	                   <td><input type="number" id="vision_pay" name="vision_pay" class="notEmpty"/>
	                       <label for="vision_pay" class="dis-no notShow">단가</label></td>
	               </tr>
	               <tr>
	                   <td>청소청약</td>
	                   <td><input type="number" id="vision_min_pay" name="vision_min_pay" class="notEmpty"/>
	                       <label for="vision_min_pay" class="dis-no notShow">청소청약</label></td>
	               </tr>
	                <tr>
	                   <td>우선순위</td>
	                   <td><input type="number" id="vision_sort" name="vision_sort" class="notEmpty"/>
	                       <label for="vision_sort" class="dis-no notShow">우선순위</label></td>
	               </tr>
	           </table> 
	        </div>
	        <div class="write_bt">
	             <ul>
	                <li><a href="/admin/users/adest_list" class="bt_cont">목록</a></li>
	                <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
	            </ul>
	        </div>
		</form>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>