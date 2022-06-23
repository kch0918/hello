<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script>

var selCate1 = '${data.cate1}';

$(document).ready(function(){
	$("#depth_cate1").empty();
	$("#depth_cate1").append(selCate1);
	/* $("input:checkbox[name='depth_cate1']").append(selCate1); */
    $('.mainmenu').children().eq(2).addClass('on');
});


     // fncSubmit
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
     		$("#estimateForm").ajaxSubmit({
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
	 
     function cateChange(data){
    	 document.querySelector("input[name=depth_cate1]").value = data;
     } 

</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>견적분류 수정</p>
            <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"/></li>
                <li>견적 분류 관리</li>
                <li>분류 등록 및 수정</li>
            </ul>       		
    	</div>
        <div class="uplaod_cont select_a">
        	<form id="estimateForm" name="estimateForm" method="post" action="estimate_edit_proc">
	           <table>
	               <tr>
	                   <td>대분류</td>
		                   <td>
		                    <div class="d_inline select">
		                        <p class="select-p" id="depth_cate1">선택하세요.</p>
		                        <ul class="select-ul">
		                        	<c:forEach var="i" items="${getCate1}" varStatus="loop">
		                        		<li onclick="cateChange('${i.cate1}')" id="depth_cate1">${i.cate1}</li>
		                        	</c:forEach>
		                        </ul>
		                        <input type="hidden" name="depth_cate1" value="${data.cate1}">
		                    </div>
		                    </td>
			               </tr>
			             <tr>
		                   <td>중분류</td>
		                   <td><input type="text" id="depth_cate2" name="depth_cate2" placeholder="중분류를 입력하세요." value="${data.cate2}"/>
		                    </div>
		                   </td>
             			</tr>
	           </table> 
        </div>
        <div class="write_bt">
             <ul>
                <li><a href="/admin/users/estimate_list" class="bt_cont">목록</a></li>
                <li><a href="javascript:fncSubmit();" class="bt_cont bt_c">수정</a></li>
            </ul>
        </div>
      	<input type="hidden" id="idx" name="idx" value="${data.idx}"/>
     </form>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>