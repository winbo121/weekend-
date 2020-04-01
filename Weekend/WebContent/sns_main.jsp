<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주말+</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<link rel="stylesheet" href="Weekend/css/styles.css" type="text/css" />
<link rel="stylesheet" href="Weekend/css/jquery-ui.css" />
<link rel="stylesheet" href="Weekend/css/floating.css" />
<link rel="stylesheet" href="Weekend/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="//developers.band.us/js/share/band-button.js?v=07022019"></script>
<script type="text/javascript"
	src="//static.naver.net/blog/share/blog_sharebutton.js?v={0}"></script>
<script type='text/javascript'>
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content",
			active : parseInt("${curmsg == null ? 0:curmsg}")
		});
	});

	function heart_Popup(a) {
		window.open("Weekend/goods.jsp?ww=" + a, "heart_Popup",
				"location=no,resizeable=no,menubar=no,width=200,height=300");
	}
	
	$(function() {

		$(".heart").on("click", function() {
			$(this).toggleClass("heart-blast");
		});
	});
	
	 $(document).ready(function(){
	    	$(".Msg").hide();
			$(".Chatopen").show();
	        $(".Chatopen").click(function(event){  //팝업 Open 버튼 클릭 시 
	 
	             $(".Msg").css({
	                "top": (($(window).height()-$(".Msg").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$(".Msg").outerWidth())/2+$(window).scrollLeft())+"px"
	                //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
	             
	             }); 
	            
	            $(".Chat_back").css("display","block"); //팝업 뒷배경 display block
	            $(".flBtn").css("display","none"); 
	            $(".Msg").css("display","block"); //팝업창 display block
	            $("body").css("overflow","hidden");//body 스크롤바 없애기
	        });
	        
	        $(".Chatclose").click(function(event){
	            $(".Chat_back").css("display","none"); //팝업창 뒷배경 display none
	            $(".flBtn").css("display","block");
	            $(".Msg").css("display","none"); //팝업창 display none
	            $("body").css("overflow","auto");//body 스크롤바 생성
	        });
	     
	    
	    });
	
	$(document).ready(function(){
    	$(".New_post").hide();
        $(".Enrollment").click(function(event){  //팝업 Open 버튼 클릭 시 
 
             $(".New_post").css({
                "top": (($(window).height()-$(".New_post").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$(".New_post").outerWidth())/2+$(window).scrollLeft())+"px"
                //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
             
             }); 
            
            $(".Enrollment_back").css("display","block"); //팝업 뒷배경 display block
            $(".flBtn").css("display","none");
            $(".New_post").css("display","block"); //팝업창 display block
            $("body").css("overflow","hidden");//body 스크롤바 없애기
        });
        
        $(".Enrollment_close").click(function(event){
            $(".Enrollment_back").css("display","none"); //팝업창 뒷배경 display none
            $(".flBtn").css("display","block");
            $(".New_post").css("display","none"); //팝업창 display none
            $("body").css("overflow","auto");//body 스크롤바 생성
        });
        
    });
	
	/*SNS 이미지 부분*/
	function readURL(input) {
	  if (input.files && input.files[0]) {

	    var reader = new FileReader();

	    reader.onload = function(e) {
	      $('.image-upload-wrap').hide();

	      $('.file-upload-image').attr('src', e.target.result);
	      $('.file-upload-content').show();

	    };

	    reader.readAsDataURL(input.files[0]);

	  } else {
	    removeUpload();
	  }
	}
	
	function removeUpload() {
	  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
	  $('.file-upload-content').hide();
	  $('.image-upload-wrap').show();
	}
	$('.image-upload-wrap').bind('dragover', function () {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function () {
			$('.image-upload-wrap').removeClass('image-dropping');
	});
		
	
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
							mobileWebUrl : 'http://winbo121.cafe24.com/Weekend/main.jsp'

						}
					},

					buttons : [ {
						title : '모바일 웹으로 보기',
						link : {
							mobileWebUrl : 'http://winbo121.cafe24.com/Weekend/main.jsp'

						}
					} ]
				});
	}
	//]]>

	function shareFB()

	{

		window
				.open('http://www.facebook.com/sharer/sharer.php?u=http://winbo121.cafe24.com/Weekend/main.jsp');

	}
</script>

</head>

<body>
	<div class="Site-header">
		<h1 class="Site-logo">
			<a href="Weekend/home.jsp" class="Site-logo_link"> <span
				class="Site-logo_text">주말+</span>
			</a>
			<sns:login />
		</h1>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- /#wrapper -->
	<div id="wrapper1">
		<section id="main">
			<section id="content">
				<c:choose>
					<c:when test="${uid != null}">
						<div class="Enrollment_back"></div>
						<div class="New_post">
							<h2 id="New">새 게시물</h2>
							<hr>
							<form class="m_form" method="post"
								action="Weekend/upload.jsp?action=newmsg" enctype="multipart/form-data">
								<input type="hidden" name="uid" value="${uid}">
								<sns:write type="msg" />
								<button class="Enrollment_close">
									<i class="fas fa-angle-left" aria-hidden="true"></i>
								</button>
								<button class="submit" type="submit">등록</button>
							</form>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<h3 id="SNS_title">여행자들의 최신 소식</h3>
				<div id="accordion">
					<c:forEach varStatus="mcnt" var="msgs" items="${datas}">
						<c:set var="m" value="${msgs.message}" />

						<h3>${m.uid}&nbsp;&nbsp;&nbsp;&nbsp;${m.msg} &nbsp;&nbsp; [좋아요 ${m.favcount} | 댓글
							${m.replycount}]</h3>

						<div>
							<c:choose>
								<c:when test="${m.img=='null'}">

								</c:when>

								<c:otherwise>
									<img src="/Weekend/upload/${m.img}" class="sns_img">
								</c:otherwise>

							</c:choose>
							<div class="Good">
								<c:choose>
									<c:when test="${uid != null}">
										<div class="Good_div">
											<sns:smenu mid="${m.mid}" auid="${m.uid}"
												curmsg="${mcnt.index}" />
											<a href="Weekend/sns_comment.jsp?ww=${m.mid}" id="SNS_comment"><i
												class="far fa-comment" style="width: 25px; height: 25px; margin-top: -25px;"></i></a>
											<a href="javascript:heart_Popup(${m.mid })" id="heartlist">
												<img
												src="https://img.icons8.com/ios/50/000000/wish-list.png"
												style="width: 24px; height: 24px; margin-top: -10px;">
											</a>
										</div>
									</c:when>
								</c:choose>
								<div class="Write_div">
									${m.date}에 작성된 글입니다.
									<ul class="reply">
										<c:forEach var="r" items="${msgs.rlist}">
											<li>${r.uid }::${r.rmsg}-${r.date}<sns:rmenu
													curmsg="${mcnt.index}" muid="${m.uid }" rid="${r.rid}"
													ruid="${r.uid}" /></li>
										</c:forEach>
									</ul>
									<form action="/gta?action=newreply&cnt=${cnt}"
										method="post">
										<input type="hidden" name="mid" value="${m.mid}"> <input
											type="hidden" name="uid" value="${uid}"> <input
											type="hidden" name="suid" value="${suid}"> <input
											type="hidden" name="curmsg" value="${mcnt.index}">
										<sns:write type="rmsg" />
									</form>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<div align="center">
					<a
						href="/gta?action=getall&cnt=${cnt+5}&suid=${suid}&curmsg=${cnt}">더보기&gt;&gt;</a>
				</div>


			</section>
			<!-- end of sidebar -->
		</section>
	</div>
	<c:choose>
		<c:when test="${uid==null }">

		</c:when>
		<c:otherwise>
			<div class="Chat_back"></div>
			<div class="Msg">
				<button class="Chatclose">
					<i class="fas fa-times" aria-hidden="true"></i>
				</button>
				<div>
					<div class="site notes">
						<textarea id="messageTextArea" readonly="readonly" rows="10"
							cols="45" class="message"></textarea>
					</div>
					<br />
					<!-- 송신 메시지 텍스트박스 -->
					<div class="Sendmessage">
						<input type="text" id="messageText" size="50" />
						<!-- 송신 버튼 -->
						<input type="button" value="Send" onclick="sendMessage()"
							style="width: 21%;" />
					</div>
				</div>
			</div>

			<script type="text/javascript">
				//웹소켓 초기화
				var webSocket = new WebSocket(
						"ws://umj7-012.cafe24.com/broadsocket");
				var messageTextArea = document
						.getElementById("messageTextArea");
				//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
				webSocket.onmessage = function processMessge(message) {
					//Json 풀기
					var jsonData = JSON.parse(message.data);
					if (jsonData.message != null) {
						messageTextArea.value += jsonData.message + "\n"
					}
					;
				}
				//메시지 보내기
				function sendMessage() {
					var messageText = document.getElementById("messageText");

					webSocket.send("${uid}:" + messageText.value);
					messageText.value = "";
				}
			</script>
		</c:otherwise>
	</c:choose>
	<div class="flBtn flBtn-position-br flBtn-size-medium">
		<input type="checkbox"> <a href="" data-role="main"> <i
			class="fas fa-plus"></i>
		</a>
		<ul class="flBtn-first">
			<li><a href="sms:010-9899-9125" tooltip="문자"><i
					class="fas fa-envelope"></i></a></li>
			<li><a href="tel:010-9899-9125" tooltip="전화"><i
					class="fas fa-mobile-alt"></i></a></li>
			<c:choose>
				<c:when test="${uid==null }">

				</c:when>
				<c:otherwise>
					<li><button class="Chatopen">
							<i class="far fa-comment-dots"></i>
						</button></li>

				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uid != null}">
					<li><a href="Weekend/boardList.bo" tooltip="공지사항"><i
							class="far fa-edit"></i></a></li>
					<li><button class="Enrollment" tooltip="SNS 올리기"><i
							class="fas fa-camera-retro"></i></button></li>
					<li><a href="Weekend/deleteUser.bo?nickname=${uid}" tooltip="회원탈퇴"><i
							class="fa fa-user-times"></i></a></li>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uid != null}">
					<li><a href="Weekend/user_control.jsp?action=logout&action1=login1"
						tooltip="로그아웃"><i class="fas fa-sign-out-alt"></i></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="login.jsp" tooltip="로그인"><i
							class="fas fa-sign-in-alt"></i></a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="Weekend/map.jsp" tooltip="Map"><i
					class="fas fa-map-marked-alt"></i></a></li>
			<li><a href="Weekend/home.jsp" tooltip="홈"><i class="fas fa-home"></i></a></li>
		</ul>
		<ul class="flBtn-second">
			<li><a id="kakao-link-btn" href="javascript:sendLink()"
				tooltip="kakao"> <img src="Weekend/css/images/kakao-talk.svg"
					style="width: 20px; height: 40px;"></a></li>
			<li><a href="javascript:shareFB();" tooltip="Facebook"><i
					class="fab fa-facebook-f"></i></a></li>

			<script type="text/javascript">
				function naver() {

					var url = "http://winbo121.cafe24.com/Weekend/main.jsp";
					var title = "주말플러스"

					window
							.open(
									'http://share.naver.com/web/shareView.nhn?url='
											+ url + '&title=' + title,
									'naversharedialog',
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
				 
				 /* 웹 공유
				    content = content + " " + url;
				    var shareUrl = "https://www.band.us/plugin/share?body="+encodeURIComponent(content);
				    window.open(shareUrl, "share_band", "width=410, height=540, resizable=no");
				   */ 
				}
			</script>
			<li><a href="javascript:naver();" tooltip="naver"><img
					src="Weekend/css/images/naver_icon.svg" style="width: 25px; height: 40px;"></a></li>
			<li><a href="javascript:void(0);" onclick="share_band('주말플러스', 'http://winbo121.cafe24.com/Weekend/main.jsp');return false;" tooltip="Band"><img src="Weekend/css/images/naverband_icon.JPG"
					style="width: 25px; height: 25px;"></a></li>
		</ul>
	</div>
</body>
</html>