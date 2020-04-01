<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>주말+</title>
<link rel="stylesheet" href="css/Home.css" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

	var userID = new naver_id_login("Moripd5gWWLMNbfMfano",
			"http://localhost:8181/Weekend/home.jsp");
	// 접근 토큰 값 출력
	//alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	userID.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {

		/*
		 alert(naver_id_login.getProfileData('email'));
		 alert(naver_id_login.getProfileData('nickname'));
		 alert(naver_id_login.getProfileData('birthday'));
		 */

		/*console.log(userID.getProfileData('nickname'));
		 /*console.log(userID.getProfileData('email'));*/
		console.log(userID.getProfileData('id'));
		console.log(userID.getProfileData('age'));
		/*console.log(userID.getProfileData('name'));
		 console.log(userID.getProfileData('birthday'));
		 console.log(userID.getProfileData('gender'));*/
		//console.log(userID.getProfileData('profile_image'));
		alert("주말 플러스에 오신것을 환영합니다!");

		location.href = "user_control.jsp?action=login&uid="
				+userID.getProfileData('id') + "&site=naver";

	}

	function login() {
		location.href= "login.jsp";
	}
	function logout() {

		location.replace("user_control.jsp?action=logout&action1=login1");
	}
	function map() {
		location.replace("map.jsp");
	}
	function sns() {
		location.replace("/gta?action=getall");
	}
</script>
</head>
<body>
	<form>
		<input type="radio" name="tab" id="menu" />
		<div class="container">
			<input type="radio" name="tab" checked="checked" id="Plus_home" />
			<section class="Plus_home">
				<h1>Home</h1>
				<label for="Plus_home"></label>
				<%@include file="sns_photo.jsp"%>
			</section>
			<c:choose>
			<c:when test="${uid==null }">
				<input type="radio" name="tab" id="Plus_login" onclick="login()"/>
			<section class="Plus_login">
				<h1>Login</h1>
				<label for="Plus_login"></label>
			</section>
			</c:when>
			<c:otherwise>
			<input type="radio" name="tab" id="Plus_logout" onclick="logout()"/>
			<section class="Plus_logout">
				<h1>Logout</h1>
				<label for="Plus_logout"></label>
			</section>
			</c:otherwise>
		</c:choose>
			<input type="radio" name="tab" id="Plus_map" onclick="map()"/>
			<section class="Plus_map">
				<h1>Map</h1>
				<label for="Plus_map"></label>
			</section>
			<c:choose>
			<c:when test="${uid==null}">
			</c:when>
			<c:otherwise>
			<input type="radio" name="tab" id="Plus_sns" onclick="sns()"/>
			<section class="Plus_sns">
				<h1>SNS</h1>
				<label for="Plus_sns"></label>
			</section>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="menu">
			<div>
				<label for="menu"></label> <label for="Plus_home"></label>
			</div>
		</div>
	</form>
</body>
</html>