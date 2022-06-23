<%@ page import="classes.*" %>
<script>
 var isLogin = "<%=Utils.checkNullString(session.getAttribute("login_id"))%>"; 
 var link = location.href;

 if (isLogin == '') {
 	alert("본 시스템은 LG헬로비전 임직원 중 사전 등록된 사용자에 한해 사용할 수 있습니다.불법적인 접근 및 사용시 관련법규에 의해 처벌될 수 있습니다.");
 	location.href = "/admin/login";
 }
</script>
<html>
<head>
<title>LG헬로비전</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script type="text/javascript" src="/inc/js/musign.js"></script>
<script type="text/javascript" src="/inc/js/function.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>
<script>
$(document).ready(function(){
	getUserLog();
	ChkUser();
	bookmarkInit();
	var scr_stat = getCookie("scr_stat");
	if(scr_stat == "ON")
	{
		$("#scr_stat").html('ON');
		$("#scr_stat").removeClass('off');
		$("#scr_stat").addClass('on');
	}
	else if(scr_stat == "OFF")
	{
		$("#scr_stat").html('OFF');
		$("#scr_stat").removeClass('on');
		$("#scr_stat").addClass('off');
	}
	else
	{
		$("#scr_stat").html('ON');
		$("#scr_stat").removeClass('off');
		$("#scr_stat").addClass('on');
		setCookie("scr_stat", "ON", 9999);
	}
});


//다른 유저 접근 체크
function ChkUser()
{
	
	$.ajax({
		type : "POST", 
		url : "/admin/ChkUser",
		dataType : "text",
		async : false,
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			if(result.isSuc=="fail")
			{
				alert(result.msg);
				location.href="/admin/login";
			}
		}
	});
}


function bookmarkInit()
{
	$.ajax({
		type : "POST", 
		url : "/admin/getBookmark",
		dataType : "text",
		async : false,
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			if(result.length > 0)
			{
				var bookmarkArr = nullChk(result[0].bookmark).split("|");
				var titleArr = nullChk(result[0].title).split("|");
				$("#bookmark_ul").html('');//초기화
				$("#bookmark_ul").append('<li><a onclick="bookmark(\'on\', \'\', \'\')" class="bt_favor">즐겨찾기 메뉴 추가</a></li>');
				for(var i = 0; i < bookmarkArr.length-1; i++)
				{
					$("#bookmark_ul").append('<li><a href="'+bookmarkArr[i]+'">'+titleArr[i]+'</a><a onclick="bookmark(\'off\', \''+bookmarkArr[i]+'\', \''+titleArr[i]+'\')"><img src="/img/x_bt.png"></a></li>');
				}
				
			}
		}
	});
}
	
function bookmark(act, link, titl)
{
	var nowLink = location.href.replace(location.host, "");
	nowLink = nowLink.replace("http://", "");
	nowLink = nowLink.replace("https://", "");
	var tit = $(".search").find("p").html();
	if(tit.indexOf("<span>") > -1)
	{
		tit = tit.substring(0, tit.indexOf("<span>"));
	}
	if(act == "off")
	{
		nowLink = link;
		tit = titl;
	}
	$.ajax({
		type : "POST", 
		url : "/admin/setBookmark",
		dataType : "text",
		async : false,
		data : 
		{
			act : act,
			link : nowLink,
			tit : tit
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			var result = JSON.parse(data);
    		if(result.isSuc == "success")
    		{
    			bookmarkInit();
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});
}
function changeScr()
{
	if($("#scr_stat").html() == 'ON')
	{
		setCookie("scr_stat", "OFF", 9999);
		$("#scr_stat").html('OFF');
		$("#scr_stat").removeClass('on');
		$("#scr_stat").addClass('off');
	}
	else
	{
		setCookie("scr_stat", "ON", 9999);
		$("#scr_stat").html('ON');
		$("#scr_stat").removeClass('off');
		$("#scr_stat").addClass('on');
	}
	var nowLink = location.href.replace(location.host, "");
	nowLink = nowLink.replace("http://", "");
	nowLink = nowLink.replace("https://", "");
	location.href=nowLink;
}


function getUserLog()
{
	
	$.ajax({
		type : "POST", 
		url : "/admin/getUserLog",
		dataType : "text",
		async : false,
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			console.log(result);
    		if(result.isSuc == "success")
    		{
    			$('#log_date').text(result.log_date);
    			$('#log_ip').text(result.log_ip);
    		}else{
    			alert(result.msg);
    			location.href='/admin/login';
    			
    		}
		}
	});
}


</script>
<div id="header" class="header_wrap">
    <div class="h_left">
    <a href="" class="logo"><img src="/img/c_logo.png"></a>
    <ul class="d_inline favor" id="bookmark_ul">
        <li><a onclick="bookmark('on', '', '')" class="bt_favor">즐겨찾기 메뉴 추가</a></li>
<!--         <li class="dept1">광고관리 <a href=""><img src="/img/photo.png"></a></li> -->
<!--         <li class="dept2">광고문의 리스트</li> -->
<!--         <li class="dept3"></li> -->
    </ul>
    </div>
    <div class="right">  
 
    	이전 로그인 : <span id="log_date"></span>
    	접근 IP :  <span id="log_ip"></span>
    
    <ul class="infi d_inline" onclick="changeScr()">
        <li>Scroll</li>
        <li class="onoff">
            <div class="o2-li act on" id="scr_stat">OFF</div>
        </li>
    </ul>
    <div class="t_menu">
        <div class="menu">
            <img src="/img/ico_admin.png" class="ico_admin">
            <span>Admin</span>
            <img src="/img/h_down_arrow.png" class="ico_arrow">
        </div>
        <div class="hide">
            <a href="/admin/logout">LOGOUT</a>
        </div>
    </div>
    </div> 
</div>