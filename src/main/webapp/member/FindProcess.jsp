<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="utills.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userName = request.getParameter("name");
String userId = request.getParameter("id");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleID");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC 연결
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//회원 인증 시도하기
MemberDTO dto = dao.getID(userName);
dao.close();

if( userId.equals(dto.getId())){
	//JSFunction.alertBack( dto.getName() +"님의 비밀번호는 "+ dto.getPass() + "입니다.", out);	
	JSFunction.alertLocation(dto.getName() +"님의 비밀번호는 "+ dto.getPass() + "입니다.", "Login.jsp", out);
}
	JSFunction.alertBack( dto.getName() +"님의 아이디는 "+ dto.getId() + "입니다.", out);	

%>