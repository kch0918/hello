<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>
<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(5).addClass('on');
    $("#data_contents").html(repWord('${data.contents}'))
    
    /* 체크박스 체크값 조회 */
    if(${data.tm_agree eq 'true'}) {
    	$("input:checkbox[name='tm_agree']").prop("checked", true);
    } else {
    	$("input:checkbox[name='tm_agree']").prop("checked", false);
    }
    
    if(${data.dm_agree eq 'true'}) {
    	$("input:checkbox[name='dm_agree']").prop("checked", true);
    } else {
    	$("input:checkbox[name='dm_agree']").prop("checked", false);
    }
    
    if(${data.email_agree eq 'true'}) {
    	$("input:checkbox[name='email_agree']").prop("checked", true);
    } else {
    	$("input:checkbox[name='email_agree']").prop("checked", false);
    }
});

     function changeStatus()
     {
     	$.ajax({
     		type : "POST", 
     		url : "/admin/changeStatusAdquest",
     		dataType : "text",
     		async : false,
     		data : 
     		{
     			idx : '${idx}',
     			act : $("#selStatus").val()
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
     
     function changeOption()
     {
      var tm_agree = $('input:checkbox[name="tm_agree"]').is(":checked");
      var dm_agree = $('input:checkbox[name="dm_agree"]').is(":checked")
      var email_agree =  $('input:checkbox[name="email_agree"]').is(":checked");
  	   
      if(tm_agree) {
      	$("input:checkbox[name='tm_agree']").prop("checked", true);
      } else {
      	$("input:checkbox[name='tm_agree']").prop("checked", false);
      }
      
      if(dm_agree) {
      	$("input:checkbox[name='dm_agree']").prop("checked", true);
      } else {
      	$("input:checkbox[name='dm_agree']").prop("checked", false);
      }
      
      if(email_agree) {
      	$("input:checkbox[name='email_agree']").prop("checked", true);
      } else {
      	$("input:checkbox[name='email_agree']").prop("checked", false);
      }
      
	var act = $("#selStatus").val();
	
	console.log(act);
      
     	$.ajax({
     		type : "POST", 
     		url : "/admin/adquest_upload_proc",
     		dataType : "text",
     		data : 
     		{
     			idx : '${idx}',
     		 	tm_agree 	: tm_agree,
   				dm_agree 	: dm_agree,
   				email_agree : email_agree,
   				act			: act
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
     				location.href="/admin/users/adquest_list";
         		}
     		}
     	});	
    }
     
     var masking_name  = "${data.write}";
     var masking_tel   = "${data.tel}";
     var masking_email = "${data.email}";
     
     $(document).ready(function(){
    	 
   	   if($('#masking').hasClass('active')){
		   $("#masking").html('ON');
		   $("#tel").html(repTel2(masking_tel));
		   $("#write").html(repName(masking_name));
		   $("#email").html(repEmail(masking_email));
     	 } 
    	 
  	   $('#masking').click(function(){
  		   var maskLis = $('#marsking .o2-li');		  
  		   $(this).toggleClass('active');
  		   if($(this).hasClass('active')){
  			   $(this).html('ON');
  			   $("#tel").html(repTel2(masking_tel));
  			   $("#write").html(repName(masking_name));
  			   $("#email").html(repEmail(masking_email));
  		   } else {
  			   $(this).html('OFF');
  			   $("#tel").html(masking_tel);
  			   $("#write").html(masking_name);
  			   $("#email").html(masking_email);
  		   }
  	   });		
  	});
     
</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>광고 문의 리스트</p>
            <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"/></li>
                <li>광고문의 관리</li>
                <li>광고문의 리스트</li>
            </ul>   		
    	</div>
		<div class="sub_text_box">
    		<p class="sub_text">문의글 보기</p>
    		
           <ul class="infi d_inline bt_masking">
				<li>마스킹 해제</li>
				<li class="onoff">
					<div class="o2-li act active" id="masking">ON</div>
				</li>
            </ul>      		
    	</div>
        <div class="uplaod_cont select_b">
	           <table>
	               <tr>
	                   <td>제목</td>
	                   <td><span class="upload_text">${data.title }</span></td>
	               </tr>
	               <tr>
	                   <td class="add_icon">성함</td>
	                   <td><span class="upload_text" id="write">${data.write }</span></td>
	               </tr>
	               <tr>
	                   <td class="add_icon">연락처</td>
	                   <td><span class="upload_text" id="tel">${data.tel }</span></td>
	               </tr>
	               <tr>
	                   <td class="add_icon">이메일</td>
	                   <td><span class="upload_text" id="email">${data.email }</span></td>
	               </tr>
	               <tr>
	                   <td>희망 광고 상품</td>
	                   <td><span class="upload_text">${data.hope_item }</span></td>
	               </tr>
	               <tr>
	                   <td>희망 광고 지역</td>
	                   <td><span class="upload_text">${data.region }</span></td>
	               </tr>
	               <tr>
	                   <td>첨부파일</td>
	                   <td>
	                   		<c:if test="${data.attach ne ''}">
		                   		<button type="button" class="notice-button-action notice-button-download" onclick="window.location.href='/upload/concat/${data.attach}'" title="" download>${data.attach}</button>
	                   		</c:if>
	                   		<c:if test="${data.attach eq ''}">
		                   		첨부파일이 없습니다.
	                   		</c:if>
	                   	</td>
	               </tr>
	               <tr>
	                   <td class="add_icon">상담 희망내용</td>
	                   <td><span class="upload_text" id="data_contents"></span></td>
	               </tr>
	                <tr>
	                   <td class="add_icon">개인정보 제공 동의 여부</td>
	                   <td><span class="upload_text ad_desc">동의</span></td>
	               </tr>
	                <tr>
	                   <td class="add_icon">개인정보 마케팅 활용 수집 및 이용 동의 여부</td>
	                   <td>
               				<!-- 개인정보 마케팅 활용 분기처리 -->
							<input type="checkbox" name="tm_agree" id="user_agree2">
						    <label for="user_agree2" >TM 수신동의</label>
						    <input type="checkbox" name="dm_agree" id="user_agree3">
						    <label for="user_agree3">문자 수신동의</label>
						    <input type="checkbox" name="email_agree" id="user_agree4">
						    <label for="user_agree4">Email 수신동의</label>	  
	                   </td>
	               </tr>
	              <tr>
                   <td>진행상태변경</td>
	                   <td> 
	                    <div class="select">
	                        <select de-data="${data.condition}" id="selStatus" name="selStatus" class="dis-no d_inline" onchange="changeStatus()">
	                            <option value="대기중">대기중</option>
	                            <option value="배정완료">배정완료</option>
	                        </select>
	                    </div>
	                  </td>
	               </tr>
	           </table> 
	        </div>
	        
 	        <div class="write_bt"> 
 	             <ul>
	                <li><a href="/admin/users/adquest_list" class="bt_cont">목록</a></li> 
 	                <li><a href="javascript:changeOption();" class="bt_cont bt_c">저장</a></li> 
 	            </ul> 
 	        </div> 
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>