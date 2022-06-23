<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/web/layout/header.jsp"/>

<div id="consult-sec01">
	<div class="consult_tab">
		<h3>업종별 광고 컨설팅</h3>
		<p class="online_stit">나의 사업과 맞는 광고 매체는 무엇일까요? 광고 전문가 LG헬로비전이 추천해드립니다.</p>
		<ul>
			<c:forEach var="i" items="${list}" varStatus="loop">
				<c:if test="${loop.index eq 0 }">
					<li class="on">${i.cate}</li>
				</c:if>
				<c:if test="${loop.index ne 0 }">
					<li>${i.cate}</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>

<div id="consult-sec02">
	<div class="consult_wr">
		<c:forEach var="i" items="${list}" varStatus="loop">
			<c:if test="${loop.index eq 0 }">
				<div class="consult_box on">
					<img src="/upload/ad/${i.banner}"/>
				</div>
			</c:if>
			<c:if test="${loop.index ne 0 }">
				<div class="consult_box">
					<img src="/upload/ad/${i.banner}"/>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<div id="consult-sec03">
	<div class="consult_wr">
		<c:forEach var="i" items="${list}" varStatus="loop">
			<c:if test="${loop.index eq 0 }">
				<div class="consult_box on">
					<img src="/upload/ad/${i.m_banner}"/>
				</div>
			</c:if>
			<c:if test="${loop.index ne 0 }">
				<div class="consult_box">
					<img src="/upload/ad/${i.m_banner}"/>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<div id="consult-sec04">
	<div class="consult_bt bottom_ad">
		<p class="ad_txt f-size6 img-ani bottom-top img-aniload">
			광고 셀프견적 · 컨설팅 받기는 <strong>언제나 무료</strong>입니다.
		</p>

		<div class="btn_group img-ani bottom-top img-aniload">
			<button class="btn_view">
				<a href="/self/quotation">셀프 견적 내기</a>
			</button>
			<button class="btn_view">
				<a href="/consulting">업종별 컨설팅 보기</a>
			</button>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/pages/web/layout/footer.jsp"/>