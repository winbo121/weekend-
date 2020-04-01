<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<%
request.setCharacterEncoding("utf-8");
	// 컨트롤러 요청 action 코드값
	String action = request.getParameter("action");
	String action1=request.getParameter("action1");
	String uid=request.getParameter("uid");
	String site=request.getParameter("site");
	String nickname=request.getParameter("nickname");
	
	
	
	// 신규 회원등록
	if(action.equals("new")) {
		System.out.println("New_User");
		response.sendRedirect("/Weekend/NickAdd.bo?uid="+uid+"&site="+site+"&nickname="+nickname+"");
		
	}
	// 로그인
	else if(action.equals("login")) {
		System.out.println("Login");
			response.sendRedirect("/Weekend/Login.bo?uid="+uid+"&site="+site+"&nickname="+nickname+"");
		
		
	} 
	// 로그아웃
	else if(action.equals("logout")) {
		
		System.out.println("Logout");
		response.setHeader("pragma","No-cache");

		response.setHeader("Cache-Control","no-cache");

		response.addHeader("Cache-Control","No-store");


		response.setDateHeader("Expires",1L);
	
		
		
		session.removeAttribute("uid");
	
		response.sendRedirect("main.jsp?action=getall&action1="+action1+"");		
	}
%>