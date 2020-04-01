<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="css/Weekend_login.css" />
<title>로그인 | 주말+</title>
</head>
<body>
	<form class="Site-login_container" action="user_control.jsp">
		<section class="Site-login">
			<div class="logo_title">
				<strong class="logo"> <a href="home.jsp">주말+</a></strong>
			</div>
			<div>
				<a id="kakao-login-btn"> </a>
			</div>
			<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('49bbefdec55f169fc3e4f0fa9d24f2e3');

				// 카카오 로그인 버튼을 생성합니다.
				Kakao.Auth
						.createLoginButton({
							container : '#kakao-login-btn',
							success : function(authObj) {

								// 로그인 성공시, API를 호출합니다.
								Kakao.API
										.request({
											url : '/v2/user/me',
											success : function(res) {
												console.log(res);

												var userID = res.id; //유저의 카카오톡 고유 id
												var image = res.image;
												//var userEmail = res.kaccount_email; //유저의 이메일
												//var userName = res.properties.nickname; //유저가 등록한 별명(이름)
												//var birthday = res.kaccout_birthday;

												alert("주말 플러스에 오신것을 환영합니다!");

												location.href = "user_control.jsp?action=login&uid="
														+ userID
														+ "&site=kakao";
											},
											fail : function(error) {
												alert(JSON.stringify(error));
											}
										});
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
				//]]>
			</script>
			<!--  
			<div>
					<img src="css/images/login_btn_facebook.png" alt="페이스북 로그인">
				</a>
			</div>
			-->
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div>
				<a id="naver_id_login"> </a>
			</div>
			<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
			<script>
			
				var naver_id_login = new naver_id_login("Moripd5gWWLMNbfMfano",
						"http://localhost/WebContent/Weekend/home.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 3);
				naver_id_login.setDomain("http://localhost/WebContent/Weekend/login.jsp");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
			<p class="Login_space">
				<span>Kim</span>
			</p>
		</section>
	</form>
	<script type="text/javascript">
		function Prev() {
			location.replace("home.jsp");
		}
	</script>
	<footer>
		<div class="prev">
			<button><a onclick="Prev(); return false;" data-rel="back">prev</a></button>
		</div>
	</footer>
</body>
</html>