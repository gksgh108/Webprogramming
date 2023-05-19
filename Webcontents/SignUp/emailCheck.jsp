<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Darle - 이메일확인</title>
</head>
<body>
<%
	String email=request.getParameter("email");
	int rst=0;
	Connection conn=ConnectionProvider.getConnection();

	try{
		UserDao dao = new UserDao();
		rst = dao.emailCheck(conn, email); //db에 해당 email이 있으면 1, 없으면 0리턴
	}catch(SQLException e){}
	finally{JdbcUtil.close(conn);}
	if(rst==1){
		out.print("이미 사용중인 이메일입니다.");
		
	}else
		out.print("사용가능한 이메일입니다.");
%>
</body>
</html>