<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LG HelloVision 광고</title>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
<link rel="stylesheet" href="/inc/css/changePw.css"/>
<script>
function enter_check_login()
{
	if(event.keyCode == 13){
		fncSubmit();
		return;
	}
}
function fncSubmit()
{
	var pw = $("#password2").val();
	var id = "ladming";
	
	if($("#password1").val() == "")
	{
		alert("기존 비밀번호를 입력해주세요.");
		$("#password1").focus();
		return;
	}
	if($("#password2").val() == "")
	{
		alert("새로운 비밀번호를 입력해주세요.");
		$("#password2").focus();
		return;
	}
	
	/* 비밀번호 4글자에서 12글자 사이로 */
	if(pw.length < 4 || pw.length > 12){
		alert("4자리 ~ 12자리 이내로 입력해주세요.");
		return false;
	/* 숫자 + 영문자 ++ 특수문자 조합으로 8자리 이상 사용 */	  
	 } else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        return false;
	 /* 반복문자 4번이상 사용 x */
	 } else if(/(\w)\1\1\1/.test(pw)){
	    alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	    return false;
	 /* 비밀번호에 id가 포함되어 있을때  */
	 } else if(pw.search(id) > -1) {
		alert('ID기 포함되어 있는 비밀번호는 사용하실 수 없습니다. ');
		return false;
	 }
		
	if($("#password3").val() == "")
	{
		alert("새로운 비밀번호를 입력해주세요.");
		$("#password3").focus();
		return;
	}
	if($("#password2").val() != $("#password3").val())
	{
		alert("비밀번호를 다시 확인해주세요.");
		$("#password2").focus();
		return;
	}
	
	$("#pwForm").ajaxSubmit({
		success: function(data)
		{
			console.log(data);
    		var result = JSON.parse(data);
    		if(result.isSuc == "success")
    		{
    			alert('비밀번호가 변경되었습니다.');
    			location.href="/admin/login";
    		}
    		else
    		{
    			alert(result.msg);
    			$("#password1").focus();
    		}
		}
	});
}
</script>
</head>
<body>
<div class="login_wrap">
	<div class="page_login">
		<div class="inner">
			<div class="logo"><img src="/img/logo.png" /></div>
        	<form id="pwForm" name="pwForm" method="post" action="/admin/changePw_proc">
            	<div class="log-line">
					<input type="password" id="password1" name="password1" placeholder="기존 비밀번호">     	
					<input type="password" id="password2" name="password2" placeholder="새로운 비밀번호">     	
					<input type="password" id="password3" name="password3" placeholder="새로운 비밀번호 확인" onkeydown="javascript:enter_check_login();">     	
				</div>  
            	<input type="button" onclick="fncSubmit()" value="비밀번호 변경" class="btn_login">
        	</form>
        	<!-- <a href="#">Forgot your password?</a>  -->
        	
    	</div>
    </div>
</div>
</body>

<style>


</style>
</html>