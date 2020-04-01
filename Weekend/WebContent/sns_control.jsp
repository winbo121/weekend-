<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="mysns.sns.*,mysns.member.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메시지 처리 빈즈 -->
<jsp:useBean id="msg" class="mysns.sns.Message" />
<jsp:useBean id="msgdao" class="mysns.sns.MessageDAO" />
<jsp:useBean id="reply" class="mysns.sns.Reply" />

<!-- 프로퍼티 set -->
<jsp:setProperty name="msg" property="*" />
<jsp:setProperty name="reply" property="*" />

<%
//기본 파라미터 정리
	// 컨트롤러 요청 action 코드 값
	String action =(String) request.getAttribute("action");

	// 다음 페이지 요청 카운트
	String cnt =(String) request.getAttribute("cnt");

	// 특정 회원 게시물 only
	String suid =(String) request.getAttribute("suid");
	
	// 홈 URL
	String home;
	
	
 	
	// 메시지 페이지 카운트
	int mcnt;
	
	if((cnt != null) && (suid !=null)) {
		// 각 action 처리후 메인으로 되돌아가기 위한 기본 url
		//심지어 suid 값이 ""이여도 값이 있는것이므로 더보기 페이지 하면 이쪽 if문으로 오는것이다
		home = "/gta?action=getall&cnt="+cnt+"&suid="+suid;
		mcnt = Integer.parseInt((String) request.getAttribute("cnt"));
		
	}
	else {
		//로그인 한번 하고 완전 첫페이지 말고는 쓸떄가 없음
		// 게시글 작성시에는 현재 상태와 상관 없이 전체 게시물의 첫페이지로 이동 하기 위한 url
		home = "/gta?action=getall";
		// 첫페이지 요청인 경우, 기본 게시물 5개씩
		mcnt = 5;
	}
	
	// 댓글이 달린 게시물 위치 정보 -> accordion 상태 유지 목적
	
	// 새로운 메시지 등록
	if (action.equals("newmsg")) {
		String uid=(String) request.getAttribute("uid");
		String img=(String) request.getAttribute("img");
		String message=(String) request.getAttribute("msg");
		msg.setUid(uid);
		msg.setMsg(message);
		msg.setImg(img);	
		
		if (msgdao.newMsg(msg))
			response.sendRedirect(home);
		else
			throw new Exception("메시지 등록 오류!!");
	// 댓글 등록
	} else if (action.equals("newreply")) {
		if (msgdao.newReply(reply))
			pageContext.forward(home);
		else
			throw new Exception("댓글 등록 오류!!");
	} 
	else if(action.equals("fav")) {
		String uid1=(String)request.getAttribute("uid");
		String mid1=(String)request.getAttribute("mid");
		MessageDAO M=new MessageDAO();
		M.favorite(Integer.parseInt(mid1),uid1);
		pageContext.forward(home);
	}
	// 메시지 삭제
	else if (action.equals("delmsg")) {
		if(msgdao.delMsg(msg.getMid())) {
			pageContext.forward(home);
		}
		else{
			throw new Exception("메시지 등록 오류!!");
		}
	} 
	// 댓글 삭제
	else if (action.equals("delreply")) {
		if(msgdao.delReply(reply.getRid())) {
			pageContext.forward(home);
		}
		else
			throw new Exception("메시지 등록 오류!!");;
	} 
	
	
	//무조건 마지막엔 여기 엘스문을 거친다 
	else if (action.equals("getall")) {
		ArrayList<MessageSet> datas = msgdao.getAll(mcnt,suid);
		
		// 게시글 목록
		request.setAttribute("datas", datas);
	
		// 특정 회원 only 인 경우 회원 uid 를 request  scope 에 저장
		request.setAttribute("suid",suid);
		
		// 현재 페이지 카운트 정보 저장
		request.setAttribute("cnt",mcnt);

		pageContext.forward("sns_main.jsp");
	}
	// 좋아요 추가
	
%>
