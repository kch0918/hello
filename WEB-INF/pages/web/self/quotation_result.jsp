<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp" />
<script>

$(document).ready(function(){
	setResult();
});


function setResult()
{
	var inner = "";
	var vision_arr = '${vision}'.split("|");
	
	console.log("vision_arr : " + vision_arr);
	
	var same_vision = "";
	for(var i = 0; i < vision_arr.length-1; i++)
	{
		var writeCnt = 1;
		var isSame = "";
		for(var z = 0; z < vision_arr.length-1; z++)
		{
			if(vision_arr[i] == vision_arr[z] && i != z)
			{
				console.log(vision_arr[i]);
				isSame = true;
				writeCnt ++; 
			}
		}
		var isWrite = false;
		
		var same_vision_arr = same_vision.split("|");
		
		for(var z = 0; z < same_vision_arr.length-1; z++)
		{
			if(vision_arr[i] == same_vision_arr[z])
			{
				isWrite = true;
			}
		}
		if(isWrite == false)
		{
			$.ajax({
				type : "POST", 
				url : "./getVisionFin",
				dataType : "text",
				async : false,
				data : 
				{
					idx : vision_arr[i]
				},
				error : function() 
				{
					console.log("AJAX ERROR");
				},
				success : function(data) 
				{
					console.log(":::"+data);
					var result = JSON.parse(data);
					inner += '<tr>';
					inner += '	<td>'+result.cate1+'</td>';
					inner += '	<td>';
					if(result.type == 'one')
					{
						inner += result.cate2+"<br>"+result.contents;
					}
					else
					{
						inner += result.cate2;
					}
					inner += '	</td>';
					
					inner += '	<td>'+Math.floor((Number(result.min_pay)*writeCnt/10000) / (Number(result.pay)/10000))+' 회<br></td>';
					inner += '	<td class="total">'+(Number(result.min_pay)*writeCnt/10000)+' 만원</td>';
					inner += '	<td>';
					if(result.type == 'one')
					{
						//inner += '단가 : ' + Number(result.pay)/10000 + '만원<br>';
						inner += '최소금액 : ' + Number(result.min_pay)/10000 + '만원';
					}
					if(result.type == 'view' || result.type == 'click')
					{
						inner += '1view당' + result.pay + '원<br> 최소금액 : ' + (Number(result.min_pay) / 10000) + '만원';
 					}
					inner += '	</td>';
					inner += '</tr>';
					
					if(isSame == true)
					{
						same_vision += vision_arr[i]+"|"
					}
				}
			});	
		}
	}
	if('${video}' == 'y')
	{
		inner += '<tr>';
		inner += '	<td>동영상 광고제작</td>';
		inner += '	<td>동영상 광고</td>';
		inner += '	<td>1</td>';
		inner += '	<td class="total">150 만원</td>';
		inner += '	<td>-</td>';
		inner += '</tr>';
	}
	inner += '<tr>';
	inner += '	<td>총합계</td>';
	inner += '	<td></td>';
	inner += '	<td></td>';
	inner += '	<td class="total_sum"></td>';
	inner += '	<td>Vat 별도</td>';
	inner += '</tr>';
	
	$("#target").html(inner);
	
	var total = $(".result_list tr td.total").length;
	var total_sum = 0;

	for(i=1; i<=total; i++) {
		var sum = parseInt($(".result_list tr").eq(i).find(".total").text().split(" ")[0]);
		total_sum += sum;
	}
	console.log(total_sum);
	$(".total_sum").text(total_sum + "만원");
}
function viewInfo()
{
	$("#info_layer").fadeIn(200);
}

function sendInfo()
{
	var user_name = $("#user_name").val();
	if(user_name == "")
	{
		alert("성함을 입력해주세요.");
		$("#user_name").focus();
		return;
	}
	
	if (containsNum(user_name)) {
		alert("숫자는 사용할 수 없습니다.");
		$("#user_name").val('');
		$("#user_name").focus();
		return;
	}	
	
	if (checkSpecial(user_name)) {
		alert("특수문자는 사용할 수 없습니다.");
		$("#user_name").val('');
		$("#user_name").focus();
		return;
	}
	
	var user_tel = $("#user_tel").val();
	if(user_tel == "")
	{
		alert("연락처를 입력해주세요.");
		$("#user_tel").focus();
		return;
	}
	
	if (checkSpecial(user_tel)) {
		alert("특수문자는 사용할 수 없습니다.");
		$("#user_tel").val('');
		$("#user_tel").focus();
		return;
	}
	
	if (isNotNumber(user_tel)) {
		alert("숫자만 사용할 수 없습니다.");
		$("#user_tel").val('');
		$("#user_tel").focus();
		return;
	}
	
	var user_email = $("#user_email").val();
	
//	if($("#user_email").val() == "")
//	{
//		alert("이메일을 입력해주세요.");
//		$("#user_email").focus();
//		return;
//	}
	
	if(containsHS(user_email))
	{
		alert("메일 양식을 맞춰주세요.");
		$("#user_email").focus();
		return;
	}
	
 	var tm_agree, dm_agree, email_agree;
	if($('input:checkbox[name="tm_agree"]').is(":checked")){
		tm_agree = "y";
	}else{
		tm_agree = "n";
	} 
	
	if($("#user_agree").is(":checked"))
	{
		$.ajax({
			type : "POST", 
			url : "./sendRequest",
			dataType : "text",
			async : false,
			data : 
			{
				user_name : $("#user_name").val(),
				user_tel : $("#user_tel").val(),
				user_email : $("#user_email").val(),
				user_answer : $("#user_answer").val(),
				user_hope_item : '${idx_arr}',
				user_contents : $(".result_list").html(),
				tm_agree : $('input:checkbox[name="tm_agree"]').is(":checked") ,
				dm_agree : $('input:checkbox[name="dm_agree"]').is(":checked") ,
				email_agree : $('input:checkbox[name="email_agree"]').is(":checked") 
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
	    			location.href="/self/quotation";
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});	
	}
	else
	{
		alert("이용약관에 동의해주세요.");
		return;
	}
	
	
}
</script>

<div id="self-sec01">
	<div class="result_wr">
		<h3 class="re_tit">견적서</h3>
		<p class="re_stit">
			‘보너스’ 및 ‘프로모션’ 할인 적용이 되지 않은 ‘정단가’ 기준 견적입니다. <br /> 희망 지역/ 매체 상세별/집행
			시기별 등 견적과 실 거래가의 차이가 발생할 수 있습니다.
		</p>

		<table class="result_list">
			<thead>
				<th>매체</th>
				<th>상세</th>
				<th>횟수</th>
				<th>비용</th>
				<th>비고</th>
			</thead>
			<tbody id="target">


			</tbody>
		</table>


		<div class="btn_move">
			<a href="/self/quotation"><img src="/img/btn_confirm.png" />견적
				다시내기</a> <a onclick="viewInfo();" class="btn_apply">상담 신청하기</a> <a
				href="/consulting">업종별 광고 컨설팅 가기<img src="/img/btn_confirm.png" /></a>
		</div>

		<div class="talk">
			<span class="talk_ct">1</span>
		</div>
	</div>
	<div id="info_layer" class="list-edit-wrap">
		<div class="le-cell">
			<div class="le-inner">
				<div class="list-edit white-bg">
					<div class="close"
						onclick="javascript:$('#info_layer').fadeOut(200);">
						<img src="/img/close_pop.png">
					</div>

					<h3 class="text-center">내 셀프견적 문의하기</h3>
					<table class="quo_result">
						<tr>
							<th class="required">성함</th>
							<td><input type="text" id="user_name" name="user_name"
								placeholder="성함" /></td>
						</tr>
						<tr>
							<th class="required">연락처</th>
							<td><input type="text" id="user_tel" name="user_tel"
								placeholder="연락처" /></td>
						</tr>
						<tr>
							<th class="">이메일</th>
							<td><input type="text" id="user_email" name="user_email"
								placeholder="이메일" /></td>
						</tr>
						<tr>
							<th>문의 사항</th>
							<td><textarea id="user_answer" name="user_answer"
									placeholder="문의 사항 남기기"></textarea></td>
						</tr>
						<tr>
							<th class="required">[필수]개인정보 수집 및 이용동의</th>
							<td>
							1. 개인정보 수집・이용 목적 : 광고 상담 및 컨설팅 </br>
							2. 수집하려는 개인정보의 항목 : 이름, 연락처, 이메일</br>
							3. 개인정보의 보유 및 이용 기간 : 입력 후 1년
							<span
								class="agree_noti"> * 개인정보 수집 및 이용 동의를 거부할 수 있으며, 거부할 경우 광고상담에 제약을 받을 수 있습니다. </span>
							
							<input type="checkbox" id="user_agree" name="user_agree"
								value="Y" /><label for="user_agree">동의</label> </td>
						</tr>
						<tr>
							<th>[선택] 개인정보 마케팅(광고) 활용 동의</th>
							<td>
							    <span class="private_noti">
							    	광고 다이렉트몰의 프로모션 및 할인 안내 등 제반 마케팅 활동을 목적으로 하는 개인정보 수집 및 활용에 동의합니다.
							    </span>
							    
							    <input type="checkbox" name="tm_agree" id="tm_agree">
							    <label for="tm_agree">TM 수신동의</label>
							    <input type="checkbox" name="dm_agree" id="dm_agree">
							    <label for="dm_agree">문자 수신동의</label>
							    <input type="checkbox" name="email_agree" id="email_agree">
							    <label for="email_agree">Email 수신동의</label>
				    		</td>
						</tr>
					</table>

					<div class="btn_box">
						<button onclick="javascript:$('#info_layer').fadeOut(200);">닫기</button>
						<button onclick="javascript:sendInfo();">제출하기</button>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>

<script>
    fbq('track', 'SubmitApplication');
</script>

<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp" />