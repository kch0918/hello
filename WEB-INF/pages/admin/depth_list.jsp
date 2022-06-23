<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/header.jsp"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<script>

	$(document).ready(function(){
	//	$("#p_"+page).addClass("active");
	//	$("#search_name").val(search_name);
	//	if(order_by == "desc")
	//	{
	//		$("#sort_"+sort_type).html('<img src="/img/icon_up.png">');
	//	}
	//	else if(order_by == "asc")
	//	{
	//		$("#sort_"+sort_type).html('<img src="/img/icon_down.png">');
	//	}
	//	if(listSize != "")
	//	{
	//		$("#listSize").val(listSize);
	//	}
		getList();
	})

	function reSelect(act)
	{
		if(act.indexOf("sort_") > -1)
		{
			var sort_type = act.replace("sort_", "");
			$("#sort_type").val(sort_type);
			var order_by = "";
			if($("#"+act).html() == '<img src="/img/icon_down.png">')
			{
				order_by = "desc";
			}
			else if($("#"+act).html() == '<img src="/img/icon_up.png">')
			{
				order_by = "asc";
			}
			$("#order_by").val(order_by);			
		}
		$("#page").val(1);
		$("#shopForm").submit();
	}
	function enter_check()
	{
		if(event.keyCode == 13){
			reSelect('search');
			return;
		}
	}
	function pageMove(page)
	{
		$("#page").val(page);
		$("#shopForm").submit();
	}
	
	function delete_cate_proc(idx)
	{
		var con = confirm("정말 삭제하시겠습니까?"); 
		if(con)
		{
			$.ajax({
				type : "POST", 
				url : "./depth_del",
				dataType : "text",
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
					if(result.isSuc == "success")
					{
						alert("삭제되었습니다.");
						location.reload();
					}
					else
					{
						alert(result.msg);
					}
				}
			});
		}
	}
	function excel_submit()
	{
		if($("#upload").val() == '')
		{
			alert("파일이 등록되지 않았습니다.");
			$("#upload").focus();
			return;
		}

		$("#excelForm").ajaxSubmit({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
				if(result.isSuc == "success")
				{
					$("#geoForm").attr("target", "geoFrame");
					$("#geoForm").submit();
					alert(result.msg);
				}
				else
				{
					alert(result.msg);
				}
			}
		});
	}
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');

			fileTarget.on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
			  var filename = $(this)[0].files[0].name;
			} 
			else {  // old IE
			  var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}

			// 추출한 파일명 삽입
			$(this).siblings('.upload-name').text(filename);
		});
	}); 
	
	// 게시판 목록 조회
	function getList()
	{
		// var search_cont =  $('#search_name').val();
		var f = document.fncForm;
		
		$.ajax({
			type : "POST", 			
			url : "./getDepthList",	
			dataType : "text",
			error : function() 
			{
				console.log("AJAX ERROR");
			},
			success : function(data) 
			{
				console.log(data);
				var result = JSON.parse(data);
				console.log(result);
				var inner = "";
				
				if(result.list.length > 0)
				{
					for(var i = 0; i < result.list.length; i++)
					{
						inner += '<tr>';
						inner += '	<td>'+result.list[i].cate1+'</td>'; 
						inner += '  <td>'+result.list[i].cate2+'</td>';
						inner += 	'<td>';
						inner += 		'<a class="mod-btn" href="/admin/depth_edit?idx='+result.list[i].idx+'">수정</a>';
						inner += 		'<a class="mod-btn" href="javascript:delete_cate_proc('+result.list[i].idx+')">삭제</a>';
						inner += 	'</td>';
						inner += '</tr>';
					}
				}
				
				$("#list_target").html(inner);
			}
		});	
	}

</script>

<div class="title">
	<h2>분류 관리</h2>
</div>

<div class="table-top table">
	<div class="btn-area text-right">
		<div>			
			<a class="btn btn01" href="/admin/depth_ins">등록</a>
		</div>
	</div>
</div>

<div class="table-top table">
	<div class="search">
		<form id="shopForm" name="shopForm" method="get" action="depth_list">
			<select id="listSize" name="listSize" onchange="reSelect('search');">
				<option value="20">20개 보기</option>
				<option value="50">50개 보기</option>
				<option value="100">100개 보기</option>
				<option value="300">300개 보기</option> 
				<option value="500">500개 보기</option>
				<option value="1000">1000개 보기</option>
			</select>
			<input type="text" id="search_name" name="search_name" onkeydown="javascript:enter_check();"/>
			<input class="search-btn" type="button" value="검색" onclick="reSelect('search')"/>
			<input type="hidden" id="order_by" name="order_by" value=""/>
			<input type="hidden" id="sort_type" name="sort_type" value=""/>
			<input type="hidden" id="page" name="page" value=""/>
		</form>
	</div>
</div>

<table class="list-table">
	<thead>
		<tr>
			<th>대분류<span id="sort_cate1" onclick="reSelect('sort_cate1')"><img src="/img/icon_down.png"/></span></th>
			<th>중분류<span id="sort_cate2" onclick="reSelect('sort_cate2')"><img src="/img/icon_down.png"/></span></th>
			<th>관리</span>
		</tr>
	</thead>
	<tbody id="list_target">
	</tbody>
</table>

<div class="page_num">
</div>

<form id="geoForm" name="geoForm" method="post" action="getGeo"/></form>
<iframe id="geoFrame" name="geoFrame" style="display:none;"></iframe>
