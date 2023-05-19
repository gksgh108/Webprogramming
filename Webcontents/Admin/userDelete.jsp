<%@page import="javax.xml.crypto.dsig.spec.ExcC14NParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Darle - 회원정보삭제</title>
<link href="qnadesign.css" rel="stylesheet" type="text/css">

</head>

<body>

        
        <%
        String uid = request.getParameter("uid");
        Connection conn = ConnectionProvider.getConnection();
		try{
        	UserDao dao = new UserDao();
        	dao.deleteById(conn, uid);
        }catch(SQLException e){}finally{
        	JdbcUtil.close(conn);
    	}
        %>
	<jsp:forward page="/Admin/userlist.jsp"></jsp:forward>
    </body>
</html>
