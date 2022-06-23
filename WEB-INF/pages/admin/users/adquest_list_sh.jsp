<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<jsp:include page="/WEB-INF/pages/common_admin/admin_lnb.jsp"/>

<script>
$(document).ready(function(){
    $('.mainmenu').children().eq(6).addClass('on');    
    $("#chk_all").change(function() {
		if($("input:checkbox[name='chk_all']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", false);
		}
	});
    
	getList();
});

    var search_type = $("#search_type").val();
    var searchName =  $("#searchName").val();
    
   	console.log(search_type);
   	console.log(searchName);
	// 게시판 목록 조회
   function getList(paging_type) 
     {
		var tm_agree = "";
		var dm_agree = "";
		var email_agree = "";
		
		if($("#tm_agree").is(":checked"))
		{
			tm_agree = "true";
		}
		else
		{
			tm_agree = "";
		}
		
		if($("#dm_agree").is(":checked"))
		{
			dm_agree = "true";
		}
		else
		{
			dm_agree = "";
		}
		
		if($("#email_agree").is(":checked"))
		{
			email_agree = "true";
		}
		else
		{
			email_agree = "";
		} 
	
		getListStart();
     	$.ajax({
     		type : "POST", 
     		url : "/admin/getadquestList_sh",
     		dataType : "text",
     		data : 
     		{
     			page : page,
     			order_by : order_by,
     			sort_type : sort_type,
     			listSize : $("#listSize").val(),
     			search_type : $("#search_type").val(),
     			search_name : $("#search_name").val(),
     			start_date : $("#start_date").val().replace(/-/gi, ""),
     			finish_date : $("#finish_date").val().replace(/-/gi, ""),
     		 	tm_agree 	: tm_agree,
     			dm_agree 	: dm_agree,
     			email_agree : email_agree
     			
     		},
     		error : function() 
     		{
     			console.log("AJAX ERROR");
     		},
     		success : function(data) 
     		{
     			console.log(data);
     			var result = JSON.parse(data);
     			$(".serch_cont_txt").html("결과 "+result.listCnt+" / 전체 "+result.listCnt_all+"개");
     			var inner = "";
     			if(result.list.length > 0)
     			{
     				for(var i = 0; i < result.list.length; i++)
     				{
     					inner += '<ul>';
     					inner += '	<li>';
     					inner += '		<input class="regular-radio" type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
     					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
     					inner += '	</li>';
     					inner += '	<li>'+[i+1]+'</li>';
     					inner += '	<li class="res_name" onclick="javascript:location.href=\'./adquest_upload_sh?idx='+result.list[i].idx+'\'">'+nullChk(result.list[i].title)+'</li>';
     					inner += '	<li>'+nullChk(repName(result.list[i].write))+'</li>';
     					inner += '	<li>'+nullChk(repTel2(result.list[i].tel))+'</li>';
     					inner += '	<li>'+nullChk(result.list[i].hope_item)+'</li>';
     					if(nullChk(result.list[i].tm_agree) == "true" || nullChk(result.list[i].dm_agree) == "true" || nullChk(result.list[i].email_agree) == "true")
     						{
     							inner += '	<li>동의</li>'; 
     						} else {
     							inner += '	<li>미동의</li>'; 
     						}
     					inner += '	<li>'+cutDate(result.list[i].submit_date)+'</li>';
     					if(result.list[i].condition == "Y")
    					{
    						inner += '	<li onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].condition)+'\');"><span class="bt_yn bt_y">'+nullChk(result.list[i].condition)+'</span></li>';
    					}
    					else
    					{
    						inner += '	<li onclick="javascript:changeStatus(\''+nullChk(result.list[i].idx)+'\', \''+nullChk(result.list[i].condition)+'\');"><span class="bt_yn bt_n">'+nullChk(result.list[i].condition)+'</span></li>';
    					}
     					inner += '</ul>';
     				}
     			}
     			else
     			{
     				inner += '<ul>';
     				inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
     				inner += '</ul>';
     			}
     			order_by = result.order_by;
     			sort_type = result.sort_type;
     			listSize = result.listSize;
     			if(paging_type == "scroll")
     			{
     				if(result.list.length > 0)
     				{
     					$(".tb_div").append(inner);
     				}
     			}
     			else
     			{
     				$(".tb_div").html(inner);
     			}
     			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
     			getListEnd();
     		}
     	});	
     }
   function changeStatus(idx, val)
   {
   	var act = "";
   	if(val == "대기중") {act = "배정완료";}
   	else if(val == "배정완료") {act = "대기중";}
   	
   	$.ajax({
   		type : "POST", 
   		url : "/admin/changeStatusAdquest_sh",
   		dataType : "text",
   		async : false,
   		data : 
   		{
   			idx : idx,
   			act : act
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
   function changeStatusAll()
   {
   	var act = $("#selStatus").val();
   	var chkIdx = "";
   	$("[name='chk_val']").each(function() 
   	{
   		if( $(this).prop("checked")==true )
   		{
   			chkIdx = $(this).attr("id").replace("chk_", "");
   			$.ajax({
   				type : "POST", 
   				url : "/admin/changeStatusAdquest_sh",
   				dataType : "text",
   				async : false,
   				data : 
   				{
   					idx : chkIdx,
   					act : act
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
   	});
   	
   	
   }
// 게시물 삭제
function delContent()
{
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += '\''+$(this).attr("id").replace("chk_", "")+"\',";
		}
	});
	if(chkIdx == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/delContent_sh",
			dataType : "text",
			async : false,
			data : 
			{
				idx : chkIdx,
				tb : 'tbl_adquest_sh'
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
	    			getList();
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

<div id="container" class="report">
	<div class="contain_inner">
    	<div class="search">
    		<p>신한카드 광고문의 관리<span>문의 내역 리스트입니다.</span></p>
	    		<input type="button" class="enroll dis-no" value="등록" onclick="location.href='/admin/users/adquest_upload'"/>
	    		<div class="seacrh_info search_bot select_a">
	    			<table>
	                    <tr>
	                       <td class="search_txt">조건 선택</td>
	                        <td>
	                            <div class="m_line">
	                                <select de-data="전체" class="dis-no d_inline" name="search_type" id="search_type">
	                                    <option value="">전체</option>
	                                    <option value="title">제목</option>
	                                    <option value="write">작성자</option>
	                                    <option value="tel">연락처</option>
	                                    <option value="hope_item">희망광고상품</option>
	                                </select>
		                             <div class="d_inline">
	                                    <ul class="check_wrap">
		                                     <li>
	                                            <input type="checkbox" id="tm_agree" name="tm_agree" value="" class="regular-radio"/>
	                                            <label for="tm_agree"><span>TM 동의</span></label>
	                                        </li>
	                                        <li>
	                                            <input type="checkbox" id="dm_agree" name="dm_agree" value="" class="regular-radio"/>
	                                            <label for="dm_agree"><span>문자 동의</span></label>
	                                        </li>
	                                        <li>
	                                            <input type="checkbox" id="email_agree" name="email_agree" value="" class="regular-radio"/>
	                                            <label for="email_agree"><span>이메일 동의</span></label>
	                                        </li>
	                                 	</ul>
	                                </div> 
	                            </div> 
	                        </td>
	                        <td class="lsit_search" rowspan="3">
	                            <input type="button" name="" id="" class="search_bt" value="search" onclick="javascript:pagingReset(); getList();"/>
	                        </td>
	                    </tr>
	                    <tr>
                        <td class="search_txt">검색어</td>
                        <td>
                            <div class="m_line serch_key_box">
                                <input type="text" id="search_name" name="search_name" class="search_key" placeholder="검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="search_txt">기간 검색</td>
                        <td>
                            <div class="m_line">
                                <div class="date_line">
                                    <div class="date_box"><input type="text" id="start_date" name="" class="search_date" autocomplete="off" placeholder="2020-08-20"/></div>
                                    <div class="date_box"><input type="text" id="finish_date" name="" class="search_date" autocomplete="off" placeholder="2020-08-26"/></div>
                                </div>
                                <div class="check_box">
                                    <ul class="check_wrap check_d">
                                        <li onclick="setDateBySearch('all');"><input type="radio" id="allChk" name="during" value="" class="regular-radio" checked/><label for="allChk"><span>전체</span></label></li>
                                        <li onclick="setDateBySearch('7');"><input type="radio" id="radio-1-2" name="during" value="" class="regular-radio"/><label for="radio-1-2"><span>7일</span></label></li>
                                        <li onclick="setDateBySearch('15');"><input type="radio" id="radio-1-3" name="during" value="" class="regular-radio"/><label for="radio-1-3"><span>15일</span></label></li>
                                        <li onclick="setDateBySearch('1');"><input type="radio" id="radio-1-4" name="during" value="" class="regular-radio" /><label for="radio-1-4"><span>1개월</span></label></li>
                                        <li onclick="setDateBySearch('3');"><input type="radio" id="radio-1-5" name="during" value="" class="regular-radio"/><label for="radio-1-5"><span>3개월</span></label></li>
                                    </ul>
                                 </div>
                             </div>
                        </td>
                    </tr>
	                </table>
    		</div>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                     <ul class="left">
                    <li><span class="serch_cont_txt"><strong>결과 10개</strong> / 전체 75개</span></li>
                    <li><a onclick="delContent();" class="del_bt"><img src=""/>선택 삭제</a></li>
                    <li>
                        <ul class="post_view">
                            <li>선택한 게시글 진행상태</li>
                            <li>
                                <select de-data="대기중" id="selStatus" name="selStatus" class="dis-no d_inline">
                                    <option value="대기중">대기중</option>
                                    <option value="배정완료">배정완료</option>
                                </select>  
                            </li>
                            <li><a onclick="changeStatusAll()" class="expose_bt">반영</a></li>
                        </ul>
                    </li>
                </ul>
            	 <ul class="right">
                    <ul class="view_type">
                        <li><a href="">순서 반영하기</a></li>
                        <li><a href="" class="color_p">화면 미리보기</a></li>
                    </ul>
                       <select id="listSize" name="listSize" class="dis-no" onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
							<option value="10">10개 보기</option>
							<option value="20">20개 보기</option>
							<option value="50">50개 보기</option>
							<option value="100">100개 보기</option>
							<option value="300">300개 보기</option>
							<option value="500">500개 보기</option>
							<option value="1000">1000개 보기</option>
					  </select>
                </ul>                      
            </div>
        	<div class="search_cont">        	    
            <div class="table-list text-center table-fix table-adquest">
              <div>
                <div class="t_hd">
                <ul>
               		<li><input class="regular-radio" type="checkbox" id="chk_all" name="chk_all" value="chk_val"/><label for="chk_all"></label></li>
                    <li>NO.<span id="" onclick="reSortAjax('sort_idx')"><img src="/img/list_icon_down.png" id="sort_idx"/></span></li>
                    <li>제목<span id="" onclick="reSortAjax('sort_title')"><img src="/img/list_icon_down.png" id="sort_title"/></span></li>
                    <li>작성자<span id="" onclick="reSortAjax('sort_write')"><img src="/img/list_icon_down.png" id="sort_write"/></span></li>
                    <li>연락처<span id="" onclick="reSortAjax('sort_tel')"><img src="/img/list_icon_down.png" id="sort_tel"/></span></li>
                    <li>희망 광고 상품<span id="" onclick="reSortAjax('sort_hope_item')"><img src="/img/list_icon_down.png" id="sort_hope_item"/></span></li>
                    <li>선택 동의 여부<span id="" onclick=""><img src="/img/list_icon_down.png" id="sort_submit_date"/></span></li>
                    <li>작성일<span id="" onclick="reSortAjax('sort_submit_date')"><img src="/img/list_icon_down.png" id="sort_submit_date"/></span></li>
                    <li>진행상태<span id="" onclick="reSortAjax('sort_condition')"><img src="/img/list_icon_down.png" id="sort_condition"/></span></li>
                </ul>
                </div>
                <div class="tb_div">
                </div>
        </div>
    </div>
        	</div>
        		<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/footer.jsp"/>