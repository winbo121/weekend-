<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/floating.css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('49bbefdec55f169fc3e4f0fa9d24f2e3');

	function sendLink() {
		Kakao.Link
				.sendDefault({
					objectType : 'location',
					address : '서울특별시 노원구 동일로 214길 32',
					addressTitle : '한국성서대학교',
					content : {
						title : '주말플러스',
						description : '#여행 #욜로 #주말 뭐하지? #휴식',
						imageUrl : 'https://cdn.pixabay.com/photo/2016/01/09/18/27/old-1130731_960_720.jpg',
						link : {
							mobileWebUrl : 'https://282569c1.ngrok.io/Weekend/main.jsp'

						}
					},
					buttons : [ {
						title : '모바일 웹으로 보기',
						link : {
							mobileWebUrl : 'https://282569c1.ngrok.io/Weekend/main.jsp'
						}
					} ]
				});
	}
	//]]>

	function shareFB()
	{

		window
				.open('http://www.facebook.com/sharer/sharer.php?u=https://282569c1.ngrok.io/Weekend/main.jsp');

	}
</script>



<div class="flBtn flBtn-position-br flBtn-size-medium">
	<input type="checkbox">
	<a href="" data-role="main">
		<i class="fas fa-plus"></i>		
	</a>
	<ul class="flBtn-first">
		<li><a href="sms:010-9899-9125" tooltip="문자"><i class="fas fa-envelope"></i></a></li>
		<li><a href="tel:010-9899-9125" tooltip="전화"><i class="fas fa-mobile-alt"></i></a></li>
		<c:choose>
		<c:when test="${uid==null }">
		
		</c:when>
		<c:otherwise>
		<li><button class="Chatopen"><i class="far fa-comment-dots"></i></button></li>
			
		</c:otherwise>
	</c:choose>
	<c:choose>
					<c:when test="${uid != null}">
					<li><a href="deleteUser.bo?nickname=${uid}" tooltip="회원탈퇴"><i class="fa fa-user-times"></i></a></li>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
		<c:choose>
			<c:when test="${uid != null}">
				<li><a href="user_control.jsp?action=logout&action1=login1"
					tooltip="로그아웃"><i class="fas fa-sign-out-alt"></i></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="login.jsp" tooltip="로그인"><i
						class="fas fa-sign-in-alt"></i></a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="map.jsp" tooltip="Map"><i
					class="fas fa-map-marked-alt"></i></a></li>
		<li><a href="gta?action=getall" tooltip="SNS"><i class="fab fa-instagram"></i></a></li>
		<li><a href="home.jsp" tooltip="홈"><i class="fas fa-home"></i></a></li>
	</ul>
	<ul class="flBtn-second">
	<li><a id="kakao-link-btn" href="javascript:sendLink()" tooltip="kakao"> <img
		src="css/images/kakao-talk.svg" style="width: 20px; height: 40px;"></a></li>
		<li><a href="javascript:shareFB();" tooltip="Facebook"><i class="fab fa-facebook-f"></i></a></li>

		<script type="text/javascript">
		
			function naver() {

				var url = "https://282569c1.ngrok.io/Weekend/main.jsp";
				var title = "주말플러스"

				window
						.open('https://share.naver.com/web/shareView.nhn?url='
								+ url + '&title='
								+ title,
								'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
				return false;
			}
			// 모바일 공유
			function share_band(content, url){
			    content = content + " " + url;
			    var param = 'create/post?text=' + encodeURIComponent(content);
			    if (navigator.userAgent.match(/android/i)) {
			        setTimeout(function(){
			            location.href = 'intent://' + param + '#Intent;package=com.nhn.android.band;end';
			        }, 100);
			    } else if (navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)) {
			        location.href = 'bandapp://' + param;
			    }
			 
			 /*웹 공유
			    content = content + " " + url;
			    var shareUrl = "https://www.band.us/plugin/share?body="+encodeURIComponent(content);
			    window.open(shareUrl, "share_band", "width=410, height=540, resizable=no");
			   */ 
			}
			</script>

		<li><a href="javascript:naver();" tooltip="naver"><img
		src="css/images/naver_icon.svg" style="width: 20px; height: 40px;"></a></li>
		<li><a href="javascript:void(0);" onclick="share_band('주말플러스', 'https://282569c1.ngrok.io/Weekend/main.jsp');return false;" tooltip="Band"><img
		src="css/images/naverband_icon.JPG" style="width: 25px; height: 25px;"></a></li>
	</ul>
</div>
