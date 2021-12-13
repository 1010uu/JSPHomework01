<%@page import="utills.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 중이 아니라면
if(session.getAttribute("UserId")==null)
{
	JSFunction.alertLocation("로그인 후 이용해주세요", 
			"../member/Login.jsp", out);
	
	return;
}
%>