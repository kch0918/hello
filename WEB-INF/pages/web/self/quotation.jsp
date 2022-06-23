<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp"/>
<script src="/inc/js/Chart.min.js"></script>
<script src="/inc/js/utils.js"></script>
<script>
function ulInit()
{
	$("#self-sec01 .rate_wr > div .rate_stit").click(function() {
		var chk = $(this).hasClass("on");
		
		if(chk == true) {
			$(this).find("ul").slideUp(300);
			$(this).removeClass("on");
		}else {
			$("#self-sec01 .rate_wr > div .rate_stit > ul").hide();
			$(this).find("ul").slideDown(300);
			$(this).addClass("on");
		}
	})

	$("#self-sec01 .rate_wr > div .rate_stit li").click(function() {
		var rate = $(this).text();

		$(this).parent().prev().text(rate);
		selPercent($(this).parent().prev().attr("id"));
		gridChart();
	})
}



function selMedia()
{
	var a = document.getElementsByName("media").length;
	var inner = "";
	var cnt = 0;
	var chkArr = ""; 
	for(var i = 0; i < a; i++)
	{
		if(document.getElementsByName("media")[i].checked)
		{
			var arr = document.getElementsByName("media")[i].id.split("_");
			chkArr += arr[1]+"|";
	 		inner += '<div class="broad_rate on">';
	 		if(cnt == 0)
	 		{
    	 		inner += '	<span class="rate_col" style="background:#ed174d"></span><p class="rate_tit"><span></span>'+arr[2]+'</p>';
	 		}
	 		else if(cnt == 1)
	 		{
    	 		inner += '	<span class="rate_col" style="background:#f36488"></span><p class="rate_tit"><span></span>'+arr[2]+'</p>';
	 		}
	 		else if(cnt == 2)
	 		{
    	 		inner += '	<span class="rate_col" style="background:#f9b2c4"></span><p class="rate_tit"><span></span>'+arr[2]+'</p>';
	 		}
	 		else if(cnt == 3)
	 		{
    	 		inner += '	<span class="rate_col" style="background:#d6d6d6"></span><p class="rate_tit"><span></span>'+arr[2]+'</p>';
	 		}
	 		inner += '	<div class="rate_stit">';
	 		inner += '		<p class="percent" id="p_'+arr[1]+'">100%</p>';
	 		inner += '		<ul class="percent_ul">';
	 		inner += '		</ul>';
	 		inner += '	</div>';
	 		inner += '</div>';
	 		cnt ++;
		}
	}
	$("#step2_target").html(inner);
	var a = document.getElementsByClassName("rate_col").length;
	if(a > 0)
	{
		$(".step3").show();
		$(".step5").show();
	}
	else
	{
		$(".step3").hide();
		$(".step5").hide();
	}

	//지면만 선택한경우 스텝4 하이드
	if(document.getElementsByClassName("rate_tit").length == 1 && document.getElementsByClassName("rate_tit")[0].innerHTML.indexOf("지면") > -1)
	{
		$(".step4").hide();
	}
	else
	{
		$(".step4").show();
	}
	var b = document.getElementsByClassName("percent").length;
	var innerUl = "";
	if(b == 1) 
	{ 
		document.getElementsByClassName("percent")[0].innerHTML = "100%";
		
		innerUl += '<li>100%</li>';
		document.getElementsByClassName("percent_ul")[0].innerHTML = innerUl; 
	}
	else if(b == 2) 
	{ 
		document.getElementsByClassName("percent")[0].innerHTML = "50%"; 
		document.getElementsByClassName("percent")[1].innerHTML = "50%";

		innerUl += '<li>90%</li>';
		innerUl += '<li>80%</li>';
		innerUl += '<li>70%</li>';
		innerUl += '<li>60%</li>';
		innerUl += '<li>50%</li>';
		innerUl += '<li>40%</li>';
		innerUl += '<li>30%</li>';
		innerUl += '<li>20%</li>';
		innerUl += '<li>10%</li>';
		document.getElementsByClassName("percent_ul")[0].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[1].innerHTML = innerUl; 
	}
	else if(b == 3) 
	{ 
		document.getElementsByClassName("percent")[0].innerHTML = "40%"; 
		document.getElementsByClassName("percent")[1].innerHTML = "30%"; 
		document.getElementsByClassName("percent")[2].innerHTML = "30%";

		innerUl += '<li>80%</li>';
		innerUl += '<li>70%</li>';
		innerUl += '<li>60%</li>';
		innerUl += '<li>50%</li>';
		innerUl += '<li>40%</li>';
		innerUl += '<li>30%</li>';
		innerUl += '<li>20%</li>';
		innerUl += '<li>10%</li>';
		document.getElementsByClassName("percent_ul")[0].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[1].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[2].innerHTML = innerUl; 
	}
	else if(b == 4) 
	{ 
		document.getElementsByClassName("percent")[0].innerHTML = "20%"; 
		document.getElementsByClassName("percent")[1].innerHTML = "30%"; 
		document.getElementsByClassName("percent")[2].innerHTML = "20%"; 
		document.getElementsByClassName("percent")[3].innerHTML = "30%";

		innerUl += '<li>70%</li>';
		innerUl += '<li>60%</li>';
		innerUl += '<li>50%</li>';
		innerUl += '<li>40%</li>';
		innerUl += '<li>30%</li>';
		innerUl += '<li>20%</li>';
		innerUl += '<li>10%</li>';
		document.getElementsByClassName("percent_ul")[0].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[1].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[2].innerHTML = innerUl; 
		document.getElementsByClassName("percent_ul")[3].innerHTML = innerUl; 
	}
	ulInit();
	//step5
	var chkArr = chkArr.split("|");
	$(".step5").html("");
	for(var i = 0; i < chkArr.length-1; i++)
	{
		$.ajax({
			type : "POST", 
			url : "./getCateList",
			dataType : "text",
			async : false,
			data : 
			{
				cate : chkArr[i]
				
			},
			error : function() 
			{
				console.log("AJAX ERROR");
			},
			success : function(data) 
			{
				console.log(":::"+data);
				var result = JSON.parse(data);
				var inner = "";
				if(result.length > 0)
				{
					inner += '<div class="">';
					inner += '	<p class="step_tit">선호 매체로 선택하신 <span>'+result[0].cate1+'</span> 중 <br>희망 세부사항을 선택해주세요.</p>';

					var isTwoDep = false;
					for(var z = 0; z < result.length; z++)
    				{
						if(result[z].cnt > 1)
    					{
	    					isTwoDep = true;
    					}
    				}

					if(isTwoDep == true)
					{
    					var isWrite = false;
    					var writer = "";
        				for(var z = 0; z < result.length; z++)
        				{ 
        					if(writer != result[z].cate2 && writer != "")
        					{
        						inner += '		</div>';
        						inner += '	</li>';
        						inner += '</ul>';
        					}      
        					if(writer != result[z].cate2)
        					{
        						inner += '<ul>';
        						inner += '	<li>- '+result[z].cate2;
        						inner += '		<div>';
        						writer = result[z].cate2;
        					}
        					inner += '			<input type="checkbox" name="de_chk" id="de_chk_'+result[z].idx+'"><label for="de_chk_'+result[z].idx+'">'+result[z].contents+'</label>';
        				}
					}
					else
					{
						for(var z = 0; z < result.length; z++)
        				{
    						inner += '			<input type="checkbox" name="de_chk" id="de_chk_'+result[z].idx+'"><label for="de_chk_'+result[z].idx+'">'+result[z].cate2+'</label>';
        				}
					}
					inner += '</div>';
    				$(".step5").append(inner);
				}
			}
		});	
	}
	//step5

	gridChart();
}
function fncSubmit()
{
	if(isNaN($("#pay").val()))
	{
		alert("숫자만 입력해주세요.");
		$("#pay").focus();
		return;
	}
	
	var idx_arr = "";
	var val_arr = "";
	var percent = 0;
	$("[name='media']").each(function() 
	{
		if($(this).is(":checked"))
		{
			idx = $(this).attr("id").split("_")[1];
			idx_arr += idx+"|";
			val_arr += $("#p_"+idx).html().replace("%", "")+"|";
			percent += Number($("#p_"+idx).html().replace("%", ""));
		}
	});
	var de_idx_arr = "";
	$("[name='de_chk']").each(function() 
	{
		if($(this).is(":checked"))
		{
			idx = $(this).attr("id").split("_")[2];
			de_idx_arr += idx+",";
		}
	});
	if(de_idx_arr.length > 0)
	{
    	de_idx_arr = de_idx_arr.substring(0, de_idx_arr.length-1);
	}
	if($("#pay").val() == "")
	{
		alert("예산을 입력해주세요.");
		$("#pay").focus();
	}
	else if(Number($("#pay").val()) < 100)
	{
		alert("예산은 100만원 이상으로 입력해주세요.");
		$("#pay").focus();
	}
	else if(idx_arr == "")
	{
		alert("광고 선호 매체를 선택해주세요.");
	}
	else if(percent != 100)
	{
		alert("매체별 희망 비중을 100%에 맞춰주세요.");
	}
	else if($("[name='de_chk']").is(":checked") == false)
	{
		alert("선호 매체를 체크해주세요.");	
	}
	else if($("[name='location']").is(":checked") == false)
	{
		alert("희망 지역을 체크해주세요.");	
	}
	else
	{
		$("#idx_arr").val(idx_arr);
		$("#de_idx_arr").val(de_idx_arr);
		$("#val_arr").val(val_arr);
		$("#fncForm").submit();
	}
}
function gridChart()
{
	$("#chart").html('<div id="canvas-holder" style="width:100%"><canvas id="chart-area" style="display: block; width: 561px; height: 280px;"></canvas></div>');
	var b = document.getElementsByClassName("percent").length;
	var config;
	if(b == 1) 
	{ 
		config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [
							Number(document.getElementsByClassName("percent")[0].innerHTML.replace("%", ""))
						],
						backgroundColor: [
							'#ed174d'
						],
						label: 'Dataset 1'
					}],
					labels: [
						document.getElementsByClassName("rate_tit")[0].innerHTML.replace("<span></span>", "")
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					},
					title: {
						display: true
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};

				
	}
	else if(b == 2) 
	{ 
		config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [
							Number(document.getElementsByClassName("percent")[0].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[1].innerHTML.replace("%", ""))
						],
						backgroundColor: [
							'#ed174d',
							'#f36488'
						],
						label: 'Dataset 1'
					}],
					labels: [
						document.getElementsByClassName("rate_tit")[0].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[1].innerHTML.replace("<span></span>", "")
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					},
					title: {
						display: true
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};

	}
	else if(b == 3) 
	{ 
		config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [
							Number(document.getElementsByClassName("percent")[0].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[1].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[2].innerHTML.replace("%", ""))
						],
						backgroundColor: [
							'#ed174d',
							'#f36488',
							'#f9b2c4'
						],
						label: 'Dataset 1'
					}],
					labels: [
						document.getElementsByClassName("rate_tit")[0].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[1].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[2].innerHTML.replace("<span></span>", "")
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					},
					title: {
						display: true
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};

	}
	else if(b == 4) 
	{ 
		config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [
							Number(document.getElementsByClassName("percent")[0].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[1].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[2].innerHTML.replace("%", "")),
							Number(document.getElementsByClassName("percent")[3].innerHTML.replace("%", ""))
						],
						backgroundColor: [
							'#ed174d',
							'#f36488',
							'#f9b2c4',
							'#d6d6d6'
						],
						label: 'Dataset 1'
					}],
					labels: [
						document.getElementsByClassName("rate_tit")[0].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[1].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[2].innerHTML.replace("<span></span>", ""),
						document.getElementsByClassName("rate_tit")[3].innerHTML.replace("<span></span>", "")
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					},
					title: {
						display: true
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};

			
	}
	var ctx = document.getElementById('chart-area').getContext('2d');
	window.myDoughnut = new Chart(ctx, config);

	chk_desabled();
}
function chk_desabled()
{
	$("[name='de_chk']").attr("disabled", false);
	$("label").css("color", "#242424");
	$("label").css("text-decoration", "none");
	$("[name='media']").each(function() 
	{
		if($(this).is(":checked"))
		{
			idx = $(this).attr("id").split("_")[1];
			percent = $("#p_"+idx).html().replace("%", "");
			pay = Number($("#pay").val()) * Number(percent) / 100 * 10000;

			console.log("클릭한거 : "+idx);
			console.log("퍼센트 : "+percent);
			console.log("예산 : "+pay);

			$.ajax({
				type : "POST", 
				url : "./getCatePay",
				dataType : "text",
				async : false,
				data : 
				{
					idx : idx
				},
				error : function() 
				{
					console.log("AJAX ERROR");
				},
				success : function(data) 
				{
					console.log(data);
					var result = JSON.parse(data);
					var inner = "";
					if(result.length > 0)
					{
						for(var i = 0; i < result.length; i++)
						{
    						var vision_pay = Number(result[i].min_pay);
    						if(vision_pay > pay)
    						{
        						var toomuch = result[i].idx;
        						$("#de_chk_"+result[i].idx).attr("disabled", true);
        						$("#de_chk_"+result[i].idx).next("label").css("color", "#e6e6e6");
        						$("#de_chk_"+result[i].idx).next("label").css("text-decoration", "line-through");
        						console.log("넌 너무 비싸! "+result[i].idx+" :: "+result[i].contents);
    						}
						}
					}
				}
			});	
			
		}
	});
}
function selPercent(idx)
{
	var b = document.getElementsByClassName("percent").length;

	var selIndex = 0;
	var tot = 0;
	for(var i = 0; i < b; i++)
	{
		if(idx == document.getElementsByClassName("percent")[i].id)
		{
			selIndex = i;
			for(var z = 0; z <= i; z++)
			{
				console.log("지금까지 선택한거 : "+document.getElementsByClassName("percent")[z].innerHTML);
				tot += Number(document.getElementsByClassName("percent")[z].innerHTML.replace("%", ""));
			}
		}
	}
	
	var nam = 100 - tot;

	var len = 0;
	for(var i = selIndex+1; i < b; i++)
	{
		len ++;
	}
	console.log("남은애들 : "+len);


	var res = 100 - (len * 10); //기준점! 최대 여기가 되어야함.
	var val = Number($("#"+idx).html().replace("%", "")); // 60
	var conv = val - tot + res; // 60 - 110 + 100 
	if(len == 0)
	{
		if(tot > res)
		{
			alert("매체별 희망 비중을 100%에 맞춰주세요.");
			$("#"+idx).html(conv+"%");
			return;
		}
		else if(tot < 100)
		{
			alert("매체별 희망 비중을 100%에 맞춰주세요.");
			$("#"+idx).html(conv+"%");
			return;
		}
	}
	else
	{
		if(tot > res)
		{
			alert("매체별 희망 비중을 100%에 맞춰주세요.");
			$("#"+idx).html(conv+"%");
			tot = res;
			nam = 100 - tot;
		}
	}

	var slash = nam / len;

	console.log("나눈거 : "+slash);

	var perArr = new Array();
	for(var i = 1; i <= len; i++)
	{
		var ceil_val = Math.ceil(slash / 10) * 10 ;
		console.log(i+"번째애가 가져갈것 : "+ceil_val); //10단위 올림
		perArr.push(ceil_val);

		nam = nam - ceil_val;

		console.log("남은거 : "+nam);

		slash = nam / (len - i);

	}
	for(var i = 0; i < perArr.length; i++)
	{
		var a = i + selIndex + 1;
		document.getElementsByClassName("percent")[a].innerHTML = perArr[i]+"%";
	}

	gridChart();

}
</script>

<div id="self-sec01">
	<div class="quo_wr">
		<form id="fncForm" name="fncForm" method="post" action="./quotation_result">
			<div class="self_wr">
	
				<h3 class="self_tit"><p>1분이면 OK!</p>실시간 광고 견적을 확인해보세요!</h3>
	
				<ul class="self_proc">
					<li>
						<div>
							<p class="proc_tit en-txt">STEP1</p>
							<div class="proc_img"></div>
							<p class="proc_stit">광고 예산 입력</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP2</p>
							<div class="proc_img"></div>
							<p class="proc_stit">광고 매체 선택</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP3</p>
							<div class="proc_img"></div>
							<p class="proc_stit">광고 비중 선택</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP4</p>
							<div class="proc_img"></div>
							<p class="proc_stit">영상 제작 여부선택 </p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP5</p>
							<div class="proc_img"></div>
							<p class="proc_stit">매체 세부사항 선택</p>
						</div>
					</li>
				</ul>
	
				<div class="self_step">
					<div class="step1">
						<p class="step_tit">광고 예산을 입력해주세요.</p>
						<p class="step_stit">*상담 시 변경 가능하니, 부담 없이 입력해주세요.</p>
						
						<div>
							<input type="text" id="pay" name="pay" placeholder="100부터 입력이 가능합니다." min="100" class="budget"/><span>만 원</span>
						</div>
					</div><!-- step1 -->
	
					<div class="step2">
						<p class="step_tit">광고 선호 매체를 선택해주세요.</p>
	
						<div>
						<c:forEach var="i" items="${list}" varStatus="loop">
						    <input type="checkbox" onclick="selMedia();" name="media" id="media_${i.idx}_${i.cate1}"/>
						    <label for="media_${i.idx}_${i.cate1}">${i.cate1}</label>
						</c:forEach>
						</div>
					</div><!-- step2 -->
	
					<div class="step3">
					
					
						<p class="step_tit">매체별 희망 비중을 선택해주세요.</p>
	
						<div class="rate_wr" id="step2_target">
							
						</div><!-- rate_wr -->
	
						<div id="chart">
						</div>
					</div><!-- step3 -->
	
					<div class="step4">
						<p class="step_tit">동영상 광고 소재 제작을 희망하시나요? </p>
						<p class="step_stit">*광고 제작비는 200만 원 이상입니다. 기획, 시놉시스 제작 기법, 출현 배우 등에 따라 견적이 달라질 수 있습니다.</p>
	
						<div>
							<input type="radio" name="video" id="yes" value="y"/><label for="yes">예</label><span>필요합니다.</span>
							<input type="radio" name="video" id="no" value="n"/><label for="no">아니오</label><span>필요하지 않습니다.</span>
						</div>
					</div><!-- step4 -->
	
					<div class="step5">
	
					</div><!-- step5 -->
					
	
					<div class="step6">
						<p class="step_tit">광고 희망 지역을 선택해주세요.</p>
						<p class="step_stit">*전문가 컨설팅을 위한 지역 선택입니다. 실제 광고 집행 시에는 광역 단위뿐 아니라 동/시/군/구 단위까지 광고할 수 있습니다.</p>
	
						<div>
							<input type="checkbox" name="location" id="all"/><label for="all">전국</label>
							<input type="checkbox" name="location" id="seoul"/><label for="seoul">서울/경기/인천</label>
							<input type="checkbox" name="location" id="gangwon"/><label for="gangwon">강원도</label>
							<input type="checkbox" name="location" id="chungcheong"/><label for="chungcheong">충청도/대전</label>
							<input type="checkbox" name="location" id="jeonbuk"/><label for="jeonbuk">전라북도</label>
							<input type="checkbox" name="location" id="jeonnam"/><label for="jeonnam">전라남도/광주</label>
							<input type="checkbox" name="location" id="gyungbuk"/><label for="gyungbuk">경상북도/대구</label>
							<input type="checkbox" name="location" id="gyungnam"/><label for="gyungnam">경상남도/울산</label>
							<input type="checkbox" name="location" id="busan"/><label for="busan">부산</label>
							<input type="checkbox" name="location" id="jeju"/><label for="jeju">제주도</label>
						</div>
					</div><!-- step6 -->
	
				</div><!-- self_step -->
	
	
			</div><!-- self_wr -->
	
			<div class="btn_confirm">
				<a href="javascript:fncSubmit();">견적 확인하기<img src="/img/btn_confirm.png"/></a>
			</div>
			<input type="hidden" id="idx_arr" name="idx_arr"/>
			<input type="hidden" id="de_idx_arr" name="de_idx_arr"/>
			<input type="hidden" id="val_arr" name="val_arr"/>
		</form>
	
	</div><!-- quo_wr -->
</div>

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
		items:[{i:"셀프견적",	     /*전환 식별 코드  (한글 , 영어 , 번호 , 공백 허용 )*/
			t:"셀프견적",         /*전환명  (한글 , 영어 , 번호 , 공백 허용 )*/
			p:"1",		     /*전환가격  (전환 가격이 없을경우 1로 설정 )*/
			q:"1"		     /*전환수량  (전환 수량이 고정적으로 1개 이하일 경우 1로 설정 )*/
		}]
	};
}));
</script>
<script type="text/javascript" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET PURCHASE SCRIPT END 2021.3.19 -->

<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>