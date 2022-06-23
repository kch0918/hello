<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>LG HelloVision 광고</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
		<script src="/inc/js/function.js"></script>
		<link rel="stylesheet" href="/inc/css/login.css"/>
		<link rel="stylesheet" href="/inc/css/sub.css"/>
		<script>
		

			//var remember_id = getCookie('remember_id');
			//var remember_pw = getCookie('remember_pw');
			/*
			$(document).ready(function(){
				if(remember_id != '' && remember_pw != '')
				{
					$("#remember_pw").prop("checked", true);
					$("#login_id").val(remember_id);
					$("#login_pw").val(remember_pw);
				}
				
			})
			*/
			function enter_check_login()
			{
				if(event.keyCode == 13){
					login();
					return;
				}
			}
			
			function fncSubmit()
			{
				var validationFlag = "Y";
				$(".notEmpty").each(function() 
				{
					if ($(this).val() == "") 
					{
						alert(this.dataset.name+"을(를) 입력해주세요.");
						$(this).focus();
						validationFlag = "N";
						return false;
					}
				});
				
				if(validationFlag == "Y")
				{
					$("#fncForm").ajaxSubmit({
						success: function(data)
						{
							console.log(data);
							var result = JSON.parse(data);
				    		if(result.isSuc == "success")
				    		{
				    			alert('환영합니다')
				    			location.href="/admin/users/main_list";
				    		//	setCookie("remember_id", $("#login_id").val());
				    		//	setCookie("remember_pw", $("#login_pw").val());
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
	</head>
	<body>
		<div class="login_wrap">
			<div class="page_login">
				<div class="inner">
					<div class="logo"><img src="/img/logo.png" /></div>
					<form id="fncForm" name="fncForm" method="post" action="./login_proc">
						<div class="log-line">
							<input type="text" data-name="아이디" id="login_id" name="login_id" class="notEmpty" placeholder="아이디" />
							<input type="password" data-name="비밀번호" id="login_pw" name="login_pw" class="notEmpty" onkeypress="excuteEnter(fncSubmit)" placeholder="비밀번호" />
						</div>  
						<!-- 
						<div class="chk-wrap">
							<input type="checkbox" id="remember_pw" name="remember_pw"/>        		
							<label for="remember_pw"><span></span>기억하기</label>
						</div>
						 -->
						 
						 <strong class="login_noti">* 본 시스템은 LG헬로비전 임직원 중 사전 등록된 사용자에 한해 사용할 수 있습니다.
불법적인 접근 및 사용시 관련법규에 의해 처벌될 수 있습니다.</strong>
						
						<input type="button" onclick="fncSubmit()" value="로그인" class="btn_login"/>
						<input type="button" onclick="javascript:location.href='changePw'" value="비밀번호 변경" class="btn_normal"/>
					</form>
					<!-- <a href="#">Forgot your password?</a>  -->
				</div>
			</div>
		</div>
	</body>
</html>