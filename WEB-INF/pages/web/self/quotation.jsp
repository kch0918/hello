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

	//????????? ??????????????? ??????4 ?????????
	if(document.getElementsByClassName("rate_tit").length == 1 && document.getElementsByClassName("rate_tit")[0].innerHTML.indexOf("??????") > -1)
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
					inner += '	<p class="step_tit">?????? ????????? ???????????? <span>'+result[0].cate1+'</span> ??? <br>?????? ??????????????? ??????????????????.</p>';

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
		alert("????????? ??????????????????.");
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
		alert("????????? ??????????????????.");
		$("#pay").focus();
	}
	else if(Number($("#pay").val()) < 100)
	{
		alert("????????? 100?????? ???????????? ??????????????????.");
		$("#pay").focus();
	}
	else if(idx_arr == "")
	{
		alert("?????? ?????? ????????? ??????????????????.");
	}
	else if(percent != 100)
	{
		alert("????????? ?????? ????????? 100%??? ???????????????.");
	}
	else if($("[name='de_chk']").is(":checked") == false)
	{
		alert("?????? ????????? ??????????????????.");	
	}
	else if($("[name='location']").is(":checked") == false)
	{
		alert("?????? ????????? ??????????????????.");	
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

			console.log("???????????? : "+idx);
			console.log("????????? : "+percent);
			console.log("?????? : "+pay);

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
        						console.log("??? ?????? ??????! "+result[i].idx+" :: "+result[i].contents);
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
				console.log("???????????? ???????????? : "+document.getElementsByClassName("percent")[z].innerHTML);
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
	console.log("???????????? : "+len);


	var res = 100 - (len * 10); //?????????! ?????? ????????? ????????????.
	var val = Number($("#"+idx).html().replace("%", "")); // 60
	var conv = val - tot + res; // 60 - 110 + 100 
	if(len == 0)
	{
		if(tot > res)
		{
			alert("????????? ?????? ????????? 100%??? ???????????????.");
			$("#"+idx).html(conv+"%");
			return;
		}
		else if(tot < 100)
		{
			alert("????????? ?????? ????????? 100%??? ???????????????.");
			$("#"+idx).html(conv+"%");
			return;
		}
	}
	else
	{
		if(tot > res)
		{
			alert("????????? ?????? ????????? 100%??? ???????????????.");
			$("#"+idx).html(conv+"%");
			tot = res;
			nam = 100 - tot;
		}
	}

	var slash = nam / len;

	console.log("????????? : "+slash);

	var perArr = new Array();
	for(var i = 1; i <= len; i++)
	{
		var ceil_val = Math.ceil(slash / 10) * 10 ;
		console.log(i+"???????????? ???????????? : "+ceil_val); //10?????? ??????
		perArr.push(ceil_val);

		nam = nam - ceil_val;

		console.log("????????? : "+nam);

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
	
				<h3 class="self_tit"><p>1????????? OK!</p>????????? ?????? ????????? ??????????????????!</h3>
	
				<ul class="self_proc">
					<li>
						<div>
							<p class="proc_tit en-txt">STEP1</p>
							<div class="proc_img"></div>
							<p class="proc_stit">?????? ?????? ??????</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP2</p>
							<div class="proc_img"></div>
							<p class="proc_stit">?????? ?????? ??????</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP3</p>
							<div class="proc_img"></div>
							<p class="proc_stit">?????? ?????? ??????</p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP4</p>
							<div class="proc_img"></div>
							<p class="proc_stit">?????? ?????? ???????????? </p>
						</div>
					</li>
					<li>
						<div>
							<p class="proc_tit en-txt">STEP5</p>
							<div class="proc_img"></div>
							<p class="proc_stit">?????? ???????????? ??????</p>
						</div>
					</li>
				</ul>
	
				<div class="self_step">
					<div class="step1">
						<p class="step_tit">?????? ????????? ??????????????????.</p>
						<p class="step_stit">*?????? ??? ?????? ????????????, ?????? ?????? ??????????????????.</p>
						
						<div>
							<input type="text" id="pay" name="pay" placeholder="100?????? ????????? ???????????????." min="100" class="budget"/><span>??? ???</span>
						</div>
					</div><!-- step1 -->
	
					<div class="step2">
						<p class="step_tit">?????? ?????? ????????? ??????????????????.</p>
	
						<div>
						<c:forEach var="i" items="${list}" varStatus="loop">
						    <input type="checkbox" onclick="selMedia();" name="media" id="media_${i.idx}_${i.cate1}"/>
						    <label for="media_${i.idx}_${i.cate1}">${i.cate1}</label>
						</c:forEach>
						</div>
					</div><!-- step2 -->
	
					<div class="step3">
					
					
						<p class="step_tit">????????? ?????? ????????? ??????????????????.</p>
	
						<div class="rate_wr" id="step2_target">
							
						</div><!-- rate_wr -->
	
						<div id="chart">
						</div>
					</div><!-- step3 -->
	
					<div class="step4">
						<p class="step_tit">????????? ?????? ?????? ????????? ??????????????????? </p>
						<p class="step_stit">*?????? ???????????? 200??? ??? ???????????????. ??????, ???????????? ?????? ??????, ?????? ?????? ?????? ?????? ????????? ????????? ??? ????????????.</p>
	
						<div>
							<input type="radio" name="video" id="yes" value="y"/><label for="yes">???</label><span>???????????????.</span>
							<input type="radio" name="video" id="no" value="n"/><label for="no">?????????</label><span>???????????? ????????????.</span>
						</div>
					</div><!-- step4 -->
	
					<div class="step5">
	
					</div><!-- step5 -->
					
	
					<div class="step6">
						<p class="step_tit">?????? ?????? ????????? ??????????????????.</p>
						<p class="step_stit">*????????? ???????????? ?????? ?????? ???????????????. ?????? ?????? ?????? ????????? ?????? ????????? ????????? ???/???/???/??? ???????????? ????????? ??? ????????????.</p>
	
						<div>
							<input type="checkbox" name="location" id="all"/><label for="all">??????</label>
							<input type="checkbox" name="location" id="seoul"/><label for="seoul">??????/??????/??????</label>
							<input type="checkbox" name="location" id="gangwon"/><label for="gangwon">?????????</label>
							<input type="checkbox" name="location" id="chungcheong"/><label for="chungcheong">?????????/??????</label>
							<input type="checkbox" name="location" id="jeonbuk"/><label for="jeonbuk">????????????</label>
							<input type="checkbox" name="location" id="jeonnam"/><label for="jeonnam">????????????/??????</label>
							<input type="checkbox" name="location" id="gyungbuk"/><label for="gyungbuk">????????????/??????</label>
							<input type="checkbox" name="location" id="gyungnam"/><label for="gyungnam">????????????/??????</label>
							<input type="checkbox" name="location" id="busan"/><label for="busan">??????</label>
							<input type="checkbox" name="location" id="jeju"/><label for="jeju">?????????</label>
						</div>
					</div><!-- step6 -->
	
				</div><!-- self_step -->
	
	
			</div><!-- self_wr -->
	
			<div class="btn_confirm">
				<a href="javascript:fncSubmit();">?????? ????????????<img src="/img/btn_confirm.png"/></a>
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
		wp_hcuid:"",  		     /*???????????? ??? Unique ID (ex. ?????????  ID, ???????????? ??? )??? ??????????????? ??????.
					      *?????? : ????????? ?????? ?????? ???????????? ????????? ?????? ???????????? ????????????.*/
		ti:"51438",            	     /*????????? ?????? */
		ty:"PurchaseComplete",       /*??????????????? ?????? */
		device:widerplanet_device,                /*???????????? ??????  (web ??????  mobile)*/
		items:[{i:"????????????",	     /*?????? ?????? ??????  (?????? , ?????? , ?????? , ?????? ?????? )*/
			t:"????????????",         /*?????????  (?????? , ?????? , ?????? , ?????? ?????? )*/
			p:"1",		     /*????????????  (?????? ????????? ???????????? 1??? ?????? )*/
			q:"1"		     /*????????????  (?????? ????????? ??????????????? 1??? ????????? ?????? 1??? ?????? )*/
		}]
	};
}));
</script>
<script type="text/javascript" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET PURCHASE SCRIPT END 2021.3.19 -->

<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>