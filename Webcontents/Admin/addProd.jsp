<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Darle - 상품추가</title>
<link href="inquirystyle.css" rel="stylesheet" type="text/css">

</head>

<body>

        <% request.setCharacterEncoding("utf-8"); %>
		<jsp:useBean id="product" class="my.model.Product"/>
		<jsp:setProperty property="*" name="product"/>
        <%
		String location = "C:\\web1\\ws\\team_file\\WebContents\\image";
		
		int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   파일의 최대 크기
		 
        product.setPdate(new java.util.Date());
        Connection conn = ConnectionProvider.getConnection();
        
        try{
        	ProductDao dao = new ProductDao();
        	dao.insert(conn, product);
        }catch(SQLException e){}
        finally{ JdbcUtil.close(conn); }
        %>
     <jsp:forward page="/Admin/prodlist.jsp"/>  
     


</body>
</html>
