<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" href="css/Weekend.css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>주말+</title>
<meta property="og:type" content="website"/>
<meta property="og:url"  content="http://winbo121.cafe24.com/Weekend/main.jsp"/>
<meta property="og:description" content="일상을 여행으로  여행을 일상으로"/>
<meta property="og:image" content="https://cdn.pixabay.com/photo/2016/01/09/18/27/old-1130731_960_720.jpg"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<script type="text/javascript">
    
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
    </script>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String pagefile = request.getParameter("pagefile");
		String uid = request.getParameter("");
		if (uid != null) {
			session.setAttribute("uid", uid);
		}
	%>
	<!-- header 시작  -->
	<%
		if (pagefile.contains("/board/")) {
	%>
	<jsp:include page="gacipan.jsp" />
	<%
		} else {
			System.out.print("2");
	%>
	<jsp:include page="header.jsp" />
	<%
		}
	%>



	<!-- header 끝  -->
	<!--  content 시작  -->
	<jsp:include page='<%=pagefile + ".jsp"%>' />
	<!--  content 끝  -->
	
	<c:choose>
		<c:when test="${uid==null }">
		
		</c:when>
		<c:otherwise>
			<div class="Chat_back"></div>
			<div class="Msg">
				<button class="Chatclose" style="left: 360px;">
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
						<input type="button" value="Send" onclick="sendMessage()" style="width: 21%;"/>
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
	<!--  footer 시작   -->
<%
		if (pagefile.contains("/board")) {

		} else {
	%>
    <%@include file="floatingButton.jsp"%>
	<!--  footer 끝  -->
	<%
		}
	%>
</body>
</html>