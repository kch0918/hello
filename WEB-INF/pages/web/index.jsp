<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="layout/header.jsp"%>
<script src="/js/musign/main.js"></script>
<!-- main-sec01 -->
<script>

/* var RP = "${RP}";
var test = ${inputLine};
console.log("RequestParameter : "+ RP)
console.log("--------------------------------------")
console.log("result_code : "+test.result_code);
console.log("media_name : "+test.data[0].media_name);
console.log("product_name : "+test.data[0].product_name);
console.log("ad_price : "+test.data[0].ad_price);
console.log("impression : "+test.data[0].impression);
console.log("click : "+test.data[0].click);
console.log("view : "+test.data[0].view); */

</script>

<div id="main-sec01-2" class="count-Box">
	<div class="count_wr_mo">
		<div class="ad_wr">
			<div class="ad_01">
				<div class="ad_img"></div>
				<div class="ad_box">
					<p class="ad_tit">총 광고 규모</p>
					<p class="ad_stit">
						<span id="ad_count1" class="ad_count"><fmt:formatNumber
								value="${won}" pattern="#,###" /></span><span class="ad_stit2">원</span>
					</p>

				</div>
			</div>
			<div class="ad_02">
				<div class="ad_img"></div>
 				<div class="ad_box"> 
					<p class="ad_tit">총 광고주 수</p>
					<p class="ad_stit">
						<span id="ad_count2" class="ad_count"><fmt:formatNumber
								value="${gun}" pattern="#,###" /></span><span class="ad_stit2">건</span>
					</p>

				</div>
			</div>
		</div>
	</div>
</div>


<div id="main-sec01">
	<div class="vid_box">
		<div class="main_bar"></div>
		<p class="main_tit lg-txt">${data.main_title }</p>
		<p class="main_stit">${data.sub_title }</p>

		<div id="container"></div>
	</div>
	<iframe id="player"
		src="https://www.youtube.com/embed/5XC4Bub_bcI?autoplay=1&amp;mute=1&amp;controls=0"
		width="100%" height="950" frameborder="0"
		allowfullscreen="allowfullscreen"></iframe>

	<div class="main-01-linkTxt">
		<a href="/ad_trend" class="lg-txt">광고 트렌드 분석 바로가기<img src="/img/web/img/linkTxt_arrow.png"></a>
		<a href="/self/quotation" class="lg-txt">셀프 광고 견적 내기 바로가기<img src="/img/web/img/linkTxt_arrow.png"></a>
	</div>


	<div class="count_wr">
		<p class="count_tit">
			LG헬로비전과 <span class="count_stit">함께한</span>
		</p>

		<div class="ad_wr">
			<div class="ad_01">
				<div class="ad_img"></div>
				<div class="ad_box">
					<p class="ad_tit">총 광고 규모</p>
					<p class="ad_stit">
						<span id="ad_count1" class="ad_count"><fmt:formatNumber
								value="${won}" pattern="#,###" /></span><span class="ad_stit2">원</span>
					</p>
				</div>
			</div>
			<div class="ad_02">
				<div class="ad_img"></div>
				<div class="ad_box">
					<p class="ad_tit">총 광고주 수</p>
					<p class="ad_stit">
						<span id="ad_count2" class="ad_count"><fmt:formatNumber
								value="${gun}" pattern="#,###" /></span><span class="ad_stit2">건</span>
					</p>

				</div>
			</div>
			<div class="ad_03">
				<a href="/consulting">
					<div class="ad_img"></div>
					<div class="ad_box">
						<div class="ad_tit">업종별 광고 컨설팅</div>
						<div class="ad_stit">
							<span>바로가기</span>
						</div>
	
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="talk">
		<span class="talk_ct">1</span>
	</div>
</div>

<div id="main-sec01-1">
	<div class="count_wr_mo">
		<div class="ad_wr">			
			<div class="ad_03">
				<a href="/ad_trend">
					<div class="ad_box">
						<div class="ad_tit">광고<br>트렌드 분석</div>
						<div class="ad_stit">
							<span>바로가기</span>
						</div>	
					</div>
				</a>
				<a href="/self/quotation">
					<div class="ad_box">
						<div class="ad_tit">셀프<br>광고 견적내기</div>
						<div class="ad_stit">
							<span>바로가기</span>
						</div>	
					</div>
				</a>
				<a href="/consulting">
					<div class="ad_box">
						<div class="ad_tit">업종별<br>광고 컨설팅</div>
						<div class="ad_stit">
							<span>바로가기</span>
						</div>	
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<!-- main-sec02 -->
<div id="main-sec02">
	<div class="half-left">
		<img src="/img/web/img/img_platform-1.png">
	</div>

	<div class="half-right">
		<div class="about_wr">
			<h3 class="en-txt img-ani bottom-top">About us</h3>
			<p class="about_tit lg-txt img-ani bottom-top">
				LG헬로비전이 직접 운영하는 <br> 믿을 수 있는 광고 플랫폼입니다.
			</p>

			<div class="about_con img-ani bottom-top">
				<div class="line"></div>
				<div class="txt_box">
					<p class="about_stit">
						우리는 광고주가 가장 적은 비용으로 <br>가장 높은 광고 효과를 낼 수 있게 하는 것을 목표로 합니다.<br>
						우리가 가장 잘하는 TV 광고부터 <br>온라인의 검색, SNS, 유튜브, 블로그 광고, 버스·택시·전광판 등
						옥외광고까지<br> 광고주의 업종과 상황에 맞게 가장 효과적인 광고를 제안합니다.<br> <span
							class="about_stit2">투명한 견적 산출부터, 광고 제작, 신뢰 있는 결과 리포트까지
							제공하는<br> LG헬로비전의 광고전문가에게 맡겨주세요.
						</span>
					</p>
					<button class="btn_view">
						<a href="/ad_broadcast">매체 소개</a>
					</button>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- main-sec03 -->
<div id="main-sec03">
	<div class="why_wr">
		<h3 class="why_tit en-txt img-ani bottom-top">Why lg HelloVision?</h3>
		<p class="lg-txt img-ani bottom-top">
			LG헬로비전 광고 다이렉트몰을 <br> 선택해야 할 이유가 있습니다.
		</p>

		<ul class="why_list img-ani bottom-top">
			<li>
				<div class="circle"></div>
				<p class="why_stit">효율적이고</p>
				<p class="why_stit2">
					광고비만 많이 쓴다고, <br> 효과가 높을까요? <br>저 비용으로도 최적의 효과를 드립니다.
				</p>
			</li>
			<li>
				<div class="circle"></div>
				<p class="why_stit">편리하며</p>
				<p class="why_stit2">
					TV광고, SNS광고 다 따로 맡기세요?<br> 한번의 상담으로 가장 적합한 <br>모든 매체 광고를
					추천해드립니다.
				</p>
			</li>
			<li>
				<div class="circle"></div>
				<p class="why_stit">투명한</p>
				<p class="why_stit2">
					광고가 제대로 집행되는지 <br>궁금하지 않으셨나요? 투명하고<br> 믿을 수 있는 결과물을
					받아보세요.
				</p>
			</li>
		</ul>
	</div>
</div>

<!-- main-sec04 -->
<div id="main-sec04">
	<div class="what_wr">
		<h3 class="what_tit en-txt img-ani bottom-top">WHAT WE DO</h3>
		<p class="lg-txt img-ani bottom-top">
			세상에서 가장 쉬운 방법으로 <br> 셀프 견적을 알아보세요.
		</p>
		<button class="btn_view img-ani bottom-top">
			<a href="/self/quotation">셀프견적 바로가기</a>
		</button>
		<ul class="what_list img-ani bottom-top">
			<li>
				<p class="what_stit">Step 1</p>
				<p class="what_stit2">예산을 입력하고</p>
			</li>
			<li>
				<p class="what_stit">Step 2</p>
				<p class="what_stit2">
					원하는 광고(매체)를 <br> 선택하면
				</p>
			</li>
			<li>
				<p class="what_stit">Step 3</p>
				<p class="what_stit2">
					실시간 광고 견적 <br> 확인이 가능합니다.
				</p>
			</li>
			<li>
				<p class="what_stit">Benefits</p>
				<p class="what_stit2">
					필요시, 전문가의 <br> 무료 상담도 제공됩니다.
				</p>
			</li>
		</ul>
	</div>
</div>

<!-- main-sec05 -->
<div id="main-sec05">
	<div class="what_wr">
		<h3 class="what_tit en-txt img-ani bottom-top">WHAT WE DO</h3>
		<p class="lg-txt img-ani bottom-top">
			셀프 견적이 막막하신 광고 초보시라면 <br>업종별 컨설팅을 <br> 먼저 받아보세요.
		</p>
		<button class="btn_view img-ani bottom-top">
			<a href="/consulting">업종별 광고 컨설팅</a>
		</button>
		<ul class="what_list img-ani bottom-top">
			<li>
				<p class="what_stit">Step 1</p>
				<p class="what_stit2">업종만 선택하면</p>
			</li>
			<li>
				<p class="what_stit">Step 2</p>
				<p class="what_stit2">
					광고 시장 분석과<br>업종별 최적의 광고 상품을<br>추천합니다.
				</p>
			</li>
			<li>
				<p class="what_stit">Benefits</p>
				<p class="what_stit2">
					초보 광고주를 위한 <br> 무료 상담도 받아보세요.
				</p>
			</li>
		</ul>
	</div>
</div>

<!-- main-sec05-1 -->
<div id="main-sec05-1">
	<div class="success-box">
		<h3 class="what_tit en-txt img-ani bottom-top">WHAT WE DO</h3>
		<p class="lg-txt img-ani bottom-top">
			LG헬로비전과 함께한 성공 사례<br>
			<small>파트너사 프로젝트의 성공, LG 헬로비전이 함께 해왔습니다.</small>
		</p>
		
		<div id="success-inbox-wrap" class="img-ani bottom-top">
			<ul class="succe-tab">
				<li class="on">일반기업</li>
				<li class="subcolor">사이버대학교</li>
				<li>공공기관</li>
			</ul>
			<!-- 휴엔케어 -->
			<div class="success-inbox on hucare-box img-ani bottom-top">				
				<!-- 휴엔케어 -->
				<div class="succe-result suc-re-01 on img-ani bottom-top">
					<div class="succe-result-top">
						<h2>해충방제 & 방역 살균소독 전문 H사 홍보 대행  <small>2020 ~ 현재</small></h2>
						<ol class="succe-tab-sub">
							<li class="on">운영 성과</li>
							<li>운영 방향</li>
						</ol>
					</div>
					<!--휴엔케어 - 운영성과 -->
					<div class="succe-result-box su-res-box on img-ani bottom-top">
						<section class="succe-result-box-left">
							<h5>
								브랜드 인스타그램 팔로워 약 4천 명 <br>
								브랜드 블로그 콘텐츠별 조회수 최대 3천 회 이상
							</h5>
							<div class="recce-rewr">
								<div class="succe-result-grape">
									<img src="/img/web/img/care-grape-01.png" class="grape-pc" />
									<img src="/img/web/img/care-grape-01-mo.png" class="grape-mo"/>
								</div>
							</div>
						</section>
						<section class="succe-result-box-right">
							<div class="succe-result-box-right-top">
								<h5>
									광고 영상 기획/ 제작 및 참여형 이벤트 진행
									<span>광고 영상 유튜브 조회수 164만 회</span>
								</h5>
								<div class="img-box">
									<img src="/img/web/img/care-right-01.png" />
									<img src="/img/web/img/care-right-02.png" />
								</div>
							</div>
							<div class="succe-result-box-right-bottom">
								<h5>
									콘텐츠 업로드 및 온라인 참여형 이벤트 진행
								</h5>
								<div class="img-box">
									<img src="/img/web/img/care-right-03.png" />
									<img src="/img/web/img/care-right-04.png" />
								</div>
							</div>
						</section>
					</div>
					<!--휴엔케어 - 운영방향 -->
					<div class="succe-direction-box su-res-box img-ani bottom-top">
						<ul class="succe-direction-list">
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-01.png" /></span>
								<h5>검색광고</h5>
								<p>네이버 브랜드 검색 + 파워링크 검색 광고 운영</p>
								<ol class="succe-direction-process">
									<li>브랜드 검색 </li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">브랜드 신뢰도 강화 </li><br>
									<li>광고 소재 및 문구 타겟팅 </li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">홈페이지 클릭 유도 </li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-02.png" /></span>
								<h5>온라인 채널 운영</h5>
								<p>인스타그램, 페이스북, 블로그</p>
								<ol class="succe-direction-process">
									<li>댓글관리   이벤트 운영</li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">주기적인 소비자 커뮤니케이션</li><br>
									<li class="fw-bold">광고 및 홍보 지양, 정보성   전문성 중심 채널 운영</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-03.png" /></span>
								<h5>콘텐츠 제작</h5>
								<p>온라인매체별 주 1~2회 정기적인 콘텐츠 제작/ 배포</p>
								<ol class="succe-direction-process">
									<li>해충정보   휴엔케어 파트너사 소개 생활 정보 등 다양한 카테고리 운영</li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">전문성 + 친근감 강화</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-04.png" /></span>
								<h5>영상 제작/ 기획/ 광고 송출</h5>
								<p>브랜드 광고 및 직원 대상 교육 영상 제작</p>
								<ol class="succe-direction-process">								
									<li class="fw-bold">타겟 맞춤형 영상 콘텐츠 제작<br>온라인 광고를 통한 브랜드 영상 노출 극대화</li>							
								</ol>
							</li>
						</ul>
					</div>
				</div>					
			</div>
			
			<!-- 사이버대학교 -->
			<div class="success-inbox college-box img-ani bottom-top">				
				<!-- 사이버대학교 - 운영성과 -->
				<div class="succe-result suc-re-01 on">
					<div class="succe-result-top">
						<h2>A 사이버 대학교_2020년 후기 입시 모집 광고 운영</h2>
						<ol class="succe-tab-sub">
							<li class="on">운영 성과</li>
							<li>운영 방향</li>
						</ol>
					</div>
					<!--사이버대학교 - 운영성과 -->
					<div class="succe-result-box su-res-box on">
						<section class="succe-result-box-left">
							<h4 class="mo-regrape-txt">· &nbsp;모집 인원 2019년 대비 125% 달성</h4>
							<div class="succe-result-grape">
								<img src="/img/web/img/care-grape-02-1.png" class="grape-pc"/>
								<img src="/img/web/img/care-grape-02-mo.png" class="grape-mo"/>
								<h4>모집 인원 2019년 대비 125% 달성</h4>
							</div>
						</section>
						<section class="succe-result-box-right">
							<h4 class="mo-regrape-txt">· &nbsp;모집 인원 KPI 112% 달성</h4>
							<div class="succe-result-grape">
								<img src="/img/web/img/care-grape-03-1.png" class="grape-pc" />
								<img src="/img/web/img/care-grape-03-mo.png" class="grape-mo"/>
								<h4>모집 인원 KPI 112% 달성</h4>
							</div>
						</section>
					</div>
					<!--사이버대학교 - 운영방향 -->
					<div class="succe-direction-box su-res-box img-ani bottom-top">
						<ul class="succe-direction-list">
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-01.png" /></span>
								<h5>검색광고</h5>
								<p>네이버 (파워링크, 파워콘텐츠, 브랜드검색)/<br>
									카카오/구글 검색광고</p>
								<ol class="succe-direction-process">
									<li>키워드 전략 운영</li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">높은 CTR(클릭률) 달성 </li><br>
									<li>모집 기간별 광고 노출 조절</li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">저예산 운영</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-05.png" /></span>
								<h5>TV광고/ 언론 노출</h5>
								<p>IPTV 및 케이블 광고 약 500만 뷰 노출</p>
								<ol class="succe-direction-process">
									<li>시청 가구 타겟팅 IPTV 광고 + 케이블 광고</li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">메인 타겟 대상 사이버대학교 브랜드 확산</li><br>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-06.png" /></span>
								<h5>온라인 광고 집중 집행</h5>
								<p>네이버 JOB & 판 배너광고, 카카오톡 비즈보드, <br>
									GDN, 유튜브, 페이스북 (인스타그램) 광고 운영</p>
								<ol class="succe-direction-process">
									<li>SNS 기획 콘텐츠 운영   언론 노출</li>
									<img src="/img/web/img/arrow-black.png" / class="arrow-black">
									<li class="fw-bold">주목도 확대</li><br>
									<li class="fw-bold">사이버 대학교관심 타겟군 설정을 통한 높은 CTR(클릭률)</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-07.png" /></span>
								<h5>오프라인 광고</h5>
								<p>서울 지하철 스크린도어/ 지하철 내부 <br>
									(모니터 + 출입문 상단 등) 광고 편성</p>
								<ol class="succe-direction-process">								
									<li>지하철 중심 오프라인 광고 집행</li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">2040세대 유동인구 대상 브랜딩</li>							
								</ol>
							</li>
						</ul>
					</div>
				</div>					
			</div>
			
			
			<!-- 공공기관 -->
			<div class="success-inbox public-box img-ani bottom-top">				
				<!-- 공공기관 - 운영성과 -->
				<div class="succe-result suc-re-01 on img-ani bottom-top">
					<div class="succe-result-top">
						<h2>B 공공기관 운영 홈페이지 통합 홍보<small>(20년7월 ~ 현재)</small></h2>
						<ol class="succe-tab-sub">
							<li class="on">운영 성과</li>
							<li>운영 방향</li>
						</ol>
					</div>
					<!--공공기관 - 운영성과 -->
					<div class="succe-result-box su-res-box on">
						<section class="succe-result-box-left">
							<h4 class="mo-regrape-txt">· &nbsp;블로그 콘텐츠 조회수 KPI 2,000% 초과 달성</h4>
							<div class="succe-result-grape">
								<img src="/img/web/img/care-grape-04-1.png" class="grape-pc"/>
								<img src="/img/web/img/care-grape-04-mo2.png" class="grape-mo"/>
								<h4>블로그 콘텐츠 조회수 KPI 2,000% 초과 달성</h4>
							</div>
						</section>
						<section class="succe-result-box-right">
							<h4 class="mo-regrape-txt">· &nbsp;유튜브 콘텐츠 조회수 KPI 300% 초과 달성</h4>
							<div class="succe-result-grape">
								<img src="/img/web/img/care-grape-05-1.png" class="grape-pc"/>
								<img src="/img/web/img/care-grape-05-mo.png" class="grape-mo"/>
								<h4>유튜브 콘텐츠 조회수 KPI 300% 초과 달성</h4>
							</div>
						</section>
					</div>
					<!--공공기관 - 운영방향 -->
					<div class="succe-direction-box su-res-box img-ani bottom-top">
						<ul class="succe-direction-list">
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-08.png" /></span>
								<h5>콘텐츠 제작</h5>
								<p>영상/ 소셜 미디어 콘텐츠 184편 제작/ 배포</p>
								<ol class="succe-direction-process">
									<li>콘텐츠 조회 예상 타겟별 제작 차별화</li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">브랜드 파워 성장   전문성 + 친근함 강화 </li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-09.png" /></span>
								<h5>온라인 채널 운영</h5>
								<p>유튜브, 페이스북, 블로그, 카카오플러스친구 등 운영</p>
								<ol class="succe-direction-process">
									<li>콘텐츠 노출 후 유저의 이동 경로 예측, 홈페이지 버튼 생성 </li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">홈페이지 인입 유도</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-05.png" /></span>
								<h5>온라인 광고 </h5>
								<p>페이스북/유튜브/온라인 배너광고 상시 운영  </p>
								<ol class="succe-direction-process">
									<li>2554남녀 · 관심사 · 키워드 등 타겟팅</li><br>									
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">메인 타겟/ 잠재 타겟 홈페이지 인입 유도</li>
								</ol>
							</li>
							<li>
								<span class="direc-imgBox"><img src="/img/web/img/direction-list-10.png" /></span>
								<h5>이모티콘 및 굿즈 키트 개발</h5>
								<p>이모티콘 2건 제작 및 배포/ 이벤트</p>
								<ol class="succe-direction-process">	
									<li>실생활 사용 가능한 이모티콘/ 굿즈 제작 · 배포</li><br>												
									<li class="fw-bold txtAlign"><img src="/img/web/img/arrow-black.png" / class="arrow-black">브랜드 화제성 강화 및 타겟 충성도 향상</li>							
								</ol>
							</li>
						</ul>
					</div>
				</div>					
			</div>
			
			
		
			
		
		</div>
	</div>
</div>

<!-- main-sec06 -->
<div id="main-sec06">
	<div class="why_wr">
		<h3 class="why_tit en-txt img-ani bottom-top">our partners</h3>
		<p class="lg-txt img-ani bottom-top">
			2000년부터 이미 많은 광고주들이 <br> 우리와 함께 진행했습니다.
		</p>

		<div class="partner_box img-ani bottom-top scroller">
			<img src="/img/web/img/partner_logo00.png" /><img
				src="/img/web/img/partner_logo00.png" /><img
				src="/img/web/img/partner_logo00.png" /><img
				src="/img/web/img/partner_logo00.png" /><img
				src="/img/web/img/partner_logo00.png" />
		</div>
	</div>
</div>

<!-- main-sec07 -->
<div id="main-sec07">
	<div class="half-left">
		<div class="join_wr">
			<h3 class="why_tit en-txt img-ani bottom-top">let’s join us</h3>
			<p class="lg-txt img-ani bottom-top">
				성공을 위한 첫걸음 <br>LG 헬로비전에서 <br>우리와 함께 시작해요.
			</p>
			<p class="bg_txt img-ani on">join us</p>

		</div>
	</div>

	<div class="half-right">
		<div class="grid_wr">
			<div class="quo_box img-ani bottom-top">
				<h4 class="grid_tit">Quotation</h4>
				<p class="grid_stit">광고 견적내기</p>
				<img src="/img/web/img/icon_arrowb.png" />

			</div>
			<div class="dir_box img-ani bottom-top">
				<h4 class="grid_tit">Media</h4>
				<p class="grid_stit">매체 소개</p>
				<img src="/img/web/img/icon_arrowb.png" />

			</div>
			<div class="contact_box img-ani bottom-top">
				<h4 class="grid_tit">What is</h4>
				<p class="grid_stit">광고 다이렉트 몰이란?</p>
				<img src="/img/web/img/icon_arrowh.png" />

			</div>
		</div>
	</div>

</div>


<%@ include file="layout/footer.jsp"%>

<c:forEach var="i" items="${popList}" varStatus="loop">
<c:if test="${i.is_center eq 'N' }">
	<div id="main_popup" class="main_popup pop_idx${i.idx}" style="position: absolute; z-index: 10000; top: ${i.margin_top}px; left: ${i.margin_left}px; display:none;">
		<c:if test="${i.btn_pop eq 'now'}">		
			<div class="" onclick="javascript:location.href='${i.url}'">
				<img src="${image_dir}popup/${i.banner}" alt="" onerror="this.src='/img/noimg.png'" />
			</div>
		</c:if>
		<c:if test="${i.btn_pop eq 'new'}">		
			<div class="" onclick="javascript:window.open('${i.url}');" >
				<img src="${image_dir}popup/${i.banner}" alt="" onerror="this.src='/img/noimg.png'" />
			</div>
		</c:if>
		<div class="popup_bottom">
			<c:if test="${i.not_today eq 'Y' }">
				<span class="close_popup_day" onclick="pop_todayclose('${i.idx}')">오늘하루 열지않기</span>
			</c:if>
			<div class="event-pop" onclick="pop_close('${i.idx}')">닫기</div>
		</div>
	</div>
</c:if>
<c:if test="${i.is_center eq 'Y' }">
	<div id="main_popup" class="main_popup pop_idx${i.idx}" style="position: absolute; z-index: 10000; top: 50%; left:50%; display:none;">
		<c:if test="${i.btn_pop eq 'now'}">		
			<div class="" onclick="javascript:location.href='${i.url}'">
				<img src="${image_dir}popup/${i.banner}" alt="" onerror="this.src='/img/noimg.png'"/>
			</div>
		</c:if>
		<c:if test="${i.btn_pop eq 'new'}">		
			<div class="" onclick="javascript:window.open('${i.url}');" >
				<img src="${image_dir}popup/${i.banner}" alt="" onerror="this.src='/img/noimg.png'"/>
			</div>
		</c:if>
		<div class="popup_bottom">
			<c:if test="${i.not_today eq 'Y' }">
				<span class="close_popup_day" onclick="pop_todayclose('${i.idx}')">오늘하루 열지않기</span>
			</c:if>
			<div class="event-pop" onclick="pop_close('${i.idx}')">닫기</div>
		</div>
	</div>
</c:if>
</c:forEach>

	<script>
	var openPopCnt = 0;
	$(window).ready(function(){
		var pop_idx='';
		var pop_idx_arry=[];
		$('.main_popup').each(function(){ 
			pop_idx = $(this).attr('class').replace('main_popup','').trim();
			pop_idx_arry.push(pop_idx);
		})
	
		for (var i = 0; i < $('.main_popup').length+1; i++) {
			if(getCookie(pop_idx_arry[i])!="Y"){
				$("."+pop_idx_arry[i]).show('fade');
				if(pop_idx_arry[i] != undefined)
				{
	    			openPopCnt ++;	
				}
			}
		}
		if(openPopCnt > 0)
		{
			$("#main_popup_bg").show();
		}
	});
	function pop_todayclose(idx){
		var	notToday = getCookie("pop_idx"+idx);
		//alert(notToday);
		if(notToday == "Y"){
			$(".pop_idx"+idx).hide('fade');
		}else{
			setCookie("pop_idx"+idx,'Y', 1);
			$(".pop_idx"+idx).hide('fade');
		}
		openPopCnt --;
		if(openPopCnt == 0)
		{
			$("#main_popup_bg").hide();
		}
	}
	function pop_close(idx){
		$(".pop_idx"+idx).hide('fade');
		openPopCnt --;
		if(openPopCnt == 0)
		{
			$("#main_popup_bg").hide();
		}
	}
	</script>
