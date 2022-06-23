<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp"/>
<script>
$(document).ready(function(){
	$("#data_main_title").html(nullChk('${data.main_title}'));
	$("#data_submit_date").html(cutDate('${data.submit_date}'));
	$("#data_content").html(repWord('${data.contents}'));
	
	jQuery(function($){

		$( "iframe" ).wrap( "<div class='iframe_box'></div>" );

		});
})
</script>
<div id="board-sec01" class="ad_trend_viewBox">
	<div id="notice-document">
		<div class="notice-document-wrap" itemscope
			itemtype="http://schema.org/Article">
			<div class="table notice-titwr">
				<div class="notice-title" itemprop="name">
					<h1 id="data_main_title">
					</h1>
				</div>
	
				<div class="notice-detail">
					<div class="detail-attr detail-date">
						<div class="table">
							<div class="detail-name">등록일</div>
							<div class="detail-value" id="data_submit_date"></div>
						</div>
					</div>
				</div>
			</div>
	
			<div class="notice-content" itemprop="description">
				<div class="content-view" id="data_content">
				</div>
			</div>
	
		</div>
	</div>
	<div class="text button-wrap">
		<span class="btn_view bgnone"><a href="/ad_trend" class="list ">목록으로 가기</a></span>
		<ul class="pageBtn">
			<c:choose>
				<c:when test="${pre_data.idx != null}">
				   <li><a href="/trend_view/?idx=${pre_data.idx}" class="prevText">이전</a></li>
				</c:when>
			</c:choose>
			
			<c:choose>
				<c:when test="${next_data.idx != null}">
					<li><a href="/trend_view/?idx=${next_data.idx}" class="nextText">다음</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	<div class="notice-attach">
		<button type="button" class="notice-button-action notice-button-download" onclick="window.location.href='/upload/port/${data.banner}'" title="" download>첨부파일 : ${data.ori_banner}</button>
	</div>
</div>


<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>