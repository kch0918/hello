<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="layout/header.jsp" %>

<div id="contact-sec01">
<div class="contact_wr">
	<h3 class="bd_tit">광고문의 및 제휴문의</h3>
	<form id="fncForm" name="fncForm" method="post" action="/contact_proc" enctype="multipart/form-data">
		<div class="form_wr">
			<div class="row two">
				<div class="key_name">
					<div class="key">
						이름<span>(필수)</span>
					</div>
					<div class="value">
						<input type="text" id="write" name="write" data-name="이름" class="notEmpty" required>
					</div>
				</div>

				<div class="key_phone">
					<div class="key">
						연락처<span>(필수)</span>
					</div>
					<div class="value">
						<input type="text" id="phone1" class="phone_no" name="phone1" data-name="연락처1" class="notEmpty" required value="">―
						<input type="text" id="phone2" class="phone_no" name="phone2" data-name="연락처2" class="notEmpty" required value="">―
						<input type="text" id="phone3" class="phone_no" name="phone3" data-name="연락처3" class="notEmpty" required value="">
					</div>
				</div>
				
				<div class="key_email">
					<div class="key">
						이메일
					</div>
					<div class="value">
						<input type="text" id="email1" name="email1" data-name="이메일" class="notEmpty" value="">@<input type="text" id="email2" name="email2" data-name="이메일" class="notEmpty" value="">
						<select id="selMail" onchange="mailChange()">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="empas.com">empas.com</option>
							<option value="korea.com">korea.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="row key_goods">
				<div class="key">
					희망 광고 상품 
				</div>
				<div class="value">
					<input type="checkbox" name="goods1" id="goods1">
				    <label for="goods1">방송 광고</label>
				    <input type="checkbox" name="goods2" id="goods2">
				    <label for="goods2">온라인광고</label>
				    <input type="checkbox" name="goods3" id="goods3">
				    <label for="goods3">옥외광고</label>
				    <input type="checkbox" name="goods4" id="goods4">
				    <label for="goods4">교통 광고</label>
				    <input type="checkbox" name="goods5" id="goods5">
				    <label for="goods5">기타 광고</label>
				    <input type="checkbox" name="goods6" id="goods6">
				    <label for="goods6">제휴 문의</label>
				</div>
			</div>
			
			<div class="row">
				<div class="key">
					희망 광고 지역
				</div>
				<div class="value">
					<input type="text" id="region" name="region" data-name="지역" placeholder="희망 광고 지역을 입력해 주세요." class="notEmpty">
				</div>
			</div>

			<div class="row">
				<div class="key">
					제목
				</div>
				<div class="value">
					<input type="text" id="title" name="title" data-name="제목" placeholder="제목을 입력해 주세요." class="notEmpty">
				</div>
			</div>

			<div class="row">
				<div class="key">
					상담 희망 내용
				</div>
				<div class="value">
					<textarea rows="10" id="contents" name="contents" class="notEmpty" data-name="내용" placeholder="내용을 입력해 주세요.(100자이상)"></textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="key">
					[필수]개인정보 수집 및 이용동의
				</div>
				<div class="value">
					<p>
					1. 개인정보 수집・이용 목적 : 광고 상담 및 컨설팅 </br>
					2. 수집하려는 개인정보의 항목 : 이름, 연락처, 이메일</br>
					3. 개인정보의 보유 및 이용 기간 : 입력 후 1년	
					</p>
				    <span class="private_noti">
				    	 개인정보 수집 및 이용 동의를 거부할 수 있으며, 거부할 경우 광고상담에 제약을 받을 수 있습니다. 
				    </span>
				    
				    <input type="checkbox" name="user_agree" id="user_agree">
				    <label for="user_agree">동의</label>
				</div>
			</div>	   
			
			<div class="row">
				<div class="key">
					[선택] 개인정보 마케팅(광고) 활용 동의
				</div>
				<div class="value">
					<span class="private_noti">
				    	광고 다이렉트몰의 프로모션 및 할인 안내 등 제반 마케팅 활동을 목적으로 하는 개인정보 수집 및 활용에 동의합니다.
				    </span>
				    
					 <input type="checkbox" name="user_agree2" id="user_agree2">
				    <label for="user_agree2">TM 수신동의</label>
				    <input type="checkbox" name="user_agree3" id="user_agree3">
				    <label for="user_agree3">문자 수신동의</label>
				    <input type="checkbox" name="user_agree4" id="user_agree4">
				    <label for="user_agree4">Email 수신동의</label>

				</div>
			</div>	   	 
			
			<div class="row">
				<div class="key">
					파일첨부
				</div>
				<div class="value">
					<div class="file_box">
						<span class="file_name">*최대 5MB의 파일 첨부가능</span>
						<input type="file" id="attach" name="attach" class="dis-no"><label for="attach">파일첨부</label>
					</div>
				</div>
			</div>		
		</div>
		
		<div class="btn_send">
			<a onclick="javascript:fncSubmit();">문의 접수 <img src="/img/web/img/btn_submit.png"></a>
			<input type="hidden" id="idx" name="idx" required>
		</div>
	</form>
</div>
</div>


<script>
 /* 특정 파일 업로드 */
/* function checkFile(f){

	var file = f.files;

	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

	else return;
	
	f.outerHTML = f.outerHTML;
	
} */

$("#attach").on('change', function(){ // 값이 변경되면 
	if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; 
	}
	else { // old IE
		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
	} 
	// 추출한 파일명 삽입
	$(this).siblings('.file_name').text(filename); 
});

function mailChange()
{
	var selMail = $("#selMail").val();
	$("#email2").val(selMail);
}

function fncSubmit()
{
/* 	var validationFlag = "Y";
	$(".notEmpty").each(function() 
	{
		if ($(this).val() == "") 
		{
			alert(this.dataset.name+"을(를) 입력해주세요.");
			$(this).focus();
			validationFlag = "N";
			return false;
		}
	}); */
	
	// 이름 형식검사
	var write = $('#write').val();
	if ( isEmpty(write)) {
		alert("이름을 입력해주세요.");
		$("#write").val('');
		$("#write").focus();
		return;
	}
	
	if(containsNum(write))
	{
		alert("숫자는 불가능합니다.");
		$("#write").val('');
		$("#write").focus();
		return;
	}
	
	if (checkSpecial(write)) {
		alert("특수문자는 사용할 수 없습니다.");
		$("#write").val('');
		$("#write").focus();
		return;
	}
	
	$('.phone_no').each(function(){ 
		if( isEmpty( $(this).val() ))
		{
			alert("연락처를 입력해주세요.");
			$(this).val('');
			$(this).focus();
			return false;
		}
		
		if( checkSpecial( $(this).val() ))
		{
			alert("특수문자는 사용할 수 없습니다.");
			$(this).val('');
			$(this).focus();
			return false;
		}
		
		if( isNotNumber( $(this).val() ))
		{
			alert("숫자만 사용할 수 없습니다.");
			$(this).val('');
			$(this).focus();
			return false;
		}
	})
	
		var region = $('#region').val();
		if ( isEmpty(region)) {
			alert("지역을 입력해주세요.");
			$("#region").val('');
			$("#region").focus();
			return;
		}
		
		if(containsNum(region))
		{
			alert("숫자는 불가능합니다.");
			$("#region").val('');
			$("#region").focus();
			return;
		}
		
		if (checkSpecial(region)) {
			alert("특수문자는 사용할 수 없습니다.");
			$("#region").val('');
			$("#region").focus();
			return;
		}
		
	var user_email = $('#email1').val()+'@'+$('#email2').val();
	
	if(containsHS(user_email))
	{
		alert("메일 양식을 맞춰주세요.");
		$('#email1').val('');
		$('#email2').val('');
		$('#email1').focus('');
		$('#email2').focus('');
		return;
	}
	
	var mail_arr = user_email.split('@');
	if ( (mail_arr[0]!='' && mail_arr[1]=='') ||  (mail_arr[0]=='' && mail_arr[1]!='') ) {
		alert("메일 양식을 맞춰주세요.");
		$('#email1').val('');
		$('#email2').val('');
		$('#email1').focus('');
		$('#email2').focus('');
	}
	
	
	// 이전 url
	var preUrl = document.referrer;
	
	/* if(validationFlag == "Y")
	{ */
		if($("#user_agree").is(":checked"))
		{
		//	console.log("preUrl : " + preUrl);
			$("#fncForm").ajaxSubmit({
				data : {
					pre_url : preUrl
					},
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
		else
		{
			alert("이용약관에 동의해주세요.");
			return;
		}
	//}
}

</script>

<!-- WIDERPLANET PURCHASE SCRIPT START 2021.3.19 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
var UserAgent = navigator.userAgent;
var widerplanet_device = (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) ? "mobile" : "web";
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",  		     /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
					      *주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"51438",            	     /*광고주 코드 */
		ty:"PurchaseComplete",       /*트래킹태그 타입 */
		device:widerplanet_device,                /*디바이스 종류  (web 또는  mobile)*/
		items:[{i:"광고문의 및 제휴문의",	     /*전환 식별 코드  (한글 , 영어 , 번호 , 공백 허용 )*/
			t:"광고문의 및 제휴문의",         /*전환명  (한글 , 영어 , 번호 , 공백 허용 )*/
			p:"1",		     /*전환가격  (전환 가격이 없을경우 1로 설정 )*/
			q:"1"		     /*전환수량  (전환 수량이 고정적으로 1개 이하일 경우 1로 설정 )*/
		}]
	};
}));
</script>
<script type="text/javascript" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET PURCHASE SCRIPT END 2021.3.19 -->

<%@ include file="layout/footer.jsp" %>