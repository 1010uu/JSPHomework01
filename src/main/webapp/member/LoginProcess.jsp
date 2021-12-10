<%@page import="utills.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess.jsp</title>
</head>
<body>
<%
String userId = request.getParameter("id");
String userPwd = request.getParameter("passwd");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleID");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC 연결
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//회원 인증 시도하기
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//자원 해제
dao.close();

if(memberDTO.getId()!=null){ //회원 인증(로그인)에 성공한 경우
	
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	
	//페이지 이동
	response.sendRedirect("../board/listT.jsp");
}
else{ //실패한 경우
	request.setAttribute("LoginErrMsg", "로그인 실패입니다.");
	//로그인 페이지로 포워드(페이지 전달)한다.
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>
</body>
</html>
