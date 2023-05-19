<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Darle - 회원정보수정</title>
<link href="inquirystyle.css" rel="stylesheet" type="text/css">

</head>

<body>

        
        <%
		String location = "C:\\web1\\ws\\team_file\\WebContents\\image";
		
		int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   파일의 최대 크기
		 
		MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8",
													  new DefaultFileRenamePolicy());
		
		String userid = multi.getParameter("pid");
		String uid = multi.getParameter("idfield");
        String namefield = multi.getParameter("namefield");
        String phonefield = multi.getParameter("phonefield");
        String phone1 = phonefield.substring(0,3);
        String phone2 = phonefield.substring(4,8);
        String phone3 = phonefield.substring(9);
        String emailfield = multi.getParameter("emailfield");
        String addressfield = multi.getParameter("addressfield");
        int pointfield = Integer.parseInt(multi.getParameter("pointfield"));
        
        Connection conn = ConnectionProvider.getConnection();
		User user = new User(uid, namefield, phone1, phone2, phone3, emailfield, addressfield, pointfield);
        
        try{
        	UserDao dao = new UserDao();
        	dao.updateAdmin(conn, user);
        }catch(SQLException e){}
        finally{ JdbcUtil.close(conn); }
        %>
     <jsp:forward page="/Admin/userlist.jsp"/>  
     
       


</body>
</html>
