<%@page import="jdbconnect.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC테스트1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	%>
	
	<h2>jdbc테스트2</h2>
	<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleID");
	String pwd = application.getInitParameter("OraclePwd");
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	%>
	
	<h2>jdbc테스트3</h2>
	<%
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
	%>
</body>
</html>