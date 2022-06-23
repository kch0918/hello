<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script>

var selCate1 = '${Cate.cate1}';

$(document).ready(function(){
	$("#vision_cate1").val('${cate.idx}');
	$(".vision_cate1").html('${cate.cate1}');
	cateChange();
	$("#vision_cate2").val('${data.cate}');
	$(".vision_cate2").html('${data.cate2}');
	$("#vision_type").val('${data.type}');
	var type_html = "";
	if('${data.type}' == "one") {type_html = "XX원";}
	else if('${data.type}' == "view") {type_html = "1 view당 XX원";}
	else if('${data.type}' == "click") {type_html = "1 click당 XX원";}
	$(".vision_type").html(type_html);
});

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
</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>광고견적 수정</p>
            <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"/></li>
                <li>광고 견적 관리</li>
                <li>광고등록</li>
            </ul>       		
    	</div>
    	
      <div class="uplaod_cont select_a">
		<form id="adestForm" name="adestForm" method="post" action="adest_edit_proc">
	           <table>
	               <tr>
	                   <td>대분류</td>
	                   <td>
	                    <div class="d_inline select" >
	                    	<select id="vision_cate1" name="vision_cate1" onchange="cateChange();" class="notEmpty dis-no d_inline">
	                        	<c:forEach var="i" items="${getCate1}" varStatus="loop">
	                        		<option value="${i.idx }">${i.cate1 }</option>
	                        	</c:forEach>
	                    	</select>
	                    </div>
	                    </td>
	               </tr>
	               <tr>
	                   <td>중분류</td>
	                	<td><select id="vision_cate2" name="vision_cate2" class="notEmpty dis-no d_inline">
					</select></td>
	               </tr>
	               <tr>
	                   <td>과금타입</td>
	                   <td> <select id="vision_type" name="vision_type" class="notEmpty dis-no d_inline">
						<option value="one">XX원</option>
						<option value="view">1 view당 XX원</option>
						<option value="click">1 click당 XX원</option>
					</select></td>
	               </tr>
	               <tr>
	                   <td>광고내용</td>
	                   <td><input type="text" id="vision_contents" name="vision_contents"  value="${data.contents}"/></td>
	               </tr>
	               <tr>
	                   <td>단가</td>
	                   <td><input type="number" id="vision_pay" name="vision_pay" class="notEmpty"  value="${data.pay}"/>
	                       <label for="vision_pay" class="dis-no notShow">단가</label></td>
	               </tr>
	               <tr>
	                   <td>최소청약</td>
	                   <td><input type="number" id="vision_min_pay" name="vision_min_pay" class="notEmpty" value="${data.min_pay}" />
                    	   <label for="vision_min_pay" class="dis-no notShow">최소청약</label></td>
	               </tr>
	                <tr>
	                   <td>우선순위</td>
	                   <td><input type="number" id="vision_sort" name="vision_sort" class="notEmpty" value="${data.sort}"/>
	                       <label for="vision_sort" class="dis-no notShow">우선순위</label></td>
	               </tr>
	           </table> 
	        </div>
	        <div class="write_bt">
	             <ul>
	                <li><a href="/admin/users/adest_list" class="bt_cont">목록</a></li>
	                <li><a href="javascript:fncSubmit();" class="bt_cont bt_c">수정</a></li>
	            </ul>
	        </div>
	       <input type="hidden" id="idx" name="idx" value="${data.idx}"/>
		</form>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>