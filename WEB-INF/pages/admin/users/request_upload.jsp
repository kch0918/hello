<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>


<script>

$(document).ready(function(){
    $('.mainmenu').children().eq(3).addClass('on');
    $("#data_answer").html(repWord('${data.answer}'))
    
       if($("#masking").hasClass('active')){
			   $("#masking").html('ON');
			   $("#tel").html(repTel(masking_tel));
			   $("#name").html(repName(masking_name));
			   $("#email").html(repEmail(masking_email));
       }
    
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
   		url : "/admin/request_upload_proc",
   		dataType : "text",
   		data : 
   		{
   			idx : '${idx}',
   		 	tm_agree 	: tm_agree,
 			dm_agree 	: dm_agree,
 			email_agree : email_agree,
 			act 		: act
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
   				location.href="/admin/users/request_list";
       		}
   		}
   	});	
  }
   
   var masking_name  = "${data.name}";
   var masking_tel   = "${data.tel}";
   var masking_email = "${data.email}";
   
   $(document).ready(function(){
	   $('#masking').click(function(){
		   var maskLis = $('#marsking .o2-li');		  
		   $(this).toggleClass('active');
		   if($(this).hasClass('active')){
			   $(this).html('ON');
			   $("#tel").html(repTel(masking_tel));
			   $("#name").html(repName(masking_name));
			   $("#email").html(repEmail(masking_email));
		   } else {
			   $(this).html('OFF');
			   $("#tel").html(masking_tel);
			   $("#name").html(masking_name);
			   $("#email").html(masking_email);
		   }
	   });		
	});
   
</script>

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>견적 신청 리스트</p>
            <ul class="breadcrumb">
                <li><img src="/img/adm-i03.png" alt="홈"/></li>
                <li>견적 신청 관리</li>
                <li>견적 신청 리스트</li>
            </ul>               		
    	</div>
    	
    	<div class="sub_text_box">
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
                   <td class="add_icon">성함</td>
                   <td><span class="upload_text" id="name">${data.name }</span></td>
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
                   <td>셀프견적 내용</td>
                   <td><span class="upload_text">${data.contents }</span></td>
               </tr>
               <tr>
                   <td>추가 문의사항</td>
                   <td><span class="upload_text" id="data_answer"></span></td>
               </tr>
               <tr>
                   <td class="add_icon">개인정보 제공 동의 여부</td>
                   <td><span class="upload_text">동의</span></td>
               </tr>
               <tr>
	                   <td class="add_icon">개인정보 마케팅 활용 수집 및 이용 동의 여부</td>
	                   <td>
               				<!-- 개인정보 마케팅 활용 분기처리 -->
							<input type="checkbox" name="tm_agree" id="tm_agree">
						    <label for="tm_agree" >TM 수신동의</label>
						    <input type="checkbox" name="dm_agree" id="dm_agree">
						    <label for="dm_agree">문자 수신동의</label>
						    <input type="checkbox" name="email_agree" id="email_agree">
						    <label for="email_agree">Email 수신동의</label>	  
	                   </td>
	               </tr>
                <tr>
                   <td>진행상태변경</td>
                   <td> 
                    <div class="select">
                        <select de-data="${data.condition}" id="selStatus" name="selStatus" class="dis-no d_inline">
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
                 <li><a href="/admin/users/request_list" class="bt_cont">목록</a></li>
                 <li><a onclick="changeOption();" class="bt_cont bt_c">저장</a></li> 
             </ul> 
         </div> 
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>