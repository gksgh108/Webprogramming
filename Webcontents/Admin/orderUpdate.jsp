<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Darle - 주문정보수정</title>
<link href="inquirystyle.css" rel="stylesheet" type="text/css">

</head>

<body>
		
		
		<% request.setCharacterEncoding("utf-8"); %>
		<jsp:useBean id="order" class="my.model.Order"/>
		<jsp:setProperty property="*" name="order"/>
        <%
		
        Connection conn = ConnectionProvider.getConnection();
        
        try{
        	OrderDao dao = new OrderDao();
        	dao.update(conn, order);
        }catch(SQLException e){}
        finally{ JdbcUtil.close(conn); }
        %>
      <jsp:forward page="/Admin/orderlist.jsp"/> 

</body>
</html>
