<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="foot_wr">
	<div class="foot_top">
		<div class="foot_list">
			<ul>
				<li><a href="/privacy">개인정보처리방침</a></li>
				<li><a href="/sitemap">사이트맵</a></li>
			</ul>
		</div>
	</div>
	<div class="foot_bt">
		<div class="foot_list2">
			<div class="foot_left">
				<img src="../img/web/img/logo_foot.png" />
			</div>
			<div class="foot_right">
				<div class="foot_info">
					<ul>
						<li>
							<p class="info_tit">대표이사</p>
							<p class="info_stit">송구영</p>
						</li>
						<li>
							<p class="info_tit">개인정보보호책임자</p>
							<p class="info_stit">이건호</p>
						</li>
						<li>
							<p class="info_tit">사업자등록번호</p>
							<p class="info_stit">117-81-13423</p>
						</li>
						<li>
							<p class="info_stit">서울특별시 마포구 월드컵북로 56길 19 상암디지털드림타워</p>
						</li>
						<li>
							<p class="info_tit">광고 상담 문의</p>
							<p class="info_stit">1855-0909</p>
						</li>
					</ul>
					<div class="fam_box">
						<p class="fam">Family site</p>

						<ul class="fam_list">
							<li><a href="http://www.lghellovision.net/main.do"
								target="_blank" rel="noopener">LG헬로비전 공식 홈페이지</a></li>
							<li><a
								href="http://www.lghellovision.net/product/productMain.do"
								target="_blank" rel="noopener">LG헬로비전 다이렉트샵</a></li>
							<li><a
								href="https://rental.lghellovision.net/main/detail"
								target="_blank" rel="noopener">LG헬로비전 헬로렌탈</a></li>
							<li><a href="http://direct.lghellovision.net/main.do"
								target="_blank" rel="noopener">LG헬로비전 헬로모바일</a></li>
						</ul>
					</div>
				</div>
				<div class="foot_copy">
					<ul class="sns_wr">
						<li><a href="#"><img src="/img/icon_facebook.png" /></a></li>
						<li><a href="#"><img src="/img/icon_insta.png" /></a></li>
						<li><a href="#"><img src="/img/icon_youtube.png" /></a></li>
					</ul>
					<p class="copy">c 2020 LG Hellovision All rights reserved</p>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- WIDERPLANET  SCRIPT START 2021.3.18 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
var UserAgent = navigator.userAgent;
var widerplanet_device = (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) ? "mobile" : "web";
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",   /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
				*주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"51438",	/*광고주 코드 */
		ty:"Home",	/*트래킹태그 타입 */
		device: widerplanet_device	/*디바이스 종류  (web 또는  mobile)*/
		
	};
}));
function wider_conversion(){
    wptg_tagscript_vars.push(
      (function() {
        return {
          wp_hcuid:"",         /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
           *주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
          ti:"51438",                   /*광고주 코드 */
          ty:"PurchaseComplete",       /*트래킹태그 타입 */
          device:"mobile",                /*디바이스 종류  (web 또는  mobile)*/
          items:[{i:"전화상담 ",      /*전환 식별 코드  (한글 , 영어 , 번호 , 공백 허용 )*/
            t:"전화상담 ",         /*전환명  (한글 , 영어 , 번호 , 공백 허용 )*/
            p:"1",       /*전환가격  (전환 가격이 없을경우 1로 설정 )*/
            q:"1"        /*전환수량  (전환 수량이 고정적으로 1개 이하일 경우 1로 설정 )*/
          }]
        };
      }));
    wptg_tagscript.exec();
}
</script>
<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2021.3.18 -->

</body>
</html>